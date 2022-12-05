require 'rails_helper'

RSpec.feature "Admins can change users's detail" do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link 'Edit User'
  end

  scenario 'with valid credentials' do
    fill_in 'user_email', with: 'newguy@examplo.com'
    click_button 'Update User'

    expect(page).to have_content('User has been updated')
    expect(page).to have_content('newguy@examplo.com')
    expect(page).to_not have_content('user.email')
  end

  scenario "when toogling a user's admin ability" do
    check 'user_admin'
    click_button 'Update User'

    expect(page).to have_content 'User has been updated'
    expect(page).to have_content "#{user.email} (Admin)"
  end
end