class ConversationsController < ApplicationController

  before_action :authenticate_user!

  respond_to :html

  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    flash[:notice] = 'Conversation was successfully created.' if @conversation.save
    respond_with(@conversation)
  end

  def edit
  end

  def update
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
  end

  def destroy
  end

  private

    def conversation_params
        params.require(:conversation).permit(:first_name, :last_name, :email, :phone_number, :state)
    end

end
