require 'rails_helper'

RSpec.feature 'Users can sign up' do
  scenario 'when provided valid details' do
    visit '/'
    click_link 'Sing up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'commit'
    expect(page).to have_content('You have signed up successfully.')
  end
end