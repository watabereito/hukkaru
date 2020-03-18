class AddTeamIdToRecruits < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM recruits;'
    add_reference :recruits, :team, null: false, index: true
  end

  def down
    remove_reference :recruits, :team, index:true
  end
  end
