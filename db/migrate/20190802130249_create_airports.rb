class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :country
      t.string :code

      t.timestamps
    end
    add_index :airports, :code
  end
end
