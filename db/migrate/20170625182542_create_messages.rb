class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :subject, limit: 255
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
    add_index :messages, :subject
    add_index :messages, :sender_id
    add_index :messages, :recipient_id
  end
end
