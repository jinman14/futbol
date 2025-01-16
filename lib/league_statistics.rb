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
    teams_average_offence = average_offence

    best_offence_id = teams_average_offence.max_by { |team_id, average_goals| average_goals }[0]

    @teams.select { |team| team.team_id == best_offence_id }[0].team_name
  end

  def worst_offense
    teams_average_offence = average_offence

    worst_offence_id = teams_average_offence.min_by { |team_id, average_goals| average_goals }[0]

    @teams.select { |team| team.team_id == worst_offence_id }[0].team_name
  end

  def highest_scoring_visitor
    highest_visitor = goals(:away).max_by { |team_id, average_goals| average_goals}[0]

    @teams.select { |team| team.team_id == highest_visitor }[0].team_name
  end

  def games_played(team_id)
    @game_teams.find_all do |game_team|
      game_team.team_id == team_id
    end.count
  end

  private

  def average_offence
    games = team_games
    team_ids = StatsHelper.team_ids

    teams_offence = {}

    team_ids.each do |team_id|
      teams_offence[team_id] = games[team_id].sum { |game| game.goals } / (games[team_id].count).to_f
    end

    teams_offence
  end

  def team_games
    team_games = {}
    team_ids = StatsHelper.team_ids

    team_ids.each do |team_id|
      team_games[team_id] = []
    end

    @game_teams.each do |team_game|
      team_games[team_game.team_id] << team_game
    end

    team_games
  end

  def home_or_away_games(home_or_away)
    games = {}
    team_ids = StatsHelper.team_ids

    team_ids.each do |team_id|
      games[team_id] = []
    end

    @games.each do |game|
      if home_or_away == :home
        games[game.home_team_id] << game
      elsif home_or_away == :away
        games[game.away_team_id] << game
      end
    end

    games
  end

  def goals(home_or_away)

    team_ids = StatsHelper.team_ids
    games = home_or_away_games(home_or_away)
    goals = {}

    games.each do |game|

      if home_or_away == :home
        team_ids.each do |team_id|
          total_goals = games[team_id].sum { |game| game.home_goals}
          average_goals = total_goals.to_f / games[team_id].count
          goals[team_id] = average_goals
          
        end

      elsif home_or_away == :away
        team_ids.each do |team_id|
          total_goals = games[team_id].sum { |game| game.away_goals}
          average_goals = total_goals.to_f / games[team_id].count
          goals[team_id] = average_goals
        end
      end

    end
    goals
  end
end