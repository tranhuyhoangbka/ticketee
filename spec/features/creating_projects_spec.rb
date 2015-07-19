require "rails_helper"

feature "Creating Projects" do
  before :each do
    visit "/"

    click_link "New Project"
  end
  scenario "can create a project" do
    fill_in "Name", with: "TextMate 2"
    fill_in "Description", with: "A text-editor for OS X"
    click_button "Create Project"

    expect(page).to have_content("Project has been created")
    project = Project.where(name: "TextMate 2").first
    expect(current_url).to eq project_url(project)

    expect(page).to have_title("TextMate 2 - Projects - Ticketee")    
  end

  scenario "can not create a project without a name" do        
    click_button "Create Project"

    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end