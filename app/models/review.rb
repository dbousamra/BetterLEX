class Review < ActiveRecord::Base

	include Rakismet::Model

	belongs_to :subject
  belongs_to :user

  attr_accessible :difficulty, :workload, :review, :semester, :recommend, :approved
  
  

  validates :difficulty, :workload, :semester, :review, :presence => true
  validates :review, :length => { :minimum =>20 }

  rakismet_attrs  :author => proc { user.name },
                  :author_email => proc { user.email }, 
                  :author_url => 'http://high-moon-5823.herokuapp.com/',
                  :content => :review

  scope :is_approved, :conditions => { :approved => true }
	scope :has_text_review, where( "review <> ''" )
end
