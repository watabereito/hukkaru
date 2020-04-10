class CreateRecruitComments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruit_comments do |t|
      t.string :body
      t.references :recruit, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
