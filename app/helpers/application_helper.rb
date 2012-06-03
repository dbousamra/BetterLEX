module ApplicationHelper
  
  def score_color(score)
  	if score > 7.5
  	  "progress-danger"
  	elsif score < 5.0
	  "progress-success"
  	else
  	  "progress-info"
  	end
  end

  def recommend_format(recommend_value)
  	recommend_value ""
  end
end
