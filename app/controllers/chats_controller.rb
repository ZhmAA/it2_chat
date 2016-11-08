class ChatsController < ApplicationController
  def index
    @users = User.all.reverse
    @chats = current_user.chats.all
  end

  def show
    @chat = Chat.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end
  
  #def new
  #  @chat = current_user.chats.create(params[:user_id])
  #  @chat.save
  #  redirect_to chat_path(@chat.id)
  #end

  def new
    @chat = current_user.chats.new
  end

  def create
    @chat = current_user.chats.create(params[:user_id])
    if @chat.save
      flash[:success] = "Chat created successful"
      redirect_to chats_path
    else
      render 'new'
    end
  end
end
