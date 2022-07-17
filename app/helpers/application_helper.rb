module ApplicationHelper
  def avatar_url user
    return 'Guest' unless user
    return user.image if user&.image
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end

  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias($1)
          %(<img alt="#$1" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end

  def online_status(user)
    content_tag :span, user.name,
                class: "user-#{user.id} online_status #{ 'online' if user.online? }"
  end

  def chatted_time(time)
    time.to_formatted_s(:short)
  end

  def format_time(time)
    time.strftime "%I:%M %p | %B %e"
  end
end
