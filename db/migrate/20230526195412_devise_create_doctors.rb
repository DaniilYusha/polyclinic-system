class DeviseCreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :avatar
      t.string :phone,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.references :doctor_category, type: :uuid, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end

    add_index :doctors, :phone,                unique: true
    add_index :doctors, :reset_password_token, unique: true
  end
end
