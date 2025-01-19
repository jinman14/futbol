class TeamStatistics
  @@teams = nil
  @@game_teams = nil
  @@games = nil
  def self.set_teams(teamcsv, game_teams, games)
    @@teams = CSVHelper.teamsCSV(teamcsv)
    @@game_teams = CSVHelper.game_teamsCSV(game_teams)
    @@games = CSVHelper.gamesCSV(games)
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
    games_by_season = self.game_id_by_season(team)
    game_teams_by_season = self.team_games_by_season(games_by_season)
    # binding.pry
    game_teams_by_season.max_by do |season, games|
      self.team_win_percent(games)
    end[0].to_s
  end
  
  private

  def self.find_team(team_id)
    team_id = team_id.to_i
    @@teams.find{ |team| team.team_id == team_id}
  end

  def self.team_games_by_season(gamehash)
    # binding.pry
    seasons = StatsHelper.seasons
    games_seasons = {}
    seasons.each { |season| games_seasons[season] = [] }
    gamehash.each do |season, games|
      games = games.map do |game|
        @@game_teams.find { |game_team| game_team.team_id == game.home_team_id || game_team.team_id == game.away_team_id }
      end
      games_seasons[season] = games
    end
    games_seasons
  end

  def self.team_win_percent(games)
    wins = games.count do |game|
      game.result == 'WIN'
    end
    wins.to_f / games.count
  end

  def self.game_id_by_season(team)
    games = @@games.find_all { |game| game.home_team_id == team.team_id || game.away_team_id == team.team_id }
    # binding.pry
    seasons = StatsHelper.seasons
    game_seasons = {}
    seasons.each { |season| game_seasons[season] = [] }
    # binding.pry
    games.each do |game|
      game_seasons[game.season] << game
    end
    # binding.pry
    game_seasons
  end
end