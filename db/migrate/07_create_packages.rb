class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.references :user, foreign_key: true
      t.references :order_status, foreign_key: true
      t.references :bus, foreign_key: true

      t.string :trackingid, :unique => true, required: true
      t.decimal :current_lat, :precision=>10, :scale=>6
      t.decimal :current_lng, :precision=>10, :scale=>6
      t.text :description, required: true

      t.references :origin, foreign_key: true
      t.references :destination, foreign_key: true
      t.decimal :weight

      t.timestamps
    end
  end
end
