require 'rspec'
require 'simplecov'
require './lib/csv_helper'
require './lib/team'

SimpleCov.start

describe CSVHelper do
    describe '#teamsCSV' do
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

    describe '#all_teams' do
        it 'can return an array of all teams' do
            expect(CSVHelper.all_teams.count).to eq(32)
        end
    end
end