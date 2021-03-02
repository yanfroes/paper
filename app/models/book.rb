class Book < ApplicationRecord
  has_paper_trail
  before_update :check_update

  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships, source: :person
  accepts_nested_attributes_for :authorships, allow_destroy: true

  has_many :editions, dependent: :destroy
  accepts_nested_attributes_for :editions

  has_many :covers, through: :editions, source: :cover, autosave: true

  has_one :isbn, inverse_of: :book, dependent: :destroy
  accepts_nested_attributes_for :isbn

  def check_update
    return if changed?

    tracking_has_many_associations = [ 'editions' ]
    tracking_has_one_associations = [ 'isbn' ]

    tracking_has_many_associations.each do |a|
      send(a).each do |r|
        if r.send(:changed?) || r.marked_for_destruction?
          self.updated_at = DateTime.now
          return
        end
      end
    end

    tracking_has_one_associations.each do |a|
      r = send(a)
      if r.send(:changed?) || r.marked_for_destruction?
        self.updated_at = DateTime.now
        return
      end
    end

  end
end
