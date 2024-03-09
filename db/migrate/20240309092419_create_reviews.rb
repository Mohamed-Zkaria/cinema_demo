class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :user, null: false
      t.integer :stars, null: false
      t.text :review, null: false
      t.timestamps
    end
  end
end
