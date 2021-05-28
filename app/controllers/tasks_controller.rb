class TasksController < ApplicationController
  def show
    time = Time.now 
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
    @category_id = Category.find(params[:category_id])
    @user_id = User.find(params[:user_id])
    @task_id = Task.find(params[:id])
    @tasks = Task.joins(:category).where( :id => @task_id )
  end

  def new
    time = Time.now 
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
    @category_id = Category.find(params[:id])
    @user_id = User.find(params[:user_id])
  end

  def edit
    @category_id = Category.find(params[:category_id])
    time = Time.now 
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
    @user_id = User.find(params[:user_id])
    @task_id = Task.find(params[:id])
  end

  def create
    @category_id = Category.find(params[:id])
    @task_create = Task.create(description: params[:description],completed: params[:completed], completed_at: params[:completed_at] ,category_id: params[:category_id] ) 
    @user_id = User.find(params[:user_id])
    if @task_create.save
      redirect_to show_tasks_path(@category_id,user_id: @user_id), :flash => { :success => "Successfull added new task" }
    else
      redirect_to show_tasks_path(@category_id,user_id: @user_id), :flash => {:alert => "Unabled to add task"}
    end
  end

  def update
    @task = Task.find(params[:id])
    @user_id = User.find(params[:user_id])
    @task.update(description: params[:description],completed: params[:completed], completed_at: params[:completed_at])
      # redirect_to show_tasks_path(@category_id,user_id: @user), :flash => { :success => "Successfull updated new task" }
    
  end

  def destroy
    @task = Task.find(params[:id])
    @user_id = User.find(params[:user_id])
    @category_id = Category.find(params[:category_id])
    @task.destroy
      redirect_to show_tasks_path(@category_id,user_id: @user_id), :flash => { :success => "Successfull Deleted" }
  end

  def index
  end
end
