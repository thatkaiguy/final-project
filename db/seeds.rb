# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({ email: "ron@headoutdoors.me", password: "password" })
User.create!({ email: "guest@headoutdoors.me", password: "password" })

Address.create!({ city: "San Francisco", state: "CA", postal_code: "12345" })
Address.create!({ city: "Seattle", state: "WA", postal_code: "12345" })

Activity.create!({ creator_id: 2,
                   address_id: 1,
                   title: "3 Hour Whale Watching",
                   description: <<-DESC,
                     Join your captain for an enthralling San Francisco whale
                     watching tour and catch incredible sightings of these
                     magnificent creatures migrating through one of Earth's
                     most unique ecosystems! The Pacific coast adjoining San
                     Francisco and the picturesque Farallon Islands are known
                     for their rich and diverse marine life and you'll discover
                     the beauty of the ocean and its inhabitants on this
                     full-day adventure.
                   DESC
                   img_url: "http://tinyurl.com/oa49w4u",
                   capacity: 30 })

Activity.create!({ creator_id: 1,
                   address_id: 2,
                   title: "Mt. St. Hellens Tour",
                   description: <<-DESC,
                     Mount St Helens Volcano is a must-see attraction, and
                     this small-group tour from Seattle is the ideal way to
                     visit the national monument. A professional naturalist
                     guide will take you to Mount St Helens National Volcanic
                     Monument in a luxury Mercedes van. Visit the observatory,
                     go on an educational trail walk, and learn about the
                     Volcano's infamous 1980 eruption. During the tour, enjoy
                     a gourmet picnic lunch accompanied with local Washington
                     wines, in addition to light snacks and beverages throughout
                     the day.
                   DESC
                   img_url: "http://tinyurl.com/o9e5pr9",
                   capacity: 30 })

Review.create!({ author_id: 1,
                 num_stars: 4,
                 body: "such whales",
                 activity_id: 1 })

Review.create!({ author_id: 2,
                 num_stars: 3,
                 body: "no lava :(",
                 activity_id: 2 })
