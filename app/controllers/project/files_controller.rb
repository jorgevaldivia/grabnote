class Project::FilesController < ApplicationController
  before_action :set_project
  respond_to :json

  def create
    # TODO(kevin): upload to s3, get key and store with file
    @file = Project::File.new(
      name: 'test',
      key: 'fillmein.txt',
      user: current_user,
      project: @project
    )
    @activity = Activity.new(
      action: 'create',
      trackable: @file,
      user: current_user,
      project: @project
    )
    if @file.save and @activity.save
      respond_with(@file, location: nil)
    else
      respond_with({error: 'Cannot process request'}, status: 503)
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_file_params
      params.require(:project_file).permit(:name)
    end
end