class UsersController < ApplicationController
  before_action :set_user, only: :show
  # def index
  #   redirect_to new_user_session_path
  # end


  # def new
  #   @user = User.new
  #   raise
  # end

  def profile
    @user = current_user
    @answers = Answer.all
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
  def show
  end


  # def destroy
  # end


  private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :photo)
  # end
  def set_user
    @user = User.find(params[:id])
  end

end
