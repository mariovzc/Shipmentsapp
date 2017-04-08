class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities, :id => false  do |t|
      t.primary_key :code
      t.string :name

      t.timestamps
    end
  end
end
