namespace :movies do
    desc "Importing movies.csv from data folder."
    task import: :environment do
      Task.movies_importer("/data/movies.csv")
    end
  end