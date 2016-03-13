require "rails_helper"

RSpec.feature "Users can edit existing tasks" do  
	let(:project) {FactoryGirl.create(:project) }
	let(:task) { FactoryGirl.create(:task, project: project) }

	before do  
		visit project_task_path(project, task)
		click_link "Edit Task"
	end

	scenario "with valid attributes" do  
		fill_in "Subject", with: "Make it really shiny!"
		click_button "Update Task"

		expect(page).to have_content "Task has been updated."

		within("#task h2") do  
			expect(page).to have_content "Make it really shiny!"
			expect(page).not_to have_content "task.subject"
		end
	end

	scenario "with invalid attributes" do  
		fill_in "Subject", with: " "
		click_button "Update Task"

		expect(page).to have_content "Task has not been updated."
	end
end
