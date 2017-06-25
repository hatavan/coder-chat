class MessagesController < ApplicationController

  before_action :require_login

  def index
    @messages = Message.order(:created_at).where(recipient_id: current_user.id)
  end

  def new
  end

  def create
  end

  def sent
    @messages = Message.order(:created_at).where(sender_id: current_user.id)
  end
end
