class Attachment < ApplicationRecord
  belongs_to :product

  validates :archivo, attachment_presence: true

  has_attached_file :archivo, styles: {thumb: "400x400", medium: "750x750"}
  validates_attachment_content_type :archivo, content_type: /\Aimage\/.*\Z/
end
