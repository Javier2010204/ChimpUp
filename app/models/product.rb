class Product < ApplicationRecord
  belongs_to :company
  belongs_to :sub_category
  belongs_to :brand
end
