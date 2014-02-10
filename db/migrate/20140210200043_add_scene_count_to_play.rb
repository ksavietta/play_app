class AddSceneCountToPlay < ActiveRecord::Migration
  def change
    add_column :plays, :scene_count, :integer, default: 0
  end
end
