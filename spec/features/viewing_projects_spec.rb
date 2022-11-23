require 'rails_helper'

RSpec.feature 'Users can view projects' do
  scenario 'with the project details' do
    project = FactoryBot.create(:project, name: 'Visual Studio Code')

    visit '/'
    click_link "show_project_#{project.id}"
    expect(page.current_url).to eq project_url(project)
  end
end