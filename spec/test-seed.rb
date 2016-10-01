	before	do
		# user
		@user1 = User.create!(name:"xx", email:"lunacy20@gmail.com", password:"12345678")
		@user2 = User.create!(name:"xx", email:"leechinghui.tw@gmail.com", password:"12345678")

		#project, group, participations
		ProjCategory.create!(name:"使命感行動")
		ProjStatus.create!(name:"執行中")
		PartiStatus.create!(name:"進行中")

		@project = Project.create!(name:"xx", category_id: 1 , status_id: 1, creator: @user1)
		@group = Group.create!(name:"台北班")
		@participation1 = Participation.create!(group: @group, project: @project, user: @user1, status_id:1 )
		@participation2 = Participation.create!(group: @group, project: @project, user: @user2, status_id:1 )

		#teams, teammateships
		@team1 = Team.create!(project: @project, group: @group, num:1)
		@team2 = Team.create!(project: @project, group: @group, num:2)
		@user1.teams << @team1
		@user2.teams << @team2

		#stage, lesson
		@stage1 = Stage.create!(project: @project, num: 1)
		@lesson1 = Lesson.create!(name:"lesson01", stage: @stage1, group: @group, num:1)

		#task, assignment
		@task_teamwork = Task.create!(num:1, team_work: true, project: @project, name:"task_teamwork")
		@assign_teamwork = Assignment.create!(task: @task_teamwork, deadline: DateTime.now, assigned_at: DateTime.now, group: @group, stage: @stage1, num:1)

		@task_personal = Task.create!(num:2, team_work: false, project: @project, name:"task_personal")
		@assign_personal = Assignment.create!(task: @task_personal, deadline: DateTime.now, assigned_at: DateTime.now, group: @group, stage: @stage1, num:1)

		#user's upload
		@upload_teamwork = Upload.create!(user: @user1, task: @task_teamwork, assignment: @assign_teamwork, team: @team1, group: @group, stage: @stage1, on_time: true)
		@upload_personal = Upload.create!(user: @user1, task: @task_personal, assignment: @assign_personal, team: @team1, group: @group, stage: @stage1, on_time: true)
	end