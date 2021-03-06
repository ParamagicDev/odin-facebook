# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  default_scope -> { order(created_at: :desc) }
  scope :unread, -> { where(read_at: nil) }
  scope :friend_requests, -> { where(notifiable_type: 'FriendRequest') }
  scope :non_friend_requests, -> { where.not(notifiable_type: 'FriendRequest') }
end
