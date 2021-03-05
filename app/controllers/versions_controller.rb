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

    # restore cover
    # tid = version.transaction_id
    # bc = PaperTrail::Version.where(item_type: 'Cover', transaction_id: tid).first
    # bc.reify.save!
    #
    # # change transaction_id for cover
    # nid = PaperTrail::Version.where(item_type: version.item_type).reorder('created_at desc').first.transaction_id
    # item.editions.first.cover.versions.last.update! transaction_id: nid

    redirect_to version_path(item.versions.last)
    #redirect_back fallback_location: root_path
  end
end
