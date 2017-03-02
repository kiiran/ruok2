class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_convo_history = ConversationHistory.new
    @new_convo_history.user = User.first
    @new_convo_history.save
    # @first_question = TemplateQuestion.first_question
    # @new_convo_history.questions.push(@first_question)
  end
end
