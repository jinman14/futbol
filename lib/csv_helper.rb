require 'csv'
require 'pry'
class CSVHelper
    @@teams = []
    @@games = []

    def self.teamsCSV(filepath)
        CSV.foreach(filepath, headers: true, header_converters: :symbol) do |row|
            @@teams << Team.new(
                row[:team_id].to_i,
                row[:franchiseid].to_i,
                row[:teamname],
                row[:abbreviation],
                row[:stadium],
                row[:link]
            )
        end
        @@teams
    end

    def self.gamesCSV(filepath)
        CSV.foreach(filepath, headers: true, header_converters: :symbol) do |row|
            @@games << Game.new(
                row[:game_id].to_i,
                row[:season].to_i,
                row[:type],
                row[:date_time],
                row[:away_team_id].to_i,
                row[:home_team_id].to_i,
                row[:away_goals].to_i,
                row[:home_goals].to_i,
                row[:venue],
                row[:venue_link]
            )
        end
        @@games
    end

    def self.all_teams
        @@teams
    end

    def self.all_games
        @@games
    end
end