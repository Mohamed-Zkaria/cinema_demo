class AddIndexOnReviewStars < ActiveRecord::Migration[7.1]
  def change
    add_index(:reviews, [:stars], using: 'btree')
  end
end
