class Subject < ActiveRecord::Base
  require 'facets/float'
  attr_accessible :code, :title
  has_many :reviews

  validates :code, :title, :presence => true

  validates :code, :length => { :minimum => 5, :maximum => 7 }

  validates :code, :uniqueness => true
  validates :title, :uniqueness => true


  def average_difficulty
  	if self.reviews.is_approved.count > 0
  		self.reviews.is_approved.average(:difficulty).round(2)
  	else
  		0.0
  	end
  end

  def average_overall
    if self.reviews.count > 0
      self.reviews.average(:overall).round(2)
    else
      0.0
    end
  end

  def average_workload
  	if self.reviews.count > 0
  		self.reviews.average(:workload).round(2)
  	else
  		0.0
  	end
  end
end
