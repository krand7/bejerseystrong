class ConversationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_conversation,    only: [:show, :delete]

  respond_to :html

  def index
    if current_user.leadership?
      @conversations = Conversation.current
    else
      @conversations = current_user.conversations.current
    end
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    flash[:notice] = 'Conversation was successfully created.' if @conversation.save
    redirect_to conversations_path and return
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    raise StandardError
  end

  def delete
    @conversation.update(deleted: true)
    redirect_to conversations_path and return
  end

  private

    def set_conversation
      @conversation = Conversation.find_by_id(params[:id])
    end

    def conversation_params
        params.require(:conversation).permit(:first_name, :last_name, :email, :phone_number, :state)
    end

end
