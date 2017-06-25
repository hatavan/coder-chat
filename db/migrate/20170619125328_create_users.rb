class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email, limit: 255
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email
  end
end
