require 'rails_helper'

RSpec.feature 'Users can create a new project' do
  before do
    visit '/'

    click_link 'New Project'
  end

  scenario 'with valid attributes' do
    fill_in :project_name, with: 'Visual Studio Code'
    fill_in :project_description, with: 'Code editing redefined'
    click_button 'Create Project'

    expect(page).to have_content 'Project has been created.'

    project = Project.find_by! name: 'Visual Studio Code'
    expect(page.current_url).to eq project_url(project)

    title = 'Visual Studio Code - Projects - Ticketee'
    expect(page).to have_title title
  end

  scenario 'with provided in valid attributes' do
    click_button 'Create Project'

    expect(page).to have_content 'Project has not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end