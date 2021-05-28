class UsersController < ApplicationController
  require 'date'
  before_action :logged_in_user, only: [:show]
    def show
        time = Time.now 
        @user = User.find(params[:id])
        @products_of_company = Category.where(user_id: params[:id])
        @user_id = User.find(params[:id])
        @categories = Category.joins(:user).where(:user => @user_id)
        @category = Category.joins(:user).where(:user => @user_id)
        @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
        @category_count = Category.joins(:user).where(:user => @user).count
    end
    def new
        @user = User.includes(:categories, :tasks)
        @user_new = User.new
    end
    def create
        @user = User.create(user_params)
         if @user.save 
          flash[:success] = "Welcome to the app!"
          redirect_to @user
         else
          render 'new'
         end
    end
    def user_params
         params.require(:user).permit(:username, :password)
    end
    def home
    end
end
