require 'rails_helper'

RSpec.feature 'Admins can edit projects' do
  before do
    login_as(FactoryBot.create(:user, :admin))
    project = FactoryBot.create :project, {name: 'Visual Studio Code'}

    visit project_path(project)
    click_link 'Edit Project'
  end

  scenario 'with the project details' do
    fill_in 'project_name', with: 'VS Code'
    click_button 'Update Project'

    expect(page).to have_content('Project has been updated')
    expect(page).to have_content('VS Code')
  end

  scenario 'when providing invalid attributes' do
    fill_in 'project_name', with: ''
    click_button 'Update Project'

    expect(page).to have_content('Project has not been updated')
  end
end