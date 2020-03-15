class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :leve
      t.string :sex
      t.string :Birthday

      t.timestamps
    end
  end
end
