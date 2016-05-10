class AddUserFieldsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :message_sender_id, :integer
    add_column :messages, :message_receiver_id, :integer
  end
end
