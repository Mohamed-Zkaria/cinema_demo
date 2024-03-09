class AddForeignKeyToMoviesOnReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :movie
  end
end
