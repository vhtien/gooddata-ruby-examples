require 'gooddata'

GoodData.with_connection(login: 'user',
                         password: 'password',
                         server: 'https://some-other-server.com') do |c|
  # just so you believe us we are printing names of all the project under this account
  c.projects.all.each do |p|
    puts p.title
  end
end