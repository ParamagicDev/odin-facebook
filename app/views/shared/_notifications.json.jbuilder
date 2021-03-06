# frozen_string_literal: true

json.array! notifications do |notification|
  json.id notification.id
  json.sender notification.sender
  json.action notification.action
  json.notifiable do
    json.type notification.notifiable_type.to_s.underscore.humanize.downcase.to_s
  end

  if notification.notifiable_type == 'FriendRequest'
    json.url friend_requests_url
  else
    json.url notifications_url
  end
end
