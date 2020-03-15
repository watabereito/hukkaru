class AddUserIdToTeams < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM teams;'
    add_reference :teams, :user, null: false, index: true
  end

  def down
    remove_reference :teams, :user, index:true
  end
  end
