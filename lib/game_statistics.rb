class GameStatistics
    @@games = CSVHelper.gamesCSV('./data/games.csv')

    def self.highest_total_score
        highest_score = @@games.max_by { |game| game.home_goals + game.away_goals }

        highest_score.home_goals + highest_score.away_goals
    end

    def self.lowest_total_score
        lowest_score = @@games.min_by { |game| game.home_goals + game.away_goals }

        lowest_score.home_goals + lowest_score.away_goals
    end

    def self.percentage_home_wins
        home_wins = @@games.count { |game| game.home_goals > game.away_goals }.to_f

        (home_wins / @@games.size).round(2)
    end

    def self.percentage_visitor_wins
        visitor_wins = @@games.count { |game| game.home_goals < game.away_goals }.to_f

        (visitor_wins / @@games.size).round(2)
    end
end