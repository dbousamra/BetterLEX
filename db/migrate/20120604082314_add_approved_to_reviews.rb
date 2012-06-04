class AddApprovedToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :approved, :boolean
  end
end
