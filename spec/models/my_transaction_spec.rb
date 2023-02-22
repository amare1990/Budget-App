require 'rails_helper'

RSpec.describe MyTransaction, type: :model do
  before(:each) do
    @user = User.create!(name: 'Shegaw M. gobeze', email: 'sheg@budgetapp.com',
                         password: '0931234567')
    @categ = Category.create!(name: 'food', user: @user)
    @categ2 = Category.create!(name: 'Shelter', user: @user)
    @my_transaction = MyTransaction.create!(name: 'Beyaynet', amount: 2, user: @user)
    @my_transaction2 = MyTransaction.create!(name: 'Firfir', amount: 3, user: @user)

    @category_my_transaction = CategoryMyTransaction.create!(category: @categ,
                                                             my_transaction: @my_transaction)
    @category_my_transaction2 = CategoryMyTransaction.create!(category: @categ,
                                                              my_transaction: @my_transaction2)
  end

  describe "\nmodel testing" do
    it "\nshould be valid" do
      expect(@my_transaction).to be_valid
    end

    it "\nThe category name should not be blank" do
      @my_transaction.name = nil
      expect(@my_transaction).to_not be_valid
    end

    it "\nThe association between user and this transaction should be ok" do
      expect(@my_transaction.user).to be_valid
    end

    it "\nThe user fullname of this transaction should be exactly 'Shegaw M. gobeze'" do
      expect(@my_transaction.user.name).to eq('Shegaw M. gobeze')
    end
    it "\n@mytransaction transaction object should be grouped under food categ" do
      expect(@category_my_transaction.category.name).to eq('food')
    end

    it "\n@mytransaction transaction object should not be grouped under Shelter categ" do
      expect(@category_my_transaction.category.name).to_not eq('Shelter')
    end
  end

  describe "\n model validation testing" do
    subject do
      @user = User.create!(name: 'Sim A. Desta', email: 'simegnaw@budgetapp.com',
                           password: '0931234567')
      @my_transaction = MyTransaction.new(name: 'AB', user: @user)
    end

    it "\n The MyTransaction object should be invalid if the name is blank" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "\n The MyTransaction object should be invalid if the name char length is less than 3 characters" do
      expect(subject).not_to be_valid
    end

    it "\n The MyTransaction object should be invalid if the name char length is greater than 30 charactors" do
      subject.name = 'a' * 31
      expect(subject).not_to be_valid
    end

    it "\n The MyTransaction object should be invalid if the amount is equal to zero" do
      subject.amount = 0
      expect(subject).not_to be_valid
    end

    it "\n The MyTransaction object should be invalid if the amount is less than zero" do
      subject.amount = -1
      expect(subject).not_to be_valid
    end
  end
end
