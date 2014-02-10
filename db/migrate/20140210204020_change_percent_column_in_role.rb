class ChangePercentColumnInRole < ActiveRecord::Migration
  def up
    change_column :roles, :percent_total_scenes, :decimal
  end

  def down
    change_column :roles, :percent_total_scenes, :integer
  end
end
