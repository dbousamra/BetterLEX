class AddSemesterAndRecommendAndUsernameToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :username, :string
    add_column :reviews, :recommend, :boolean
    add_column :reviews, :semester, :integer
  end
end
