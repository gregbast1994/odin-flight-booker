class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.date :departure_date
      t.integer :arrival_id
      t.float :duration
      t.references :passengers, foreign_key: true
      t.timestamps
    end
    add_foreign_key :departure_id, :arrival_id
    add_index :flights, [:departure_id, :arrival_id]
  end
end
