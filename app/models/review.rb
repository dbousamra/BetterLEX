class Review < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  attr_accessible :difficulty, :workload, :review, :semester, :recommend


  validates :difficulty, :workload, :review, :semester, :presence => true
  validates :review, :length => { :minimum =>20 }

end
