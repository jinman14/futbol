class GameStatistics
    @@games = CSVHelper.gamesCSV('./data/games.csv')

    def self.highest_total_score
        sorted = sort_by_score
        (sorted[-1].home_goals + sorted[-1].away_goals)
    end

    private

    def self.sort_by_score
        @@games.sort_by { |game| game.home_goals + game.away_goals }
    end
end