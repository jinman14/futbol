require './spec/spec_helper'

describe TeamStatistics do
  before :all do
    StatsHelper.set_teams('./data/teams_dummy.csv', './data/game_teams_dummy.csv', './data/games_dummy.csv')
    TeamStatistics.set_teams('./data/teams_dummy.csv', './data/game_teams_dummy.csv', './data/games_dummy.csv')
  end

  describe '#team_info' do
    xit "can return team info" do
      expect(TeamStatistics.team_info('1')).to eq({
        'team_id' => '1',
        'franchise_id' => '23',
        'team_name' => 'Atlanta United',
        'abbreviation' => 'ATL',
        'link' => '/api/v1/teams/1'
      })
    end
  end

  describe '#best_season' do
    it "can return highest win percentage for team in season" do
      # expect(TeamStatistics.best_season('6')).to eq("20132014")
      expect(TeamStatistics.best_season('6')).to eq("1")
    end
  end

  describe '#worst_season' do
    it "can return lowest win percentage for team in season" do
      # expect(TeamStatistics.worst_season("6")).to eq("20142015")
      expect(TeamStatistics.worst_season("6")).to eq("2")
    end
  end
end