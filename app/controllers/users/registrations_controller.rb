class Users::RegistrationsController < Devise::RegistrationsController
  after_save :welcome_email # Run on create & update

  # def create
  #   photo = JSON.parse(params['user']['photo'])
  #   photo = photo[0]['secure_url']
  #   user = User.new(sign_up_params)
  #   user.photo = photo
  #   user.save
  # end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo, :password, :password_confirmation, :current_password)
  end

  def welcome_email
    UserMailer.welcome(self.id).deliver_later
  end
end
