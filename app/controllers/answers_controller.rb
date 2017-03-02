class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]
  def create

    # needs to receive question_id and answer content from homepage:
    answer_content = params["text"]
    template_question_id = params["question_id"].to_i
    template_question = TemplateQuestion.find(template_question_id)

    # create a new question to give it this answer:
    @question = Question.new
    @question.subject = template_question.subject
    @question.content = template_question.content
    @question.template_question = template_question
    @question.save

    # finally, create the answer:
    @answer = Answer.new(content: answer_content)
    @answer.question = @question
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
