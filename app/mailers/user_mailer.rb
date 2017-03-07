class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail(to: @user.email, subject: "Hi, #{@user.first_name}")
  end

  def send_questionnaire_to(group)
    @group = group
    group.users.each do |user|
      @user = user
      mail(to: @user.email, subject: "Questionnaire from #{@group.name}")
    end
  end
end
