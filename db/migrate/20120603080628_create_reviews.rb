class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :subject
      t.integer :difficulty
      t.integer :workload
      t.text :review

      t.timestamps
    end
    add_index :reviews, :subject_id
  end
end
