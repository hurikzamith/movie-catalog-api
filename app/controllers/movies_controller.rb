class MoviesController < ApplicationController
  protect_from_forgery with: :null_session

  # reads the csv file so it can be 
  def read_csv
    # skip_before_action :authenticate_user!
    require 'csv'
    csv_text = File.read('netflix_titles.csv')
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Movie.find_or_create_by(title: row['title'], genre: row['listed_in'], year: row['release_year'], country: row['country'], published_at: row['date_added'], description: row['description'])
    end
    render json: { message: "Dados do CSV importados com sucesso!" }
  end

  # Renderiza em Json todos os filmes filtrados por year, genre, country
  def index
    @movies = Movie.order(year: :asc)
    @movies = @movies.where(year: params[:year]) if params[:year].present?
    @movies = @movies.where(genre: params[:genre]) if params[:genre].present?
    @movies = @movies.where(country: params[:country]) if params[:country].present?
    render json: @movies
  end
end
