class AddColumnTeams < ActiveRecord::Migration[6.0]
  def change
      add_column :teams, :photo, :string
    end
  end
