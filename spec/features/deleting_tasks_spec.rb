require "rails_helper"

RSpec.feature "Users can delete tasks" do  
	let(:project) { FactoryGirl.create(:project)}
	let(:task) { FactoryGirl.create(:task, project: project ) }

	before do  
		visit project_task_path(project, task )
	end

	scenario "successfully" do  
		click_link "Delete Task"

		expect(page).to have_content "Task has been deleted."
		expect(page.current_url).to eq project_url(project)
	end
end
