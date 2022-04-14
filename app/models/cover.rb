class Cover < ApplicationRecord
  belongs_to :edition, touch: true
  has_paper_trail
end
