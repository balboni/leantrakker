require "rails_helper"

RSpec.feature "Users can delete tickets" do  
	let(:project) { FactoryGirl.create(:project) }
	let(:comment) { FactoryGirl.create(:comment, project: project) }

	before do  
		visit project_comment_path(project, comment)
	end

	scenario "successfully" do  
		click_link "Delete Comment"

		expect(page).to have_content "Comment has been deleted."
		expect(page.current_url).to eq project_url(project)
	end
end
