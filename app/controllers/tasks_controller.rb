class TasksController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @tasklist = Tasklist.find(params[:tasklist_id])
    @task = Task.new
  end

  def create
    @tasklist = Tasklist.find(params[:tasklist_id])
    @task = Task.new(task_params)
    @task.tasklist = @tasklist
    if @task.save
      flash[:success] = "You created a new task!"
      redirect_to tasklist_path(@tasklist)
    else
      flash[:errors] = @task.errors.full_messages
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @tasklist = Tasklist.find(params[:tasklist_id])
    @task.attachment = nil if params[:remove] = 'on'
    if @task.update(task_params)
      flash[:success] = "Your task was updated!"
      respond_to do |format|
        format.html { redirect_to tasklist_path(@tasklist) }
        format.js
      end
    else
      flash[:errors] = @task.errors.full_messages
      render :edit
    end
  end


  def destroy
    task = Task.destroy(params[:id])
    redirect_to tasklist_path(task.tasklist_id)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :attachment)
  end
end
