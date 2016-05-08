class AddTestingFlagToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :for_testing, :boolean, default: false
  end
end
