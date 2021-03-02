class Authorship < ApplicationRecord
  has_paper_trail
  belongs_to :book
  belongs_to :person
end
