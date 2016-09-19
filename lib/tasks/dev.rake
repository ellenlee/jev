namespace :dev do

  task :fake => :environment do

    puts "Create fake data for development"
    u = User.new( :password => "12345678", :email => "root@example.com", :name => "管理員")
    u.save!
    
    puts "-- 學員"
    20.times do |u|
    	user = User.new(name: "user_"+u.to_s, :email => u.to_s+"@gmail.com", :password => "12345678" )
    	user.save!
    end

    puts "-- create fake classroom"
    Group.create!(name:"中原班")
    Group.create!(name:"政大班")
    Group.create!(name:"公開班")

    puts "-- create fake projects"
    Project.create!(name:"飯店案", info: "這是XX專案說明")
    Project.create!(name:"香氛案", info: "這是XX專案說明")
    Project.create!(name:"媒體案", info: "這是XX專案說明")
    Project.create!(name:"社企案", info: "這是XX專案說明")

    puts "-- create fake stages"
    Project.all.each do |p|
      5.times do |s|
      	stage = Stage.new(name: "第"+s.to_s+"週課程")
      	p.stages << stage
      	stage.save!
      	p.save!
      end
    end

    puts "-- create fake task"
    p1 = Project.first
    p1.stages.all.each do |s|
      5.times do |t|
      	task = Task.new(name: "第"+t.to_s+"份作業")
      	s.tasks << task
      	s.save!
      	task.save!
      end
    end	 

    p2 = Project.second
    p2.stages.all.each do |s|
      3.times do |t|
      	task = Task.new(name: "第"+t.to_s+"份作業")
      	s.tasks << task
      	s.save!
      	task.save!
      end
    end	    
  end
end