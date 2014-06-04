class ProjectsController < ApplicationController
  def new
    if current_user
  	 @project = Project.new
    else
      redirect_to :root, :notice => "You need to be logged in as an admin to do that!"
    end
  end

  def index
  	@platforms = Project.uniq.pluck(:platform)
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save
  		flash[:success] = "Project saved!"
  		redirect_to :new
  	else
  		render 'new'
  	end
  end

  private
    def project_params
      params.permit(:url, :image_url, :description, :platform)
    end

end
