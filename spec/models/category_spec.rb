require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user3 = User.create!(name: 'Shegaw M. gobeze', email: 'sheg@budgetapp.com',
                          password: '0931234567')
    @categ1 = Category.create!(name: 'food', user: @user3)
  end

  describe "\nmodel testing" do
    it "\nshould be valid" do
      expect(@categ1).to be_valid
    end

    it "\nThe category name should not be blank" do
      @categ1.name = nil
      expect(@categ1).to_not be_valid
    end

    it "\nThe association between user and this category should be ok" do
      expect(@categ1.user).to be_valid
    end

    it "\nThe user fullname of this category should be exactly 'Shegaw M. gobeze'" do
      expect(@categ1.user.name).to eq('Shegaw M. gobeze')
    end
  end

  describe "\n model validation testing" do
    subject do
      @user4 = User.create!(name: 'Sim A. Desta', email: 'simegnaw@budgetapp.com',
                            password: '0931234567')
      @categ2 = Category.new(name: 'c', user: @user4)
    end

    it "\n The category object should be invalid if the name char length is less than 2 characters" do
      expect(subject).not_to be_valid
    end

    it "\n The Category object should be invalid if the name char length is greater than 30 charactors" do
      subject.name = 'a' * 31
      expect(subject).not_to be_valid
    end
  end
end
