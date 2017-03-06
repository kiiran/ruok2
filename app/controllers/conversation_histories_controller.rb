class ConversationHistoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def index
    @convo_histories = ConversationHistory.all
  end

  def new
    @ch = ConversationHistory.find(params["conversation_history_id"])
    @the_questions = @ch.questions
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
