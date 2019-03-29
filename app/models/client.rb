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

class Client < ApplicationRecord
  belongs_to :company
  has_many :sales
end
