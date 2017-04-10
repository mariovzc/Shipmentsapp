class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.string :license_plate, required: true
      t.references :fleet, foreign_key: true, required: true

      t.timestamps
    end
  end
end
