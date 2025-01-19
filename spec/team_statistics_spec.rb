require './spec/spec_helper'

describe TeamStatistics do
  before :all do
    TeamStatistics.set_teams('./data/teams.csv', './data/game_teams.csv', './data/games.csv')
  end

  describe '#team_info' do
    it "can return team info" do
      expect(TeamStatistics.team_info('1')).to eq({
        'team_id' => '1',
        'franchise_id' => '23',
        'team_name' => 'Atlanta United',
        'abbreviation' => 'ATL',
        'link' => '/api/v1/teams/1'
      })
    end
  end

  describe '#best_season'do
    it "can return highest win percentage for team in season" do
      expect(TeamStatistics.best_season('6')).to eq("20132014")
    end
  end
end