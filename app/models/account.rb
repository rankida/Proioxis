# == Schema Information
#
# Table name: accounts
#
#  id              :integer         not null, primary key
#  company_name    :string(255)
#  billing_details :string(255)
#  address1        :string(255)
#  address2        :string(255)
#  postcode        :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Account < ActiveRecord::Base
  attr_accessible :address1, :address2, :billing_details, :company_name, :postcode

  validates :company_name, presence: true
  validates :address1, presence: true
  validates :billing_details, presence: true
  validates :postcode, presence: true
end
