class MakeReviewsAJoinTable < ActiveRecord::Migration[6.0]
  ####################
   def up
    Review.destroy_all
remove_column :reviews, :name 
add_column :reviews,:user_id,:integer
  end
########################################
  def down
    Review.destroy_all
remove_column :reviews,:user_id
add_column :reviews,:name,:string
  end
  ###################
end

