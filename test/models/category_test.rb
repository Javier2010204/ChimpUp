# == Schema Information
#
# Table name: categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  icon        :string
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
