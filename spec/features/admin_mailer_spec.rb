require "rails_helper"

describe "Admins Confirmations on Create", :type => :feature do

  before :each do
    @admin = FactoryBot.build(:admin)
  end

  it "1. should send email confirmation" do
    expect { @admin.save }.to change(Devise.mailer.deliveries, :count).by(1)
    expect(Devise.mailer.deliveries.last.subject).to eq("Confirmation instructions")
    expect(Devise.mailer.deliveries.last.to).to eq([@admin.email])
  end

end