class Project::CommentsController < ApplicationController
  include Trackable
  before_action :set_project
  respond_to :json

  def create
    @comment = Project::Comment.new(
      body: project_comment_params[:body],
      user: current_user,
      project: @project)
    if @comment.save
      track @comment
      respond_with(@comment, location: nil)
    else
      respond_with({error: 'Cannot process request'}, status: 503)
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_comment_params
      params.require(:project_comment).permit(:body)
    end
end