namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_wines
    make_reviews
  end
end

def make_wines

  years = (2005..2012).to_a
  colors = ["Red", "White"]
  classifications = ["Table", "Sparkling", "Dessert"]
  grapes = ["Grenache", "Mourvedre", "Pinot Noir", "Cabernet Franc", "Malbec"]

  Wine.create!(brand_name: "Grape Ape",
               producer: "Mongo Vineyards",
               color: "Red",
               classification: "Table",
               grape_wine_name: "Cabernet Franc",
               year: 2010)
  25.times do
    Wine.create!(brand_name: Faker::Name.last_name,
                 producer: Faker::Company.name,
                 color: colors.sample,
                 classification: classifications.sample,
                 grape_wine_name: grapes.sample,
                 year: years.sample)
  end
end

def make_reviews
  scores = (1..5).to_a
  Wine.all.each do |wine|
    rand(10).times do
      summary = Faker::Lorem.paragraph(1)
      notes = Faker::Lorem.paragraph(5)
      score = scores.sample
      wine.reviews.create!(summary: summary, notes: notes, score: score, date: rand(2.years).ago)
    end
  end
end