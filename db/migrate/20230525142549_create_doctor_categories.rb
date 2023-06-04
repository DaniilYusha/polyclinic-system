class CreateDoctorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_categories, id: :uuid do |t|
      t.string :title, unique: true, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
