require 'csv'
class Task
    def self.movies_importer(path)
        path = File.join(Rails.root, path)
        unless File.exist?(path)
            puts "Files doesn't exist."
            return           
        end

        CSV.open( path, headers: true).lazy.each do |row|
            begin
            
                title = row['Movie']
                description = row['Description']
                year = row['Year']
                director = row['Director']
                actor = row['Actor']
                filming_location = row['Filming location']
                country = row['Country']

                next if Movie.exists?(title: title)

                movie = Movie.new({
                    title: title,
                    description: description,
                    year: year,
                    director: director,
                    actor: actor,
                    filming_location: filming_location,
                    country: country
                })

                if movie.save
                    puts "Movie '#{movie.title}' saved successfully."
                else
                    puts "Failed to save movie '#{title}'. Errors: #{movie.errors.full_messages.join(', ')}"
                end
            rescue ActiveRecord::RecordNotUnique => e
                puts "An error of type #{e.class} happened, message is #{e.message}"
            end
        end

    end


    def self.reviews_importer(path)
        path = File.join(Rails.root, path)
        unless File.exist?(path)
            puts "Files doesn't exist."
            return           
        end

        movies_hash = {}

        CSV.open( path, headers: true).lazy.each do |row|
            begin
                title = row['Movie']
                user = row['User']
                stars = row['Stars']
                review = row['Review']
      
                unless(movies_hash[title])
                    movies_hash[title] = movie = Movie.find_by(title: title)
                end
                
                
                review = movies_hash[title].reviews.new({
                    title: title,
                    user: user,
                    stars: stars,
                    review: review,
                })
                if review.save
                    puts "Movie '#{review.title}' saved successfully."
                else
                    puts "Failed to save movie '#{review}'. Errors: #{review.errors.full_messages.join(', ')}"
                end
            rescue ActiveRecord::RecordNotUnique => e
                puts "An error of type #{e.class} happened, message is #{e.message}"
            end
        end
    end
end