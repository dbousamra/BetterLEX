class Review < ActiveRecord::Base
  belongs_to :subject
  attr_accessible :username, :difficulty, :workload, :review, :semester, :recommend
end
