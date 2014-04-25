class ProjectsController < ApplicationController
  def new
  	@project = Project.new
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
