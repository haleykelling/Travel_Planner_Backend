
DayTransportation.destroy_all
DayAccomodation.destroy_all
Accomodation.destroy_all
Activity.destroy_all
Comment.destroy_all
Day.destroy_all
Trip.destroy_all 
Transportation.destroy_all
User.destroy_all

user1 = User.create(username: 'hkelling', password: '1234')

greece = Trip.create(name: "Honeymoon to Greece", start_date: "2021-05-15", end_date: "2021-05-29", user: user1)
yellowstone = Trip.create(name: "Trip to Yellowstone", start_date: "2018-06-10", end_date: "2018-06-13", user: user1)

day1greece = Day.create(date: "2021-05-15", start_city: "Denver, Colorado", end_city: "Denver, Colorado", trip: greece, start_latitude: 39.7392358, start_longitude: -104.990251, end_latitude: 39.7392358, end_longitude: -104.990251)
day2greece = Day.create(date: "2021-05-16", start_city: "Athens, Greece", end_city: "Athens, Greece", trip: greece, start_latitude: 37.9838096, start_longitude: 23.7275388, end_latitude: 37.9838096, end_longitude: 23.7275388)
day3greece = Day.create(date: "2021-05-17", start_city: "Athens, Greece", end_city: "Athens, Greece", trip: greece, start_latitude: 37.9838096, start_longitude: 23.7275388, end_latitude: 37.9838096, end_longitude: 23.7275388)
day4greece = Day.create(date: "2021-05-18", start_city: "Athens, Greece", end_city: "Oia, Greece", trip: greece, start_latitude: 37.9838096, start_longitude: 23.7275388, end_latitude: 36.4618, end_longitude: 25.3753)
day5greece = Day.create(date: "2021-05-19", start_city: "Oia, Greece", end_city: "Oia, Greece", trip: greece, start_latitude: 36.4618, start_longitude: 25.3753, end_latitude: 36.4618, end_longitude: 25.3753)
day6greece = Day.create(date: "2021-05-20", start_city: "Oia, Greece", end_city: "Oia, Greece", trip: greece, start_latitude: 36.4618, start_longitude: 25.3753, end_latitude: 36.4618, end_longitude: 25.3753)
day7greece = Day.create(date: "2021-05-21", start_city: "Oia, Greece", end_city: "Oia, Greece", trip: greece, start_latitude: 36.4618, start_longitude: 25.3753, end_latitude: 36.4618, end_longitude: 25.3753)
day8greece = Day.create(date: "2021-05-22", start_city: "Oia, Greece", end_city: "Paros, Greece", trip: greece, start_latitude: 36.4618, start_longitude: 25.3753, end_latitude: 37.0854, end_longitude: 25.1515)
day9greece = Day.create(date: "2021-05-23", start_city: "Paros, Greece", end_city: "Paros, Greece", trip: greece, start_latitude: 37.0854, start_longitude: 25.1515, end_latitude: 37.0854, end_longitude: 25.1515)
day10greece = Day.create(date: "2021-05-24", start_city: "Paros, Greece", end_city: "Paros, Greece", trip: greece, start_latitude: 37.0854, start_longitude: 25.1515, end_latitude: 37.0854, end_longitude: 25.1515)
day11greece = Day.create(date: "2021-05-25", start_city: "Paros, Greece", end_city: "Naxos, Greece", trip: greece, start_latitude: 37.0854, start_longitude: 25.1515, end_latitude: 37.1036, end_longitude: 25.3777)
day12greece = Day.create(date: "2021-05-26", start_city: "Naxos, Greece", end_city: "Naxos, Greece", trip: greece, start_latitude: 37.1036, start_longitude: 25.3777, end_latitude: 37.1036, end_longitude: 25.3777)
day13greece = Day.create(date: "2021-05-27", start_city: "Naxos, Greece", end_city: "Naxos, Greece", trip: greece, start_latitude: 37.1036, start_longitude: 25.3777, end_latitude: 37.1036, end_longitude: 25.3777)
day14greece = Day.create(date: "2021-05-28", start_city: "Naxos, Greece", end_city: "Athens, Greece", trip: greece, start_latitude: 37.1036, start_longitude: 25.3777, end_latitude: 37.9838096, end_longitude: 23.7275388)
day15greece = Day.create(date: "2021-05-29", start_city: "Athens, Greece", end_city: "Denver, Colorado", trip: greece, start_latitude: 37.9838096, start_longitude: 23.7275388, end_latitude: 39.7392358, end_longitude: -104.990251)

flight1 = Transportation.create(name: 'Flight to Greece', details: 'Delta Flight #245', type_of_activity: 'Transportation', address: '8500 Pena Blvd, Denver, CO 80246', start_time: 958, end_time: 920, multiday: true, latitude: 39.849360, longitude: -104.673810)
ferry1 = Transportation.create(name: 'Ferry from Athens to Santorini', details: 'Seajets Superjet', type_of_activity: 'Transportation', address: '10 Akti Miaouli, Piraeus 185 38, Greece', start_time: 700, end_time: 1215, multiday: false, latitude: 37.939300, longitude: 23.640130)
flight2 = Transportation.create(name: 'Flight Home', details: 'Delta Flight #161', type_of_activity: 'Transportation', address: 'Attiki Odos, Spata Artemida 190 04, Greece', start_time: 710, end_time: 1315, multiday: false, latitude: 37.935879, longitude: 23.943470)

