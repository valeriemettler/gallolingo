class CreateTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :tiers do |t|
      t.integer :level
      t.integer :course_id

      t.timestamps
    end
  end
end
