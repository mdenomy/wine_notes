Factory.define :wine do |wine|
  wine.producer    "Muddy Rudder Vineyards"
  wine.brand_name  "Dinghy"
end

Factory.define :user do |user|
  user.name                   "Fred Garvin"
  user.email                  "fgarvin@mp.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end