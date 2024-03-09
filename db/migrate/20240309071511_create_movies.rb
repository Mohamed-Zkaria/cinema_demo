class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false, index: { unique: true, name: 'unique_movies' }
      t.text :description, null: false 
      t.date :year, null: false
      t.string :director, null: false
      t.string :actor, null: false
      t.string :filming_location, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
