require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/csv_helper'
require './lib/season_statistics'
require './lib/team'
require './lib/game_team'
require 'pry'


RSpec.describe SeasonStatistics do
  describe 'tackle assessment' do
    it 'can tell about tackles' do
      expect(SeasonStatistics.most_tackles("20132014")).to eq("FC Cincinnati")
      expect(SeasonStatistics.fewest_tackles("20132014")).to eq("Atlanta United")
    end
  end
end