class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false #index: true, unique: true
      t.string :password_digest, null: false
      t.string :session_token, null: false #index: true, unique: true
      t.timestamps
    end
    # add_index :username, :session_token, index: true, unique: true
  end
end
