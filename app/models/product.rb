class Product < ApplicationRecord
  belongs_to :company
  belongs_to :sub_category
  belongs_to :brand

  def product_description
    self.name + ((self.brand != nil) ? ' ' + self.brand.name : '')
  end

  def brand_name
    if self.brand
        self.brand.name
    else
        ''
    end
  end
end
