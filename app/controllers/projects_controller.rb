class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to :projects, :notice => "Successful update!"
    else
      redirect_to :projects, :notice => "Edit failed"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      redirect_to :projects, :notice => "Deleted succesfully!"
    else
      redirect_to :projects, :notice => "Delete failed"
    end
  end

  private
    def project_params
      params.permit(:url, :image_url, :description, :platform)
    end

    def signed_in_user
      redirect_to :root, :notice => "You need to be logged in as an admin to do that!" unless current_user
    end

end
