# == Schema Information
#
# Table name: companies
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  address            :string
#  phone              :integer
#  description        :text
#  facebook_link      :string
#  logo_file_name     :string
#  logo_content_type  :string
#  logo_file_size     :bigint(8)
#  logo_updated_at    :datetime
#  cover_file_name    :string
#  cover_content_type :string
#  cover_file_size    :bigint(8)
#  cover_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Company < ApplicationRecord
    has_many :users
    has_many :products
end
