# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |c|
  GoodData.with_project(PROJECT_ID) do |project|
    path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'users.csv')
    puts "Loading #{path}"
    CSV.foreach(path, :headers => true, :return_headers => false) do |user|
      email = user[0]
      role = user[1]
      project.invite(email, role)
    end
  end
end