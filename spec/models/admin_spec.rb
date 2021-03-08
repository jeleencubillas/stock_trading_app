require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "1. should not save without username" do
    admin = Admin.create(:email => "test@email.com", :password => "test123456")

    expect(admin).to_not be_valid
    expect(admin.errors).to be_present
    expect(admin.errors.to_hash.keys).to include(:username)

  end
end
