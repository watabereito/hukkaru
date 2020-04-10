class RemoveTeamNameFromRecruits < ActiveRecord::Migration[6.0]
  def change

    remove_column :recruits, :team_name, :string
  end
end
