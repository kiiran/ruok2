class ConversationHistoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def index
    @convo_histories = ConversationHistory.all
  end

  def new
    # request.session_options[:id]
    @ch = ConversationHistory.find(params[:conversation_history_id])
    @the_questions = @ch.questions.order(created_at: :asc)

    @the_question_1 = Question.find(@the_questions[0]).content
    @the_answer_1 = Answer.find_by(question_id: @the_questions[0].id).content

    @the_question_2 = Question.find(@the_questions[1]).content
    @the_answer_2 = Answer.find_by(question_id: @the_questions[1].id).content

    @the_question_3 = Question.find(@the_questions[2]).content
    @the_answer_3 = Answer.find_by(question_id: @the_questions[2].id).content

  end

  def show
    @convo_history = ConversationHistory.find(params[:id])
  end

  def create
    @convo_history = ConversationHistory.new(convo_params)
    @convo_history.questions
  end

  def destroy
    ConversationHistory.destroy
  end

  def convo_params
    params.require(:conversation_history).permit(:positive_index, :negative_index, :user_id, :group_id)
  end
end
