class GameStatistics
    @@games = CSVHelper.gamesCSV('./data/games.csv')

    def self.highest_total_score
        highest_score = @@games.max_by { |game| game.home_goals + game.away_goals }
        highest_score.home_goals + highest_score.away_goals
    end
end