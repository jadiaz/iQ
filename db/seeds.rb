puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.select { |c| c.name !~ /system/ }.each(&:drop)
puts 'SETTING UP DEFAULT USER ACCOUNT'
user = User.create! :email => 'test.user@heatsynclabs.org', :password => 'test123456', :password_confirmation => 'test123456'
puts 'NEW USER CREATED: ' << user.email
