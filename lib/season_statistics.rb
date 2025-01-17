class SeasonStatistics
  @@games = CSVHelper.gamesCSV('./data/games.csv')
  @@teams = CSVHelper.teamsCSV('./data/teams.csv')
  @@game_teams = CSVHelper.game_teamsCSV('./data/game_teams.csv')
  # def self.winningest_coach

  #   StatsHelper.seasons.each do |season|
      
  #   end
    
  # end

  # def worst_coach

  # end

  # def most_accurate_team
    
  # end

  # def least_accurate_team
    
  # end

  def self.most_tackles(season)
    season_game_teams = self.game_teams_in_season(season)
    tackles_per_team = Hash.new(0)
    
    season_game_teams.each do |game_team|
      tackles_per_team[game_team.team_id] += game_team.tackles
    end
    
    most_tackles = tackles_per_team.max_by { |team_id, tackles| tackles }[0]
    @@teams.find do |team|
      team.team_id == most_tackles
    end.team_name
  end

  def self.fewest_tackles(season)
    season_game_teams = self.game_teams_in_season(season)
    tackles_per_team = Hash.new(0)
    
    season_game_teams.each do |game_team|
      tackles_per_team[game_team.team_id] += game_team.tackles
    end
    
    fewest_tackles = tackles_per_team.min_by { |team_id, tackles| tackles }[0]
    @@teams.find do |team|
      team.team_id == fewest_tackles
    end.team_name
  end
  
  # def fewest_tackles()
  
  # end
  
  def coach_win_percent(coach)
    search_coach = coach
    
    
  end
  
  private
  
  def self.game_teams_in_season(season)
    # binding.pry
    games = @@games.find_all { |game| game.season == season.to_i }.map { |game| game.game_id }
    @@game_teams.find_all { |game| games.include?(game.game_id) }
  end
end