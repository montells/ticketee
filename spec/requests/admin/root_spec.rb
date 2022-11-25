require 'rails_helper'

RSpec.describe "/admin", type: :request do

  describe "GET /" do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:user, :admin) }

    context 'when signed in as a user' do
      before do
        login_as(user)
      end

      it 'redirects away' do
        get '/admin'
        expect(response).to have_http_status(302)
      end
    end

    context 'when signed in as admin' do
      before do
        login_as(admin)
      end

      it 'let the admins in' do
        get '/admin'
        expect(response).to have_http_status(200)
      end
    end
  end

end
