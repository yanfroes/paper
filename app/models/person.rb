class Person < ApplicationRecord
  has_paper_trail
  has_many :authorships, dependent: :destroy
  has_many :books, through: :authorships
end
