require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    let!(:user) { User.create(name: 'Amare M. Kassa', email: 'ame@budgetapp.com', password: '0913850328') }
  end

  let(:invalid_attributes) do
    let!(:user) { User.create(name: 'A', email: 'ame@budgetapp.com', password: '0913850328') }
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_registration_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_session_url
      expect(response).to be_successful
    end
  end
end
