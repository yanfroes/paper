class Person < ApplicationRecord
  has_many :authorships, dependent: :destroy
  has_paper_trail
end
