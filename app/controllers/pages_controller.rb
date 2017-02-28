class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @new_convo_history = ConversationHistory.new
    # @question = Question.new(content: "How are you?")
    @new_convo_history.questions.push(@question)
  end
end
