class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :pick_id
      t.integer :user_id
      t.string :grade
      t.timestamps
    end
  end
end
