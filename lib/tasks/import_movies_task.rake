namespace :movies do
    desc "Importing movies.csv from data folder."
    task import: :environment do
      Task.movies_importer("/data/movies.csv")
    end
end

namespace :reviews do 
    desc "Importing reviews.csv from data folder"
 
    task import: :environment do
        Task.reviews_importer("/data/reviews.csv")
    end  
 end