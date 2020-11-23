module MoviesHelper


def total_gross movie

return content_tag(:strong,'Floop') if movie.flop?
number_to_currency(movie.total_gross)
end
#############################
def image movie
if movie.image_file_name.blank? || movie.image_file_name== ' '
  image_tag 'placeholder.png'
else 
image_tag "#{movie.image_file_name.strip}"
end

end
##############################
def format_average_stars(movie)
  if !movie.reviews.average(:stars) or movie.reviews.average(:stars).zero?
    content_tag(:strong,"No reviews")
  else
  #pluralize(number_with_precision( movie.average_stars, precision: 1), 'star')
 '*' * movie.average_stars.round
  end
end
##############################
def show_numb_of_reviews_big_then_zero movie
  pluralize(@movie.reviews.count,'review') if @movie.reviews.count>0
end
##############################
end
