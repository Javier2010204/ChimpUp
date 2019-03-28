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

class Product < ApplicationRecord
    has_many :taggings
    has_many :sub_categories, through: :taggings
    has_many :attachments

    belongs_to :company
    belongs_to :sub_category
    belongs_to :brand

    has_attached_file :avatar, styles: {thumb: "100x100", medium: "300x300"}, default_url: "/images/:style/default-avatar.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    def product_description
        self.name + ((self.brand != nil) ? ' ' + self.brand.name : '')
    end

    def self.tagged_with(name)
        SubCategory.find_by(name: name).products
    end

    def self.tag_counts

    end

    def brand_name
        if self.brand
            self.brand.name
        else
            ''
        end
    end

    def self.own(company)
        Product.where(company_id: company)
    end
end
