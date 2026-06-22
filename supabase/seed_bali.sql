-- ============================================================
-- 360 Travellers — Bali packages seed (4 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- ── 1. Bali Essentials ───────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Bali Essentials: Culture & Coast',
  'bali-essentials-culture-coast-6d',
  'A perfect introduction to the Island of the Gods, blending the serene artistic heart of Ubud with the sophisticated beach life of Seminyak.',
  'international', 'Indonesia', 'bali',
  24500, 30000, '5 Nights / 6 Days', 5, 6,
  'Ubud, Seminyak', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Ubud","description":"Arrive at Ngurah Rai International Airport and enjoy a private transfer to the artistic town of Ubud. Check into your lush jungle resort and take some time to breathe in the fresh mountain air. Spend your evening wandering through the Ubud Art Market to discover beautiful local handicrafts and textiles. Enjoy a quiet, traditional Balinese dinner at a local restaurant overlooking the rice fields to settle into the island vibe."},{"day":2,"title":"Ubud Culture & Nature","description":"Begin your morning with a visit to the Sacred Monkey Forest Sanctuary, where you can walk through ancient temple grounds amidst playful macaques. Continue to the Tegalalang Rice Terrace for breathtaking views of the iconic, tiered green landscape that defines Bali interior. In the afternoon, visit the Tirta Empul Temple to witness the holy water purification ritual, a deep spiritual experience. Return to your hotel in the evening for a relaxing dip in the pool surrounded by tropical gardens."},{"day":3,"title":"Transfer to Seminyak","description":"After a delicious breakfast, enjoy a scenic drive from the hills of Ubud down to the vibrant coastal area of Seminyak. On the way, stop at a traditional Balinese coffee plantation to sample the famous Luwak coffee and learn about local farming. Upon arrival in Seminyak, check into your beachfront hotel and take a refreshing walk along the long stretch of golden sand. Spend your evening enjoying the famous sunset at a chic beach club with cocktails and music."},{"day":4,"title":"Beach & Sunset Delights","description":"Dedicate your day to sun, sand, and sea as you lounge by the beach or explore the trendy boutiques and cafes in Seminyak. Consider a surfing lesson or simply enjoy a relaxing massage at a local wellness center to rejuvenate your body. As the sun begins to set, make your way to Tanah Lot Temple, perched on a rock formation in the sea. Watch the sunset behind the temple for one of the most iconic and photogenic views in all of Indonesia."},{"day":5,"title":"Leisure Day","description":"Today is entirely at your leisure to explore the island further or simply indulge in the comforts of your resort. You might choose to head out for some final souvenir shopping in the bustling streets of Legian or Kuta. Alternatively, treat yourself to a full-day luxury spa experience, featuring traditional Balinese flower baths and soothing massage techniques. End your final night with a celebratory seafood dinner on the beach at Jimbaran Bay, where the fresh catch is grilled to perfection."},{"day":6,"title":"Departure","description":"Enjoy a final, leisurely breakfast while watching the waves roll into the shore one last time. Take care of last-minute packing before your private transfer picks you up for the trip back to the airport. Reflect on the amazing beauty, culture, and hospitality you have experienced during your week in Bali. Depart for your flight home, feeling refreshed and already planning your return to this magical island."}]'::jsonb,
  '["Ubud Monkey Forest","Tegalalang Rice Terraces","Tanah Lot Sunset","Jimbaran Seafood Dinner"]'::jsonb,
  '["5 nights accommodation","Daily breakfast","All private transfers","Sightseeing entrance fees","English speaking guide"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Carry a sarong for temple visits","Use local ride-hailing apps for cheap transport"]'::jsonb,
  '["Ubud","Seminyak"]'::jsonb,
  4.6, 720,
  'Bali Essentials Tour | 360 Travellers',
  'Experience the culture and coasts of Bali. Book your getaway with 360 Travellers.',
  '["bali tour","ubud package","seminyak travel","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'bali-essentials-culture-coast-6d');

-- ── 2. Bali Adventure & Nusa Penida ──────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Bali Adventure & Nusa Penida',
  'bali-adventure-nusa-penida-7d',
  'An action-packed itinerary for the thrill-seeker, featuring waterfall trekking in the north and an exciting island-hopping trip to Nusa Penida.',
  'international', 'Indonesia', 'bali',
  32000, 39000, '6 Nights / 7 Days', 6, 7,
  'Ubud, Nusa Penida', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Bali","description":"Touch down at the airport and be met by our representative for your transfer to your hotel in the heart of Bali. Settle in and enjoy the quiet surroundings as you prepare for an exciting week of exploration. Take a gentle evening walk through the nearby streets to get a feel for the local culture and architecture. Enjoy a welcome dinner at a traditional eatery to kick off your adventure with authentic Indonesian flavors."},{"day":2,"title":"Waterfall Exploration","description":"Head north to discover the hidden gems of Bali, starting with the spectacular Sekumpul Waterfall, tucked away in the lush jungle. Trek through river paths and tropical foliage to reach the base of these majestic cascading waters. Spend your afternoon at a second waterfall, such as Gitgit or Banyumala, enjoying a swim in the cool, crystal-clear mountain pools. This day is all about connecting with nature and witnessing the untamed beauty of the Balinese highlands."},{"day":3,"title":"Nusa Penida Crossing","description":"Check out and transfer to Sanur Port to catch a fast boat across the sparkling blue waters to the island of Nusa Penida. Upon arrival, your local guide will meet you and take you to see the iconic Kelingking Beach, famous for its T-Rex shaped cliff. Spend your afternoon visiting Angel Billabong and Broken Beach to take photos of the unique geological formations. Check into your island resort and enjoy a peaceful evening watching the stars from the beach."},{"day":4,"title":"Nusa Penida Wonders","description":"Wake up early to experience the raw, natural beauty of the island before the day-trippers arrive. Visit Diamond Beach for a stunning view of the white sand against the bright blue ocean, and take the stairs down for a closer look. Continue to Atuh Beach for more swimming and snorkeling in the surrounding reef areas. This island is known for its dramatic scenery and quiet charm, providing a stark contrast to the busy mainland of Bali."},{"day":5,"title":"Return to Mainland","description":"Board your fast boat back to mainland Bali and enjoy the scenic ride across the ocean. Transfer to your hotel in the Kuta or Canggu area, where you can enjoy a change of pace. Spend your afternoon relaxing at the hotel pool or exploring the surf culture and trendy cafes nearby. As the sun sets, head to a popular beach club for a lively evening of music and ocean breezes."},{"day":6,"title":"Leisure & Surf","description":"Today is yours to embrace the adventurous spirit of Bali, whether you choose to go surfing, whitewater rafting, or simply exploring by scooter. The waves in Canggu are perfect for beginners, or you can book a guided tour into the interior for an adrenaline-filled rafting session on the Ayung River. Enjoy your final day soaking up the sun and indulging in delicious local snacks from beachside vendors. Celebrate your last night with a vibrant party or a quiet, high-end meal overlooking the waves."},{"day":7,"title":"Departure","description":"Enjoy a final breakfast with a view before your private transfer to the airport for your flight home. Take one last look at the beautiful beaches and lush scenery that made your trip so special. Ensure you have all your travel documents and souvenirs packed as you head to the terminal. We hope you return home with thrilling stories and incredible memories of your adventurous Bali getaway."}]'::jsonb,
  '["Sekumpul Waterfall trek","Kelingking Beach T-Rex Cliff","Diamond Beach","Fast boat to Nusa Penida"]'::jsonb,
  '["6 nights accommodation","Daily breakfast","All ferry and private transfers","Guided tours","Entrance fees"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Insurance"]'::jsonb,
  '["Pack sturdy shoes for waterfall trekking","Bring a dry bag for boat transfers"]'::jsonb,
  '["Ubud","Nusa Penida","Kuta"]'::jsonb,
  4.7, 510,
  'Bali Adventure Tour | 360 Travellers',
  'Waterfall trekking and island hopping in Bali. Book with 360 Travellers.',
  '["bali adventure","nusa penida tour","bali waterfalls","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'bali-adventure-nusa-penida-7d');

-- ── 3. Romantic Bali Honeymoon ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Romantic Bali Honeymoon',
  'romantic-bali-honeymoon-6d',
  'A luxurious, intimate escape designed for couples, featuring private pool villas, candlelit dinners, and serene spa experiences.',
  'international', 'Indonesia', 'bali',
  48000, 58000, '5 Nights / 6 Days', 5, 6,
  'Uluwatu, Ubud', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Romance","description":"Arrive at the airport and enjoy a VIP private transfer to your exclusive pool villa in the quiet hills of Ubud. Upon arrival, you will find your room decorated with traditional flowers to welcome you to your honeymoon. Spend your first evening relaxing in your private pool with a bottle of sparkling wine. Enjoy an intimate dinner served in the privacy of your villa, accompanied by soft music and the sounds of the jungle."},{"day":2,"title":"Ubud Serenity","description":"Start your day with a romantic floating breakfast served in your private villa pool, the perfect way to begin your morning. In the afternoon, enjoy a couples spa package that includes a flower bath and a synchronized massage using organic local oils. Take a gentle, private walking tour through the quiet rice paddies surrounding Ubud to soak in the peaceful atmosphere. As evening falls, enjoy a curated dinner at a restaurant overlooking the lush Ayung River valley."},{"day":3,"title":"Transfer to Uluwatu","description":"Check out of your Ubud villa and enjoy a private drive to the dramatic cliffs of Uluwatu in the south. Check into a high-end cliffside resort that offers breathtaking views of the endless Indian Ocean. Spend your afternoon lounging in a private cabana by the resort pool, enjoying cocktails while watching the waves crash against the cliffs below. As the sun sets, head to the Uluwatu Temple to watch the famous Kecak Fire Dance performance, a cultural masterpiece."},{"day":4,"title":"Cliffside Luxury","description":"Today is a day for pure couple relaxation, focusing on enjoying the luxury amenities of your stunning resort. Book a private beach excursion to a secluded cove where you can enjoy a picnic lunch just for the two of you. Return to the resort in the afternoon for a sunset photo session, capturing the magic of your honeymoon against the cliffside backdrop. Spend your evening with a candlelit dinner set up on a private terrace, overlooking the starlit ocean."},{"day":5,"title":"Beach Day","description":"Visit the beautiful Padang Padang Beach or Bingin Beach for a day of sun, sand, and private time by the water. You can hire a private guide for the day to take you to hidden spots and ensure you have plenty of privacy. Enjoy a casual but delicious seafood lunch at a beach club before returning to the resort for some afternoon downtime. The rest of the day is yours to enjoy, perhaps with a final sunset toast at the resort bar."},{"day":6,"title":"Departure","description":"Wake up to a final beautiful view of the ocean and enjoy a relaxed breakfast served on your balcony. Take your time to pack and pick up some luxury local gifts from the hotel boutique before your transfer. Our representative will ensure your journey to the airport is smooth and comfortable as you head home. We hope this trip has provided a perfect, romantic start to your new life together."}]'::jsonb,
  '["Private pool villa stay","Floating breakfast","Couples spa treatment","Kecak Fire Dance","Candlelit cliffside dinner"]'::jsonb,
  '["5 nights luxury villa accommodation","Daily breakfast","All private transfers","Spa treatments","Candlelit dinners"]'::jsonb,
  '["Flights","Visa","Additional meals","Personal expenses"]'::jsonb,
  '["Book private dinners in advance","Pack light, breathable clothing"]'::jsonb,
  '["Uluwatu","Ubud"]'::jsonb,
  4.9, 380,
  'Romantic Bali Honeymoon | 360 Travellers',
  'Luxury and romance in Bali. Book your honeymoon with 360 Travellers.',
  '["bali honeymoon","luxury bali","romantic bali","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'romantic-bali-honeymoon-6d');

-- ── 4. Complete Bali Discovery ────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'The Complete Bali Discovery',
  'complete-bali-discovery-10d',
  'The ultimate 10-day Indonesian journey covering the mountains, jungles, beaches, and the hidden island charms of Bali.',
  'international', 'Indonesia', 'bali',
  62000, 75000, '9 Nights / 10 Days', 9, 10,
  'Ubud, Munduk, Seminyak, Uluwatu', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Bali","description":"Arrive at the international airport and receive a warm welcome before being transferred to your hotel in the cultural center of Ubud. Take the evening to relax after your journey, enjoying the peaceful atmosphere of your surroundings. Enjoy a quiet walk to a local cafe for a taste of Indonesian coffee and light snacks. Get ready to begin your comprehensive exploration of this diverse island tomorrow morning."},{"day":2,"title":"Ubud Highlights","description":"Explore the spiritual and artistic heart of Bali by visiting the Monkey Forest and the Tegalalang Rice Terraces. Spend your afternoon learning about traditional Balinese painting or wood carving in a local workshop. Visit the Royal Palace in the center of town to admire the unique architecture and historical significance. End the day with a traditional dance performance that showcases the storytelling traditions of the island."},{"day":3,"title":"Northern Highlands","description":"Travel north into the misty mountains of Munduk, a region famous for its waterfalls and spice plantations. Check into a mountain lodge and enjoy the cooler climate and dramatic views of the rolling green hills. Take a hike to see some of the most beautiful hidden waterfalls in the area, surrounded by dense jungle. Spend your evening by a cozy fire, enjoying the quiet serenity of the northern highlands."},{"day":4,"title":"Lake & Temple","description":"Visit the iconic Pura Ulun Danu Beratan, a temple that seems to float on the surface of the serene Lake Beratan. Afterward, explore the nearby botanical gardens to see a wide variety of native Indonesian flora and giant trees. Continue your drive through the beautiful countryside, stopping at local fruit markets to taste exotic treats. Return to your lodge for a final night in the mountains, enjoying the peaceful environment."},{"day":5,"title":"Transfer to Coast","description":"Head south towards the vibrant coast, passing through beautiful scenic villages and terraced landscapes along the way. Stop at a local temple or cultural site that reflects the diverse history of the Balinese people. Upon arrival in the Seminyak area, check into your beach resort and enjoy the immediate shift in atmosphere. Spend your evening watching the sunset from the sand and enjoying a lively dinner at a beachside grill."},{"day":6,"title":"Coastal Exploration","description":"Spend your day exploring the trendy neighborhoods of Canggu and Seminyak, known for their surfing, shopping, and cafe culture. Visit the iconic Tanah Lot Temple for a morning tour before the crowds arrive, allowing for better photos and a peaceful experience. In the afternoon, enjoy some retail therapy at the local boutiques that offer unique Balinese fashion. As evening approaches, choose one of the many high-end beach clubs for a night of music and drinks."},{"day":7,"title":"Southern Cliffs","description":"Travel to the southern peninsula of Uluwatu, famous for its dramatic limestone cliffs and world-class surfing waves. Visit the Uluwatu Temple to admire its clifftop location and the incredible ocean vistas it provides. Spend your afternoon lounging at a secluded beach and enjoying the crystal-clear waters of the south. As the sun sets, be sure to catch the famous Kecak Fire Dance performance right at the cliffside."},{"day":8,"title":"Island Leisure","description":"Dedicate your day to total relaxation at your resort or head out for a final adventure, such as a snorkeling trip to a nearby reef. Treat yourself to a final full-day spa session to ensure you are feeling rejuvenated before your flight. You might also want to visit the Garuda Wisnu Kencana Cultural Park to see the massive, iconic statue that overlooks the island. Spend your evening enjoying a final fancy dinner at a restaurant with panoramic ocean views."},{"day":9,"title":"Final Memories","description":"Enjoy a slow breakfast and a final morning stroll along the beach to soak in the beauty of Bali one last time. Use your remaining time to do some last-minute shopping for local crafts and mementos to bring home. Pack your bags and enjoy a final delicious lunch of authentic Nasi Goreng or Satay. Prepare for your trip back to the airport, reflecting on all the incredible experiences you have had across the island."},{"day":10,"title":"Departure","description":"After a final, relaxed breakfast in the tropical sun, you will be transferred to the airport for your flight home. Take one last look at the stunning island landscape as you head to the terminal, knowing you have experienced the best of Bali. We hope you leave with a wealth of beautiful memories and the intention to return to this paradise very soon. Have a safe and pleasant journey back to your home country."}]'::jsonb,
  '["Comprehensive Bali coverage","Ubud culture","Munduk waterfalls","Uluwatu cliffs","Tanah Lot Temple"]'::jsonb,
  '["9 nights accommodation","Daily breakfast","All private transfers","Guided sightseeing tours","Cultural experiences"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Book internal activities well in advance","Pack a variety of clothes for mountains and beach"]'::jsonb,
  '["Ubud","Munduk","Seminyak","Uluwatu"]'::jsonb,
  4.8, 1500,
  'Complete Bali Tour | 360 Travellers',
  'From jungles to beaches, cover all of Bali. Book with 360 Travellers.',
  '["bali tour package","complete bali","bali vacation","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'complete-bali-discovery-10d');
