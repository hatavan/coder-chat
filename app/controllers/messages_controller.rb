class MessagesController < ApplicationController

  before_action :require_login

  def index
    @messages = Message.order(:created_at).find_by(recipient_id: current_user.id)
  end

  def new
  end

  def create
  end

  def sent
    @messages = Message.order(:created_at).find_by(sender_id: current_user.id)
  end
end
