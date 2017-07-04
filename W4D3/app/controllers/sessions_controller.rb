class SessionsController < ApplicationController
  before_action :redirect_page, only: [:new, :create]
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    return render :new if @user.nil?

    if @user.valid?
      login_user!(@user)
    else
      render :new
    end
  end

  def destroy
    if current_user
      @current_user = current_user
      @current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to cats_url
    end
  end


end
