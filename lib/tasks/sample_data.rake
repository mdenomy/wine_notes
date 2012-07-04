namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Wine.create!(brand_name: "Grape Ape",
                 producer: "Mongo Vineyards",
                 year: 2010)
    9.times do
       brand_name  = Faker::Name.name
       producer = Faker::Name.name
       year = 2009
       Wine.create!(brand_name: brand_name,
                        producer: producer,
                        year: year)
    end
    wines = Wine.all(limit: 3)
    20.times do
      notes = Faker::Lorem.paragraph(5)
      score = 2
      wines.each { |wine| wine.reviews.create!(notes: notes, score: score, date: rand(2.years).ago) }
    end
  end
end