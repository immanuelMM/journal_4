class TodayTasksController < ApplicationController
    require 'date'
  def index
    time = Time.now 
    @user_id = User.find(params[:id])
    @user = Task.includes(:category,:user).where(:category => @user_id )
    @tasks = Task.joins(:category).where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") )
    @taskss = Category.joins(:tasks).where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") )
    # @d = Date.now
    @today_task = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") )
    @today_task_count = Task.where("DATE(completed_at) = ?", time.strftime("%Y-%m-%d") ).count
  end
end
