require "rails_helper"

RSpec.feature "Users can create new tasks" do  
	before do  
		project = FactoryGirl.create(:project, name: "Internet Explorer")

		visit project_path(project)
		click_link "New Task"
	end

	scenario "with valid attributes" do  
		fill_in "Subject", with: "Non-standards compliance"
		fill_in "Description", with: "My pages are ugly!"
		click_button "Create Task"

		expect(page).to have_content "Task has been created."
	end

	scenario "when providing invalid attributes" do  
		click_button "Create Task"

		expect(page).to have_content "Task has not been created."
		expect(page).to have_content "Subject can't be blank."
		expect(page).to have_content "Description can't be blank."
	end
end
