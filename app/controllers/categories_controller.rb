class CategoriesController < ApplicationController
  require 'date'
  def new
    time = Time.now 
    @user_id = User.find(params[:id])
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
  end

  def show
    time = Time.now 
    @category = Category.find(params[:id])  
    @categories = Category.joins(:task)
    @tasks = Task.joins(:category).where( :categories => @category )
    @user_id = User.find(params[:user_id]) 
    time = Time.now 
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
  end

  def create
    time = Time.now 
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
    @category = User.find(params[:id])
    category_create = Category.create(name: params[:name], description: params[:description], user_id: params[:user_id] )

    if category_create.save
      redirect_to user_path(@category), :flash => { :success => "Successfull added new Category" }
      else
        redirect_to user_path(@category), :flash => {:alert => "Unabled to add Category"}
    end
  end

  def edit
    @user_id = User.find(params[:user_id])
    @category = Category.find(params[:id])
    @categories =  Category.where(:id => @category)
  end

  def update
    @user_id = User.find(params[:user_id])
    @category = Category.find(params[:id])
    @category.update(name: params[:name], description: params[:description])
    redirect_to show_tasks_path(@category,user_id:@user_id), :flash => { :success => "Successfully updated"}
  end

  def destroy
  end
end
