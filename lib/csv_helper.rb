require 'csv'
class CSVHelper
    @@teams = []

    def self.teamsCSV(filepath)
        CSV.foreach(filepath, headers: true, header_converters: :symbol) do |row|
            @@teams << Team.new(
                row[:team_id].to_i,
                row[:franchiseid].to_i,
                row[:teamname],
                row[:abbreviation],
                row[:stadium],
                row[:link]
            )
        end
        @@teams
    end

    def self.all_teams
        @@teams
    end
end