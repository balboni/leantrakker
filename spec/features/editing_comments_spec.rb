require "rails_helper"

RSpec.feature "Users can edit existing comments" do  
	let(:project) { FactoryGirl.create(:project) }
	let(:comment) { FactoryGirl.create(:comment, project: project) }

	before do  
		visit project_comment_path(project, comment)
		click_link "Edit Comment"
	end

	scenario "with valid attributes" do  
		fill_in "Subject", with: "Make it really shiny!"
		click_button "Update Comment"

		expect(page).to have_content "Comment has been updated."

		within("#comment h2") do  
			expect(page).to have_content "Make it really shiny!"
			expect(page).not_to have_content comment.subject
		end
	end

	scenario "with invalid attributes" do  
		fill_in "Subject", with: ""
		click_button "Update Comment"

		expect(page).to have_content "Comment has not been updated."
	end
end
