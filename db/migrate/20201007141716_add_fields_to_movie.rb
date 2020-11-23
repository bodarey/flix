class AddFieldsToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :cast, :string, default: ' '
    add_column :movies, :director, :string, default: ' '
    add_column :movies, :duration, :string, default: ' '
    add_column :movies, :image_file_name, :string, default: ' '
  end
end
