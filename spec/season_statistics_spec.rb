require 'rspec'
require 'simplecov'
require './lib/csv_helper'
require './lib/season_statistics'
require './lib/team'
require './lib/game_team'

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
    it 'winningest coach' do
      expect(@season_stats.winningest_coach.count).to eq(1)
      expect(@season_stats.winningest_coach).to eq("")
    end

    it 'worst_coach' do
      expect(@season_stats.worst_coach.count).to eq(1)
      expect(@season_stats.worst_coach).to eq("")
    end
  end

  describe 'assess team shot percentage' do
    it 'most_accurate_team' do
      expect(@season_stats.most_accurate_team).to eq("")
    end

    it 'least_accurate_team' do
      expect(@season_stats.least_accurate_team).to eq("")
    end
  end

  describe 'tackle assessment' do
    it 'can tell about tackles' do
      expect(@season_stats.most_tackles).to eq("")
      expect(@season_stats.fewest_tackles).to eq("")
    end
  end

end