require 'rspec'
require 'simplecov'
require './lib/stats_helper'
require './lib/csv_helper'
require './lib/game'
require './lib/team'
require './lib/game_team'

SimpleCov.start

RSpec.describe StatsHelper do
  
  describe '#seasons' do
    it 'can return an array of the seasons' do
      expect(StatsHelper.seasons).to eq([20122013, 20162017, 20142015, 20152016, 20132014, 20172018])
    end
  end
end