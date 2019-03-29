# == Schema Information
#
# Table name: sale_details
#
#  id         :bigint(8)        not null, primary key
#  sale_id    :bigint(8)
#  product_id :bigint(8)
#  number     :integer
#  qty        :integer
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SaleDetail < ApplicationRecord
    belongs_to :sale
    belongs_to :product

    validates :product_id, presence: true
    validates :qty, presence: true
    validates :price, presence: true

    accepts_nested_attributes_for :product

    def subtotal
        self.qty ? qty * unit_price : 0
    end

    def unit_price
        if persisted?
            price
        else
            product ? product.sale_price : 0
        end
    end
end
