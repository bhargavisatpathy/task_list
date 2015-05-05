class TasksController < ApplicationController
  def new
    @tasklist = Tasklist.find(params[:tasklist_id])
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(task_params)
    task.tasklist_id = params["tasklist_id"].to_i
    if task.save
      flash[:success] = "You created a new task!"
      redirect_to tasklist_path(task.tasklist_id)

    else
      flash[:errors] = "Sorry, your task was not created. Please try again."
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

  end


  def destroy
    task = Task.destroy(params[:id])
    redirect_to tasklist_path(task.tasklist_id)
  end

  private

  def task_params
    params.require(:task).permit(:title, :decription, :due_date)
  end
end
