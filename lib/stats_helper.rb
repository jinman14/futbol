require './lib/csv_helper'
require './lib/game'
require './lib/team'
require './lib/game_team'

class StatsHelper
  def self.set_teams(teamcsv, game_teams, games)
    @@teams = CSVHelper.teamsCSV(teamcsv)
    @@game_teams = CSVHelper.game_teamsCSV(game_teams)
    @@games = CSVHelper.gamesCSV(games)
  end
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

  def self.coaches
    coaches = []

    @@game_teams.each do |game_teams|
      coaches << game_teams.head_coach if !coaches.include?(game_teams.head_coach)
    end

    coaches
  end
end