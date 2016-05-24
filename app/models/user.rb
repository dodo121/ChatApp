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

  enum status: [:active, :away, :inactive]

  def callers
    conversations.map do |conv|
      { conversation_id: conv.id, users_names: callers_names_except_self(conv.users) }
    end
  end

  def callers_names_except_self(users)
    users.select { |user| user != self }.map(&:email)
  end

  def change_status(new_status_id)
    update_attributes(status: new_status_id) if User.statuses.values.include? new_status_id
  end
end
