class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :lesson
      t.string :phrases
      t.integer :tier_id

      t.timestamps
    end
  end
end
