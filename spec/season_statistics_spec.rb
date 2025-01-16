require 'rspec'
require 'simplecov'
require './lib/csv_helper'
require './lib/season_statistics'
require './lib/team'
require './lib/game_team'

SimpleCov.start

RSpec.describe SeasonStatistics do
  describe 'season coach wins' do
    xit '#self.winningest_coach(season) can return the coach with the best record in a season' do
      expect(SeasonStatistics.winningest_coach("20132014")).to eq "Claude Julien"
      # expect(SeasonStatistics.winningest_coach("20142015")).to eq "Alain Vigneault"
    end

    xit "#self.worst_coach(season) can return the coach with the worst record in a season" do
      expect(SeasonStatistics.worst_coach("20132014")).to eq "Peter Laviolette"
      expect(SeasonStatistics.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end
end