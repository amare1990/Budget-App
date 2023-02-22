require 'rails_helper'

RSpec.describe "SplashScreens", type: :request do
  before(:each) { get root_path }
  describe "GET /show" do
    it "should return http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end

    it "should render the correct template, i.e., 'show' template" do
      expect(response).to render_template(:show)
    end

  end

end
