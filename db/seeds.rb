User.create!([
  {email: "harry@headoutdoors.me", password_digest: "$2a$10$yY8GQr5b9Q2YUzeh5wnwgehlvfqcCUckUJXYd1P74hJCZqGrF1vAW", session_token: "TzK5sLQOAUuDqRTs8RXBUA", fname: nil, lname: nil, phone1: nil, phone2: nil, location: nil},
  {email: "guest@headoutdoors.me", password_digest: "$2a$10$KVNlhT8XGM3J/6GRVqQzBempXxRABLXjAWBdjhuwEEfcOY3vtzddm", session_token: "4GGbhupOburX9tal5NMuCQ", fname: nil, lname: nil, phone1: nil, phone2: nil, location: nil}
])
Address.create!([
  {address1: "", address2: "", city: "San Francisco", state: "CA", postal_code: "94109"},
  {address1: "", address2: "", city: "San Francisco", state: "CA", postal_code: "94121"},
  {address1: "", address2: "", city: "San Francisco", state: "CA", postal_code: "94107"},
  {address1: "", address2: "", city: "San Francisco", state: "CA", postal_code: "94123"},
  {address1: "", address2: "", city: "Seattle", state: "WA", postal_code: "98104"},
  {address1: "", address2: "", city: "Skykomish", state: "WA", postal_code: "98288"},
  {address1: "", address2: "", city: "Austin", state: "TX", postal_code: "78704"},
  {address1: "", address2: "", city: "La Jolla", state: "CA", postal_code: "92037"},
  {address1: "", address2: "", city: "Needville", state: "TX", postal_code: "77461"},
  {address1: "", address2: "", city: "Austin", state: "TX", postal_code: "78741"}
])
Category.create!([
  {label: "fishing"},
  {label: "chartered"},
  {label: "surfing"},
  {label: "kayaking"},
  {label: "whale watching"},
  {label: "hiking"},
  {label: "snow"},
  {label: "skiing"},
  {label: "wildlife"},
  {label: "climbing"},
  {label: "snorkeling"},
  {label: "stargazing"},
  {label: "SUP"},
  {label: "standup paddle boarding"}
])
Activity.create!([
  {creator_id: 2, address_id: 1, title: "Half Day Chartered Fishing Trip", description: "The catch is striped bass, halibut, salmon, reds, blues, lings and things. Departures are at 6:00am daily from Fisherman's Warf, Berth 4.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440456168/headoutdoors/vcut8a5ba7wm2lq19tux.jpg", capacity: 10, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440456168/headoutdoors/vcut8a5ba7wm2lq19tux.jpg", price: "100.0"},
  {creator_id: 2, address_id: 2, title: "Individual Surf Lesson (17+years)", description: "Individual surf lessons are one of our favorite type of lesson because of how we can focus in on one person's learning techniques and skills. Individual surf lessons include the following:\r\n\r\n2 hour surf lesson\r\nWetsuit\r\nSurfboard\r\nFree photo\r\nOne-on-one training\r\n\r\nSurf students under the age of 18 have a parent or guardian present on the beach during the entire duration of the surf lesson.  \r\n\r\n50% of the amount paid is a non-refundable deposit. Cancellations must be made 48 hours prior to the lesson time in order for deposit to remain valid for rescheduling. ", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440457169/headoutdoors/qim30iuofetnomchn9iv.jpg", capacity: 15, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440457169/headoutdoors/qim30iuofetnomchn9iv.jpg", price: "65.0"},
  {creator_id: 2, address_id: 3, title: "Take Away Kayak Rental", description: "We provide everything so you can paddle in your favorite lake, river or San Francisco’s own Golden Gate Bridge. You can find car top kit for any car and kayak carts.\r\n \r\nAlso, we have roof rack accessories(car-top box, roof racks, carriers, etc., so you can carry skis, camping gear, and more on your car.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440457577/headoutdoors/ij7hojqqiuexhxpephpp.jpg", capacity: 20, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440457577/headoutdoors/ij7hojqqiuexhxpephpp.jpg", price: "50.0"},
  {creator_id: 2, address_id: 4, title: "Farallon Islands Whale Watching", description: "Our full-day (8-hour) whale watching cruises depart from San Francisco at 8:00 AM, and from Sausalito at 6:45 AM aboard the 56-foot Salty Lady, a Coast Guard certified vessel, on Saturdays and Sundays, and select Fridays.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440457883/headoutdoors/nouqncm4uiwf5p4jq8af.jpg", capacity: 30, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440457883/headoutdoors/nouqncm4uiwf5p4jq8af.jpg", price: "128.0"},
  {creator_id: 2, address_id: 5, title: "Guided Snowshoe Hike - Snoqualmie Pass", description: "Experience Commonwealth Basin in the winter surrounded by the Cascade crest peaks. Bring a lunch, a well-stocked day pack, extra clothing and water; you will be out from about 10 a.m. - 3 p.m.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440458345/headoutdoors/kfrppeqvcv1uvmgxtpxz.jpg", capacity: 10, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440458345/headoutdoors/kfrppeqvcv1uvmgxtpxz.jpg", price: "25.0"},
  {creator_id: 2, address_id: 6, title: "Intermediate Ski Clinic", description: "Clinic groups begin at 10:00am and 1:00pm daily on snow. The goal is to continue to develop your fundamental technique but to also show you how to apply your skills tactically, based on the current weather and snow conditions.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440458923/headoutdoors/fsyj5vwuh9fqr0xizr3u.jpg", capacity: 15, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440458923/headoutdoors/fsyj5vwuh9fqr0xizr3u.jpg", price: "149.0"},
  {creator_id: 2, address_id: 7, title: "Congress Avenue Bridge Bat Tours", description: "Check out the Congress Avenue Bridge Bats on a kayak tour with Live Love Paddle. See and learn about one of the World's Largest Urban Bat Colonies! Our store is located in next to Radio Shack in ground floor of the AMLI South Shore Apartments located at 1602 East Riverside Drive on Lady Bird Lake, Austin, TX.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440459954/headoutdoors/lwwl94jxvbkkuf5uxkrr.jpg", capacity: 10, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440459954/headoutdoors/lwwl94jxvbkkuf5uxkrr.jpg", price: "30.0"},
  {creator_id: 2, address_id: 7, title: "Guided Outdoor Climbing", description: "You can go rock climbing right here in Austin! Whether you are new to the sport or an expert enthusiast, you'll have a fun and safe time climbing with an experienced guide. This activity is great for families, couples and groups.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440460385/headoutdoors/cc3e1wj1ei7ux0ln80wx.jpg", capacity: 8, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440460385/headoutdoors/cc3e1wj1ei7ux0ln80wx.jpg", price: "30.0"},
  {creator_id: 2, address_id: 8, title: "La Jolla Leopard Shark Snorkel Tour", description: "La Jolla is lucky enough to have the best leopard shark migration in the world and Everyday California is home to the Original Snorkel Tour of La Jolla! Leopard sharks are harmless bottom dwellers with a mouth the size of a quarter, so they won’t bite you. Being able to swim within inches of these beautiful sharks brings people to us from all over the world. On our guided snorkeling tours, you can also expect to see shovel nose guitar fish and bat rays swimming around. One of our experienced guides will take you on a tour of the Marine Room.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440461818/headoutdoors/pf3mjvyznjjbvrzexhuu.jpg", capacity: 17, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440461818/headoutdoors/pf3mjvyznjjbvrzexhuu.jpg", price: "34.0"},
  {creator_id: 2, address_id: 9, title: "Brazos Bend Hiking and Stargazing", description: "Enjoy the day hiking at Brazos Bend State Park, an area with lots of very diverse wildlife, and spend the evening at the George Observatory at Brazos Bend viewing the stars! No experience is necessary and dinner is provided.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440462140/headoutdoors/luljb245mqkmq3wmizxj.jpg", capacity: 15, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440462140/headoutdoors/luljb245mqkmq3wmizxj.jpg", price: "55.0"},
  {creator_id: 2, address_id: 10, title: "Stand Up Paddle Board Rental - Full Day", description: "Come enjoy a fun day paddling in the sun at Lady Bird Lake. Come find our dock at 2200 South Lakeshore Blvd, Austin Texas 78741.", img_url: "http://res.cloudinary.com/thatkaiguy/image/upload/c_scale,w_300/v1440462857/headoutdoors/jnforafrn1ludjtqpyge.jpg", capacity: 20, img_url_full_size: "http://res.cloudinary.com/thatkaiguy/image/upload/v1440462857/headoutdoors/jnforafrn1ludjtqpyge.jpg", price: "33.0"}
])
CategoryLink.create!([
  {category_id: 1, activity_id: 1},
  {category_id: 2, activity_id: 1},
  {category_id: 3, activity_id: 2},
  {category_id: 4, activity_id: 3},
  {category_id: 5, activity_id: 4},
  {category_id: 6, activity_id: 5},
  {category_id: 7, activity_id: 5},
  {category_id: 8, activity_id: 6},
  {category_id: 9, activity_id: 7},
  {category_id: 4, activity_id: 7},
  {category_id: 10, activity_id: 8},
  {category_id: 9, activity_id: 9},
  {category_id: 11, activity_id: 9},
  {category_id: 6, activity_id: 10},
  {category_id: 12, activity_id: 10},
  {category_id: 9, activity_id: 4},
  {category_id: 13, activity_id: 11},
  {category_id: 14, activity_id: 11}
])
BookedActivity.create!([
  {customer_id: 1, date: "2015-08-22 00:00:00", activity_id: 1, party_size: 1},
  {customer_id: 1, date: "2015-08-28 00:00:00", activity_id: 4, party_size: 1},
  {customer_id: 2, date: "2015-10-31 00:00:00", activity_id: 1, party_size: 2}
])
Review.create!([
  {author_id: 1, num_stars: "5.0", body: "Awesome trip! Caught the biggest bass I've seen!", activity_id: 1},
  {author_id: 1, num_stars: "4.0", body: "Great experience but I got a little seasick. -_-", activity_id: 4}
])
