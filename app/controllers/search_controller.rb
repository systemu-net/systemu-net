class SearchController < ApplicationController
  before_action :set_conversation, except: [:index, :new]
  before_action :check_participating!, except: [:index, :new]

  def index
  end

  def new
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    @personal_message = PersonalMessage.new
    respond_to :js
  end

  def show
    @personal_message = PersonalMessage.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end
