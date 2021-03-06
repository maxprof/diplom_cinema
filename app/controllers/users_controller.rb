class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])#.includes(:cinema)
    check_booking_time
  end

  def edit
    @user = User.find(params[:id])
    check_booking_time
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User profile was successufly updated"
      redirect_to user_path(@user)
    end
    check_booking_time
  end

  private
    def user_params
       params.require(:user).permit(:avatar, :login)
    end
end



