# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "Creating subject"

subject1 = Subject.create!(:code => "TTT101", :title => "Test Subject")
user1 = User.create!(:name => 'Bob Sacamano', :email => 'bob@gmail.com', :password => 'admin1', :password_confirmation => 'admin1', :course => "Bachelor of Information Technology")
