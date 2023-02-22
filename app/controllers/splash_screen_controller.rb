class SplashScreenController < ApplicationController
  load_and_authorize_resource except: %i[show]
  skip_before_action :authenticate_user!
  def show
    redirect_to categories_path if user_signed_in?
  end
end
