class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      
      if user.authenticate(params[:session][:password])
      redirect_to user_path
    else
      flash[:error] = '邮箱或密码有误'
      render 'new'
    end
  end

  def destroy
  end
end
