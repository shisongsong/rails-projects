class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page]).per_page(15)
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def create
    if @user.save
      sign_in @user
      flash[:success] = "注册成功，欢迎加入"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "修改成功"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    flash[:success] = "删除成功"
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Before filters
  def signed_in_user
    #redirect_to signin_path, notice:"请先登录" unless signed_in?
    unless signed_in?
      store_location
      flash[:warning] = "请先登录"
      redirect_to signin_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def admin_user 
    redirect_to (root_path) unless current_user.admin?
  end
end
