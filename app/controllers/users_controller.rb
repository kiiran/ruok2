class UsersController < ApplicationController

  # def index
  #   redirect_to new_user_session_path
  # end


  # def new
  #   @user = User.new
  #   raise
  # end

  def profile
    @user = current_user
  end


  # def create
  #   raise
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path
  #     notice
  #   else
  #     render :new
  #   end
  # end



  # def destroy
  # end


  # private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :photo)
  # end
end
