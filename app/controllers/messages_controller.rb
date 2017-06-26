class MessagesController < ApplicationController

  before_action :require_login

  def index
    @messages = Message.order(:created_at).where(recipient_id: current_user.id)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      flash[:success] = 'Sent message successful'
      redirect_to messages_path
    else
      flash[:error] = "#{@message.errors.full_messages.to_sentence}"
      redirect_to 'new'
    end
  end

  def sent
    @messages = Message.order(:updated_at).where(sender_id: current_user.id)
  end

  def show
    @message = Message.find(params[:id])
    if @message.is_read?
      render 'read'
    elsif current_user.id != @message.sender.id
      if current_user.id == @message.recipient.id
        @message.is_read = true
        !@message.save
      else
        redirect_to messages_path
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body, :recipient_id)
  end
end
