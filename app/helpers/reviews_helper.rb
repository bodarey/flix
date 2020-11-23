module ReviewsHelper

  def time_ago review
   "about #{time_ago_in_words(review.created_at)} ago"
  end

end
