# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

Movie.destroy_all


formats = %w(Beta VHS IMAX HD SuperHD 4K DVD BlueRay)
images = %w(skis.jpg boots.jpg poles.jpg)
100.times do
  movie = Movie.create( :name => "#{Company.bs}",
                        :director => "#{Name.name}",
                        :description => Lorem.paragraphs(2).join("<br/>"),
                        :year => rand( 1940..2015 ),
                        :length => rand( 20..240 ),
                        :format => formats[ rand(formats.length) ],
                        :image => "movies/" + images[rand(images.length)],
                        :thumbnail => "movies/" + images[rand(images.length)]
  )
  movie.save

  (rand(1..10)).times do
      movie.comments.create(
                              :author => "#{Name.name}",
                              :title=> "#{Company.bs}",
                              :content => Lorem.sentences(3).join("<br/>").html_safe,
                              :rating => rand(1..5)
  )
  end
  puts movie.inspect
end