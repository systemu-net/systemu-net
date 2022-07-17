class NotificationsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(personal_message)
    ActionCable.server.broadcast "notifications_#{personal_message.user.id}_channel",
                                  message: render_message('outgoing', personal_message),
                                  conversation_id: personal_message.conversation.id

    ActionCable.server.broadcast "notifications_#{personal_message.receiver.id}_channel",
                                  notification: render_notification(personal_message),
                                  message: render_message('incoming', personal_message),
                                  conversation_id: personal_message.conversation.id

  end

  private

  def render_notification(message)
    NotificationsController.render partial: 'notifications/notification', locals: { message: message }
  end

  def render_message(type, message)
    PersonalMessagesController.render partial: "personal_messages/#{type}_message",
                                      locals: { message: message }
  end
end
