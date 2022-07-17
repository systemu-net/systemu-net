class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> {order(:created_at => :desc)}, dependent: :destroy
  has_many :comments, -> {order(:created_at => :desc)}, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  scope :of_followed_users, -> (following_users) { where user_id: following_users }

  after_commit :create_hash_tags, on: :create

  def is_belongs_to? user
    Post.find_by(user_id: user.id, id: id)
  end

  def is_liked user
    Like.find_by(user_id: user.id, post_id: id)
  end

  def is_bookmarked user
    Bookmark.find_by(user_id: user.id, post_id: id)
  end

  def extract_name_hash_tags
    content.to_s.scan(/#\w+/).map { |name| name.gsub('#', '') }
  end

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end
end
