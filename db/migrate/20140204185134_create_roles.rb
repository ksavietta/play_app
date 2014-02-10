class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :number_of_lines_spoken
      t.integer :longest_speech
      t.integer :number_of_scences_role_appears
      t.integer :percent_total_scenes

      t.timestamps
    end
  end
end
