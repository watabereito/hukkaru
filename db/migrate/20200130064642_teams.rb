class Teams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :discription
      t.integer :age
      t.text :message

      t.timestamps
    end
  end
end
