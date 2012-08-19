# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  company_name    :string(255)
#  billing_details :string(255)
#  address         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :address, :billing_details, :company_name
  has_many :users, :dependent => :destroy

  validates :company_name, presence: true
  validates :address, presence: true
  validates :billing_details, presence: true
end
