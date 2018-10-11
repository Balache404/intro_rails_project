# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

class NilClass
	def to_date
		nil
	end
end

Amiibo.destroy_all
GameSeries.destroy_all
Character.destroy_all
AmiiboSeries.destroy_all

amiibo_url = "http://www.amiiboapi.com/api/amiibo/"
game_url = "http://www.amiiboapi.com/api/gameseries/"
series_url = "http://www.amiiboapi.com/api/amiiboseries/"
character_url = "http://www.amiiboapi.com/api/character/"

# Seed AmiiboSeries table

uri = URI(series_url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data["amiibo"].each do |d|
	AmiiboSeries.create(name: d["name"])
end

puts "All amiibo series created"

# Seed Character table

uri = URI(character_url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data["amiibo"].each_with_index do |d, index|
	Character.create(name: d["name"])

	puts "#{index} characters created" if (index > 0) and (index % 50 == 0)
end

puts "All characters created"

# Seed GameSeries table

uri = URI(game_url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data["amiibo"].each do |d|
	GameSeries.find_or_create_by(name: d["name"])
end

puts "All game series created"

# Seed Amiibos table

uri = URI(amiibo_url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data["amiibo"].each_with_index do |d , index|

	series = AmiiboSeries.find_by(name: d["amiiboSeries"])
	character = Character.find_by(name: d["character"])
	game = GameSeries.find_by(name: d["gameSeries"])

	Amiibo.create(series_id: series.id,
					character_id: character.id,
					game_id: game.id,
					image: d["image"],
					name: d["name"],
					jp_release: d["release"]["jp"].to_date,
					na_release: d["release"]["na"].to_date,
					amiibo_type: d["type"])

	puts "#{index} amiibo created" if (index > 0) and (index % 50 == 0)
end

puts "All amiibo created"