class Project::CommentsController < ApplicationController
  before_action :set_project
  respond_to :json

  def create
    @comment = Project::Comment.new(project_comment_params)
    @comment.save
    puts request.format
    respond_with(@comment)
  end

  def destroy

  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_comment_params
      params.require(:project_comment).permit(:user_id, :project_id)
    end
end