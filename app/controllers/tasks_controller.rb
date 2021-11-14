class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    completed = params[:completed]
    @tasks = Task.all
    @tasks = Task.where.not(completed_at: nil) if completed == 'complete'
    @tasks = Task.where(completed_at: nil) if completed == 'incomplete'
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to index_path(@task)
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to update_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
