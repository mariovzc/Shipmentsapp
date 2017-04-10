class CreateFleets < ActiveRecord::Migration[5.0]
  def change
    create_table :fleets do |t|
      t.string :name, required: true
      t.references :city, required: true

      t.timestamps
    end
  end
end
