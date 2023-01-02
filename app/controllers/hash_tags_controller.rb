class HashTagsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_hash_tag, only: [:show]

  def index
    @hash_tags = HashTag.all
  end

  def show
    @posts = @hash_tag.posts
      .paginate(:page => params[:page], :per_page => 7)
      .includes(:photos, :user, :likes, :bookmarks, :comments)
      .order("created_at desc")
    @post = Post.new

    render 'posts/index'
  end

  private

  def find_hash_tag
    @hash_tag = HashTag.find_by name: params[:id]

    return if @hash_tag
    flash[:danger] = "Hashtag does not exist!"
    redirect_to root_path
  end
end
