class TeamStatistics
  @@teams = nil
  @@game_teams = nil
  def self.set_teams(teamcsv, game_teams)
    @@teams = CSVHelper.teamsCSV(teamcsv)
    @@game_teams = CSVHelper.game_teamsCSV(game_teams)
  end

  def self.team_info(team_id)
    team = self.find_team(team_id)
    {
      'team_id' => team.team_id.to_s,
      'franchise_id' => team.franchise_id.to_s,
      'team_name' => team.team_name.to_s,
      'abbreviation' => team.abbreviation.to_s,
      'link' => team.link.to_s
    }
  end

  def self.best_season(team_id)
    team = self.find_team(team_id)
    games_by_season = self.team_games_by_season(team)
    
  end
  
  private

  def self.find_team(team_id)
    team_id = team_id.to_i
    @@teams.find{ |team| team.team_id == team_id}
  end

  def self.team_games_by_season(team)
    game_teams = @@game_teams.find_all { |game_team| game_team.team_id == team.team_id }
    game_teams_seasons = Hash.new([])
    game_teams.each do |game_team|
      game_teams_seasons[game_team.season] << game_team
    end
    game_teams_seasons
  end

  def self.team_win_percent(games)
    wins = games.count do |game|
      game.results == 'WIN'
    end
    wins / games.count
  end
end