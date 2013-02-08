Factory.define :wine do |wine|
  wine.producer    "Muddy Rudder Vineyards"
  wine.brand_name  "Dinghy"
end

Factory.define :user do |user|
  user.name                   "Miquel"
  user.email                  "somebody@someplace.org"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.define :review do |review|
  review.date     DateTime.civil(2012, 1, 2)
  review.notes    "hint of pencil shavings and elderberries"
  review.score    3
  review.wine    :wine
end

Factory.define :purchase do |purchase|
  purchase.date   Date.today
  purchase.store  Faker::Company.name
  purchase.price  17.99
end
