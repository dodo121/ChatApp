class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_many :contacts, trough: :contacts_users

  has_many :sent_messages, class_name: 'Message', foreign_key: :message_sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :message_receiver_id

  has_many :conversations_users
  has_many :conversations, through: :conversations_users

  scope :testing, -> { where(for_testing: true) }

  def callers
    conversations.map do |conv|
      { id: conv.id, users_names: callers_names_except_self(conv.users), newMessagesCount: conv.messages.unseen.count }
    end
  end

  def callers_names_except_self(users)
    users.select { |user| user != self }.map(&:email)
  end
end
