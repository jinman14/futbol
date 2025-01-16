require 'rspec'
require 'simplecov'
require './lib/game_team'
require './lib/csv_helper'
require './lib/league_statistics'
require './lib/team'
require './lib/game'
require 'pry'
SimpleCov.start

describe League_Statistics do
  before :each do
    @league_stats = League_Statistics.new('./data/teams.csv', './data/games.csv', './data/game_teams.csv')
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@league_stats).to be_a(League_Statistics)
    end
  end

  describe '#count_of_teams' do
    it 'can count teams' do
      expect(@league_stats.count_of_teams).to eq(32)
    end
  end

  describe '#best_offense' do
    it 'can return team with highest average goals' do
      expect(@league_stats.best_offense).to eq("Reign FC")
    end
  end

  describe '#worst_by' do
    it 'can return the team with the lowest average goals' do
      expect(@league_stats.worst_offense).to eq("Utah Royals FC")
    end
  end

  describe '#games_played' do
    it 'can return amount of games played by team id' do
      expect(@league_stats.games_played(1)).to eq(463)
    end
  end
end