require './lib/csv_helper'

class League_Statistics

  attr_reader :games, :teams, :game_teams
  
  def initialize(teams, games, game_teams)
    @teams = CSVHelper.teamsCSV(teams)
    @games = CSVHelper.gamesCSV(games)
    @game_teams = CSVHelper.game_teamsCSV(game_teams)
  end

  def count_of_teams
    @teams.count
  end

  def best_offense
    #for each teamid in game_teams, add goals together and divide by 14882
    @game_teams.each do |team|
      team[:team_id].uniq?
    end
  end
end