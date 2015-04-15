class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :name
      t.string :show
      t.integer :position_id
      t.text :comments
      t.timestamps
    end
  end
end
