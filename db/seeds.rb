#encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{:name => 'IT', :sort_index => 0}, 
                              {:name => 'Сookery', :sort_index => 1},
                              {:name => 'Geodesy', :sort_index => 2}])

levels = Level.create([{:name => 'Level 1'},
                       {:name => 'Level 2'},
                       {:name => 'Level 3'},
                       {:name => 'Level 4'},
                       {:name => 'Level 5'}])

languages = Language.create([{:name => 'English (United States)', :short_name => 'en-us'},
                             {:name => 'Italian (Standard)', :short_name => 'it'},
                             {:name => 'German (Standard)', :short_name => 'de'}])

videos = Video.create([{:title => 'Code School', 
                        :head_video => "Learn about Code School's teaching philosophy and course strategy for delivering the latest web technologies.",
                        :category => categories[0],
                        :level => levels[3],
                        :language => languages[0]}])