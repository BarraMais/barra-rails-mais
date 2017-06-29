class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.initiated_conversations
  end

  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
      format.json
    end
  end

  def close
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_conversations
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations] ||= []
    session[:conversations].include? @conversation.id
  end
end
