#encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
categories = Category.create([{:name => 'IT', :sort_index => 0}, 
                              {:name => 'Сookery', :sort_index => 1},
                              {:name => 'Geodesy', :sort_index => 2}])

Level.delete_all
levels = Level.create([{:name => 'Level 1'},
                       {:name => 'Level 2'},
                       {:name => 'Level 3'},
                       {:name => 'Level 4'},
                       {:name => 'Level 5'}])

Language.delete_all
languages = Language.create([{:name => 'English (United States)', :short_name => 'en-us'},
                             {:name => 'Italian (Standard)', :short_name => 'it'},
                             {:name => 'German (Standard)', :short_name => 'de'}])

User.delete_all
User.create([:email => 'murmur@mail.ru'])

Video.delete_all
Video.create([{:title => 'First step in rickroll',
               :head_video => "<iframe width=\"260\" height=\"195\" src=\"//www.youtube.com/embed/dQw4w9WgXcQ?rel=0\" frameborder=\"0\"></iframe>",
               :category => categories[0],
               :level => levels[3],
               :language => languages[0]}])

Video.create([{:title => 'ASP MVC Video tutorial',
               :head_video => "<iframe width=\"260\" height=\"195\" src=\"//www.youtube.com/embed/KAKxm4eQP24?rel=0\" frameborder=\"0\"></iframe>",
               :category => categories[0],
               :level => levels[3],
               :language => languages[0]}])

Video.create([{:title => 'JavaScript video tutorial',
               :head_video => "<iframe width=\"260\" height=\"195\" src=\"//www.youtube.com/embed/_cLvpJY2deo?rel=0\" frameborder=\"0\"></iframe>",
               :category => categories[0],
               :level => levels[3],
               :language => languages[0]}])

Book.delete_all
BOOK_COUNT = 50

BOOK_COUNT.times do |i|
  Book.create(:title => Faker::Lorem.sentence(1 + Random.rand(9)),
              :author => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
              :description => Faker::Lorem.paragraph(1 + Random.rand(5)),
              :isbn => Faker::Code.isbn,
              :cover => Faker::Internet.url,
              :category => categories[Random.rand(categories.length)],
              :level => levels[Random.rand(levels.length)],
              :language => languages[Random.rand(languages.length)])
end
Book.create([:title => 'JavaScript: The Definitive Guide: Activate Your Web Pages',
              :author => 'David Flanagan',
              :description => 'Since 1996, JavaScript: The Definitive Guide has been the bible for JavaScript programmers—a programmers guide and comprehensive reference to the core language and to the client-side JavaScript APIs defined by web browsers.
The 6th edition covers HTML5 and ECMAScript 5. Many chapters have been completely rewritten to bring them in line with todays best web development practices. New chapters in this edition document jQuery and server side JavaScript. Its recommended for experienced programmers who want to learn the programming language of the Web, and for current JavaScript programmers who want to master it.',
              :isbn => '978-0596805524',
              :cover => 'http://ecx.images-amazon.com/images/I/51onEPAeDcL._SX258_PJlook-inside-v2,TopRight,1,0_SH20_BO1,204,203,200_.jpg',
             :category => categories[0],
             :level => levels[3],
             :language => languages[0]]);

Book.create([:title => 'Agile Web Development with Rails 4',
              :author => 'Dave Thomas',
              :description => 'Ruby on Rails helps you produce high-quality, beautiful-looking web applications quickly. You concentrate on creating the application, and Rails takes care of the details.
Tens of thousands of developers have used this award-winning book to learn Rails. It’s a broad, far-reaching tutorial and reference that’s recommended by the Rails core team. If you’re new to Rails, you’ll get step-by-step guidance. If you’re an experienced developer, this book will give you the comprehensive, insider information you need.
Rails has evolved over the years, and this book has evolved along with it. We still start with a step-by-step walkthrough of building a real application, and in-depth chapters look at the built-in Rails features. This edition now gives new Ruby and Rails users more information on the Ruby language and takes more time to explain key concepts throughout. Best practices on how to apply Rails continue to change, and this edition keeps up. Examples use Concerns, Russian Doll caching, and Turbolinks, and the book focuses throughout on the right way to use Rails. Additionally, this edition now works on Ruby 2.0, a new release of Ruby with substantial functional and performance improvements.',
              :isbn => '5-02-013850-9',
              :cover => 'http://ecx.images-amazon.com/images/I/41FoMm-tZ6L._SX258_PJlook-inside-v2,TopRight,1,0_SH20_BO1,204,203,200_.jpg',
             :category => categories[0],
             :level => levels[3],
             :language => languages[0]]);

Book.create([:title => 'Pro ASP.NET MVC 4',
              :author => 'Adam Freeman',
              :description => 'The ASP.NET MVC 4 Framework is the latest evolution of Microsoft’s ASP.NET web platform. It provides a high-productivity programming model that promotes cleaner code architecture, test-driven development, and powerful extensibility, combined with all the benefits of ASP.NET.
ASP.NET MVC 4 contains a number of significant advances over previous versions. New mobile and desktop templates (employing adaptive rendering) are included together with support for jQuery Mobile for the first time. New display modes allow your application to select views based on the browser thats making the request while Code Generation Recipes for Visual Studio help you auto-generate project-specific code for a wide variety of situtations including NuGet support.
In this fourth edition, the core model-view-controller (MVC) architectural concepts are not simply explained or discussed in isolation, but are demonstrated in action. You’ll work through an extended tutorial to create a working e-commerce web application that combines ASP.NET MVC with the latest C# language features and unit-testing best practices. By gaining this invaluable, practical experience, you’ll discover MVC’s strengths and weaknesses for yourself—and put your best-learned theory into practice.',
             :isbn => '1430242361',
             :cover => 'http://ecx.images-amazon.com/images/I/51Rms2VIcWL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg',
             :category => categories[0],
             :level => levels[3],
             :language => languages[0]]);

Article.delete_all
Article.create([:title => 'Как я не взломал «Хабрахабр» или 10+ активных XSS',
                 :link => 'http://habrahabr.ru/post/197672/',
                 :description => 'Увидев как все ринулись искать XSS на прекрасно-синем Хабрахабре решил попытать свое счастье. POST-овые self-xss, бесполезные во многих контекстах и векторах, начиная с фильтрации в самых популярных браузеров (chrome/safari/ie etc) и заканчивая сложностью их же применения и эксплуатации было решено оставить остальным первопроходцам и отправиться на поиски чего-то более стоящего.',
                :category => categories[0],
                :level => levels[3],
                :language => languages[0]])

Article.create([:title => 'How to: Ruby on Rails + Ubuntu + Apache with Passenger',
                 :link => 'http://nathanhoad.net/how-to-ruby-on-rails-ubuntu-apache-with-passenger',
                 :description => 'Do you have an Ubuntu installation and want to know what all this fuss about Ruby on Rails is? With Passenger from Phusion its easy!',
                :category => categories[0],
                :level => levels[3],
                :language => languages[0]])

Article.create([:title => 'A Comparison of Angular, Backbone, CanJS and Ember',
                 :link => 'http://sporto.github.io/blog/2013/04/12/comparison-angular-backbone-can-ember/',
                 :description => 'Selecting a JavaScript MVC framework can be hard work. There are so many factors to consider and so many options out there that selecting a framework can be overwhelming. To have an idea of all the possible alternatives have a look at TodoMVC.',
                :category => categories[0],
                :level => levels[3],
                :language => languages[0]])
