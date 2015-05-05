# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_tasklist
  5.times do |i|
    tasklist = Tasklist.create(title: "tasklist #{i}")
    tasklist.tasks << Task.create(title: "task #{i}:1", description: "description")
    tasklist.tasks << Task.create(title: "task #{i}:2", description: "description")
    tasklist.save
  end

  5.times do |i|
    tasklist = Tasklist.create(title: "tasklist #{i}0", archived: true)
    tasklist.tasks << Task.create(title: "task #{i}0:1", description: "description")
    tasklist.tasks << Task.create(title: "task #{i}0:2", description: "description")
    tasklist.save
  end
end

create_tasklist
