class ChatsController < ApplicationController
  before_action :users_all, only: [:index, :new]

  def index
    @chats = current_user.chats.all.reverse
  end

  def show
    @chat = Chat.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end
  
  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new
    if @chat.save
      second_user_id = params[:chat][:users].select {|key,value| key == 'check'}.values
      add_user = User.find(second_user_id)
      @chat.users << current_user << add_user
      flash[:notice] = "Chat created successful"
      redirect_to chat_path(@chat.id)
    else
      flash[:error] = "Something wrong"
      render 'new'
    end
  end

  private

  def users_all
    @users = User.all.reverse
  end
end
