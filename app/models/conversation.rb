# frozen_string_literal: true

class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  validates :author, uniqueness: { scope: :receiver }

  scope :participating, lambda { |user|
    where('(conversations.author_id = ? OR conversations.receiver_id = ?)', user.id, user.id)
  }

  scope :between, lambda { |sender_id, receiver_id|
    where(author_id: sender_id, receiver_id:)
      .or(where(author_id: receiver_id, receiver_id: sender_id))
      .limit(1)
  }

  def with(current_user)
    author == current_user ? receiver : author
  end

  def participates?(user)
    author == user || receiver == user
  end
end
