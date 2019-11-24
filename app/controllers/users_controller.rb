class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index show edit update destroy)
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def show
  end

  def new
    if logged_in?
      flash[:info] = 'すでにログインしています。'
      redirect_to current_user
    end
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
