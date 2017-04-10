class Add < ActiveRecord::Migration[5.0]
  def change
        add_column :packages, :address, :text
  end
end
