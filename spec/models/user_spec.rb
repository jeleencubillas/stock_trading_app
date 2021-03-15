require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user sign up" do
    it "1. should not save without first name" do
      @user = User.new()
      @user.email = 'testing@email.com'
      @user.password = '123456'
      @user.last_name = 'Tester'
      @user.date_of_birth = '03/12/1991'

      expect(@user).to_not be_valid
    end

    it "2. should not save without last name" do
      @user = User.new()
      @user.email = 'testing@email.com'
      @user.password = '123456'
      @user.first_name = 'Test'
      @user.date_of_birth = '03/12/1991'

      expect(@user).to_not be_valid
    end

    it "3. should not save if age < 18" do
      @user = User.new()
      @user.email = 'testing@email.com'
      @user.password = '123456'
      @user.last_name = 'Tester'
      @user.first_name = 'Test'
      @user.date_of_birth = '03/12/2015'
      
      expect(@user).to_not be_valid
    end
  end
end
