require './lib/csv_helper'
require 'pry'

class SeasonStatistics
  @@games = CSVHelper.gamesCSV('./data/games.csv')
  @@game_teams = CSVHelper.game_teamsCSV('./data/game_teams.csv')
  @@teams = CSVHelper.teamsCSV('./data/teams.csv')

  def self.winningest_coach(season)
    season_games = self.game_teams_in_season(season)
    season_coaches = self.sort_coach_games(season_games)
    season_wins = self.coaches_wins(season_coaches)

    season_wins.max_by { |coach, win_percentage| win_percentage }[0]

  end

  def self.worst_coach(season)
    season_games = self.game_teams_in_season(season)
    season_coaches = self.sort_coach_games(season_games)
    season_wins = self.coaches_wins(season_coaches)

    season_wins.min_by { |coach, win_percentage| win_percentage }[0]

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
    head_coaches = StatsHelper.coaches
    coaches_games = {}

    head_coaches.each { |coach| coaches_games[coach] = [] }

    games.each { |game| coaches_games[game.head_coach] << game }

    coaches_games
  end

  def self.coaches_wins(coaches)
    
    coaches_wins = {}

    coaches.each do |coach, games|
      next if games.size == 0
      wins = games.count { |game| game.result == 'WIN' }
      coaches_wins[coach] = wins.to_f / games.count
    end

    coaches_wins
  end
end