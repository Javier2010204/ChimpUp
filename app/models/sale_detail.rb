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
end
