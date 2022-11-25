require 'rails_helper'

RSpec.feature 'Users can delete a new project' do
  scenario 'successfully' do
    login_as(FactoryBot.create(:user, :admin))
    project = FactoryBot.create :project, name: 'Visual Studio Code'

    visit project_path(project)
    click_link 'Delete Project'

    expect(page).to have_content('Project has been deleted.')
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content('Visual Studio Code')
  end
end