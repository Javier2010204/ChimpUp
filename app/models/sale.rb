# == Schema Information
#
# Table name: sales
#
#  id         :bigint(8)        not null, primary key
#  number     :integer
#  date       :datetime
#  state      :integer
#  user_id    :bigint(8)
#  client_id  :bigint(8)
#  company_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ApplicationRecord
    has_many :sale_details, inverse_of: :sale, dependent: :destroy
    has_many :products, through: :sale_details
    belongs_to :user
    belongs_to :client
    belongs_to :company

    validates :number, presence: true
    validates :date, presence: true

    accepts_nested_attributes_for :sale_details, reject_if: sale_detail_rejectable?, allow_destroy: true

    enum state: [:draft, :confirmed]

    def total
        details = self.sale_details

        total = 0.0
        details.flat_map do |d|
            total += d.qty * d.price
        end
        total
    end

    private
        def sale_detail_rejectable?(att)
            att[:product_id].blank? || att[:qty].blank? || att[:qty].to_f <= 0 ||att[:price].to_f <= 0
        end
end
