class TasklistsController < ApplicationController
  def new
    @tasklist = Tasklist.new
  end

  def index
    @tasklists = Tasklist.where(archived: false)
  end

  def create
    tasklist = Tasklist.new(tasklist_params)
    if tasklist.save
      flash[:success] = "You created a new tasklist!"
      redirect_to root_path
    else
      flash[:errors] = "Sorry, your tasklist was not created. Please try again."
      render :new
    end
  end

  def show
    @tasklist = Tasklist.find(params[:id])
    @tasks = @tasklist.tasks
  end

  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  def update
    tasklist = Tasklist.find(params[:id])
    if tasklist.update(title: params[:tasklist][:title])
      redirect_to root_path
    else
      flash[:errors] = "Please try again!"
      render :edit
    end
  end

  def destroy
    Tasklist.destroy(params[:id])
    redirect_to root_path
  end

  def archived
    @tasklists = Tasklist.where(archived: true)
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end
end
