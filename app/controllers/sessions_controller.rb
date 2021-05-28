class SessionsController < ApplicationController
    def new 
      @user = User.includes(:categories, :tasks)
    end 
    def create
       @user = User.find_by(username: params[:session][:username])
       if @user && @user.authenticate(params[:session][:password])
          flash[:success] = "Successfully login"
          log_in @user
          redirect_back_or @user
         else
           flash[:alert] = "Invalid email or password"
           render "new"
         end
     end
   
     def destroy
      log_out
      redirect_to login_path
     end
end
