require "rails_helper"

RSpec.feature "Users can create new comments" do  
	before do  
		project = FactoryGirl.create(:project, name: "Internet Explorer")

		visit project_path(project)
		click_link "New Comment"
	end

	scenario "with valid attributes" do  
		fill_in "Subject", with: "Non-standards compliance"
		fill_in "Comment", with: "My pages are ugly!"
		click_button "Create Comment"

		expect(page).to have_content "Comment has been created."
	end

	scenario "when providing invalid attributes" do  
		click_button "Create Comment"

		expect(page).to have_content "Comment has not been created."
		expect(page).to have_content "Subjectcan't be blank"
		expect(page).to have_content "Commentcan't be blank"
	end
end

