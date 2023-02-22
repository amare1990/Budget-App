require 'rails_helper'

RSpec.describe 'Category Page', type: :system do
  describe 'category#index' do
    before :each do
      @user = User.create!(name: 'kefie g. Sim', email: 'kefie@budgetapp.com', password: '0913850328')
      @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
      @categ = Category.create(name: 'Transport', icon: @icon_file, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'kefie@budgetapp.com'
      fill_in 'user_password', with: '0913850328'
      click_button 'Log in'
      sleep(2)
      visit categories_path
    end

    it 'should display the name of the category' do
      expect(page).to have_content(@category.name)
    end

    it 'should display the title of the page' do
      expect(page).to have_content('Categories')
    end

    it "should display exactly a button with text 'Add new category'" do
      expect(page).to have_content('Add new category')
    end

    it "should redirect to a page when the 'Add new category' button is clicked" do
      click_link 'Add new category'
      expect(page).to have_current_path(new_category_path)
    end

    it "should display buttons with text Detail" do
      expect(page).to have_content('Detail')
    end
  end
end
