class Isbn < ApplicationRecord
  has_paper_trail
  belongs_to :book
end
