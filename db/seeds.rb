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
  c01 = i1.comments.create!({content:"This is the 1st comment.", user: brad })
  c02 = i1.comments.create!({content:"This is the 2nd comment.", user: li })

i2 = brad.issues.create!(title:"Issue 2", description:"Some text describing the issue so that other people can help find a solution.")
  c03 = i2.comments.create!({content:"This is the 1st comment.", user: li })
  c04 = i2.comments.create!({content:"This is the 2nd comment.", user: joe })

i3 = li.issues.create!(title:"Issue 3", description:"Some text describing the issue so that other people can help find a solution.")
  c05 = i3.comments.create!({content:"This is the 1st comment.", user: joe })
  c06 = i3.comments.create!({content:"This is the 2nd comment.", user: brad })

i4 = joe.issues.create!(title:"Issue 4", description:"Some text describing the issue so that other people can help find a solution.")
  c07 = i4.comments.create!({content:"This is the 1st comment.", user: li })
  c08 = i4.comments.create!({content:"This is the 2nd comment.", user: brad })

i5 = brad.issues.create!(title:"Issue 5", description:"Some text describing the issue so that other people can help find a solution.")
  c09 = i5.comments.create!({content:"This is the 1st comment.", user: joe })
  c10 = i5.comments.create!({content:"This is the 2nd comment.", user: li })

i6 = li.issues.create!(title:"Issue 6", description:"Some text describing the issue so that other people can help find a solution.")
  c11 = i6.comments.create!({content:"This is the 1st comment.", user: brad })
  c12 = i6.comments.create!({content:"This is the 2nd comment.", user: joe })
