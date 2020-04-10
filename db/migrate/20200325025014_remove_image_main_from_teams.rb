class RemoveImageMainFromTeams < ActiveRecord::Migration[6.0]
  def up
  remove_column :teams, :image_main
    end

def down
  add_column :teams, :image_main, :string
end
end
