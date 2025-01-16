class SeasonStatistics
  @@games = CSVHelper.gamesCSV('./data/games.csv')

  def self.winningest_coach

    StatsHelper.seasons.each do |season|
      
    end
    
  end

  # def worst_coach

  # end

  # def most_accurate_team
    
  # end

  # def least_accurate_team
    
  # end

  def self.most_tackles(season)
    game_teams_in_season = self.game_teams_in_season(season)
    tackles_per_team = {}

    game_teams_in_season.each do |game_team|
      tackles_per_team[game_team.team_id] += game_team.tackles
    end

    most_tackles = tackles_per_team.max_by { |team_id, tackles| tackles}.name
  end

  # def fewest_tackles()
    
  # end

  def coach_win_percent(coach)
    search_coach = coach

    
  end
end

private

def self.game_teams_in_season(season)
  games = @@games.find_all { |game| game.season == season.to_i }.map { |game| game.game_id }
  @@game_teams.find_all { |game| games.include?(game.game_id) }
end