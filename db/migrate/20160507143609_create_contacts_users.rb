class CreateContactsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts_users do |t|
      t.integer :contact_id
      t.integer :user_id

      t.timestamps
    end
  end
end
