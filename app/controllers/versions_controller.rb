class VersionsController < ApplicationController
  def show
    version = PaperTrail::Version.find(params[:id])
    @item = version.item
    @versions = @item.versions
  end

  def revert
    @version = PaperTrail::Version.find(params[:id])
    if @version.reify
      @version.reify(has_many: true, has_one: true).save!
    else
      @version.item.destroy
    end
    redirect_to books_path
  end

  def restore
    version = PaperTrail::Version.find(params[:id])
    vid = params[:vid].to_i
    item = version.item
    item.versions[vid].reify(has_many: true, has_one: true).save!
    redirect_to version_path(item.versions.last)
    #redirect_back fallback_location: root_path
  end
end
