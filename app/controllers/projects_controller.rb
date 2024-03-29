class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  respond_to :html, :json

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @new_comment = Project::Comment.new(:project => @project)
    respond_to do |format|
      format.html
      format.json {
        render :json => @project.to_json(
          :include => {
            activities: {
              :include => [
                :trackable,
                :user => { :only => :profile_image }
              ]
            }
          }
        )}
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(:user => current_user)
    @project.save
    respond_with(@project)
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
     format.html { redirect_to projects_url }
     format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.includes(:activities).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
