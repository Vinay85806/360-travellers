-- ============================================================
-- 360 Travellers — Uttarakhand packages seed (8 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- ── 1. Rishikesh Adventure Getaway ──────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Rishikesh Adventure Getaway',
  'rishikesh-adventure-3d',
  'Experience the yoga capital of the world and the thrill of river rafting on the Ganges in this action-packed trip.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  8500, 11000, '2 Nights / 3 Days', 2, 3,
  'Rishikesh', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Ganga Aarti","description":"Arrive in Rishikesh and check into your riverside camp or hotel. Spend your afternoon relaxing by the river or visiting the iconic Laxman Jhula bridge. In the evening, witness the divine Ganga Aarti at Parmarth Niketan, a spiritual experience that fills the air with chants and light. Enjoy a traditional dinner in the heart of the town."},{"day":2,"title":"Rafting & Exploration","description":"Start your morning with an adrenaline-pumping white water rafting session on the Ganges, navigating the famous rapids. In the afternoon, visit the local cafes or participate in a short yoga session to rejuvenate your mind and body. Explore the Beatles Ashram, known for its unique murals and historical significance. Spend your final evening enjoying live music or a quiet riverside bonfire."},{"day":3,"title":"Departure","description":"Enjoy a final morning breakfast with a view of the Himalayan foothills. Take a quick walk through the local market to pick up spiritual items or local snacks. Our team will provide a smooth transfer to the airport or train station for your return journey. Depart with unforgettable memories of adventure and serenity."}]'::jsonb,
  '["White Water Rafting","Ganga Aarti","Laxman Jhula","Beatles Ashram"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private transfers","Rafting activity"]'::jsonb,
  '["Travel fares","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Rafting is subject to weather conditions","Carry comfortable sports wear"]'::jsonb,
  '["Rishikesh"]'::jsonb,
  4.8, 720,
  'Rishikesh Adventure | 360 Travellers',
  'Combine adventure and peace in Rishikesh.',
  '["rishikesh","rafting","yoga","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'rishikesh-adventure-3d');

-- ── 2. Mussoorie Queen of Hills ──────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Mussoorie Queen of Hills',
  'mussoorie-queen-hills-3d',
  'Escape to the serene heights of Mussoorie, enjoying the colonial charm, mountain views, and the famous Kempty Falls.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  9500, 12500, '2 Nights / 3 Days', 2, 3,
  'Mussoorie', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Mall Road","description":"Arrive in Mussoorie and check into your mountain-view hotel. Spend your first afternoon walking along the famous Mall Road, taking in the colonial-era architecture and vibrant shops. As evening sets in, enjoy the panoramic view of the Doon Valley from the promenade. Indulge in local snacks and hot coffee at a cozy hillside cafe."},{"day":2,"title":"Kempty Falls & Sightseeing","description":"Visit the beautiful Kempty Falls for a refreshing morning experience at the cascading water pools. Continue your exploration to Gun Hill via the cable car, offering breathtaking views of the snow-clad Himalayan peaks. Spend your afternoon visiting the Cloud End or Company Garden for a peaceful nature walk. Enjoy a quiet dinner at your resort, surrounded by the cool mountain air."},{"day":3,"title":"Departure","description":"Have a hearty breakfast while enjoying the morning sunrise over the mountains. Take a final stroll through the peaceful local lanes to pick up some souvenirs. Our team will ensure a comfortable transfer back for your return journey. Leave with the crisp, clean mountain air and peaceful memories of the hills."}]'::jsonb,
  '["Kempty Falls","Mall Road","Gun Hill Cable Car","Doon Valley Views"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private local transport","Sightseeing"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Carry light woolens even in summer","Book cable car tickets in advance"]'::jsonb,
  '["Mussoorie"]'::jsonb,
  4.6, 550,
  'Mussoorie Tour | 360 Travellers',
  'Relax in the beautiful hill station of Mussoorie.',
  '["mussoorie","hill station","uttarakhand","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'mussoorie-queen-hills-3d');

-- ── 3. Nainital Lake Escape ──────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Nainital Lake Escape',
  'nainital-lake-escape-3d',
  'Enjoy the serene beauty of Naini Lake, the lush forests, and the surrounding Kumaon peaks in this peaceful getaway.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  8000, 10500, '2 Nights / 3 Days', 2, 3,
  'Nainital', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Boat Ride","description":"Arrive in Nainital and check into your hotel overlooking the beautiful Naini Lake. Spend your afternoon enjoying a peaceful boat ride on the crystal-clear water of the lake. Explore the local Tibetan market, known for its warm clothes and unique jewelry. End your day with a delicious dinner at a lakeside restaurant, watching the town lights reflect on the water."},{"day":2,"title":"Viewpoints & Forest","description":"Start your day with a visit to the Naina Devi Temple, located right by the lake. Take the cable car to Snow View Point to witness the majestic Himalayan peaks in all their glory. Spend your afternoon walking through the lush green forest paths or visit the Nainital Zoo to see the native wildlife. Enjoy a final evening of shopping and relaxing in the cool, pleasant atmosphere of the hills."},{"day":3,"title":"Departure","description":"Enjoy a slow breakfast while watching the morning mist clear over the mountains. Take one final walk around the lake to capture photos before your departure. Our representative will arrange your transfer back, leaving you refreshed by the quiet charm of the lake city. Carry back memories of a peaceful mountain holiday."}]'::jsonb,
  '["Naini Lake Boat Ride","Snow View Point","Naina Devi Temple","Zoo"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private local transport","Sightseeing"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Nainital is crowded in summer","Book hotels well in advance"]'::jsonb,
  '["Nainital"]'::jsonb,
  4.7, 600,
  'Nainital Tour | 360 Travellers',
  'Relax by the famous Naini Lake in Nainital.',
  '["nainital","lake tour","uttarakhand","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'nainital-lake-escape-3d');

-- ── 4. Corbett Wildlife Safari ───────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Corbett Wildlife Safari',
  'jim-corbett-safari-3d',
  'Explore India oldest national park and search for the majestic Bengal tiger in the heart of the Uttarakhand wilderness.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  12000, 15000, '2 Nights / 3 Days', 2, 3,
  'Jim Corbett', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Nature Walk","description":"Arrive at the Jim Corbett National Park and check into your jungle resort. Spend your afternoon on a guided nature walk along the riverbanks, where you can spot diverse bird species. Enjoy a bonfire dinner at the resort, listening to the sounds of the jungle as night falls. Relax and prepare for an early start tomorrow for your jungle safari experience."},{"day":2,"title":"Jungle Safari","description":"Head out early for a thrilling morning jungle safari in an open jeep to spot tigers, elephants, and deer in their natural habitat. Spend your afternoon relaxing at the resort or visiting the nearby Corbett Museum to learn about the park history. If time permits, enjoy another late afternoon safari to catch the wildlife during their active hours. Enjoy a hearty dinner, sharing stories of the day sightings."},{"day":3,"title":"Departure","description":"Have a final breakfast in the middle of the lush wilderness before preparing for your departure. Take one last look at the beautiful forest scenery and serene river as you pack your bags. Our team will ensure a smooth transfer back for your journey home. Leave with a deep appreciation for the wildlife and the beauty of the Himalayan foothills."}]'::jsonb,
  '["Jeep Safari","Nature Walk","Wildlife Spotting","Bird Watching"]'::jsonb,
  '["2 nights stay","Daily breakfast","All transfers","Jeep Safari"]'::jsonb,
  '["Travel fares","Lunch and dinner","Guide tips"]'::jsonb,
  '["Safaris must be booked months in advance","Wear neutral colored clothing"]'::jsonb,
  '["Jim Corbett"]'::jsonb,
  4.9, 450,
  'Jim Corbett Tour | 360 Travellers',
  'Go on a thrilling tiger safari in Jim Corbett.',
  '["corbett","wildlife","safari","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'jim-corbett-safari-3d');

-- ── 5. Auli Skiing Adventure ─────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Auli Skiing Adventure',
  'auli-skiing-adventure-4d',
  'Visit Auli, the premier ski destination of India, offering stunning views of Nanda Devi and snow-covered slopes.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  14000, 18000, '3 Nights / 4 Days', 3, 4,
  'Auli', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Auli","description":"Arrive in Auli and check into your snow-covered mountain resort. Spend your first afternoon taking in the spectacular view of the surrounding peaks, including Nanda Devi. Enjoy a warm dinner by the fireplace, adjusting to the crisp mountain air. Prepare for an exciting couple of days filled with snow activities and mountain exploration in one of the most beautiful destinations in the country."},{"day":2,"title":"Skiing & Snow Fun","description":"Spend your day skiing on the pristine, snow-covered slopes of Auli, suitable for both beginners and experienced skiers. If you prefer, enjoy other snow activities like sledding or just walking through the powdery, white landscape. Take the cable car ride, which offers a bird-eye view of the entire valley and the surrounding peaks. Spend your evening relaxing with a hot chocolate, surrounded by the snowy peaks under the stars."},{"day":3,"title":"Panoramic Views","description":"Take a peaceful walk through the meadows that are famous for their beauty during every season. Explore the nearby local village to understand the unique lifestyle of the mountain people living in these high altitudes. Spend your final afternoon capturing the perfect photos of the massive mountain ranges that surround the region. Enjoy a final, cozy dinner at the lodge, reflecting on your time in the snow."},{"day":4,"title":"Departure","description":"Enjoy a final mountain breakfast before your transfer down the mountain passes. The ride back is scenic, allowing you to see the changing landscape as you leave the high altitude. Our representative will ensure a safe journey to your departure point. Carry back memories of the snow-capped paradise and the quiet beauty of the Himalayas."}]'::jsonb,
  '["Skiing","Cable Car","Nanda Devi View","Meadow Walks"]'::jsonb,
  '["3 nights stay","Daily breakfast","All transfers","Skiing equipment"]'::jsonb,
  '["Travel fares","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Best time for skiing is Jan-Mar","Carry heavy woolens and snow gear"]'::jsonb,
  '["Auli"]'::jsonb,
  4.9, 320,
  'Auli Skiing Tour | 360 Travellers',
  'Enjoy the snow and skiing in beautiful Auli.',
  '["auli","skiing","snow","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'auli-skiing-adventure-4d');

-- ── 6. Char Dham Glimpse ─────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Char Dham Glimpse',
  'char-dham-glimpse-5d',
  'A spiritual journey to two of the most significant pilgrimage sites in the Himalayas: Kedarnath and Badrinath.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  25000, 30000, '4 Nights / 5 Days', 4, 5,
  'Kedarnath, Badrinath', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Journey","description":"Arrive in the gateway town and begin your spiritual journey towards the high Himalayas. The drive through the mountain roads is scenic, passing through dense forests and along the winding river valleys. Reach your base hotel and spend the evening relaxing and preparing for the pilgrimage ahead. Enjoy a simple, vegetarian dinner to keep your mind focused on your spiritual goal."},{"day":2,"title":"Kedarnath Temple","description":"Embark on a sacred journey to the Kedarnath temple, located amidst the snowy peaks. Depending on the season, you will either trek or take a helicopter to reach the ancient, powerful shrine dedicated to Lord Shiva. Spend your time in prayer and soak in the divine energy of the surroundings. Return to your base camp for a well-deserved rest after an intense and fulfilling day."},{"day":3,"title":"Badrinath Temple","description":"Travel to the holy town of Badrinath, nestled between the Nar and Narayan mountain ranges. Visit the Badrinath temple, one of the most important pilgrimage sites, and take a holy dip in the Tapt Kund hot springs. Explore the spiritual town and the nearby Mana village, the last Indian village on the border. Spend your evening in prayer and quiet reflection in this serene mountain valley."},{"day":4,"title":"Return Journey","description":"Begin your descent from the high altitudes, passing through the same beautiful mountain landscapes you ascended a few days ago. Reach the lower town and spend your final evening reflecting on the intense spiritual experience of the last few days. Enjoy a quiet dinner, resting your body and reflecting on the journey. This is a time to be grateful for the completion of your pilgrimage."},{"day":5,"title":"Departure","description":"Enjoy a slow breakfast before your final transfer back to your departure point. Reflect on the peace and the sheer magnitude of the Himalayan pilgrimage you have just completed. Our team will ensure you have a comfortable ride for your journey home. Depart with a feeling of deep satisfaction and spiritual clarity."}]'::jsonb,
  '["Kedarnath Temple","Badrinath Temple","Mana Village","Tapt Kund"]'::jsonb,
  '["4 nights stay","Daily breakfast","All transfers","Temple guides"]'::jsonb,
  '["Travel fares","Helicopter charges","Meals"]'::jsonb,
  '["Trek requires high fitness","Book pilgrimage registration in advance"]'::jsonb,
  '["Kedarnath","Badrinath"]'::jsonb,
  4.9, 900,
  'Char Dham Glimpse | 360 Travellers',
  'A spiritual pilgrimage to Kedarnath and Badrinath.',
  '["kedarnath","badrinath","pilgrimage","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'char-dham-glimpse-5d');

-- ── 7. Chopta & Tungnath Trek ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Chopta & Tungnath Trek',
  'chopta-tungnath-trek-4d',
  'Trek through the Mini Switzerland of India to reach the highest Shiva temple in the world at Tungnath.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  11000, 14000, '3 Nights / 4 Days', 3, 4,
  'Chopta', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Chopta","description":"Arrive in the serene meadows of Chopta, surrounded by towering snow-covered peaks. Check into your cozy forest lodge and spend your afternoon walking in the lush, green meadows that resemble alpine Switzerland. Enjoy a bonfire dinner under the stars, away from the city lights and noise. This is the perfect place to disconnect and connect with the quiet beauty of nature."},{"day":2,"title":"Tungnath Trek","description":"Embark on a trek to the ancient Tungnath temple, the highest Shiva temple in the world. The path is scenic, passing through oak and rhododendron forests that are especially beautiful in the morning light. Reach the temple and spend some time in quiet prayer, surrounded by the vast mountain views. If you have the energy, continue to Chandrashila peak for a 360-degree view of the Himalayas."},{"day":3,"title":"Nature Exploration","description":"Spend your day exploring the areas around Chopta, taking short walks through the dense, bird-filled forests. Visit the Deoria Tal lake if you are interested in a short drive and a peaceful lakeside walk with a reflection of the peaks. Spend your final evening in the meadow, enjoying the silence and the magnificent sunset over the mountain ranges. Enjoy a final, simple forest-style dinner at the lodge."},{"day":4,"title":"Departure","description":"Wake up to a final beautiful sunrise over the peaks before preparing for your departure. Take one last walk through the meadows, capturing the feeling of the crisp mountain air. Our team will arrange your transfer back down the valley, leaving you with memories of the trek and the peace of the high altitude. Depart with a feeling of deep rejuvenation from your time in the mountains."}]'::jsonb,
  '["Tungnath Temple","Chandrashila Trek","Chopta Meadows","Forest Walks"]'::jsonb,
  '["3 nights stay","Daily breakfast","All transfers","Trek guide"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Requires moderate fitness","Pack for sudden weather changes"]'::jsonb,
  '["Chopta"]'::jsonb,
  4.8, 410,
  'Chopta Trek Tour | 360 Travellers',
  'Trek to the highest Shiva temple in the world.',
  '["chopta","tungnath","trekking","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'chopta-tungnath-trek-4d');

-- ── 8. Complete Uttarakhand Expedition ───────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Complete Uttarakhand Expedition',
  'complete-uttarakhand-expedition-12d',
  'A grand 12-day journey covering the best of Uttarakhand, from the holy Ganges to the snow-covered peaks of the high Himalayas.',
  'domestic', 'Uttarakhand', 'uttarakhand',
  38000, 48000, '11 Nights / 12 Days', 11, 12,
  'Rishikesh, Mussoorie, Nainital, Corbett, Auli', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Rishikesh","description":"Arrive in Rishikesh and begin your massive 12-day expedition through the best of Uttarakhand. Check into your resort by the river and spend your evening witnessing the beautiful Ganga Aarti at the local ashram. Enjoy a quiet, traditional dinner as you prepare for the days of adventure and peace that lie ahead. This is the start of a journey that will take you across the entire state."},{"day":2,"title":"Rishikesh to Mussoorie","description":"Travel from Rishikesh to the charming hill station of Mussoorie, the Queen of Hills. Check into your hotel and spend your afternoon walking on the famous Mall Road, taking in the panoramic views of the mountains. In the evening, enjoy a hot coffee in a quiet cafe as you look out over the valley. Rest well as you prepare for a day of exploring the scenic beauty of the hill station tomorrow."},{"day":3,"title":"Mussoorie Wonders","description":"Spend your day visiting Kempty Falls, Gun Hill, and the Company Garden, which are the main attractions of this beautiful hill station. Take the cable car for some of the best mountain views you will see in this part of the state. Spend your evening shopping for local goods and enjoy the cool, crisp air of the mountains. This is a day dedicated to relaxing and enjoying the classic charm of Mussoorie."},{"day":4,"title":"Journey to Corbett","description":"Travel from Mussoorie down to the Jim Corbett National Park, entering the wild forest region of the state. Check into your resort and spend the afternoon on a nature walk, enjoying the sounds of the jungle. Enjoy a bonfire dinner and listen to stories about the wild tigers that roam the area. Get a good rest as you will be heading out for your safari early tomorrow morning."},{"day":5,"title":"Jungle Safari & Wildlife","description":"Go on a thrilling morning jeep safari to spot the wildlife that makes Corbett world-famous. Spend the afternoon resting at your resort or visiting the local museum to learn more about the park history. Enjoy a final evening in the wilderness, surrounded by the beauty of nature. This is a unique experience that shows you the wild side of Uttarakhand, far from the busy city life."},{"day":6,"title":"Corbett to Nainital","description":"Travel from the forest region to the beautiful lake city of Nainital, high up in the Kumaon mountains. Check into your hotel overlooking the lake and spend the afternoon taking a relaxing boat ride. Explore the local market and enjoy a dinner of local Kumaoni cuisine, known for its earthy flavors. Spend your night in the quiet, peaceful atmosphere of the lake city."},{"day":7,"title":"Nainital Exploration","description":"Visit the Naina Devi temple, take the cable car to Snow View Point, and explore the forest paths that surround the town. Spend your day enjoying the cool weather and the magnificent mountain views that make this city so popular. In the evening, walk along the lake promenade, enjoying the quiet energy of the night. This is a perfect day to recharge and enjoy the beauty of the Kumaon region."},{"day":8,"title":"Journey to Auli","description":"Drive through the spectacular mountain passes to reach the high-altitude snowy paradise of Auli. Check into your lodge and spend the evening enjoying the breathtaking views of the Nanda Devi peak. The air here is thin and crisp, a true experience of the high Himalayas. Prepare for a couple of days filled with snow, mountains, and the peace of the highest regions in the state."},{"day":9,"title":"Auli Snow Adventure","description":"Spend your day skiing, sledding, or just walking through the massive, beautiful meadows that are covered in white snow. Take the cable car for an unforgettable view of the entire valley from above. In the evening, relax with a hot meal as the sun sets over the snowy peaks. This is the highlight of your mountain experience, surrounded by the highest snow-covered peaks in the country."},{"day":10,"title":"Auli to Rishikesh","description":"Start your descent back from the high Himalayas, traveling through the winding, scenic roads of the state. Reach the lower regions and enjoy the lush, green change in the landscape as you get closer to the plains. Check into your hotel and spend your evening relaxing, reflecting on the journey from the forests to the high peaks. Enjoy a final, quiet dinner as you near the end of your trip."},{"day":11,"title":"Nature & Relaxation","description":"Spend your final full day in the river valley, relaxing by the banks of the Ganges or taking a final yoga session. This is a day to reflect on the beauty, the spirituality, and the adventure of the past 11 days. Enjoy a final celebratory dinner, tasting the very best of local food. Pack your bags and get ready for your journey back home tomorrow."},{"day":12,"title":"Departure","description":"Enjoy a final mountain breakfast, taking in the beauty of the landscape one last time. Our representative will pick you up for your transfer back to your departure point. Depart with deep memories of the rivers, the forests, the lakes, and the highest mountains of Uttarakhand. We hope you leave with a heart full of stories and a desire to come back to the Himalayas."}]'::jsonb,
  '["Full Uttarakhand","Himalayan Expedition","Corbett Safari","Auli Snow","Lake Tour"]'::jsonb,
  '["11 nights accommodation","Daily breakfast","All transfers","Safari activities","Skiing equipment"]'::jsonb,
  '["Travel fares","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack for multiple climates","Book major activities in advance"]'::jsonb,
  '["Rishikesh","Mussoorie","Corbett","Nainital","Auli"]'::jsonb,
  4.9, 1500,
  'Complete Uttarakhand Expedition | 360 Travellers',
  'The ultimate 12-day tour covering all of Uttarakhand.',
  '["uttarakhand tour","himalayas","complete uttarakhand","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'complete-uttarakhand-expedition-12d');
