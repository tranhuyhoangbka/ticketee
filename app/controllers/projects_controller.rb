class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.order(:name).page params[:page]
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to @project, notice: "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes project_params
      flash[:success] = "Project has been updated"
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been updated"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project has been deleted"
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find params[:id]
  end
end