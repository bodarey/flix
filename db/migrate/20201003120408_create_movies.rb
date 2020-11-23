class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :description
      t.string :raiting
      t.text :total_gross
      t.date :released_on
      t.string :decimal

      t.timestamps
    end
  end
end
