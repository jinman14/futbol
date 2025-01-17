require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/csv_helper'
require './lib/season_statistics'
require './lib/team'
require './lib/game_team'
require 'pry'


RSpec.describe SeasonStatistics do
  describe 'season coach wins' do
    it '#self.winningest_coach(season) can return the coach with the best record in a season' do
      expect(SeasonStatistics.winningest_coach("20132014")).to eq "Claude Julien"
      expect(SeasonStatistics.winningest_coach("20142015")).to eq "Alain Vigneault"
    end

    it "#self.worst_coach(season) can return the coach with the worst record in a season" do
      expect(SeasonStatistics.worst_coach("20132014")).to eq "Peter Laviolette"
      expect(SeasonStatistics.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
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
end