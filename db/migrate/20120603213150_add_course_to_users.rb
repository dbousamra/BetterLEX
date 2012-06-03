class AddCourseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :course, :string
  end
end
