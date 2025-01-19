class TeamStatistics
  @@teams = nil
  def self.set_teams(teamcsv)
    @@teams = CSVHelper.teamsCSV(teamcsv)
  end

  def self.team_info(team_id)
    team = self.find_team(team_id)
    {
      'team_id' => team.team_id.to_s,
      'franchise_id' => team.franchise_id.to_s,
      'team_name' => team.team_name.to_s,
      'abbreviation' => team.abbreviation.to_s,
      'link' => team.link.to_s
    }
  end

  private

  def self.find_team(team_id)
    @@teams.find{ |team| team.team_id == team_id}
  end
end