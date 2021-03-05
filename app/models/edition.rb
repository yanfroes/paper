class Edition < ApplicationRecord
  has_paper_trail

  belongs_to :book

  #has_one :cover, autosave: true, dependent: :destroy
  #accepts_nested_attributes_for :cover

  has_many :covers, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :covers

end
