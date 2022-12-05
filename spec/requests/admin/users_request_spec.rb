require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do

  let(:admin) { FactoryBot.create(:user, :admin) }

  describe "GET /index" do
    it "returns http success" do
      get admin_users_path
      expect(response).to have_http_status(:success)
    end
  end

end
