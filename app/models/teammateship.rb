class Teammateship < ApplicationRecord
    validates_uniqueness_of :user_id, scope: :team_id
    validate :validate_active_user_uniquess_in_project

    belongs_to	:user
    belongs_to	:team
    belongs_to  :project

  def validate_active_user_uniquess_in_project
    user = self.user
    team = self.team
    project = team.project

    team_list_1 = project.teams.ids
    team_list_2 = user.teammateships.where(active:true).pluck(:team_id)

    if (team_list_1 & team_list_2).count <= 1
        true
    else
        user.teammateships.where(active:true)
        errors[:base] << "must quit original team first"
    end
  end

	# protected


end
