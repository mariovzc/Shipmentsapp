class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :document, :string
    add_column :users, :role, :integer
  end
end
