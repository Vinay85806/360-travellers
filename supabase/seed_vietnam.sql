-- ============================================================
-- 360 Travellers — Vietnam packages seed (8 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- ── 1. Hanoi & Ha Long Bay ───────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Hanoi & Ha Long Bay Escape',
  'hanoi-halong-bay-4d',
  'A quick yet immersive journey through the historic capital of Hanoi and the majestic natural wonders of Ha Long Bay.',
  'international', 'Vietnam', 'vietnam',
  22000, 28000, '3 Nights / 4 Days', 3, 4,
  'Hanoi, Ha Long Bay', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Hanoi","description":"Upon arriving at Noi Bai Airport, our representative will greet you and transfer you to your hotel in the historic Old Quarter. Spend your afternoon wandering the bustling streets, marveling at the preserved French colonial architecture and ancient temples. As evening falls, enjoy a traditional dinner featuring authentic local delicacies like Bun Cha or Pho. End your night with a calm stroll around Hoan Kiem Lake, the serene heart of the city."},{"day":2,"title":"Hanoi City Discovery","description":"Start your morning with a visit to the Ho Chi Minh Mausoleum and the revered Temple of Literature to appreciate Vietnam rich history. Explore the chaotic charm of the Old Quarter 36 streets, each traditionally known for a specific trade or craft. In the afternoon, enjoy a unique Water Puppet show, an ancient performance art that brings Vietnamese folklore to life on water. Spend your final evening in the capital sampling local street food and soaking in the vibrant energy of the night market."},{"day":3,"title":"Ha Long Bay Cruise","description":"Depart Hanoi for a scenic drive through the verdant countryside to reach the breathtaking UNESCO-listed Ha Long Bay. Board your traditional junk boat cruise and enjoy a warm welcome lunch while sailing through thousands of limestone karst islands. Spend your afternoon kayaking through hidden sea caves, exploring grand limestone grottoes, and swimming in the calm, emerald waters of the bay. As the sun dips below the horizon, enjoy a romantic seafood dinner on the top deck under a canopy of stars."},{"day":4,"title":"Return & Departure","description":"Wake up to a serene morning Tai Chi session on the deck, breathing in the fresh, crisp air of the bay. After a hearty breakfast, continue your cruise through quieter parts of the bay before returning to the harbor. Our team will provide a comfortable transfer back to Hanoi or directly to the airport for your onward journey. Leave with wonderful memories of Vietnam natural beauty and the warmth of its people as you head home."}]'::jsonb,
  '["Hanoi Old Quarter","Water Puppet Show","Ha Long Bay Cruise","Limestone Grottoes"]'::jsonb,
  '["3 nights accommodation","Daily breakfast","All private transfers","Cruise activities","English speaking guide"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack comfortable walking shoes","Bring a jacket for the bay"]'::jsonb,
  '["Hanoi","Ha Long Bay"]'::jsonb,
  4.7, 550,
  'Hanoi & Ha Long Bay Tour | 360 Travellers',
  'Explore Vietnam capital and its most famous bay in 4 days.',
  '["hanoi tour","halong bay cruise","vietnam trip","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'hanoi-halong-bay-4d');

-- ── 2. Central Vietnam Heritage ──────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Central Vietnam Heritage Tour',
  'central-vietnam-heritage-5d',
  'Walk through the ancient streets of Hoi An and relax on the white sands of Da Nang in this culture-focused itinerary.',
  'international', 'Vietnam', 'vietnam',
  26000, 32000, '4 Nights / 5 Days', 4, 5,
  'Da Nang, Hoi An', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Da Nang","description":"Land in Da Nang and transfer to your beachfront resort to begin your relaxing central Vietnam vacation. Spend your first afternoon lounging by the pool or taking a long, refreshing walk along the pristine My Khe Beach. Enjoy a sunset drink at a seaside cafe, watching the local fishermen and the vast expanse of the East Sea. End your night with a delicious fresh seafood dinner prepared with local spices and coastal flair."},{"day":2,"title":"Ba Na Hills Excursion","description":"Travel to the breathtaking Ba Na Hills, a mountain resort accessible by one of the worlds longest cable car systems. Walk across the iconic Golden Bridge, held by two giant stone hands that rise majestically from the mountain forest. Spend your afternoon exploring the French Village, an architectural replica that adds a charming European touch to the Vietnamese peaks. Return to the lowlands in the evening, taking in the panoramic views of the coast as the sun begins to set."},{"day":3,"title":"Ancient Hoi An","description":"Drive to the historic town of Hoi An, a UNESCO World Heritage site known for its perfectly preserved ancient merchant houses. Wander through the atmospheric, lantern-lit streets that look like a movie set from centuries past, showcasing a blend of Japanese, Chinese, and Vietnamese styles. Visit the famous Japanese Covered Bridge and participate in a traditional lantern-making workshop to take home a piece of local culture. Spend your evening by the Thu Bon River, enjoying the view of hundreds of glowing lanterns floating on the water."},{"day":4,"title":"Hoi An Leisure","description":"Today is yours to explore the tailors, art galleries, and cafes of Hoi An at your own leisurely pace. Consider renting a bicycle to ride through the nearby rice paddies and reach the quiet Cua Dai beach for a relaxing afternoon swim. Take the opportunity to enjoy a Vietnamese cooking class to learn the secrets of local dishes like Cao Lau and Banh Mi. Spend your final evening in the ancient town, savoring a quiet dinner in one of the many beautiful riverside restaurants."},{"day":5,"title":"Departure","description":"Enjoy a final, quiet breakfast in Hoi An, savoring the peaceful morning atmosphere of the ancient town. Take one last stroll through the market to pick up unique souvenirs or handcrafted clothing from the local tailors. Our team will provide a smooth transfer back to Da Nang International Airport for your flight home. Depart with deep memories of the history, beauty, and hospitality that define this unique region of Vietnam."}]'::jsonb,
  '["Golden Bridge","Ba Na Hills","Hoi An Ancient Town","Lantern Making"]'::jsonb,
  '["4 nights accommodation","Daily breakfast","Sightseeing transfers","Entrance fees","Local tour guide"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Hoi An is best explored by bicycle","Bring light, modest clothing for temples"]'::jsonb,
  '["Da Nang","Hoi An"]'::jsonb,
  4.8, 480,
  'Central Vietnam Heritage | 360 Travellers',
  'Visit the historic streets of Hoi An and Da Nang.',
  '["hoi an tour","da nang package","vietnam heritage","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'central-vietnam-heritage-5d');

-- ── 3. Southern Vietnam Explorer ─────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Southern Vietnam Explorer',
  'southern-vietnam-explorer-5d',
  'Dive into the energy of Ho Chi Minh City and the rural charm of the Mekong Delta in this dynamic southern tour.',
  'international', 'Vietnam', 'vietnam',
  24000, 29000, '4 Nights / 5 Days', 4, 5,
  'Ho Chi Minh City, Mekong Delta', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Saigon","description":"Arrive at Tan Son Nhat Airport and be welcomed by our team before transferring to your hotel in the center of Ho Chi Minh City. Feel the intense, electric energy of this booming metropolis as you take your first walk through the bustling downtown streets. Visit the famous Ben Thanh Market to see the local life, vibrant colors, and unique goods on display. End your night with a delicious dinner at a lively city restaurant, immersing yourself in the culinary scene of the south."},{"day":2,"title":"War History & Culture","description":"Begin your morning by visiting the historic War Remnants Museum to gain deep insights into Vietnam modern history and resilience. Explore the Reunification Palace and the Notre Dame Cathedral, which stand as proud symbols of the city complex colonial and post-colonial past. In the afternoon, head to the outskirts to see the incredible Cu Chi Tunnels, an extensive underground network used by soldiers. Discover the ingenuity behind these tunnels and imagine the daily life of the people who resided there long ago."},{"day":3,"title":"Mekong Delta Journey","description":"Depart the city for a scenic drive into the heart of the Mekong Delta, a vast maze of rivers, islands, and floating markets. Board a private boat to cruise along the narrow canals, observing the traditional way of life in riverside villages and fruit orchards. Visit local workshops where coconut candy, honey, and rice paper are still crafted using traditional, manual methods. Enjoy a quiet, rustic lunch on an island in the delta, surrounded by the peaceful, lush greenery of this unique water world."},{"day":4,"title":"City Leisure","description":"Today is free for you to explore the modern side of Ho Chi Minh City, from its world-class rooftop bars to its boutique shopping malls. You might choose to visit the Bitexco Financial Tower for a panoramic view of the entire city skyline from above. Alternatively, take a slow afternoon to visit the many art galleries and cafes that showcase the city growing contemporary art and design scene. Celebrate your final night in the city with a farewell dinner at a high-end restaurant overlooking the Saigon River."},{"day":5,"title":"Departure","description":"Savor your last Vietnamese coffee and breakfast in the heart of Saigon before your scheduled transfer to the airport. Take a moment to reflect on the contrast between the city frenetic energy and the quiet beauty of the Mekong Delta. Ensure you have all your travel documents and souvenirs packed as you head toward the international terminal for your flight. We hope you leave with unforgettable stories and a newfound appreciation for the southern spirit of Vietnam."}]'::jsonb,
  '["Cu Chi Tunnels","Mekong Delta Cruise","Ben Thanh Market","War Remnants Museum"]'::jsonb,
  '["4 nights accommodation","Daily breakfast","All tours and transfers","Entrance fees","English speaking guide"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack light clothing for the tropical climate","Stay hydrated during city tours"]'::jsonb,
  '["Ho Chi Minh City","Mekong Delta"]'::jsonb,
  4.5, 610,
  'Southern Vietnam Tour | 360 Travellers',
  'Discover Ho Chi Minh City and the Mekong Delta.',
  '["ho chi minh city","mekong delta","vietnam south","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'southern-vietnam-explorer-5d');

-- ── 4. Complete Vietnam ───────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'The Complete Vietnam Experience',
  'complete-vietnam-experience-12d',
  'An epic 12-day journey spanning the north, central, and southern regions of Vietnam for a truly unforgettable vacation.',
  'international', 'Vietnam', 'vietnam',
  75000, 95000, '11 Nights / 12 Days', 11, 12,
  'Hanoi, Ha Long, Hoi An, HCMC', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Hanoi","description":"Land in Hanoi and settle into your hotel in the historic Old Quarter to begin your comprehensive 12-day Vietnamese adventure. Take a gentle evening walk around the scenic Hoan Kiem Lake, the iconic heart of the city, to get your bearings. Enjoy a delicious first dinner at a local eatery, sampling the famous street food that makes Hanoi a culinary destination. Prepare yourself for the rich history and vibrant culture that you will explore over the coming days."},{"day":2,"title":"Hanoi City Wonders","description":"Spend your first full day exploring the capital most important landmarks, including the Ho Chi Minh Mausoleum and the ancient Temple of Literature. Wander through the intricate maze of the Old Quarter streets, discovering hidden cafes and traditional artisan workshops in every corner. In the afternoon, enjoy a traditional Water Puppet show to witness a unique and beautiful aspect of Vietnamese folklore. End your day by tasting the local specialty, Bun Cha, at a classic neighborhood restaurant."},{"day":3,"title":"Ha Long Bay Cruise","description":"Travel from Hanoi to the stunning Ha Long Bay, a natural wonder featuring thousands of limestone islands rising from the emerald sea. Board your cruise and enjoy a relaxing lunch on the water as you sail through the magnificent, calm scenery of the bay. Spend your afternoon kayaking in quiet lagoons, exploring grand caves, and swimming in the refreshing, clean waters. As evening falls, enjoy a serene dinner on the deck, surrounded by the peaceful, quiet majesty of the islands."},{"day":4,"title":"Return to Hanoi","description":"Enjoy a final morning on the bay with a Tai Chi session as the sun rises over the limestone karsts. After a light lunch on board, disembark and take a comfortable drive back to the bustling capital city of Hanoi. Spend your evening at your own pace, perhaps grabbing an egg coffee at a lakeside cafe or doing some final shopping. Get a good night rest as you prepare for your flight south to the central region tomorrow."},{"day":5,"title":"Flight to Da Nang","description":"Fly from Hanoi to Da Nang, the gateway to the beautiful central coast of Vietnam, known for its pristine beaches and mountains. Transfer to your hotel and spend the afternoon lounging by the pool or taking a walk along the famous My Khe Beach. Enjoy a delicious fresh seafood dinner at a local restaurant, taking in the pleasant ocean breeze. Rest and recharge for a day of exploring the scenic beauty of the surrounding mountain ranges tomorrow."},{"day":6,"title":"Ba Na Hills","description":"Embark on a day trip to the spectacular Ba Na Hills, traveling by cable car to reach the famous Golden Bridge held by giant hands. Spend your afternoon exploring the beautiful French Village and enjoying the cool mountain air that provides a perfect escape from the coastal heat. Return to Da Nang in the evening, taking in the beautiful sunset views from the mountain peaks. Enjoy a final dinner in Da Nang, savoring the flavors of central Vietnamese coastal cuisine."},{"day":7,"title":"Transfer to Hoi An","description":"Drive to the ancient town of Hoi An, a charming destination famous for its preserved architecture and thousands of colorful lanterns. Check into your boutique hotel and take an afternoon walk through the ancient merchant houses that line the quiet streets. Participate in a traditional lantern-making workshop to learn how to create your own souvenir of this beautiful, historic place. Spend your evening walking along the riverbank as the lanterns glow in the darkness."},{"day":8,"title":"Hoi An Leisure","description":"Today is free for you to explore the hidden gems of Hoi An, from its local art galleries to the nearby tranquil rice paddies. Consider a bicycle ride to the quiet Cua Dai beach or take a local cooking class to learn the secrets of authentic Vietnamese dishes. You might also want to visit the local tailors to get custom-made clothing at very affordable prices. End your day with a beautiful dinner at a riverside restaurant, watching the world go by."},{"day":9,"title":"Flight to Saigon","description":"Fly from Da Nang to Ho Chi Minh City, the dynamic southern hub that stands in sharp contrast to the historic north. Transfer to your hotel and spend the afternoon taking in the city intense, modern energy and its impressive colonial architecture. Visit the iconic Ben Thanh Market to see the bustling trade and taste the unique flavors of the south. Enjoy a vibrant evening in the city center, surrounded by lights, music, and the fast-paced life of Saigon."},{"day":10,"title":"Cu Chi Tunnels","description":"Take a trip to the historic Cu Chi Tunnels to learn about the incredible ingenuity and resilience of the people during the wartime era. Walk through the underground networks and see the preserved sites that tell a profound story of Vietnam modern history. In the afternoon, return to the city to visit the Reunification Palace and the War Remnants Museum for more historical context. Spend your evening enjoying the modern, high-energy nightlife that defines this part of the country."},{"day":11,"title":"Mekong Delta","description":"Experience the rural beauty of the Mekong Delta with a full-day tour through its winding canals and lush fruit orchards. Sail on a private boat to visit riverside villages, seeing the traditional way of life that has remained unchanged for generations. Sample local snacks made from coconut and rice while enjoying the peaceful atmosphere of this vast, watery landscape. Return to the city in the evening, feeling refreshed by your encounter with the simpler side of life in the south."},{"day":12,"title":"Departure","description":"Enjoy a final Vietnamese breakfast and take one last walk through the city to collect any final souvenirs or mementos. Our representative will pick you up for your transfer to Tan Son Nhat Airport for your flight back home. Reflect on the amazing journey you have had, covering the diverse landscapes, history, and cultures of this beautiful nation. We hope you leave Vietnam with a heart full of memories and a desire to return for more adventures."}]'::jsonb,
  '["Comprehensive Vietnam","Hanoi Old Quarter","Ha Long Bay","Hoi An Lanterns","Mekong Delta"]'::jsonb,
  '["11 nights accommodation","Daily breakfast","Domestic flights","All private transfers","Guided tours"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Domestic flights must be booked in advance","Pack for three distinct climates"]'::jsonb,
  '["Hanoi","Ha Long Bay","Da Nang","Hoi An","HCMC"]'::jsonb,
  4.9, 1500,
  'Complete Vietnam Tour | 360 Travellers',
  'Experience all of Vietnam in one 12-day journey.',
  '["vietnam tour","complete vietnam","vietnam vacation","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'complete-vietnam-experience-12d');

-- ── 5. Sapa Mountain Trekking ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Sapa Mountain Trekking',
  'sapa-mountain-trekking-5d',
  'Explore the breathtaking rice terraces and tribal villages of the northern highlands in this nature-focused adventure.',
  'international', 'Vietnam', 'vietnam',
  28000, 35000, '4 Nights / 5 Days', 4, 5,
  'Hanoi, Sapa', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Hanoi","description":"Arrive in Hanoi and spend your first night in the Old Quarter, preparing for your journey into the northern mountains. Take a gentle evening walk around Hoan Kiem Lake to soak in the city vibrant, historic atmosphere. Enjoy a classic northern Vietnamese dinner before getting a good night of rest before your mountain departure. This is your chance to gather any last-minute trekking supplies you might need for the high altitudes."},{"day":2,"title":"Journey to Sapa","description":"Take a scenic drive or train from Hanoi into the stunning mountains of the north to reach the charming town of Sapa. As you ascend, witness the landscape change to dramatic, terraced rice fields that cascade down the mountainsides like giant green steps. Check into your mountain lodge and enjoy the cooler air and the breathtaking views that stretch across the valley. Spend your evening by the fire, learning about the unique culture of the local Hmong and Red Dao tribes."},{"day":3,"title":"Tribal Village Trek","description":"Embark on a full-day guided trek through the lush mountains, visiting remote tribal villages nestled deep in the valley. Meet the local people, learn about their traditional way of life, and admire the beautiful, intricate handicrafts they create. Walk through the rice terraces, taking in the spectacular scenery that makes this region one of the most beautiful in all of Southeast Asia. Enjoy a picnic lunch in the middle of nature, surrounded by the quiet, serene majesty of the northern highlands."},{"day":4,"title":"Fansipan Peak","description":"Take the cable car to the top of Fansipan, the highest peak in Indochina, for a view that will leave you absolutely speechless. Marvel at the clouds rolling over the mountains and the panoramic vista of the entire northern region from the summit. Spend your afternoon exploring the quiet mountain paths or visiting a local market to pick up unique, hand-woven textiles. Enjoy a final, cozy dinner in the mountain town, reflecting on the beauty of this remote and peaceful region."},{"day":5,"title":"Return to Hanoi","description":"Enjoy a final mountain breakfast, breathing in the crisp air one last time before your journey back to the capital. Take the scenic drive down through the mountain passes, capturing final photos of the lush landscapes as you leave. Upon arrival in Hanoi, our team will transfer you to the airport for your onward flight or back to your hotel for your final night. Depart with deep respect for the people and the landscapes of Vietnam high north."}]'::jsonb,
  '["Sapa Rice Terraces","Tribal Village Visit","Fansipan Peak Cable Car","Mountain Trekking"]'::jsonb,
  '["4 nights accommodation","Daily breakfast","All transfers","Guided mountain treks","Entrance fees"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack sturdy trekking shoes and a warm jacket","Trek difficulty is moderate"]'::jsonb,
  '["Hanoi","Sapa"]'::jsonb,
  4.7, 390,
  'Sapa Mountain Trekking | 360 Travellers',
  'Trek through the stunning mountains of Sapa.',
  '["sapa trekking","vietnam mountains","sapa tour","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'sapa-mountain-trekking-5d');

-- ── 6. Nha Trang Beach Retreat ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Nha Trang Beach Retreat',
  'nha-trang-beach-retreat-6d',
  'Relax on the golden beaches of Nha Trang and enjoy snorkeling in crystal-clear waters in this coastal escape.',
  'international', 'Vietnam', 'vietnam',
  30000, 38000, '5 Nights / 6 Days', 5, 6,
  'Nha Trang', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Nha Trang","description":"Arrive in the coastal city of Nha Trang, known for its beautiful beaches and vibrant ocean-side atmosphere. Check into your resort and immediately feel the stress fade away as you take in the stunning sea views. Spend your first afternoon lounging on the golden sand, feeling the gentle waves of the ocean at your feet. End your day with a seafood dinner at a local beach club, enjoying the fresh catch of the day in a relaxed setting."},{"day":2,"title":"Island Hopping","description":"Board a boat for an exciting island-hopping tour, visiting the beautiful islands that dot the turquoise waters of the bay. Spend your day snorkeling in vibrant coral reefs, seeing schools of tropical fish and unique marine life beneath the surface. Enjoy a delicious buffet lunch on one of the islands, relaxing under the shade of palm trees during the heat of the afternoon. Return to the mainland in the late afternoon, feeling refreshed by a day spent on the water."},{"day":3,"title":"Mud Bath & Wellness","description":"Visit a local mud bath and hot spring center to experience a traditional, healing treatment famous in the Nha Trang region. Immerse yourself in the warm, mineral-rich mud, which is believed to have numerous health benefits for your skin and body. Spend the rest of your day relaxing in the thermal pools, surrounded by beautiful tropical gardens and serene landscapes. End your afternoon with a professional massage to fully rejuvenate your body before a quiet evening dinner."},{"day":4,"title":"City & Culture","description":"Explore the cultural side of Nha Trang by visiting the Po Nagar Cham Towers, an ancient religious site with stunning architecture. Learn about the history of the Cham people and the significance of these towers that have stood for hundreds of years. In the afternoon, visit the local market to see the vibrant trade and pick up some fresh local fruit or handmade crafts. Spend your evening walking along the beach promenade, enjoying the vibrant nightlife and the cool ocean breeze."},{"day":5,"title":"Beach Leisure","description":"Today is entirely for you to enjoy the beach or the water activities that make Nha Trang such a world-class destination. Rent a stand-up paddleboard, try jet skiing, or simply relax on a sun lounger with a good book and a cold drink. Treat yourself to a final, luxurious seafood dinner by the ocean to celebrate your wonderful coastal vacation. Reflect on the beauty of the sea and the relaxing time you have had on this stunning stretch of the Vietnamese coast."},{"day":6,"title":"Departure","description":"Enjoy a final beach breakfast, listening to the soothing sound of the waves one last time before you prepare for your departure. Pack your bags, making sure to include all the beautiful mementos of your trip along the coast. Our team will provide a smooth transfer to the Cam Ranh airport for your flight home. Depart with a sense of peace and the beautiful memories of the crystal-clear waters of Nha Trang."}]'::jsonb,
  '["Nha Trang Beach","Island Snorkeling","Mud Bath Therapy","Po Nagar Towers"]'::jsonb,
  '["5 nights accommodation","Daily breakfast","All transfers","Island tours","Spa treatments"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["High-SPF sunscreen is essential","Check weather for water activities"]'::jsonb,
  '["Nha Trang"]'::jsonb,
  4.6, 420,
  'Nha Trang Beach Tour | 360 Travellers',
  'Enjoy a relaxing beach retreat in Nha Trang.',
  '["nha trang beach","vietnam coast","nha trang package","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'nha-trang-beach-retreat-6d');

-- ── 7. Ninh Binh Nature Escape ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Ninh Binh Nature Escape',
  'ninh-binh-nature-escape-4d',
  'Discover the Ha Long Bay on Land with limestone peaks, winding rivers, and peaceful ancient temples.',
  'international', 'Vietnam', 'vietnam',
  18000, 23000, '3 Nights / 4 Days', 3, 4,
  'Ninh Binh', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Ninh Binh","description":"Arrive in the breathtaking region of Ninh Binh, often called the Ha Long Bay on Land due to its dramatic limestone landscape. Check into your lodge, which is surrounded by lush green rice paddies and towering rock formations that create a peaceful, stunning environment. Take an evening walk through the nearby countryside to get a feel for the slow, serene pace of rural life here. Enjoy a simple, delicious home-cooked dinner at your lodge, prepared with fresh ingredients from the local farms."},{"day":2,"title":"Trang An Boat Tour","description":"Board a traditional small boat for a tour through the Trang An landscape complex, a UNESCO World Heritage site known for its winding rivers. Glide through massive caves, under hanging stalactites, and past ancient temples that are built right into the side of the limestone mountains. This is one of the most peaceful and scenic experiences in all of Vietnam, offering a quiet, intimate connection with nature. Spend your afternoon wandering around the nearby temple grounds, enjoying the silence of this sacred, natural wonder."},{"day":3,"title":"Mua Caves & Views","description":"Hike up to the top of the Mua Caves viewpoint for a panoramic vista of the entire Ninh Binh valley and its river-carved landscape. The climb is challenging, but the view from the top is absolutely spectacular, offering the best vantage point for photos of the area. In the afternoon, visit the ancient capital of Hoa Lu to learn about the history of the Dinh and Le dynasties that ruled Vietnam centuries ago. Spend your final evening in the valley, enjoying a quiet dinner as the sun sets over the peaks."},{"day":4,"title":"Departure","description":"Wake up to a final peaceful morning, enjoying the fresh air and the stunning view of the limestone karsts one last time. Take a slow walk through the rice paddies before preparing for your transfer back to Hanoi or your next destination. Our team will ensure you have a comfortable ride, taking with you the memories of the quiet beauty of this amazing nature escape. We hope you leave with a sense of calm and a deep appreciation for the landscapes of Ninh Binh."}]'::jsonb,
  '["Trang An Boat Tour","Mua Caves Viewpoint","Hoa Lu Ancient Capital"]'::jsonb,
  '["3 nights accommodation","Daily breakfast","All transfers","Boat tour fees","Entrance fees"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack comfortable hiking shoes for Mua Caves","Bring a sun hat"]'::jsonb,
  '["Ninh Binh"]'::jsonb,
  4.7, 340,
  'Ninh Binh Nature Tour | 360 Travellers',
  'Explore the stunning limestone landscapes of Ninh Binh.',
  '["ninh binh tour","vietnam nature","trang an","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'ninh-binh-nature-escape-4d');

-- ── 8. Vietnamese Culinary Journey ───────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Vietnamese Culinary Journey',
  'vietnamese-culinary-journey-7d',
  'A delicious exploration of Vietnam world-famous cuisine, from street food tours in Hanoi to cooking classes in Hoi An.',
  'international', 'Vietnam', 'vietnam',
  35000, 44000, '6 Nights / 7 Days', 6, 7,
  'Hanoi, Hoi An', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Hanoi Food Tour","description":"Arrive in Hanoi and immediately dive into the world-famous street food culture with an evening guided food tour in the Old Quarter. Sample classic dishes like Pho, Bun Cha, and egg coffee while learning about the history of each dish from a local expert. Walk through the narrow, crowded streets and see how the city lives and eats at the same time, a truly authentic experience. End your night with a local beer at a bustling corner, feeling the energy of this historic culinary city."},{"day":2,"title":"Hanoi Cooking Class","description":"Visit a local morning market to hand-select fresh ingredients before participating in a professional Vietnamese cooking class. Learn the techniques required to balance sweet, salty, sour, and spicy flavors in dishes like spring rolls and papaya salad. Enjoy the meal you have prepared for lunch, sharing stories and food with your fellow travelers and the local chef. Spend your afternoon wandering through the local cafes and trying more street-side delicacies that you missed the night before."},{"day":3,"title":"Flight to Da Nang","description":"Fly to the central region and transfer to Hoi An, a town celebrated not just for its beauty but for its unique and diverse culinary scene. Check into your hotel and spend your afternoon exploring the local street stalls that offer the famous Hoi An specialty, Cao Lau noodles. Take a walk through the historic streets, noticing how the architecture and food have been influenced by centuries of trade. Enjoy a beautiful, high-quality dinner at a restaurant overlooking the quiet river."},{"day":4,"title":"Hoi An Culinary Class","description":"Spend your day taking a deep dive into the unique regional cuisine of central Vietnam with a professional cooking class held in a rustic kitchen. Visit a local farm to pick herbs and vegetables that will form the basis of your delicious, homemade lunch. Learn how to prepare regional specialties that you cannot find anywhere else in the country, mastering the delicate art of Vietnamese spice. Spend your evening exploring the vibrant night market for some extra sweet treats and local snacks."},{"day":5,"title":"Market & Street Food","description":"Join a local guide for an in-depth tour of the Hoi An central market, seeing how the local people shop for their daily ingredients. Taste different kinds of exotic fruits, local sweets, and savory snacks that are sold by vendors who have been here for generations. In the afternoon, enjoy some free time to visit your favorite cafes or do some shopping in the ancient town. Spend your final evening in Hoi An with a gourmet dinner at a riverside restaurant, celebrating your food-filled journey."},{"day":6,"title":"Coffee & Culture","description":"On your final full day, dedicate time to learning about Vietnam famous coffee culture, from the strong local brew to the creamy egg coffee. Visit a specialized coffee house to see how the traditional drip filter, or phin, works and taste different beans from the northern highlands. Take some time to relax in a quiet cafe, reading or simply watching the life of the ancient town unfold around you. End your final night with a celebratory meal, tasting the very best that central Vietnamese cuisine has to offer."},{"day":7,"title":"Departure","description":"Enjoy a final Vietnamese breakfast, savoring the flavors of your culinary journey one last time. Take a moment to pack your bags, ensuring you have some local spices or coffee to take home with you. Our team will provide a smooth transfer to the airport for your flight home, feeling satisfied and inspired. We hope you return home with the skills to cook some of these amazing dishes yourself."}]'::jsonb,
  '["Street food tour","Cooking classes","Coffee tasting","Local market tours"]'::jsonb,
  '["6 nights accommodation","Daily breakfast","All transfers","Cooking classes","Guided tours"]'::jsonb,
  '["International flights","Visa fees","Personal expenses"]'::jsonb,
  '["Come hungry!","Ask your guide about local food allergies"]'::jsonb,
  '["Hanoi","Hoi An"]'::jsonb,
  4.9, 520,
  'Vietnamese Culinary Journey | 360 Travellers',
  'Taste the best of Vietnam in this food-focused tour.',
  '["food tour vietnam","vietnamese cuisine","cooking class","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'vietnamese-culinary-journey-7d');
