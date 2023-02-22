require 'rails_helper'

RSpec.describe 'User accounts', type: :system do
  describe 'Account page' do
    it 'shows the right content' do
      visit user_session_path
      expect(page).to have_content('LOG IN')
    end

    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Users')
    end

    it 'shows the right content' do
      visit new_user_registration_path
      expect(page).to have_content('signup')
    end

  end
end
