class AddPlayIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :play_id, :integer, null:false
  end
end
