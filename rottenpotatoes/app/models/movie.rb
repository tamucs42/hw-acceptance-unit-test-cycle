class Movie < ActiveRecord::Base
    # https://github.com/tamucs42/hw-bdd-cucumber/blob/master/rottenpotatoes/app/models/movie.rb
    def self.all_ratings
        %w(G PG PG-13 NC-17 R)
    end
end
