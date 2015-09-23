# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Test users
#venue 1
#User.create([email: 'indi3.rok@gmail.com',password:'123123123',avatar_url:'http://dummyimage.com/70x60/000/fff',verified: false, user_type:'venue',wants_newsletter: true])
#Venue.first.update_attribute :user_id, 1

#user 1
#User.create([email: 'art_rainbow@hotmail.com',password:'123123123',avatar_url:'http://dummyimage.com/70x60/000/fff',verified: false, user_type:'dancer',wants_newsletter: true])

#user 2
#User.create([email: 'yo@emmanuelorozco.com.com',password:'123123123',avatar_url:'http://dummyimage.com/70x60/000/fff',verified: false, user_type:'dancer',wants_newsletter: true])


v1 = Venue.new
v1.name = 'Pata Negra'
v1.phone = '5523123123'
v1.city = 'San Diego'
v1.state = 'California'
v1.zip_code = '55220'
v1.street_address = 'Ca Rd 123'
v1.venue_type = 'bar'
v1.dresscode = 'casual'
v1.popular_drink = 'margarita'
v1.best_for = 'dancing'
v1.url = 'www.patanegra.com'
v1.music_genre = 'rock'
v1.live = true
v1.save


v1.parties.create([
		name: 'Pata Negra Opening Party',
		party_type: 'holiday',
		date: DateTime.strptime("09/01/2016", "%m/%d/%Y"),
		start_time: DateTime.strptime("09/01/2016 19:00", "%m/%d/%Y %H:%M"),
		end_time: DateTime.strptime("10/01/2016 02:00", "%m/%d/%Y %H:%M"),
		cover: 3,
		description: 'The starting party for the venue, come and try"',
		status: 'published',
	])

v1.parties.create([
		name: 'Sweet Day',
		party_type: 'special',
		date: DateTime.strptime("10/01/2016", "%m/%d/%Y"),
		start_time: DateTime.strptime("10/01/2016 16:00", "%m/%d/%Y %H:%M"),
		end_time: DateTime.strptime("10/01/2016 02:00", "%m/%d/%Y %H:%M"),
		cover: 0,
		description: 'Awesome Try YourSelf Party',
		status: 'published',
	])

v1.parties.create([
		name: 'draft',
		party_type: '',
		date: DateTime.strptime("10/01/2016", "%m/%d/%Y"),
		start_time: DateTime.strptime("10/01/2016 16:00", "%m/%d/%Y %H:%M"),
		end_time: DateTime.strptime("10/01/2016 02:00", "%m/%d/%Y %H:%M"),
		cover: 0,
		description: 'draft cover',
		status: 'draft',
	])

v1.venue_photos.create(url: 'http://lorempixel.com/200/200/sports')
v1.venue_photos.create(url: 'http://lorempixel.com/200/200/city')


v2 = Venue.new
v2.name = 'Mc Arthys bar'
v2.phone = '1233489'
v2.city = 'San Diego'
v2.state = 'California'
v2.zip_code = '55221'
v2.street_address = 'Anthon Rd 56'
v2.venue_type = 'club'
v2.dresscode = 'casual'
v2.popular_drink = 'mojito'
v2.best_for = 'socialicing'
v2.url = 'www.coool.com'
v2.music_genre = 'rock'
v2.live = false
v2.save

v2.parties.create([
		name: 'Sweet Day',
		party_type: 'special',
		date: DateTime.strptime("10/01/2015", "%m/%d/%Y"),
		start_time: DateTime.strptime("12/12/2015 16:00", "%m/%d/%Y %H:%M"),
		end_time: DateTime.strptime("12/12/2015 02:00", "%m/%d/%Y %H:%M"),
		cover: 0,
		description: 'Test Party',
		status: 'published',
	])

v2.parties.create([
		name: 'draft',
		party_type: 'theme',
		date: DateTime.strptime("10/01/2016", "%m/%d/%Y"),
		start_time: DateTime.strptime("10/01/2015 16:00", "%m/%d/%Y %H:%M"),
		end_time: DateTime.strptime("10/01/2016 02:00", "%m/%d/%Y %H:%M"),
		cover: 0,
		description: 'draft cover',
		status: 'draft',
	])