class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations, id: :uuid do |t|
      t.text :content, null: false
      t.references :appointment, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
