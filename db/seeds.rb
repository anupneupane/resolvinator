require 'yaml'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
joe = User.create!(username:"jvenator")
brad = User.create!(username:"brad")
li = User.create!(username:"styliii")

i1 = joe.issues.create!(title:"Issue 1", description:"Some text describing the issue so that other people can help find a solution.")
  a01 = i1.answers.create!({content:"This is the 1st answer.", user: brad })
  a02 = i1.answers.create!({content:"This is the 2nd answer.", user: li })

i2 = brad.issues.create!(title:"Issue 2", description:"Some text describing the issue so that other people can help find a solution.")
  a03 = i2.answers.create!({content:"This is the 1st answer.", user: li })
  a04 = i2.answers.create!({content:"This is the 2nd answer.", user: joe })

i3 = li.issues.create!(title:"Issue 3", description:"Some text describing the issue so that other people can help find a solution.")
  a05 = i3.answers.create!({content:"This is the 1st answer.", user: joe })
  a06 = i3.answers.create!({content:"This is the 2nd answer.", user: brad })

i4 = joe.issues.create!(title:"Issue 4", description:"Some text describing the issue so that other people can help find a solution.")
  a07 = i4.answers.create!({content:"This is the 1st answer.", user: li })
  a08 = i4.answers.create!({content:"This is the 2nd answer.", user: brad })

i5 = brad.issues.create!(title:"Issue 5", description:"Some text describing the issue so that other people can help find a solution.")
  a09 = i5.answers.create!({content:"This is the 1st answer.", user: joe })
  a10 = i5.answers.create!({content:"This is the 2nd answer.", user: li })

i6 = li.issues.create!(title:"Issue 6", description:"Some text describing the issue so that other people can help find a solution.")
  a11 = i6.answers.create!({content:"This is the 1st answer.", user: brad })
  a12 = i6.answers.create!({content:"This is the 2nd answer.", user: joe })
