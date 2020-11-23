class ChangeMovieTypeToIntegertype < ActiveRecord::Migration[6.0]
  def change

        change_column :movies, :total_gross, :integer, using: 'total_gross::integer'
  end
end

