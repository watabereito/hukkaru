class CreateRecruits < ActiveRecord::Migration[6.0]
  def change
    create_table :recruits do |t|
      t.string :title
      t.text :body
      t.string :photo
      t.bigint :team_id
      t.integer :Capacity

      t.timestamps
    end
  end
end
