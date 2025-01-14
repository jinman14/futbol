require 'rspec'
require 'simplecov'
require './lib/game_team'
require './lib/csv_helper'
require './lib/league_statistics'
require './lib/team'
require './lib/game'
SimpleCov.start

describe League_Statistics do
  before :each do
    @league_stats = League_Statistics.new('./data/teams.csv', './data/games.csv')
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@league_stats).to be_a(League_Statistics)
    end
  end

  describe 'count_of_teams' do
    it 'can count teams' do
      expect(@league_stats.count_of_teams).to eq(32)
    end
  end
end