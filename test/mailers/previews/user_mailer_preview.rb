class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.welcome(user)
  end

  def send_questionnaire_to
    group = Group.last
    UserMailer.send_questionnaire_to(group)
  end
end
