require './lib/csv_helper'
require 'pry'

class SeasonStatistics
  @@games = CSVHelper.gamesCSV('./data/games.csv')
  @@game_teams = CSVHelper.game_teamsCSV('./data/game_teams.csv')
  @@teams = CSVHelper.teamsCSV('./data/teams.csv')

  def self.winningest_coach(season)
    season_games = self.game_teams_in_season(season)
    season_teams = self.sort_team_games(season_games)
    season_wins = self.team_wins(season_teams)

    best_team = season_wins.max_by { |team_id, win_percentage| win_percentage }[0]

    @@game_teams.find { |game| game.team_id == best_team }.head_coach
  end

  def self.worst_coach(season)
    season_games = self.game_teams_in_season(season)
    season_teams = self.sort_team_games(season_games)
    season_wins = self.team_wins(season_teams)

    worst_team = season_wins.min_by { |team_id, win_percentage| win_percentage }[0]

    @@game_teams.find { |game| game.team_id == worst_team }.head_coach
  end

  # def most_accurate_team(season)
    
  # end

  # def least_accurate_team(season)
    
  # end

  # def most_tackles(season)
    
  # end

  # def fewest_tackles(season)
    
  # end

  private

  def self.game_teams_in_season(season)
    games = @@games.find_all { |game| game.season == season.to_i }.map { |game| game.game_id }
    @@game_teams.find_all { |game| games.include?(game.game_id) }
  end

  def self.sort_coach_games(games)
    team_ids = StatsHelper.team_ids
    coaches = {}

    team_ids.each { |team_id| teams[team_id] = [] }

    games.each { |game| teams[game.team_id] << game }

    teams
  end

  def self.team_wins(teams)
    team_ids = StatsHelper.team_ids
    team_wins = {}

    teams.each do |team_id, games|
      next if games.size == 0
      wins = games.count { |game| game.result == 'WIN' }
      team_wins[team_id] = wins.to_f / games.count
    end

    team_wins
  end
end