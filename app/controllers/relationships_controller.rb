# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :find_user_and_posts, only: %i[follow_user unfollow_user]

  def follow_user
    return unless current_user.follow @user.id

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def unfollow_user
    return unless current_user.unfollow @user.id

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def find_user_and_posts
    @user = User.find_by! id: params[:id]
    @posts = @user.posts.includes(:photos, :likes, :comments)
  end
end
