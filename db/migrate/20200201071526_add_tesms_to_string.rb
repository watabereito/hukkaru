class AddTesmsToString < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :image_main, :string
  end
end
