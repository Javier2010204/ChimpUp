class Tagging < ApplicationRecord
  belongs_to :sub_category
  belongs_to :product
end
