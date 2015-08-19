# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({ email: "harry@headoutdoors.me", password: "password" })
User.create!({ email: "guest@headoutdoors.me", password: "password" })

Address.create!({ city: "San Francisco", state: "CA", postal_code: "12345" })
Address.create!({ city: "Seattle", state: "WA", postal_code: "12345" })

Category.create!({ label: "wildlife" }) #1
Category.create!({ label: "hiking" }) #2
Category.create!({ label: "cruise" }) #3
Category.create!({ label: "flying" }) #4
Category.create!({ label: "boat trip" }) #5

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
                   img_url_full_size: "http://tinyurl.com/oa49w4u",
                   capacity: 30,
                   price: 44 })

 CategoryLink.create!({ category_id: 1, activity_id: 1 })
 CategoryLink.create!({ category_id: 5, activity_id: 1 })

 Activity.create!({ creator_id: 2,
                    address_id: 1,
                    title: "Muir Woods, Giant Redwoods and
                           Sausalito Half-Day Trip",
                    description: <<-DESC,
                      Take time out from San Francisco on a half-day trip to
                      Muir Woods and Sausalito. This enthralling half-day trip
                      takes you across the Golden Gate Bridge to the Bay Area's
                      most popular national monument and the prettiest village
                      in California.
                    DESC
                    img_url: "http://tinyurl.com/q7u4hq3",
                    img_url_full_size: "http://tinyurl.com/q7u4hq3",
                    capacity: 30,
                    price: 25 })

CategoryLink.create!({ category_id: 2, activity_id: 2 })

Activity.create!({ creator_id: 2,
                   address_id: 1,
                   title: "San Francisco Bay Eco-Cruise",
                   description: <<-DESC,
                     Cruise the bay on an eco-tour of San Francisco! San
                     Francisco Bay is known for its major landmarks like the
                     Golden Gate Bridge and Alcatraz, but there’s more to it
                     than that. On this eco-cruise, you'll depart from Pier 39
                     and travel through the bay to explore hidden spots and
                     tributaries that only locals know about. Along the way,
                     discover a myriad of marine animals and other local
                     wildlife.
                   DESC
                   img_url: "http://tinyurl.com/owbbw2y",
                   img_url_full_size: "http://tinyurl.com/owbbw2y",
                   capacity: 30,
                   price: 60 })

CategoryLink.create!({ category_id: 3, activity_id: 3 })
CategoryLink.create!({ category_id: 1, activity_id: 3 })

Activity.create!({ creator_id: 1,
                   address_id: 2,
                   title: "Mt. St. Helens Tour",
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
                   img_url_full_size: "http://tinyurl.com/o9e5pr9",
                   capacity: 30,
                   price: 50 })

 CategoryLink.create!({ category_id: 2, activity_id: 4 })


 Activity.create!({ creator_id: 1,
                    address_id: 2,
                    title: "Seattle Seaplane Flight: Cascade Range Tour",
                    description: <<-DESC,
                      Take to Seattle’s skies on a thrilling 80-minute seaplane
                      ride to the western mountains of the Cascade Range! The
                      unforgettable flight includes a water take-off and landing
                      from Lake Washington plus aerial views of the Cascade
                      Range’s stunning mountain landscape.
                    DESC
                    img_url: "http://tinyurl.com/p7lxkau",
                    img_url_full_size: "http://tinyurl.com/p7lxkau",
                    capacity: 30,
                    price: 150 })

CategoryLink.create!({ category_id: 4, activity_id: 5 })

Review.create!({ author_id: 1,
                 num_stars: 4,
                 body: "such whales",
                 activity_id: 1 })

Review.create!({ author_id: 2,
                 num_stars: 3,
                 body: "volcano volcano",
                 activity_id: 2 })
