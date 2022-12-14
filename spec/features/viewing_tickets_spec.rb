require 'rails_helper'

RSpec.feature 'Users can view tickects' do
  before do
    vs_code = FactoryBot.create(:project, name: 'Visual Studio Code')
    FactoryBot.create(:ticket, project: vs_code,
                      name: 'Make it shiny!',
                      description: 'Gradients! Starbursts! Oh my!')

    ie = FactoryBot.create(:project, name: 'Internet Explorer')
    FactoryBot.create(:ticket, project: ie,
                      name: 'Standards compliance',
                      description: "Isn't a joke.")

  end

  scenario 'for a given project' do
    visit project_path Project.first

    expect(page).to have_content('Make it shiny!')
    puts page.body
    expect(page).to_not have_content('Standards compliance')

    click_link 'Make it shiny!'

    within('.ticket h2') do
      expect(page).to have_content('Make it shiny!')
    end

    expect(page).to have_content('Gradients! Starbursts! Oh my!')
  end
end