class TasksController < ApplicationController
	before_action :set_project
	before_action :set_task, only: [:show, :edit, :update, :destroy]


	def new
		@task = @project.tasks.build
	end

	def create
		@task = @project.tasks.build(task_params)

		if @task.save
			flash[:notice] = "Task has been created."
			redirect_to [@project, @task]
		else
			flash.now[:alert] = "Task has not been created."
			render "new"
		end
	end

	def show
	end


	private

	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_task
		@task = @project.tasks.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:subject, :description)
		
	end

end
