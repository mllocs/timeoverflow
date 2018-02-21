class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :device_tokens do |t|
      t.integer :user_id, :null => false
      t.string :token, :null => false
      # t.timestamp :last_notification_at

      t.timestamps
    end
    add_index :device_tokens, [:user_id, :token]
    add_index :device_tokens, [:user_id]
  end
end
