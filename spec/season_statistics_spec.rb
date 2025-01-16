require 'rspec'
require 'simplecov'
require './lib/csv_helper'
require './lib/season_statistics'
require './lib/team'
require './lib/game_team'
require 'pry'

SimpleCov.start

RSpec.describe SeasonStatistics do
  before(:each) do 
    @season_stats = CSVHelper.game_teamsCSV('./data/game_teams.csv')
  end

  describe 'can initialize season statistics' do
    it 'can start' do
      expect(@season_stats[0].result).to eq "LOSS"
    end
  end

  describe 'it can check coach win and loss record' do
    xit 'winningest coach' do
      expect(@season_stats.winningest_coach.count).to eq(1)
      expect(@season_stats.winningest_coach).to eq("")
    end

    xit 'worst_coach' do
      expect(@season_stats.worst_coach.count).to eq(1)
      expect(@season_stats.worst_coach).to eq("")
    end
  end

  describe 'assess team shot percentage' do
    xit 'most_accurate_team' do
      expect(@season_stats.most_accurate_team).to eq("")
    end

    xit 'least_accurate_team' do
      expect(@season_stats.least_accurate_team).to eq("")
    end
  end

  describe 'tackle assessment' do
    it 'can tell about tackles' do
      expect(@season_stats.most_tackles("20132014")).to eq("FC Cincinnati")
      expect(@season_stats.fewest_tackles("20132014")).to eq("Atlanta United")
    end
  end

end