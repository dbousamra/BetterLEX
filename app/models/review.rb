class Review < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  attr_accessible :difficulty, :workload, :review, :semester, :recommend


  validates :difficulty, :workload, :review, :semester, :presence => true
  validates :review, :length => { :minimum =>20 }

  before_create :check_for_spam

  def request=(request)
    self.user_ip    = request.remote_ip
	  self.user_agent = request.env['HTTP_USER_AGENT']
	  self.referrer   = request.env['HTTP_REFERER']
  end

  def check_for_spam
    self.approved = !Akismetor.spam?(akismet_attributes)
    true # return true so it doesn't stop save
  end

  def akismet_attributes
  	{
	    :key                  => 'abc123',
	    :blog                 => 'http://railscasts.com',
	    :user_ip              => user_ip,
	    :user_agent           => user_agent,
	    :comment_author       => user.name,
	    :comment_author_email => user.email,
	    :comment_content      => review
  	}
  end

  def mark_as_spam!
	  update_attribute(:approved, false)
	  Akismetor.submit_spam(akismet_attributes)
	end

def mark_as_ham!
  update_attribute(:approved, true)
  Akismetor.submit_ham(akismet_attributes)
end

end
