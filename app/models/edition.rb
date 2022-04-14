class Edition < ApplicationRecord
  belongs_to :book

  #has_one :cover, autosave: true, dependent: :destroy
  #accepts_nested_attributes_for :cover

  has_many :covers, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :covers
  has_paper_trail
end
