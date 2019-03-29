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

require 'test_helper'

class SaleDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
