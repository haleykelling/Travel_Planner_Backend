
DayTransportation.destroy_all
Activity.destroy_all
Day.destroy_all
Trip.destroy_all 
Transportation.destroy_all
User.destroy_all

user1 = User.create(username: 'hkelling', password: '1234')

greece = Trip.create(name: "Honeymoon to Greece", start_date: "2021-05-15", end_date: "2021-05-29", user: user1)
yellowstone = Trip.create(name: "Trip to Yellowstone", start_date: "2021-09-10", end_date: "2021-09-13", user: user1)

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

day1yellowstone = Day.create(date: "2021-09-10", start_city: "Denver, Colorado", end_city: "Jackson, Wyoming", trip: yellowstone, start_latitude: 39.7392358, start_longitude: -104.990251, end_latitude: 43.4799, end_longitude: -110.7624)
day2yellowstone = Day.create(date: "2021-09-11", start_city: "Jackson, Wyoming", end_city: "Jackson, Wyoming", trip: yellowstone, start_latitude: 43.4799, start_longitude: -110.7624, end_latitude: 43.4799, end_longitude: -110.7624)
day3yellowstone = Day.create(date: "2021-09-12", start_city: "Jackson, Wyoming", end_city: "Jackson, Wyoming", trip: yellowstone, start_latitude: 43.4799, start_longitude: -110.7624, end_latitude: 43.4799, end_longitude: -110.7624)
day4yellowstone = Day.create(date: "2021-09-13", start_city: "Jackson, Wyoming", end_city: "Denver, Colorado", trip: yellowstone, start_latitude: 43.4799, start_longitude: -110.7624, end_latitude: 39.7392358, end_longitude: -104.990251)

flight1 = Transportation.create(name: 'Flight to Greece', details: 'Delta Flight #245', type_of_activity: 'Transportation', address: '8500 Pena Blvd, Denver, CO 80246', start_time: 958, end_time: 920, multiday: true, latitude: 39.849360, longitude: -104.673810)
ferry1 = Transportation.create(name: 'Ferry from Athens to Santorini', details: 'Seajets Superjet', type_of_activity: 'Transportation', address: '10 Akti Miaouli, Piraeus 185 38, Greece', start_time: 700, end_time: 1215, multiday: false, latitude: 37.939300, longitude: 23.640130)
flight2 = Transportation.create(name: 'Flight Home', details: 'Delta Flight #161', type_of_activity: 'Transportation', address: 'Attiki Odos, Spata Artemida 190 04, Greece', start_time: 710, end_time: 1315, multiday: false, latitude: 37.935879, longitude: 23.943470)

DayTransportation.create(transportation: flight1, day: day1greece)
DayTransportation.create(transportation: flight1, day: day2greece)
DayTransportation.create(transportation: flight2, day: day14greece)
DayTransportation.create(transportation: ferry1, day: day4greece)

Activity.create(name: 'Bandiera', details: 'Mediterranean Cuisine', type_of_activity: 'Food/Drink', address: 'Taki 19 Psirri, Athens 105 54, Greece', start_time: 1900, day: day2greece, latitude: 37.978310, longitude: 23.723850)
Activity.create(name: 'Athens Mythology Highlights Tour', details: 'Visit the majestic Acropolis, the Temple of Zeus, the Ancient Agora and find out their connection to the Greek gods and goddesses.', type_of_activity: 'Sightseeing', address: 'Zappio, Athens 105 57, Greece', start_time: 900, end_time: 1300, day: day3greece, latitude: 37.973080, longitude: 23.734750)
Activity.create(name: 'Armeni', details: 'Mediterranean/Seafood Cuisine', type_of_activity: 'Food/Drink', address: 'Oia Santorini Old Port of Armeni, Oia 847 02, Greece', start_time: 1930, day: day4greece, latitude: 36.460499, longitude: 25.380546)
Activity.create(name: 'Private Cruise from Fira', details: 'Explore Santorini’s famous caldera, lava-rock beaches, and neighboring islands just the way you want to on this private chartered speedboat tour.', type_of_activity: 'Sightseeing', address: 'Alex Private Boat Rental, Fira Santorini Old Port, Thira 847 00, Greece', start_time: 1000, end_time: 1500, day: day5greece, latitude: 36.418138, longitude: 25.427716)
Activity.create(name: 'Castle of St Nicholas', details: 'Visit the castle of St Nicholas and take in the 360 degree views of the caldera.', type_of_activity: 'Sightseeing', address: 'Oia 847 02, Greece', start_time: 1100, day: day6greece, latitude: 36.4618199, longitude: 25.3753101)
