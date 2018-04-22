class ProjectsController < ApplicationController
  before_action :sign_in
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_projects


  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      flash[:notice]="Project Added"
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @project.update_attributes(project_params)
  end

  def delete
  end

  def destroy
    @project.destroy
  end

private

  def project_params
    params.require(:project).permit(:client_id, :name, :address1, :address2, :city, :state, :zip, :state, :square_footage, :status, :description, :number)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_projects
      @projects = Project.active.sorted.to_a
  end

end
