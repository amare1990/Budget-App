require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(name: 'Endeshaw N. Alemneh', email: 'endesh@gmail.com',
                         password: '09876543')
  end

  describe "\nmodel testing" do
    it "\nshould be valid" do
      expect(@user).to be_valid
    end

    it "\nThe user full name should not be blank" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "\n The user email should not be blank" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end

  describe "\n model validation testing" do
    subject do
      @user2 = User.new(name: 'Sh', email: 'shibe@budgetapp.com', password: '09876543')
    end

    it "\n The user object should be invalid if the name char length is less than 5 characters" do
      expect(subject).not_to be_valid
    end

    it "\n The user object should be invalid if the name char length is greater than 50 characters" do
      subject.name = 'a' * 51
      expect(subject).not_to be_valid
    end
  end
end
