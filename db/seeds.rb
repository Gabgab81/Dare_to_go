# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Challenge.destroy_all

# create_table "challenges", force: :cascade do |t|
#     t.string "name"
#     t.integer "category"
#     t.integer "place"
#     t.text "content"
#     t.integer "xp"
#     t.integer "delay"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "difficulty"
#   end

# 10.times {
#   difficulty = rand(3)
#   # Go to the librairy and ask the time to six people
#   # Go to the nearest {place} and {verbe} to {num} people
#   # va {place} le plus près et {verbe} à {} personnes
#   a_place = ["à la librairie", "au bar", "au musée", "au magasin", "au tabac", "à la gare", "au cinéma"]
#   a_verbe = ["demande l'heure", "dit bonjour", "parle du beau temps", "demande ton chemin", "montre du doigt", "suit pendant 5 min"]
#   endroit = a_place[rand(7)]
#   verbe = a_verbe[rand(6)]
#   namedef = verbe + " " + endroit
#   place = rand(10)
#   num_personne = rand(10)
#   content = "Va #{endroit} le plus près et #{verbe} à #{num_personne} personnes"
#   xp = 10 * difficulty * num_personne
#   delay = 10 * num_personne
#   challenge = Challenge.create!(name: namedef, category: "solo", place: place, content: content, xp: xp, delay: delay, difficulty: difficulty)
# }

# puts 'creating 10 friends challenges'
# 10.times {
#   difficulty = rand(3)
#   a_place = ["à la librairie", "au bar", "au musée", "au magasin", "au tabac", "à la gare", "au cinéma"]
#   a_verbe = ["demande l'heure", "dit bonjour", "parle du beau temps", "demande ton chemin", "montre du doigt", "suit pendant 5 min"]
#   endroit = a_place[rand(7)]
#   verbe = a_verbe[rand(6)]
#   namedef = verbe + " " + endroit
#   place = rand(10)
#   num_personne = rand(10)
#   content = "Va #{endroit} le plus près et #{verbe} à #{num_personne} personnes"
#   xp = 10 * difficulty * num_personne
#   delay = 10 * num_personne
#   challenge = Challenge.create!(name: namedef, category: "friend", place: place, content: content, xp: xp, delay: delay, difficulty: difficulty)
# }
# puts "Done ! Go and play !!"

puts "Challenge Finished!"
Level.create!(rank: "Curious", xp_requirement: 0)
Level.create!(rank: "Curious", xp_requirement: 100)
Level.create!(rank: "Curious", xp_requirement: 200)
Level.create!(rank: "Curious", xp_requirement: 300)
Level.create!(rank: "Curious", xp_requirement: 400)
Level.create!(rank: "Curious", xp_requirement: 500)
Level.create!(rank: "Curious", xp_requirement: 600)
Level.create!(rank: "Curious", xp_requirement: 700)
Level.create!(rank: "Curious", xp_requirement: 800)
Level.create!(rank: "Curious", xp_requirement: 900)
Level.create!(rank: "Curious", xp_requirement: 1000)
puts "10 first lvl created"
Level.create!(rank: "Adventurer", xp_requirement: 1200)
Level.create!(rank: "Adventurer", xp_requirement: 1400)
Level.create!(rank: "Adventurer", xp_requirement: 1600)
Level.create!(rank: "Adventurer", xp_requirement: 1800)
Level.create!(rank: "Adventurer", xp_requirement: 2000)
Level.create!(rank: "Adventurer", xp_requirement: 2200)
Level.create!(rank: "Adventurer", xp_requirement: 2400)
Level.create!(rank: "Adventurer", xp_requirement: 2600)
Level.create!(rank: "Adventurer", xp_requirement: 2800)
Level.create!(rank: "Adventurer", xp_requirement: 3000)
puts "20  lvl created"
Level.create!(rank: "Maker", xp_requirement: 4000)
Level.create!(rank: "Maker", xp_requirement: 5000)
Level.create!(rank: "Maker", xp_requirement: 6000)
Level.create!(rank: "Maker", xp_requirement: 7000)
Level.create!(rank: "Maker", xp_requirement: 8000)
Level.create!(rank: "Maker", xp_requirement: 9000)
Level.create!(rank: "Maker", xp_requirement: 11000)
Level.create!(rank: "Maker", xp_requirement: 13000)
Level.create!(rank: "Maker", xp_requirement: 15000)
Level.create!(rank: "Maker", xp_requirement: 17000)
puts "30 lvl created"
Level.create!(rank: "Accomplished", xp_requirement: 20000)
Level.create!(rank: "Accomplished", xp_requirement: 23000)
Level.create!(rank: "Accomplished", xp_requirement: 26000)
Level.create!(rank: "Accomplished", xp_requirement: 29000)
Level.create!(rank: "Accomplished", xp_requirement: 35000)
Level.create!(rank: "Accomplished", xp_requirement: 40000)
Level.create!(rank: "Accomplished", xp_requirement: 45000)
Level.create!(rank: "Accomplished", xp_requirement: 50000)
Level.create!(rank: "Accomplished", xp_requirement: 60000)
Level.create!(rank: "Accomplished", xp_requirement: 70000)
puts "40 lvl created"

require 'csv'
require 'open-uri'

puts "Creating challenges"
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = open("https://raw.githubusercontent.com/BenDndr/Dare_to_go/master/db/Challenges.csv")
n = 0
CSV.foreach(filepath, csv_options) do |row|
  n += 1
  challenge = Challenge.new(
    name: "#{row['name']}",
    category: "#{row['category']}",
    place: "#{row['place'].to_i}",
    content: "#{row['content']}",
    difficulty: "#{row['difficulty'].to_i}",
    xp: "#{row['xp'].to_i}",
    delay: "#{row['delay '].to_i}",
    inscription: "#{row['inscription'].to_i}"
  )
  challenge.photo.attach(io: File.open(Rails.root.join("app/assets/images/challenges/Challenge#{n}.jpeg")), filename: "Challenge#{n}", content_type: 'image/jpeg')
  challenge.save!
  puts "Done"
end
