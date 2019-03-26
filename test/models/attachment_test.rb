# == Schema Information
#
# Table name: attachments
#
#  id                   :bigint(8)        not null, primary key
#  archivo_file_name    :string
#  archivo_content_type :string
#  archivo_file_size    :bigint(8)
#  archivo_updated_at   :datetime
#  product_id           :bigint(8)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
