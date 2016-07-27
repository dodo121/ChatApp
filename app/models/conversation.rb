class Conversation < ApplicationRecord
  has_many :messages
  has_many :conversations_users
  has_many :users, through: :conversations_users

  scope :by_newest_message, -> { joins(:messages).order('messages.created_at').last }
end
