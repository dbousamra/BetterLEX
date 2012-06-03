class Subject < ActiveRecord::Base
  attr_accessible :code, :title
  has_many :reviews

  validates :code, :title, :presence => true

  validates :code, :length => { :minimum => 5, :maximum => 7 }
  
  validates :code, :uniqueness => true
  validates :title, :uniqueness => true


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
