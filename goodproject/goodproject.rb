#Vojta's GoodProject Manager

require 'gooddata';

$my_profile_id = nil


def listprojects()
	projects = Array.new(GoodData::Project.all)

	puts ""
	puts ""	
	puts "Listing GoodData projects available under provided credentials"
	puts ""	
	
	counter = 0
	projects.each do |pr|
	 	counter += 1
	 	puts "#{counter}. "+pr.title+" - "+pr.pid
	end
	puts ""
	puts ""

	print "Choose project:"	
	pnum = gets.chomp.to_i - 1

	wrkproj = projects[pnum]
	project_detail(wrkproj)
end

def listreports(wrkproj)
	GoodData.use wrkproj.pid
	reports = Array.new(GoodData::Report[:all])

	reports.each do |rep|
		puts rep["title"] + " - " + rep["created"].to_s
	end
	puts ""
	puts "Available actions"
	puts ""
	puts "1. Back to active project"
	puts "2. List projects"
	puts ""
	print "Make your choice: "
	go = gets.chomp
	if go == "1"
		project_detail(wrkproj)
	elsif go == "2" 
		listprojects() 
	else 
		print "Unable to comply... dude, use only the given options :)" 
	end

end


def listusers(wrkproj)
	puts ""
	puts ""
	puts "Listing users in project - "+wrkproj.title
	puts ""
	puts ""

	counter = 0
	wrkproj.users.each do |pr|
	 	roles2 = Array.new(pr.roles)

	 	counter += 1
	 	puts "#{counter}. #{pr.first_name} #{pr.last_name}"
	 	puts "Roles: "
	 	roles2.each do |ro|
	 		puts ro.title+" "+ro.created.to_s+", "+ro.summary
	 	end
	 	puts ""
	end
	puts ""
	puts "Available actions"
	puts ""
	puts "1. Back to active project"
	puts "2. List projects"
	puts ""
	print "Make your choice: "
	go = gets.chomp
	if go == "1"
		project_detail(wrkproj)
	elsif go == "2" 
		listprojects() 
	else 
		print "Unable to comply... dude, use only the given options :)" 
	end
end

def listschedules(wrkproj)
	puts ""
	puts ""
	puts "Listing schedules in project - "+wrkproj.title
	puts "--------------------------------------------"
	puts ""
	puts ""

	counter = 0
	wrkproj.schedules.each do |pr|
	 	counter += 1
	 	puts pr.executable.to_s
	 	#puts "Sechude #{counter}"
	 	puts "Process id: "+pr.process_id.to_s
	 	puts "CRON: "+pr.cron.to_s
	 	puts "State: "+pr.state.to_s
	 	puts ""
	 	puts "Listing last 5 runs"
	 	puts ""
	 	counter = 0
	 	pr.executions.each do |ex|
	 			counter += 1
	 			unless counter > 5
	 				puts "Status :" + ex["execution"]["status"]
					puts "Started " + ex["execution"]["startTime"].to_s + " and finished " + ex["execution"]["endTime"].to_s
					if ex["execution"]["status"] == "ERROR"
						puts "Error code: " + ex["execution"]["error"]["errorCode"].to_s
					end
					puts ""
	 			end
	 			
	 			
	 	end


	 	puts "------------------------	"
=begin
	 	execs = Array.new(pr.executions)
	 	counter2 = 0
	 	execs.each do |ex|
	 		print "#{counter2}. " 
	 		pp ex
	 	end	
=end
	end
	puts ""
	puts "Available actions"
	puts ""
	puts "1. Back to active project"
	puts "2. List projects"
	puts "3. Reports"
	puts ""
	print "Make your choice: "
	go = gets.chomp
	if go == "1"
		project_detail(wrkproj)
	elsif go == "2" 
		listprojects() 
	else 
		print "Unable to comply... dude, use only the given options :)" 
	end
end

def project_detail(wrkproj)
	schd = false
	puts ""
	puts ""
	puts "Project name: "+wrkproj.title
	puts ""
	puts "PID: "+wrkproj.pid
	puts "Project state: "+wrkproj.state.to_s
	
	begin
	wrkproj.users.each do |us|
		if $my_profile_id == us.obj_id
			us.roles.each do |rol|
				if rol.title == "Admin"
					schd = true
					puts "Author: "+wrkproj.author
					puts "Users count: "+wrkproj.users.count.to_s
					puts "Schedules count: "+wrkproj.schedules.count.to_s
				end
			end
		end	
	end
	rescue
		puts ""
	end

	
	puts ""
	puts "Available actions"
	puts ""
	if schd == true
		puts "1. List users"
	 	puts "2. List schedules" 
	end
	puts "3. Reports"
	puts "4. List projects"
	puts ""

	print "Choose action:"
	action = gets.chomp.to_i

	if action == 1 && schd
		listusers(wrkproj)
	elsif action == 2 && schd
		listschedules(wrkproj)
	elsif action == 3
		listreports(wrkproj)
	elsif action == 4
		listprojects()
	else 
		puts "Unable to comply... dude, use only the given options :)"
		listprojects()
	end
end
def user_info()
	
	projects = Array.new(GoodData::Project.all)


	puts "Logged in as "+GoodData::User.first_name+" "+GoodData::User.last_name
	puts "Status: "+GoodData::User.status
	puts "Title: "+GoodData::User.title


end
puts "Welcome to GoodProject Manager"
puts ""
print "Enter your GoodData login:"
login = gets.chomp
print "Enter your password:";
password = gets.chomp

login = "vojtech.pasler@gooddata.com"
password = "Vojta01.iff"

session = GoodData.connect(login,password)



$my_profile_id = session.user["profile"].split("/")[4]



# pp GoodData::Project.all


#user_info()
listprojects()




=begin
	
rescue Exception => e
projects.each do |project|
	puts project.title;
end	
=end

