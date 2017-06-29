class BarrachatController < ApplicationController
  def index
    session[:conversations] ||= []
    
    @users = User.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                    .find(session[:conversations])
  end
end
