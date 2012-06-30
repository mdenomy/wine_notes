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