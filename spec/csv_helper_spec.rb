require 'rspec'
require 'simplecov'
require './lib/csv_helper'
require './lib/team'

SimpleCov.start

describe CSVHelper do
    describe '#self.teamsCSV' do
        it 'can parse teams.csv' do
            teams = CSVHelper.teamsCSV('./data/teams.csv')

            expect(teams[0].team_id).to eq 1
            expect(teams[0].franchise_id).to eq 23
            expect(teams[0].team_name).to eq "Atlanta United"
            expect(teams[0].abbreviation).to eq "ATL"
            expect(teams[0].stadium).to eq "Mercedes-Benz Stadium"
            expect(teams[0].link).to eq "/api/v1/teams/1"
        end
    end

    describe '#self.gamesCSV' do
        it 'can parse games.csv' do
            games = CSVHelper.gamesCSV('./data/games.csv')

            expect(games[0].game_id).to eq 2012030221
            expect(games[0].season).to eq 20122013
            expect(games[0].type).to eq "Postseason"
            expect(games[0].date_time).to eq "5/16/13"
            expect(games[0].away_team_id).to eq 3
            expect(games[0].home_team_id).to eq 6
            expect(games[0].away_goals).to eq 2
            expect(games[0].home_goals).to eq 3
            expect(games[0].venue).to eq "Toyota Stadium"
            expect(games[0].venue_link).to eq "/api/v1/venues/null"
        end
    end

    describe '#self.all_teams' do
        it 'can return an array of all teams' do
            expect(CSVHelper.all_teams.count).to eq 32
        end
    end

    describe '#self.all_games' do
        it 'can return an array of all games' do
            expect(CSVHelper.all_games.count).to eq 7441
        end
    end
end