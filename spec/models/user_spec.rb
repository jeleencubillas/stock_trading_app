require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user sign up" do
    it "Shoud not save without first name" do
      @user = User.new()
      @user.email = 'testing@email.com'
      @user.password = '123456'
      @user.last_name = 'Tester'
      @user.date_of_birth = '03/12/1991'

      expect(@user).to_not be_valid
    end

    it "Shoud not save without last name" do
      @user = User.new()
      @user.email = 'testing@email.com'
      @user.password = '123456'
      @user.first_name = 'Test'
      @user.date_of_birth = '03/12/1991'

      expect(@user).to_not be_valid
    end

    it "Shoud not save without age" do
      @user = User.new()
      @user.email = 'testing@email.com'
      @user.password = '123456'
      @user.last_name = 'Tester'
      @user.first_name = 'Test'

      expect(@user).to_not be_valid
    end

    # it "Shoud not save if age is < 18" do
    #   @user = User.new()
    #   @user.email = 'testing@email.com'
    #   @user.password = '123456'
    #   @user.last_name = 'Tester'
    #   @user.first_name = 'Test'
    #   @user.date_of_birth = '03/12/2015'

    #   expect(@user).to_not be_valid
    # end

  end
end
