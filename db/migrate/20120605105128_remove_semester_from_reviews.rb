class RemoveSemesterFromReviews < ActiveRecord::Migration
  def change
  	remove_column :reviews, :semester
  end
end
