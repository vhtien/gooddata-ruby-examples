# encoding: utf-8

require 'gooddata'

username = 'svarovsky+gem_tester@gooddata.com'
password = 'jindrisska'

# Connect to platform using credentials
puts "Connecting as #{username}"
GoodData.connect username, password

# add all projects under connected user to variable and print it
all_projects = GoodData::Project.all
pp all_projects

# ask for project selected from list of variable all projects and add it to the variable
print 'Specify project URL from list above: '
proj_id = gets.chomp

# change string of project id to GoodData project variable proj_1
proj_1 = GoodData::Project[proj_id]

# list all roles for proj_1 variable
pp proj_1.roles

# ask for role selected from list of roles from variable proj_1 and add role to the variable
print 'Specify role URL from list above: '
role = gets.chomp

# ask for invitation email and add it to the variable
print 'Specify invitation email address: '
email = gets.chomp

# ask for invitation message and add it to the variable
print 'Specify invitation Message: '
message = gets.chomp

# print what will be done in the next step - invitation of user to the project withe selected role and invitation msg
puts "Invitation for '#{email}', with role '#{role}' and message '#{message}' will be send .."

# execution of class invite => sending of user invitation
result = proj_1.invite(email, role, message)

# Print the result
pp result