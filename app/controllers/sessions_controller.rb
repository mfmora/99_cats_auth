class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      login(@user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid Credentials"]
      redirect_to new_session_url
    end
  end

end
