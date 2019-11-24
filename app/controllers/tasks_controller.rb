class TasksController < ApplicationController
  
  def index
    @tasks = @user.tasks
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
end
