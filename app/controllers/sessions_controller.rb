class SessionsController < ApplicationController

  before_action :already_logged_in

  def already_logged_in
    unless params[:action] == "destroy"
      redirect_to cats_url if current_user 
    end
  end

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

  def destroy
    logout
    redirect_to cats_url
  end

end
