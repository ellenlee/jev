namespace :dev do

  task :fake_users => :environment do

    puts "-- create member "
    20.times do |u|
      i = u+3
      user = User.new(name: "user_"+i.to_s, :email => i.to_s+"@gmail.com", :password => "12345678" )
      user.save!
    end
    puts "-- finished!"
  end

  task :create_participation => :environment do

    puts "-- start creating participation"
    puts "choose project and group"
    project = Project.find(2)
    group = Group.first

    puts "loading user..."
    User.all.each do |user|
      new_record = Participation.new(project: project, group: group, user:user)
      if new_record.save
        puts "#{user.name} => #{project.name}|#{group.name} successfully"
      else
        puts new_record.errors.full_messages
      end
    end
  end

  task :create_stages_and_tasks => :environment do

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