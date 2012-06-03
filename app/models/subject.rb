class Subject < ActiveRecord::Base
  attr_accessible :code, :title
  has_many :reviews

  def average_difficulty
  	if self.reviews.count > 0
  		self.reviews.average(:difficulty)
  	else
  		0.0
  	end
  end

  def average_workload
  	if self.reviews.count > 0
  		self.reviews.average(:workload)
  	else
  		0.0
  	end
  end
end
