class Teammateship < ApplicationRecord
    validates_uniqueness_of :user_id, scope: :team_id
    validate :validate_active_team_uniquess_in_project, on: :create
    # before_create :validate_active_team_uniquess_in_project

    belongs_to	:user
    belongs_to	:team

  def validate_active_team_uniquess_in_project
    user = self.user
    project = team.project

    teams = user.teams.where(project: project)
    original_active_team = user.teammateships.where(team:teams, active: true)

    if original_active_team.count >= 1
      errors[:base] << "must quit original team first"
    else
      true
    end
  end
end
