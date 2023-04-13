class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :country
      t.integer :year
      t.string :genre

      t.timestamps
    end
  end
end
