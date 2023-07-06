class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :poster_path
      t.date :release_date
      t.float :vote_average
      t.integer :vote_count

      t.timestamps
    end
  end
end
