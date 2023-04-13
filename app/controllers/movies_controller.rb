require 'csv'

class MoviesController < ApplicationController
  def create_from_csv
    csv_text = File.read(Rails.root.join('public', 'netflix_titles.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

    csv.each do |row|
      Movie.create!(
        title: row['title'],
        description: row['description'],
        country: row['country'],
        year: row['release_year'],
        genre: row['listed_in']
      )
    end

    render json: { message: "Filmes criados a partir do arquivo CSV com sucesso!" }
  end

end
