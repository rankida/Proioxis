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

require 'spec_helper'

describe Account do
  before { @account = Account.new(company_name: "Rankida & Co.", billing_details: "free", address1: "Glasgow",
                                  postcode: "G11 XYZ") }

  subject { @account }

  it { should respond_to(:company_name) }
  it { should respond_to(:billing_details) }
  it { should respond_to(:postcode) }

  it { should be_valid }
  
  describe "when company name is not present" do
    before { @account.company_name = "" }
    it { should_not be_valid }
  end
  
  describe "when billing_details name is not present" do
    before { @account.billing_details = "" }
    it { should_not be_valid }
  end
  
  describe "when postcode name is not present" do
    before { @account.postcode = "" }
    it { should_not be_valid }
  end



end
