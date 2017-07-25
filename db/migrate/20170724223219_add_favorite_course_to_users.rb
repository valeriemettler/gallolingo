class AddFavoriteCourseToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_course, :integer
  end
end
