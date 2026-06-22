-- ============================================================
-- 360 Travellers — Kashmir packages seed (8 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- ── 1. Srinagar Houseboat Getaway ────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Srinagar Houseboat Getaway',
  'srinagar-houseboat-3d',
  'Immerse yourself in the tranquility of Dal Lake with a stay on a traditional houseboat in the heart of Srinagar.',
  'domestic', 'Kashmir', 'kashmir',
  12000, 15000, '2 Nights / 3 Days', 2, 3,
  'Srinagar', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Shikara Ride","description":"Arrive in Srinagar and transfer to your traditional wooden houseboat on Dal Lake. Spend your afternoon enjoying a peaceful Shikara ride, watching the floating gardens and the local market life on the water. As evening falls, enjoy a traditional Kashmiri dinner on the houseboat deck, surrounded by the quiet, serene waters of the lake. This is a unique experience that connects you with the heart of Kashmiri culture."},{"day":2,"title":"Mughal Gardens & Local Sightseeing","description":"Start your morning with a visit to the historic Mughal Gardens, including Nishat Bagh and Shalimar Bagh, famous for their beautiful terraces and fountains. Explore the local handicraft shops, known for delicate pashmina shawls and intricate wood carvings. Spend your late afternoon walking through the old city, seeing the traditional architecture and bustling streets. Enjoy your final night on the houseboat, reflecting on the peaceful day."},{"day":3,"title":"Departure","description":"Enjoy a slow breakfast on the deck, breathing in the fresh Himalayan air before your departure. Take one final, quiet Shikara ride to the shore to pick up some local saffron or dry fruits. Our team will ensure a smooth transfer to the airport or train station for your return journey. Depart with the memory of the tranquil waters and the warm hospitality of the houseboat staff."}]'::jsonb,
  '["Dal Lake Houseboat","Shikara Ride","Mughal Gardens","Local Markets"]'::jsonb,
  '["2 nights accommodation","Daily breakfast","Private transfers","Shikara ride"]'::jsonb,
  '["Flights/Trains","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Best season is spring or autumn","Book houseboat in advance"]'::jsonb,
  '["Srinagar"]'::jsonb,
  4.9, 850,
  'Srinagar Houseboat Tour | 360 Travellers',
  'Experience the unique charm of staying on a houseboat in Kashmir.',
  '["kashmir","srinagar","houseboat","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'srinagar-houseboat-3d');

-- ── 2. Gulmarg Snow Escape ───────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Gulmarg Snow Escape',
  'gulmarg-snow-3d',
  'Visit the world-renowned ski destination of Gulmarg, famous for its cable car, snow-covered meadows, and alpine beauty.',
  'domestic', 'Kashmir', 'kashmir',
  15000, 19000, '2 Nights / 3 Days', 2, 3,
  'Gulmarg', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Gulmarg","description":"Arrive in Gulmarg, a high-altitude hill station famous for its snow-covered slopes and stunning scenery. Check into your cozy mountain resort and enjoy the breathtaking views of the distant peaks. Spend your first evening relaxing by a fire, adjusting to the crisp, fresh Himalayan air. This is the perfect place to disconnect and enjoy the sheer beauty of the mountains under a blanket of white."},{"day":2,"title":"Gondola Ride & Snow Adventure","description":"Take the world-famous Gulmarg Gondola, one of the highest cable cars in the world, to reach the peak for a panoramic view of the Himalayas. Spend your day enjoying snow activities like skiing, sledding, or just walking through the powdery, snow-covered meadows. In the afternoon, explore the local area and visit the historic wooden churches that dot the landscape. Enjoy a hearty mountain-style dinner at your resort."},{"day":3,"title":"Departure","description":"Wake up to a final morning in the snow, taking one last walk to enjoy the quiet beauty of the mountain meadow. Pack your bags, including any local souvenirs you might have picked up, and prepare for your departure. Our team will provide a comfortable transfer back to Srinagar for your flight home. Leave with memories of the pristine white landscapes and the thrill of the high-altitude adventure."}]'::jsonb,
  '["Gulmarg Gondola","Skiing","Snow Meadows","Mountain Views"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private transfers","Sightseeing"]'::jsonb,
  '["Flights","Lunch and dinner","Skiing equipment"]'::jsonb,
  '["Carry heavy woolens","Check gondola status before booking"]'::jsonb,
  '["Gulmarg"]'::jsonb,
  4.9, 620,
  'Gulmarg Snow Tour | 360 Travellers',
  'Explore the snow-capped mountains and skiing in Gulmarg.',
  '["gulmarg","kashmir","snow","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'gulmarg-snow-3d');

-- ── 3. Pahalgam Nature Retreat ───────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Pahalgam Nature Retreat',
  'pahalgam-nature-3d',
  'Relax in the beautiful valley of Pahalgam, known for its rushing rivers, pine forests, and serene mountain atmosphere.',
  'domestic', 'Kashmir', 'kashmir',
  11000, 14000, '2 Nights / 3 Days', 2, 3,
  'Pahalgam', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Pahalgam","description":"Arrive in Pahalgam, a scenic town nestled at the confluence of the Lidder River and the Sheshnag Lake. Check into your resort, which is surrounded by thick pine forests and soaring mountains. Spend your afternoon walking along the rushing river, enjoying the sound of the water and the quiet of the forest. Enjoy a traditional dinner at your resort, surrounded by the peaceful, natural beauty of the valley."},{"day":2,"title":"Betaab & Aru Valley","description":"Explore the famous Betaab Valley, known for its lush green meadows and stunning mountain backdrop. Continue your adventure to Aru Valley, a quiet, peaceful destination that feels like a hidden paradise in the Himalayas. Spend your afternoon taking photos and enjoying the simple, raw beauty of the landscape. Return to your resort in the evening, feeling refreshed after a day in the heart of nature."},{"day":3,"title":"Departure","description":"Enjoy a slow breakfast on the balcony, watching the morning mist rise over the pine-covered hills. Take one last walk through the forest before preparing for your departure. Our team will provide a smooth transfer back to Srinagar for your onward journey. Depart with a sense of peace and a deep appreciation for the natural beauty of the Kashmir valley."}]'::jsonb,
  '["Betaab Valley","Aru Valley","Lidder River","Pine Forests"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private local transport","Sightseeing"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Pahalgam is great for trekking","Pack for mild to cool weather"]'::jsonb,
  '["Pahalgam"]'::jsonb,
  4.7, 480,
  'Pahalgam Nature Tour | 360 Travellers',
  'Enjoy a peaceful nature retreat in Pahalgam.',
  '["pahalgam","kashmir","nature","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'pahalgam-nature-3d');

-- ── 4. Sonamarg Meadow of Gold ───────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Sonamarg Meadow of Gold',
  'sonamarg-meadow-3d',
  'Discover the Meadow of Gold, home to stunning glaciers, mountain treks, and the beautiful Sindh River.',
  'domestic', 'Kashmir', 'kashmir',
  10000, 13000, '2 Nights / 3 Days', 2, 3,
  'Sonamarg', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Sonamarg","description":"Arrive in Sonamarg, the Meadow of Gold, situated at the base of the mighty Himalayas. Check into your mountain lodge and spend your first afternoon exploring the area near the rushing Sindh River. The landscape here is dramatic, with high peaks surrounding the meadow on all sides. Enjoy a quiet dinner at your lodge, feeling the excitement of being in the heart of the high mountain region."},{"day":2,"title":"Thajiwas Glacier","description":"Take a horse ride or a short trek to the Thajiwas Glacier, which remains covered in snow even during the summer months. Spend your day enjoying the view of the ice and the surrounding peaks, a truly breathtaking experience. If you are adventurous, take a longer trek to explore the hidden valleys around the glacier. Spend your evening in quiet reflection, enjoying the immense, raw power of the high Himalayas."},{"day":3,"title":"Departure","description":"Wake up to a final morning in the meadow, breathing in the thin, fresh mountain air before your departure. Take one last walk near the river to capture the beauty of the landscape on your way out. Our representative will arrange your transfer back, leaving you with memories of the wild, untamed beauty of Sonamarg. Carry back the peaceful feeling of being in the mountains."}]'::jsonb,
  '["Thajiwas Glacier","Sindh River","Mountain Meadows","Trekking"]'::jsonb,
  '["2 nights stay","Daily breakfast","All transfers","Sightseeing"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Glacier access is seasonal","Carry warm clothing"]'::jsonb,
  '["Sonamarg"]'::jsonb,
  4.8, 410,
  'Sonamarg Tour | 360 Travellers',
  'Visit the Meadow of Gold in Sonamarg.',
  '["sonamarg","kashmir","meadow of gold","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'sonamarg-meadow-3d');

-- ── 5. Srinagar & Gulmarg Duo ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Srinagar & Gulmarg Duo',
  'srinagar-gulmarg-4d',
  'A classic combination of the cultural vibrancy of Srinagar and the snow-capped mountains of Gulmarg.',
  'domestic', 'Kashmir', 'kashmir',
  18000, 22000, '3 Nights / 4 Days', 3, 4,
  'Srinagar, Gulmarg', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Srinagar","description":"Arrive in Srinagar and check into your houseboat, settling into the traditional Kashmiri style of living. Spend your afternoon enjoying a peaceful Shikara ride on Dal Lake, exploring the unique floating life. Enjoy a traditional dinner on the deck, surrounded by the calm waters and the beautiful city skyline. This is the perfect introduction to the beauty and culture of the Kashmir valley."},{"day":2,"title":"Mughal Gardens & Drive to Gulmarg","description":"Visit the beautiful Mughal gardens in the morning, taking in the terraced beauty and the historic fountains. In the afternoon, start your scenic drive to Gulmarg, a journey that takes you through the heart of the mountain landscape. Check into your mountain resort and enjoy the cool, fresh air of the high altitude. Spend your evening by the fire, looking forward to your day in the snow tomorrow."},{"day":3,"title":"Gondola Adventure","description":"Take the Gulmarg Gondola to the higher reaches of the mountain for a spectacular view of the surrounding peaks. Spend your day exploring the snow-covered meadows, enjoying the fun of skiing or just playing in the snow. Explore the beautiful local area, including the historic churches and the quiet forest paths. Enjoy a final, cozy dinner at your resort, reflecting on your wonderful mountain holiday."},{"day":4,"title":"Departure","description":"Enjoy a final mountain breakfast, watching the sun rise over the snowy peaks before you prepare for your departure. Pack your bags and take a final walk around the resort to enjoy the cool, clean air. Our team will ensure a smooth transfer back to the airport for your flight home. Leave with a heart full of memories and a desire to return to the beautiful Kashmir valley."}]'::jsonb,
  '["Dal Lake","Mughal Gardens","Gulmarg Gondola","Snow Fields"]'::jsonb,
  '["3 nights stay","Daily breakfast","All private transfers","Sightseeing"]'::jsonb,
  '["Travel fares","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Book gondola tickets well in advance","Pack for two different climates"]'::jsonb,
  '["Srinagar","Gulmarg"]'::jsonb,
  4.8, 750,
  'Srinagar & Gulmarg Tour | 360 Travellers',
  'Experience both the city of Srinagar and the peaks of Gulmarg.',
  '["srinagar","gulmarg","kashmir duo","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'srinagar-gulmarg-4d');

-- ── 6. Kashmir Valley Explorer ───────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Kashmir Valley Explorer',
  'kashmir-valley-explorer-6d',
  'A 6-day comprehensive tour covering the main gems of Kashmir: Srinagar, Gulmarg, Pahalgam, and Sonamarg.',
  'domestic', 'Kashmir', 'kashmir',
  28000, 35000, '5 Nights / 6 Days', 5, 6,
  'Srinagar, Gulmarg, Pahalgam, Sonamarg', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Srinagar","description":"Arrive in Srinagar and check into your beautiful houseboat, feeling the peace of the lake immediately. Spend your afternoon enjoying a relaxed Shikara ride on Dal Lake, taking in the sights of the city from the water. Enjoy a traditional dinner, sampling the unique and rich flavors of the valley. Get a good rest as you prepare for an exciting few days of exploring the beauty of Kashmir."},{"day":2,"title":"Gulmarg Snow Fields","description":"Drive to Gulmarg and take the Gondola ride to the top of the mountain to witness the stunning Himalayan views. Spend your day enjoying the snow and the beauty of the high-altitude meadow, a true paradise for nature lovers. Return to your hotel in the evening, feeling satisfied after a full day of mountain exploration. Enjoy a quiet, warm dinner, reflecting on the beauty of the snowy peak you just visited."},{"day":3,"title":"Drive to Pahalgam","description":"Travel from Gulmarg to the lush, pine-covered valley of Pahalgam, known for its river and mountain backdrop. Check into your resort and spend the afternoon walking by the Lidder river, listening to the peaceful sound of the flowing water. Enjoy a traditional dinner in the heart of the forest, feeling the quiet beauty of the surroundings. This is a day to slow down and connect with the raw beauty of the valley."},{"day":4,"title":"Betaab & Aru Exploration","description":"Spend your day exploring the beautiful Betaab and Aru valleys, which offer some of the most stunning scenery in the entire state. Take your time to walk through the meadows, take photos, and just enjoy the sheer peace of these beautiful places. Return to your resort in the evening, feeling enriched by your encounter with nature. Enjoy a final, quiet dinner as the sun sets over the mountains."},{"day":5,"title":"Sonamarg & Return to Srinagar","description":"Drive to Sonamarg, the Meadow of Gold, and visit the glacier before heading back to Srinagar for your final night. This route is spectacular, with massive peaks on both sides as you travel through the mountain passes. Check into your hotel in Srinagar and enjoy a celebratory dinner, reflecting on the amazing journey you have had across the Kashmir valley. Spend your evening at your own pace, perhaps walking in the city center."},{"day":6,"title":"Departure","description":"Enjoy a final Kashmiri breakfast and take one last walk through the local market to pick up your souvenirs and mementos. Our team will provide a smooth transfer to the airport, ensuring you have everything you need for your flight home. Depart with a heart full of memories and a desire to return to the beautiful Kashmir valley once more. Have a safe and pleasant journey back home."}]'::jsonb,
  '["Srinagar Houseboat","Gulmarg Gondola","Pahalgam Nature","Sonamarg Glacier"]'::jsonb,
  '["5 nights accommodation","Daily breakfast","All transfers","Sightseeing"]'::jsonb,
  '["Travel fares","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack for all weather conditions","Keep identification documents handy"]'::jsonb,
  '["Srinagar","Gulmarg","Pahalgam","Sonamarg"]'::jsonb,
  4.9, 1200,
  'Kashmir Valley Explorer | 360 Travellers',
  'See the best of Kashmir in a single 6-day trip.',
  '["kashmir","srinagar","gulmarg","pahalgam","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'kashmir-valley-explorer-6d');

-- ── 7. Heritage of Kashmir ───────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Heritage of Kashmir',
  'heritage-kashmir-3d',
  'Focusing on the history, architecture, and cultural heritage of Srinagar and its surrounding Mughal sites.',
  'domestic', 'Kashmir', 'kashmir',
  10500, 13000, '2 Nights / 3 Days', 2, 3,
  'Srinagar', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Old City","description":"Arrive in Srinagar and check into your hotel, focusing on the history of this ancient city. Spend your afternoon exploring the Old City, where you can see the traditional wooden houses and the famous Jamia Masjid. The history here is palpable, with stories of the Silk Road and the many dynasties that have ruled this valley. Enjoy a traditional dinner in a classic city restaurant, tasting the heritage of Kashmiri cuisine."},{"day":2,"title":"Gardens & Shankaracharya Temple","description":"Spend your day visiting the grand Mughal Gardens that were built during the height of the empire. Visit the Shankaracharya Temple, perched on a hill, for a view that covers the entire city and the surrounding lake. This is a day for history and culture, seeing how the architecture and spirituality of the region have blended over the centuries. Enjoy your final evening exploring the local markets, looking for antiques and traditional textiles."},{"day":3,"title":"Departure","description":"Enjoy a final Kashmiri breakfast, reflecting on the rich history you have seen during your short time in the city. Take a last walk near the lake, perhaps buying some local saffron as a memento of your trip. Our representative will arrange your transfer back, leaving you with a deeper understanding of the valley heritage. Depart with a sense of respect for the long and vibrant history of Kashmir."}]'::jsonb,
  '["Jamia Masjid","Mughal Gardens","Shankaracharya Temple","Old City"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private transfers","Historical guide"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Dress modestly for religious sites","Hire a guide for better context"]'::jsonb,
  '["Srinagar"]'::jsonb,
  4.6, 350,
  'Heritage of Kashmir Tour | 360 Travellers',
  'Explore the rich history and architecture of Srinagar.',
  '["srinagar","heritage","kashmir","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'heritage-kashmir-3d');

-- ── 8. Complete Kashmir Expedition ───────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Complete Kashmir Expedition',
  'complete-kashmir-expedition-10d',
  'A grand 10-day expedition covering all the major and hidden gems of the Kashmir valley, from Srinagar to the high borders.',
  'domestic', 'Kashmir', 'kashmir',
  40000, 50000, '9 Nights / 10 Days', 9, 10,
  'Srinagar, Gulmarg, Pahalgam, Sonamarg, Doodhpathri', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Srinagar","description":"Arrive in Srinagar and check into your houseboat, settling into the traditional and quiet lifestyle of the Dal Lake. Spend your afternoon enjoying a peaceful Shikara ride, watching the city and the surrounding mountains from the water. Enjoy a traditional Kashmiri dinner as you start your 10-day tour of this incredible region. This is the beginning of a deep dive into the culture, nature, and history of the Kashmir valley."},{"day":2,"title":"Srinagar City & Gardens","description":"Spend your full day visiting the beautiful Mughal Gardens and the historic sites of the city, such as the Shankaracharya temple. Walk through the bustling local markets to see the incredible pashmina and wood craft that Kashmir is so famous for globally. In the evening, enjoy a sunset view of the lake, with the mountains in the background. Get ready for a week of exploration across the various beautiful districts of the valley."},{"day":3,"title":"Drive to Gulmarg","description":"Travel from Srinagar to the snowy meadow of Gulmarg, stopping along the way to take in the mountain views. Check into your resort and spend the afternoon taking in the high-altitude air and the sheer beauty of the surroundings. Enjoy a cozy, warm dinner as you prepare for a day of exploring the snowy peaks tomorrow. The change in the landscape from the city to the high mountains is a journey in itself."},{"day":4,"title":"Gondola & Snow Peaks","description":"Spend your day taking the Gondola ride to the top of the mountain and enjoying the snow-covered slopes of Gulmarg. If you are a fan of skiing, this is the best place to do it, or you can just enjoy the incredible views and the quiet of the high altitudes. Spend your evening by the fire, reflecting on the beauty of the snowy mountain range. This is the highlight of the high-altitude part of your trip."},{"day":5,"title":"Journey to Pahalgam","description":"Travel from Gulmarg to the serene, pine-covered valley of Pahalgam, passing through the beautiful countryside of the Kashmir region. Check into your forest resort and spend the afternoon listening to the sound of the Lidder river rushing through the valley. This is a very peaceful and natural transition from the snow-covered mountains of Gulmarg. Enjoy a quiet, traditional dinner in the middle of the pine forest."},{"day":6,"title":"Pahalgam Valleys","description":"Spend your day visiting the beautiful Betaab and Aru valleys, which offer some of the most stunning scenery in the entire state of Jammu and Kashmir. Take your time to walk, take photos, and just enjoy the sheer peace of these remote and beautiful places. In the evening, return to your resort and enjoy a quiet, relaxing dinner, surrounded by the nature of the valley. This is a day to feel the deep, natural beauty of the area."},{"day":7,"title":"Drive to Sonamarg","description":"Travel from Pahalgam to the Meadow of Gold, Sonamarg, passing through the city of Srinagar on the way. The route is spectacular, with high peaks on both sides of the road as you enter the high-altitude mountain region. Check into your mountain lodge and spend the evening enjoying the sheer power of the surrounding peaks. This is the base for your glacier visit tomorrow. Enjoy a hearty, mountain-style dinner."},{"day":8,"title":"Thajiwas Glacier","description":"Take an early morning horse ride to the Thajiwas Glacier and spend your day surrounded by the white, beautiful ice and the peaks. Return to the lodge in the evening, feeling the peace and the power of the high Himalayas after a full day in the cold air. Spend your final evening in the high mountains, reflecting on your journey across the different regions of the valley. Enjoy a final, warm mountain dinner."},{"day":9,"title":"Return to Srinagar","description":"Drive back to Srinagar and spend your final full day in the city, doing some final shopping or just relaxing by the lake. Take a final, peaceful Shikara ride at sunset to mark the end of your incredible 10-day tour across the region. Enjoy a celebratory dinner, sampling the very best food of the valley one last time. This is a day to be grateful and to enjoy the beautiful city and its waters."},{"day":10,"title":"Departure","description":"Enjoy a final Kashmiri breakfast before your transfer to the airport for your flight home. Take one last walk near the lake to capture the feeling of the region in your mind. Our team will ensure you have a comfortable ride and everything you need for your flight. Depart with a heart full of memories from your 10-day Kashmir adventure. Have a safe and pleasant journey back home."}]'::jsonb,
  '["Full Kashmir Tour","Dal Lake","Gulmarg Gondola","Pahalgam Nature","Sonamarg Glacier"]'::jsonb,
  '["9 nights accommodation","Daily breakfast","All transfers","Sightseeing","Guided tours"]'::jsonb,
  '["Travel fares","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack for all weather","Keep ID proofs handy for security"]'::jsonb,
  '["Srinagar","Gulmarg","Pahalgam","Sonamarg"]'::jsonb,
  4.9, 1500,
  'Complete Kashmir Expedition | 360 Travellers',
  'A 10-day journey covering all major sights in Kashmir.',
  '["kashmir","complete kashmir","srinagar","gulmarg","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'complete-kashmir-expedition-10d');
