class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  before_action :find_conversation!, only: [:index]

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    @personal_message = PersonalMessage.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @personal_message = PersonalMessage.new

    respond_to :js
  end

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      redirect_to(root_path) and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
      @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
    else
      @conversation = Conversation.find_by(id: params[:conversation_id])
      redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
    end
  end
end
