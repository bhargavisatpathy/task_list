class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(task_params)
    if task.save
      flash[:success] = "You created a new task!"
      redirect_to tasks_path

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
    # @plan.select_option(params[:option].to_i)
    # @plan.status = "finalized"
    # if @plan.save
    #   invite_friends
    #   flash[:notice] = "Final invitation was sent to your friends!"
    #   redirect_to plans_path
    # else
    #   render :edit
    # end
  end


  def destroy
    Task.destroy(params[:id])
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :decription, :due_date)
  end
end
