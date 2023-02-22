require 'rails_helper'

RSpec.describe 'Splash Screen Page', type: :system do
  describe "SplashScreen /show" do
    before :each do
      visit root_path
    end

    it 'should display the application name' do
      expect(page).to have_content('Awesome Budget Management')
    end

    it 'should display a button with text LOG IN' do
      expect(page).to have_content('LOG IN')
    end

    it "should redirect to log in form when the 'LOG IN' button is clicked" do
      click_link 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end

    it "should display a button with text 'SIGN UP'" do
      expect(page).to have_content('SIGN UP')
    end

    it "should redirect to register form when the 'SIGN UP' button is clicked" do
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end

  end

end
