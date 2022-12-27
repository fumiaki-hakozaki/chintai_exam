class CreateNearestStations < ActiveRecord::Migration[6.0]
  def change
    create_table :nearest_stations do |t|
      t.string :root
      t.string :station
      t.integer :time
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
