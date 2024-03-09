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
end