DayTransportation.create(transportation: flight1, day: day1greece)
DayTransportation.create(transportation: flight1, day: day2greece)
DayTransportation.create(transportation: flight2, day: day14greece)
DayTransportation.create(transportation: ferry1, day: day4greece)

Activity.create(name: 'Bandiera', details: 'Mediterranean Cuisine', type_of_activity: 'Food/Drink', address: 'Taki 19 Psirri, Athens 105 54, Greece', start_time: 1900, day: day2greece, latitude: 37.978310, longitude: 23.723850)
Activity.create(name: 'Athens Mythology Highlights Tour', details: 'Visit the majestic Acropolis, the Temple of Zeus, the Ancient Agora and find out their connection to the Greek gods and goddesses.', type_of_activity: 'History', address: 'Zappio, Athens 105 57, Greece', start_time: 900, end_time: 1300, day: day3greece, latitude: 37.973080, longitude: 23.734750)
Activity.create(name: 'Armeni', details: 'Mediterranean/Seafood Cuisine', type_of_activity: 'Food/Drink', address: 'Oia Santorini Old Port of Armeni, Oia 847 02, Greece', start_time: 1930, day: day4greece, latitude: 36.460499, longitude: 25.380546)
Activity.create(name: 'Private Cruise from Fira', details: 'Explore Santorini’s famous caldera, lava-rock beaches, and neighboring islands just the way you want to on this private chartered speedboat tour.', type_of_activity: 'Sightseeing', address: 'Alex Private Boat Rental, Fira Santorini Old Port, Thira 847 00, Greece', start_time: 1000, end_time: 1500, day: day5greece, latitude: 36.418138, longitude: 25.427716)
Activity.create(name: 'Castle of St Nicholas', details: 'Visit the castle of St Nicholas and take in the 360 degree views of the caldera.', type_of_activity: 'Sightseeing', address: 'Oia 847 02, Greece', start_time: 1100, day: day6greece, latitude: 36.4618199, longitude: 25.3753101)



day1yellowstone = Day.create(date: "2018-06-10", start_city: "Denver, Colorado", end_city: "Jackson, Wyoming", trip: yellowstone, start_latitude: 39.7392358, start_longitude: -104.990251, end_latitude: 43.4799, end_longitude: -110.7624)
day2yellowstone = Day.create(date: "2018-06-11", start_city: "Jackson, Wyoming", end_city: "Jackson, Wyoming", trip: yellowstone, start_latitude: 43.4799, start_longitude: -110.7624, end_latitude: 43.4799, end_longitude: -110.7624)
day3yellowstone = Day.create(date: "2018-06-12", start_city: "Jackson, Wyoming", end_city: "Jackson, Wyoming", trip: yellowstone, start_latitude: 43.4799, start_longitude: -110.7624, end_latitude: 43.4799, end_longitude: -110.7624)
day4yellowstone = Day.create(date: "2018-06-13", start_city: "Jackson, Wyoming", end_city: "Denver, Colorado", trip: yellowstone, start_latitude: 43.4799, start_longitude: -110.7624, end_latitude: 39.7392358, end_longitude: -104.990251)

drive1 = Transportation.create(name: 'Drive to Yellowstone', type_of_activity: 'Transportation', address: '11013 Grant Drive, Northglenn, CO 80233', start_time: 700, end_time: 1500, multiday: false, latitude: 39.896340, longitude: -104.981530)
drive2 = Transportation.create(name: 'Drive Home', type_of_activity: 'Transportation', address: '120 Glenwood St, Jackson, WY 83001', start_time: 900, end_time: 1700, multiday: false, latitude: 43.480670, longitude: -110.763350)

DayTransportation.create(transportation: drive1, day: day1yellowstone)
DayTransportation.create(transportation: drive2, day: day4yellowstone)

Activity.create(name: 'Gun Barrel Steak & Game House', details: 'Steakhouse', type_of_activity: 'Food/Drink', address: '862 W Broadway Ave, Jackson, WY 83001', start_time: 1900, day: day1yellowstone, latitude: 43.474030, longitude: -110.781480)
Activity.create(name: 'Persephone Bakery', details: 'Breakfast', type_of_activity: 'Food/Drink', address: '145 E Broadway Ave, Jackson, WY 83001', start_time: 700, day: day2yellowstone, latitude: 43.479960, longitude: -110.759950)
Activity.create(name: 'Bin22', details: 'Italian/Wine Bar', type_of_activity: 'Food/Drink', address: '200 W Broadway Ave, Jackson, WY 83001', start_time: 1800, day: day2yellowstone, latitude: 43.479240, longitude: -110.765450)
Activity.create(name: 'The Kitchen', details: 'Lunch', type_of_activity: 'Food/Drink', address: '155 N Glenwood St, Jackson, WY 83001', start_time: 1200, day: day3yellowstone, latitude: 43.4808743, longitude: -110.764025)
Activity.create(name: 'Liberty Burger', details: 'American', type_of_activity: 'Food/Drink', address: '160 N Cache St, Jackson, WY 83001', start_time: 1930, day: day3yellowstone, latitude: 43.4812246, longitude: -110.7622685)
Activity.create(name: 'Virginian Restaurant', details: 'Breakfast', type_of_activity: 'Food/Drink', address: '750 W Broadway Ave, Jackson, WY 83001', start_time: 800, day: day4yellowstone, latitude: 43.4740693, longitude: -110.77874)

