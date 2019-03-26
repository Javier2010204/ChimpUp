# == Schema Information
#
# Table name: clients
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  address    :string
#  phone      :integer
#  company_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
