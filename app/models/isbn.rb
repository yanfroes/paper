class Isbn < ApplicationRecord
  belongs_to :book
  has_paper_trail
end
