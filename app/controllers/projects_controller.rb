class ProjectsController < ApplicationController

	def index
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = "Project has been saved."
			redirect_to @project
		else
			#  nothing, yet
		end
	end
	
end
