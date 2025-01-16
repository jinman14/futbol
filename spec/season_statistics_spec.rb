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
    it 'most_accurate_team' do
      expect(SeasonStatistics.most_accurate_team("20132014")).to eq "Real Salt Lake"
      # expect(SeasonStatistics.most_accurate_team("20142015")).to eq "Toronto FC"
    end

    it 'least_accurate_team' do
      expect(SeasonStatistics.least_accurate_team("20132014")).to eq "New York City FC"
      expect(SeasonStatistics.least_accurate_team("20142015")).to eq "Columbus Crew SC"
    end
  end

  describe 'tackle assessment' do
    xit 'can tell about tackles' do
      expect(@season_stats.most_tackles).to eq("")
      expect(@season_stats.fewest_tackles).to eq("")
    end
  end

end