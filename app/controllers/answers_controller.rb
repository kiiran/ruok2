class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    # needs to receive question_id and answer content from homepage:
    content = params["text"]
    question_id = params["question_id"].to_i

    @answer = Answer.new(content: content, question_id: question_id)
    # result from the API:
    sentiment_hash = @answer.get_sentiment
    # set sentiment values in answer object:
    @answer.pos = sentiment_hash[:pos]
    @answer.neutral = sentiment_hash[:neutral]
    @answer.neg = sentiment_hash[:neg]
    @answer.save

    # find a question based on highest value (pos, neutral or negative)
    # send question to homepage

    # create a js file to help with rendering shit in the homepage:
    respond_to do |format|
      format.js
    end

  end

end
