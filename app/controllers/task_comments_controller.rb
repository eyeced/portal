class TaskCommentsController < ApplicationController
  before_action :set_task_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @task_comments = TaskComment.all
    respond_with(@task_comments)
  end

  def comments_for_task
    @task_comments = TaskComment.where(task_id: params[:task_id]) if params[:task_id]
    respond_with(@task_comments)
  end

  def show
    respond_with(@task_comment)
  end

  def new
    @task_comment = TaskComment.new
    @task_comment.task_id = params[:task_id] if params[:task_id]
    respond_with(@task_comment)
  end

  def edit
  end

  def create
    @task_comment = TaskComment.new(task_comment_params)
    @task_comment.save
    respond_with(@task_comment)
  end

  def update
    @task_comment.update(task_comment_params)
    respond_with(@task_comment)
  end

  def destroy
    @task_comment.destroy
    respond_with(@task_comment)
  end

  private
    def set_task_comment
      @task_comment = TaskComment.find(params[:id])
    end

    def task_comment_params
      params.require(:task_comment).permit(:comment, :task_id)
    end
end
