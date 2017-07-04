class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save!
      render :show
    else
      flash[:errors] = ["Invalid input"]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
