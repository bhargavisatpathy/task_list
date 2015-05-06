class TasklistsController < ApplicationController
  def new
    @tasklist = Tasklist.new
  end

  def index
    @tasklists = Tasklist.active
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)
    if @tasklist.save
      flash[:success] = "You created a new tasklist!"
      redirect_to root_path
    else
      flash[:errors] = @tasklist.errors.full_messages
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
    @tasklist = Tasklist.find(params[:id])
    if @tasklist.update(tasklist_params)
      flash[:success] = "Your tasklist have been renamed!"
      redirect_to root_path
    else
      flash[:errors] = @tasklist.errors.full_messages
      render :edit
    end
  end

  def destroy
    Tasklist.destroy(params[:id])
    redirect_to tasklists_archived_path
  end

  def archived
    @tasklists = Tasklist.archived
  end

  def archive_tasklist
    tasklist = Tasklist.find(params[:id])
    tasklist.archived = true
    tasklist.save
    redirect_to :back
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end
end
