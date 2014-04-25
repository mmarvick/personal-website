class ProjectsController < ApplicationController
  def new
  	@project = Project.new
  end

  def index
  	@platforms = Project.uniq.pluck(:platform)
  end

  def create
  	@project = Project.new(user_params)
  	if @project.save
  		flash[:success] = "Project saved!"
  		redirect_to :new
  	else
  		render 'new'
  	end
  end

end
