class Conversation < ApplicationRecord
  has_many :messages
  has_many :conversations_users
  has_many :users, through: :conversations_users

  def as_json(options = {})
    h = super
    h[:user_name] =
    h
  end
end
