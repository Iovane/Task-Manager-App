class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)

    if @task.save
      flash[:notice] = "Task was created successfully"
      redirect_to @task
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      flash[:notice] = "Task was successfully updated"
      redirect_to @task
    else
      render 'edit', status: :unprocessable_entity
    end
  end


  def destroy
    @task.destroy
    flash[:notice] = "Task was successfully deleted"
    redirect_to tasks_path
  end


  private
  def tasks_params
    params.require(:task).permit(:title, :description, :deadline, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

