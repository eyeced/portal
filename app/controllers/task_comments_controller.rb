class TaskCommentsController < ApplicationController
  before_action :set_task_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    if params[:task_id]
      @task_comments = TaskComment.where(task_id: params[:task_id]) if params[:task_id]
    else
      @task_comments = TaskComment.all
    end
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
    @task_comment.added_by_id = current_user.id
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
      params.require(:task_comment).permit(:comment, :task_id, :added_by_id)
    end
end
