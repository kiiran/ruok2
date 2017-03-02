class WelcomeEmailJob < ApplicationJob
  # THIS FILE/JOB SEEMS TO BE REDUNDANT (see RegistrationsController method "welcome_email" )
  # queue_as :mailers

  # def perform(user_id)
  #   user = User.find(user_id)
  #   UserMailer.welcome(user).deliver_now
  # end
end
