class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def question_by_mood(sentiment_value)
    # if sentiment_value > 1 => happy
    # elsif sentiment_value <= 1 => sad
    # find a quetsion in db based on type: sad or happy
  end

end
