# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # Project.create(title:"XX案", info: "這是XX專案說明")
# Stage.create( title: "第1週", info: "這是第1週說明")
# Task.create(title:"第1份作業", stage_id:1)
# Task.create(title:"第2份作業", stage_id:1)
# # Classroom.create(name:"公開班")
# # Team.create( classroom_id:1, num:1, name:"第1組")
# User.create( email: "lunacy20@gmail.com", password:"12345678", name:"李靜慧")
# # TeamMembership.create(team_id:1, user_id:1 )
# # ProjectClassroomship.create(project_id:1, classroom_id:1)
ProjStatus.create!(name:"籌備中")
ProjStatus.create!(name:"執行中")
ProjStatus.create!(name:"已結案")
ProjStatus.create!(name:"撤案")

ProjCategory.create!(name:"使命感行動")
ProjCategory.create!(name:"開創力專案")

Group.create!(name:"台北班")
Group.create!(name:"中原班")
Group.create!(name:"政大班")

PartiStatus.create!(name:"參加")
PartiStatus.create!(name:"退出")
PartiStatus.create!(name:"結業")

User.create!( :password => "12345678", :email => "root@example.com", :name => "Admin")

# 要確保 name 的唯一性