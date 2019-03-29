# == Schema Information
#
# Table name: taggings
#
#  id              :bigint(8)        not null, primary key
#  sub_category_id :bigint(8)
#  product_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Tagging < ApplicationRecord
  belongs_to :sub_category
  belongs_to :product
end
