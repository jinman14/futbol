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

  end

  def games_played(team_id)
    @game_teams.find_all do |game_team|
      game_team.team_id == team_id
    end
  end
end