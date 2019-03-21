class Company < ApplicationRecord

    has_many :products
    has_many :users
    has_many :clients

    validates :name, presence: true
    validates :phone, presence: true

    has_attached_file :logo, styles: {thumb: "100x100", medium: "300x300"}, default_url: "/images/:style/default-logo.png"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

    has_attached_file :cover, styles: {thumb: "400x300", medium: "800x600"}, default_url: "/images/:style/default-cover.png"
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