Activity.create(name: 'Town Square', details: 'Visit Jackson town square, walk around, and shop.', type_of_activity: 'Sightseeing', address: 'Broadway at Cache Street, Jackson, WY 83001', start_time: 1600, day: day1yellowstone, latitude: 43.4799559, longitude: -110.7617792)
Activity.create(name: 'Old Faithful', details: "The world's most famous geyser, Old Faithful in Yellowstone, currently erupts around 20 times a day.", type_of_activity: 'Sightseeing', address: '2 Old Faithful Rd, Yellowstone National Park, WY 82190', start_time: 1000, day: day2yellowstone, latitude: 44.4569121, longitude: -110.827866)
Activity.create(name: 'Grand Prismatic Spring', details: 'Visit Grand Prismatic Spring and also see Opal Pool, Turquoise Pool, and Excelsior Geyser Crater.', type_of_activity: 'Sightseeing', address: 'Yellowstone National Park, WY 82190', start_time: 900, day: day2yellowstone, latitude: 44.4620852, longitude: -110.6424411)
Activity.create(name: 'Lake Solitude Hike', details: 'Hike includes panoramic views, lake, and wildflowers. Begins at Jenny Lake Trailhead. Roundtrip: 15.3 miles.', type_of_activity: 'Sightseeing', address: 'Jenny Lake Trail, Alta, WY 83414', start_time: 600, day: day3yellowstone, latitude: 43.7720164, longitude: -110.7396348)

hotelYellowstone = Accomodation.create(name: 'Hotel Jackson', address: '120 Glenwood St, Jackson, WY 83001', latitude: 43.480670, longitude: -110.763350)

DayAccomodation.create(day: day1yellowstone, accomodation: hotelYellowstone)
DayAccomodation.create(day: day2yellowstone, accomodation: hotelYellowstone)
DayAccomodation.create(day: day3yellowstone, accomodation: hotelYellowstone)
DayAccomodation.create(day: day4yellowstone, accomodation: hotelYellowstone)

Comment.create(text: 'We just got back from visiting the town square in Jackson. It took us about 8 hours to drive today and then we checked into the hotel and went downtown to walk around and have dinner. It is so crazy beautiful here. The mountains are so different from our mountains back home. I am so happy we made this trip happen! Our dinner tonight was delicious. Christopher claims it was the best steak he has ever had but I have heard that before.I am so excited for tommorow!', day: day1yellowstone)
Comment.create(text: 'So we just finished eating at Persephone Bakery, and it was AMAZING. I ordered the french toast and Christopher had the breakfast burrito, both of which were delicious. It was a super cute restaurant right outside of town. Now we are on our way to Old Faithful! ', day: day2yellowstone)
Comment.create(text: 'Right as we were parking Old Faithful erupted - what bad timing! So we waited another hour or so until it happened again. We walked around and looked at the gift shop and made it back in time to grab a seat. It gets crazy busy there! The eruption lasted about 4 minutes (of course Christopher timed it), which is on the longer side so that was pretty cool. Definitely worth seeing.', day: day2yellowstone)
Comment.create(text: 'On our drive up to the Grand Prismatic Springs, we saw a black bear!! It was a mom and two babies and they ran right across the road in front of us. Good thing I was paying attention and we stopped in time. We watched them run off into a wooded area right next to the car. Super cool!', day: day2yellowstone)
Comment.create(text: 'Our last stop today was at the Grand Prismatic Springs and let me tell you, it was beautiful. The spring was neon orange in places due to some sort of microbiota that makes it glow. We saw a couple other hot springs and pools as well. It was super windy and Christopher and I took a couple funny pictures. Overall, today was a super great day! I am excited for tomorrow!', day: day2yellowstone)
Comment.create(text: 'Wow I can not get over the views waking up here. We can see the Tetons from our hotel room and it is such a beautiful view! We are going on a long hike today so I will check back in tonight.', day: day3yellowstone)
Comment.create(text: 'Okay I am actually dying because we went on the longest hike ever today (15 miles!!) but it was so worth it when we got the lake at the top. I took so many incredible pictures of the waterfall along the way and all of the views. Definitely worth waking up early but I am ready for bed at 6:00! I am sad we are already leaving tomorrow but it has been such a wonderful trip!', day: day3yellowstone)