class AddOverallToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :overall, :integer
  end
end
