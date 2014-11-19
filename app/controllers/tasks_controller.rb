class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def assigned
    @tasks = Task.where(user_id: current_user.id)
    respond_with(@tasks) do |format|
      format.html { render :index }
    end
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    @task.user_id = params[:user_id] if params[:user_id]
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :user_id, :comment)
    end
end
