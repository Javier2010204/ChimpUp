class Product < ApplicationRecord

    validates :name, presence: true
    validates :name, length: {minimum: 10, maximum: 120}
    validates :description, presence: true
    validates :description, length: {minimum: 50}
    validates :sale_price, presence: true
    validates :cost_price, presence: true
    validates :brand_id, presence: true
    validates :sub_category_id, presence: true

    has_many :attachments
    belongs_to :company

    has_attached_file :avatar, styles: {thumb: "100x100", medium: "300x300"}, default_url: "/images/:style/default-avatar.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


    def self.own(company)
        Product.where(company_id: company)
    end
end
