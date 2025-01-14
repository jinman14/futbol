require './lib/csv_helper'
require './lib/game'

class StatsHelper
  @@games = CSVHelper.gamesCSV('./data/games.csv')

  def self.seasons
    seasons = []
    
    @@games.each do |game|
      seasons << game.season if !seasons.include?(game.season)
    end

    seasons
  end
end