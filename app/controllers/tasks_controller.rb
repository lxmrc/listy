class TasksController < ApplicationController
  before_action :find_task, only: [:complete, :uncomplete, :destroy]

  def index
    @pending_tasks = Task.where(completed: false)
    @completed_tasks = Task.where(completed: true)
    @new_task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to tasks_path
    end
  end

  def complete
    @task.complete
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def uncomplete
    @task.uncomplete
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
