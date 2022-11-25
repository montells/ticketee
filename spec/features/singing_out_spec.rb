require 'rails_helper'

RSpec.feature 'Signed users can sign out' do
  let!(:user) { FactoryBot.create :user }

  before do
    login_as(user)
  end

  scenario 'when provided valid credentials' do
    visit '/'
    click_link 'sing_out'
    expect(page).to have_content('Signed out successfully.')
  end
end