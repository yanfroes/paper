class Cover < ApplicationRecord
  has_paper_trail
  belongs_to :edition
end
