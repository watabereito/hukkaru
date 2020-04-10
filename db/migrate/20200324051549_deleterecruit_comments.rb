class DeleterecruitComments < ActiveRecord::Migration[6.0]
  def change
     drop_table :recruit_comments
  end
end
