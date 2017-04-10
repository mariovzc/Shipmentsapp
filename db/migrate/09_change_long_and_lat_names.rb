class ChangeLongAndLatNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :packages, :current_lat, :latitude
    rename_column :packages, :current_lng, :longitude
  end
end
