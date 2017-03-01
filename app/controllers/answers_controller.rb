class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    # needs to receive question_id from home page
    # create new answer with submituon from home page - store as content
    @answer = Answer.new(content: text_received_from_homepage)
    @answer.question = question_made_to_user_in_homepage

    # get sentiment from answr model .get_sentiment - store as sentimnt analysis
    @answer.sentiment_analysis = @answer.get_sentiment.label
    @answer.save
    # redirect to questions controller
  end

end
