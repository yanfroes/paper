class Book < ApplicationRecord
  before_update :check_update

  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships, source: :person
  accepts_nested_attributes_for :authorships, allow_destroy: true
  accepts_nested_attributes_for :authors

  has_many :editions, dependent: :destroy
  accepts_nested_attributes_for :editions

  has_many :covers, through: :editions, source: :covers, autosave: true
  accepts_nested_attributes_for :covers

  has_one :isbn, inverse_of: :book, dependent: :destroy
  accepts_nested_attributes_for :isbn
  has_paper_trail
  def check_update
    return if changed?

    tracking_has_many_associations = [ 'covers', 'authors' ]
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