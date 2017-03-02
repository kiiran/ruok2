class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]
  def create
    # needs to receive question_id and answer content from homepage:
    answer_content = params["text"]
    template_question_id = params["question_id"].to_i
    template_question = TemplateQuestion.find(template_question_id)

    # create a new question to give it this answer:
    @question = Question.make_from(template_question)
    @answer = Answer.new_with_sentiment(answer_content, @question)

    # find a question based on highest value (pos, neutral or negative)
    # send question to homepage

    # create a js file to help with rendering shit in the homepage:
    respond_to do |format|
      format.js
    end

  end

end
