require 'rails_helper'

RSpec.describe 'My Transactions', type: :request do
  before(:each) do
    @user = User.create!(name: 'fname3 M2. Lname2', email: 'user3@budgetapp.com', password: 'password3', id: 1)
    @categ = Category.create!(name: 'category3', icon: 'third categ', user: @user, id: 1)
    @transaction = MyTransaction.create!(name: 'house rent3', amount: 400, id: 1, user: @user)
    # @transaction2 = MyTransaction.create!(name: "Firfir", amount: 3, user: @user)

    #     @category_my_transaction = CategoryMyTransaction.create!(category: @categ,
    # my_transaction: @transaction)
    # @category_my_transaction2 = CategoryMyTransaction.create!(category: @categ, my_transaction: @transaction2)
  end

  before do
    @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
    subject
  end

  describe 'GET /index' do
    before(:each) { get category_my_transactions_path(category_id: @categ.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before(:each) { get category_my_transaction_path(category_id: 1, id: @transaction.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /new' do
    before(:each) { get new_category_my_transaction_path(category_id: @categ.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    before(:each) { post category_my_transactions_path(category_id: @categ.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /edit' do
    before(:each) { get edit_category_my_transaction_path(category_id: @categ.id, id: @transaction.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /update' do
    before(:each) { put category_my_transaction_path(category_id: @categ.id, id: @transaction.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /update' do
    before(:each) { delete category_my_transaction_path(category_id: @categ.id, id: @transaction.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end
end
