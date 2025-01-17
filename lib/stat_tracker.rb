class StatTracker
  
  def initialize(locations)
    @games = locations[:games]
    @teams = locations[:teams]
    @game_teams = locations[:game_teams]

    GameStatistics.set_gamecsv(@games)
    GameStatistics.set_leagueCSV(@teams, @games, @game_teams)
    GameStatistics.set_seasoncsv(@games, @game_teams, @teams)
  end

  def self.from_csv(locations)
    self.new(locations)
  end

  def highest_total_score
    GameStatistics.highest_total_score
  end
end