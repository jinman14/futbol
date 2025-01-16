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

    def self.percentage_ties
        ties = @@games.count { |game| game.home_goals == game.away_goals }.to_f

        (ties / @@games.size).round(2)
    end

    def self.count_of_games_by_season
        seasonal_games = {}

        seasons = StatsHelper.seasons

        seasons.each do |season|
            seasonal_games[season.to_s] = @@games.find_all { |game| game.season == season }.count
        end

        seasonal_games
    end

    def self.average_goals_per_game
        total_goals = @@games.sum do |game|
            game.home_goals + game.away_goals
        end.to_f
        (total_goals / @@games.count).round(2)
    end

    def self.average_goals_by_season
        season_goals = {}

        seasons = StatsHelper.seasons

        seasons.each do |season|
            season_games = @@games.find_all { |game| game.season == season }

            total_goals = season_games.sum do |game|
                game.home_goals + game.away_goals
            end.to_f

            season_goals[season.to_s] = (total_goals / season_games.count).round(2)
        end

        season_goals
    end
end