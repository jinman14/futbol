class StatTracker
  
  def initialize(locations)
    @games = locations[:games]
    @teams = locations[:teams]
    @game_teams = locations[:game_teams]
  end

  def self.from_csv(locations)
    self.new(locations)
  end

  def highest_total_score
    GameStatistics.highest_total_score
  end
end