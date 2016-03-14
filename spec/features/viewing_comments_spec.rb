require "rails_helper"

RSpec.feature "Users can view comments" do  
	before do  
		sublime = FactoryGirl.create(:project, name: "Sublime Text 3")
		FactoryGirl.create(:comment, project: sublime,
			subject: "Make it shiny!",
			comment: "This is a comment in a comment.")

		ie= FactoryGirl.create(:project, name: "Internet Explorer")
		FactoryGirl.create(:comment, project: ie,
			subject: "Standards compliance", comment: "This is the comment.")

		visit "/"
	end

	scenario "for a given project" do  
		click_link "Sublime Text 3"

		expect(page).to have_content "Make it shiny!"
		expect(page).to_not have_content "Standards compliance"

		click_link "Make it shiny!"
		within("#comment h2") do  
			expect(page).to have_content "Make it shiny!"
		end

		expect(page).to have_content "This is a comment in a comment."
	end
end
