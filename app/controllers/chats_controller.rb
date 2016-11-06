class ChatsController < ApplicationController
  def index
    @users = User.all.reverse
  end

  def show
    @chat = Chat.includes(:messages).find_by(id: params[:id])
  end
end
