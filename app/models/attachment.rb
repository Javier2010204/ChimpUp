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

class Attachment < ApplicationRecord
  belongs_to :product

  has_attached_file :archivo, styles: {thumb: "100x100", medium: "600x600"}, default_url: "/images/:style/default-avatar.png"
  validates_attachment_content_type :archivo, content_type: /\Aimage\/.*\Z/

end
