class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if term.start_with?('#')
      query = term.gsub('#', '')
      @posts = Post.joins(:hash_tags).where(hash_tags: { name: query })
    else
      @users = User.search(term)
    end
    respond_to :js
  end

  def show
    @user = User.find(params[:id])
    set_meta_tags title: @user.name
    @posts = @user.posts.includes(:photos, :likes, :comments).order("created_at desc")
    @saved = Post.joins(:bookmarks).where("bookmarks.user_id=?", current_user.id).
      includes(:photos, :likes, :comments).order("created_at desc") if @user == current_user
  end

  private

  def term
    @term ||= params[:term]
  end
end
