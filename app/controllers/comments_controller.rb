class CommentsController < ApplicationController
	before_action :set_project
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def new
		@comment = @project.comments.build
	end

	def create
		@comment = @project.comments.build(comment_params)

		if @comment.save
			flash[:notice] = "Comment has been created."
			redirect_to [@project, @comment]
		else
			flash.now[:alert] = "Comment has not been created."
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			flash[:notice] = "Comment has been updated."
			redirect_to [@project, @comment]
		else
			flash.now[:alert] = "Comment has not been updated."
			render "edit"
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Comment has been deleted."

		redirect_to @project
	end

private

  def set_project
  	@project = Project.find(params[:project_id])
  end

  def set_comment
  	@comment = @project.comments.find(params[:id])
  end

  def comment_params
  	params.require(:comment).permit(:subject, :comment)
  end



end
