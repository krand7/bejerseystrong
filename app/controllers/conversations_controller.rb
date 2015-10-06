class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation,    only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /conversations
  # GET /conversations.json
  def index
    if current_user.admin?
      @conversations = Conversation.current
    else
      @conversations = current_user.conversations.current
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = current_user.conversations.new(conversation_params)
    respond_to do |format|
      if @conversation.save
        format.html { redirect_to conversations_path, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to conversations_path, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations
  # DELETE /conversations.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_conversation
      @conversation = Conversation.find_by_id(params[:id])
    end

    def conversation_params
        params.require(:conversation).permit(:first_name, :last_name, :email, :phone_number, :state)
    end

end
