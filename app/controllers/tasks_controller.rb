class TasksController < ApplicationController
  def index
   @user = User.find_by(id: session[:user_id])
   @tasks = @user.tasks if @user
  end
  def new 
   @task = Task.new
  end
  def show
    @task = Task.find(params[:id])
  end
  def create 
   @task = Task.new(task_params)
   if @task.save
    redirect_to @task, notice:"Task is successfully create..!"
   else
     render :new, notice:"Task is not create"
   end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
   @task = Task.find(params[:id])
   if @task.update(task_params)
    redirect_to @task
   else
    render :edit
   end
  end

  def destroy

   @task = Task.find(params[:id])
   @task.destroy
     
   redirect_to root_path
  end

  private
  def task_params
   params.require(:task).permit(:title, :description, :status, :user_id) 
  end
end
