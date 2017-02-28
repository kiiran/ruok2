class ConversationHistoriesController < ApplicationController
  def index
    @convo_histories = ConversationHistory.all
  end

  def new
    @conversation_history = ConversationHistory.new
  end

  def show
    @convo_history = ConversationHistory.find(params[:id])
  end

  def create
    @convo_history = ConversationHistory.new(convo_params)
    @convo_history.questions
  end

  def destroy
  end

  def convo_params
    params.require(:conversation_history).permit(:positive_index, :negative_index, :user_id, :group_id)
  end
end
