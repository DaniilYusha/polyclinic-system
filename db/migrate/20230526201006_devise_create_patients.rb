class DeviseCreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :patients, :phone,                unique: true
    add_index :patients, :reset_password_token, unique: true
  end
end
