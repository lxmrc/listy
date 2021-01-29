class TasksController < ApplicationController
  before_action :find_task, only: [:show, :complete, :uncomplete, :destroy]
  before_action :retrieve_tasks, only: [:index, :complete, :uncomplete, :destroy]

  def index
    @new_task = Task.new
  end

  def show
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
      format.js { render 'update_list' }
    end
  end

  def uncomplete
    @task.uncomplete
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js { render 'update_list' }
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js { render 'update_list' }
    end
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end

    def find_task
      @task = Task.find(params[:id])
    end

    def retrieve_tasks
      @pending_tasks = Task.where(completed: false)
      @completed_tasks = Task.where(completed: true)
    end
end
