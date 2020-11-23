class AddFieldsToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :city, :string
    add_column :reviews, :state, :string
  end
end
