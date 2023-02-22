require 'rails_helper'

RSpec.describe 'My Transaction Page', type: :system do
  describe 'my_transactions#index' do
    before :each do
      @user = User.create!(name: 'kefie G. Sim', email: 'kefie@budgetapp.com', password: '0913850328')
      @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
      @categ = Category.create(name: 'Transport', icon: @icon_file, user_id: @user.id)
      @my_transaction = MyTransaction.create(name: 'plane trip', amount: 5000)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'kefie@budgetapp.com'
      fill_in 'user_password', with: '0913850328'
      click_button 'Log in'
      sleep(2)
      visit category_my_transactions_path(category_id: @categ.id)
    end

    it 'should display the name of the category' do
      expect(page).to have_content(@categ.name)
    end

    it "should display the name of my_transaction in this case 'plane trip'" do
      expect(page).to have_content(@my_transaction.name)
    end

    it "should display the title of the page as 'My transactions'" do
      expect(page).to have_content('My transactions')
    end

    it "should display a button with text 'Add new transaction'" do
      expect(page).to have_content('Add new transaction')
    end

    it "should redirect to a page to add new transaction when the 'Add new transaction button' is clicked" do
      click_link 'Add new transaction'
      expect(page).to have_current_path new_category_my_transaction_path(category_id: @categ.id)
    end
  end
end
