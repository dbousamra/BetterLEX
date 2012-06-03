class Review < ActiveRecord::Base
  belongs_to :subject
  attr_accessible :username, :difficulty, :workload, :review, :semester, :recommend


  validates :username, :difficulty, :workload, :review, :semester, :presence => true
  validates :review, :length => { :minimum =>20 }
  
end
