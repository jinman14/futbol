require './lib/csv_helper'

class League_Statistics

  attr_reader :games, :teams
  
  def initialize(teams, games)
    @teams = CSVHelper.teamsCSV(teams)
    @games = CSVHelper.gamesCSV(games)
    @game_teams = CSVHelper.game_teamsCSV(game_teams)
  end

  def count_of_teams
    @teams.count
  end

  def best_offense
    #for each teamid in game_teams, add goals together and divide by 14882
    @game_teams.each do |game_team|
      game_team[:team_id]
    end
  end
end