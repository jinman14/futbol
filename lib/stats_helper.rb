require './lib/csv_helper'
require './lib/game'
require './lib/team'

class StatsHelper
  @@games = CSVHelper.gamesCSV('./data/games.csv')
  @@teams = CSVHelper.teamsCSV('./data/teams.csv')
  def self.seasons
    seasons = []
    
    @@games.each do |game|
      seasons << game.season if !seasons.include?(game.season)
    end

    seasons
  end

  def self.team_ids
    team_ids = []

    @@teams.each do |team|
      team_ids << team.team_id
    end

    team_ids
  end
end