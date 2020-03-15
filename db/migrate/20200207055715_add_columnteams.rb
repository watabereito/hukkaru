class AddColumnteams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :passion, :string
    add_column :teams, :enjoy, :string
    add_column :teams, :Performance, :string
  end
end
