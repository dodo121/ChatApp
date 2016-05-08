class Message < ApplicationRecord
  attr_accessor :user_name

  belongs_to :conversation
  belongs_to :sender, class_name: 'User', foreign_key: :message_sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :message_receiver_id

  def as_json(options = {})
    h = super
    h[:user_name] = sender.email
    h
  end

end
