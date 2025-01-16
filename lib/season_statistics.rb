class SeasonStatistics
  @@games = CSVHelper.gamesCSV('./data/games.csv')
  @@game_teams = CSVHelper.game_teamsCSV('./data/game_teams.csv')
  @@teams = CSVHelper.teamsCSV('./data/teams.csv')

  def self.winningest_coach

    StatsHelper.seasons.each do |season|
      
    end
    
  end

  # def worst_coach

  # end

  def self.most_accurate_team(season)
    season_games = self.game_teams_in_season(season)
    # binding.pry
    season_teams = self.sort_team_games(season_games)
    # binding.pry
    season_accuracy = self.teams_accuracy(season_teams)
    # binding.pry

    most_accurate_team_id = season_accuracy.max_by { |team_id, accuracy| accuracy }[0]
    @@teams.select { |team| team.team_id == most_accurate_team_id }[0].team_name
  end

  def self.least_accurate_team(season)
    season_games = self.game_teams_in_season(season)
    season_teams = self.sort_team_games(season_games)
    season_accuracy = self.teams_accuracy(season_teams)

    least_accurate_team_id = season_accuracy.min_by { |team_id, accuracy| accuracy }[0]
    @@teams.select { |team| team.team_id == least_accurate_team_id }[0].team_name
  end

  # def most_tackles
    
  # end

  # def fewest_tackles
    
  # end

  private

  def self.game_teams_in_season(season)
    games = @@games.find_all { |game| game.season == season.to_i }.map { |game| game.game_id }
    # binding.pry
    @@game_teams.find_all { |game| games.include?(game.game_id) }
  end

  def self.sort_team_games(games)
    team_ids = StatsHelper.team_ids
    teams = {}

    team_ids.each { |team_id| teams[team_id] = [] }

    games.each { |game| teams[game.team_id] << game }

    teams
  end

  def self.teams_accuracy(teams)
    accuracy = {}
    
    teams.each do |team_id, games|
      # binding.pry if games.size == 0
      next if games.size == 0
      # binding.pry if total_accuracy == 0 || games.size == 0
      total_accuracy = games.sum { |game| game.goals.to_f / game.shots }
      accuracy[team_id] =  total_accuracy / games.size
    end

    accuracy
  end
end