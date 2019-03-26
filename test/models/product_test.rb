# == Schema Information
#
# Table name: products
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  description         :text
#  sale_price          :decimal(10, 2)
#  cost_price          :decimal(10, 2)
#  offer_price         :decimal(10, 2)
#  state               :string
#  stock               :integer
#  min_stock           :integer
#  offer               :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :bigint(8)
#  avatar_updated_at   :datetime
#  company_id          :bigint(8)
#  sub_category_id     :bigint(8)
#  brand_id            :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
