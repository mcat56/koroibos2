class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.references :bronze
      t.references :silver
      t.references :gold
      t.references :sport, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
    add_foreign_key :events, :olympians, column: :bronze_id, primary_key: :id
    add_foreign_key :events, :olympians, column: :silver_id, primary_key: :id
    add_foreign_key :events, :olympians, column: :gold_id, primary_key: :id
  end
end
