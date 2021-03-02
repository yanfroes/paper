class Edition < ApplicationRecord
  has_paper_trail

  belongs_to :book

  has_one :cover, inverse_of: :edition, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :cover
end
