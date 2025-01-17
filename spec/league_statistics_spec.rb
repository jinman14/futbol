require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/game_team'
require './lib/csv_helper'
require './lib/league_statistics'
require './lib/team'
require './lib/game'
require 'pry'

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

  describe '#highest_scoring_visitor' do
    it 'can return highest scoring visitor' do
      expect(@league_stats.highest_scoring_visitor).to eq('FC Dallas')
    end
  end

  describe '#highest_scoring_home_team' do
    it 'can return highest scoring home team' do
      expect(@league_stats.highest_scoring_home_team).to eq('Reign FC')
    end
  end

  describe '#lowest_scoring_visitor' do
    it 'can return the lowest scoring visiting team' do
      expect(@league_stats.lowest_scoring_visitor).to eq('San Jose Earthquakes')
    end
  end

  describe '#lowest_scoring_home_team' do
    it 'can return the lowest scoring home team' do
      expect(@league_stats.lowest_scoring_home_team).to eq('Utah Royals FC')
    end
  end
end