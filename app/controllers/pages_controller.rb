class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_convo_history = ConversationHistory.new
    @first_question = Question.first_question
    @new_convo_history.questions.push(@first_question)
  end
end
