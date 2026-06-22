-- ============================================================
-- 360 Travellers — Thailand packages seed (5 packages)
-- Replaces any existing Thailand packages.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- Remove existing Thailand packages before re-inserting
DELETE FROM packages WHERE destination_slug = 'thailand';

-- ── 1. Bangkok & Pattaya ─────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Bangkok & Pattaya Classic Escape',
  'bangkok-pattaya-classic-escape-5d',
  'A perfect introduction to Thailand, combining the high-energy urban life of Bangkok with the coastal charm and vibrant nightlife of Pattaya.',
  'international', 'Thailand', 'thailand',
  28500, 35000, '4 Nights / 5 Days', 4, 5,
  'Bangkok, Pattaya', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Bangkok","description":"Arrive at Suvarnabhumi Airport and enjoy a private transfer to your hotel. Spend your afternoon exploring the local markets before enjoying a serene evening cruise on the Chao Phraya River with a traditional Thai dinner."},{"day":2,"title":"Bangkok City Tour","description":"Visit the majestic Grand Palace and the Temple of the Emerald Buddha. Continue to Wat Arun, the Temple of Dawn. Spend the late afternoon shopping at Siam Paragon or the MBK Center for local bargains."},{"day":3,"title":"Transfer to Pattaya","description":"Check out and enjoy a scenic drive to the coastal city of Pattaya. After hotel check-in, visit the Sanctuary of Truth, a massive wooden temple. Spend the evening walking along Jomtien Beach or exploring the famous Walking Street."},{"day":4,"title":"Coral Island Adventure","description":"Take a speedboat to Coral Island (Koh Larn). Enjoy crystal-clear waters, snorkeling, and parasailing. Return in the afternoon for a relaxing Thai massage and a sunset dinner by the sea."},{"day":5,"title":"Departure","description":"After breakfast, enjoy some leisure time for souvenir shopping before your private transfer to Bangkok airport for your onward flight."}]'::jsonb,
  '["Chao Phraya River Cruise","Grand Palace & Wat Arun","Coral Island water sports","Sanctuary of Truth","Shopping in Bangkok"]'::jsonb,
  '["4 nights hotel accommodation","Daily breakfast","All private transfers","Sightseeing entrance fees","English speaking local guide"]'::jsonb,
  '["International airfare","Visa fees","Lunch and dinner","Personal shopping","Tips"]'::jsonb,
  '["Pack modest attire for temple visits (shoulders and knees covered)","Book water sports via authorized operators only"]'::jsonb,
  '["Bangkok","Pattaya"]'::jsonb,
  4.5, 850,
  'Bangkok & Pattaya Tour | 360 Travellers',
  'Book your Bangkok & Pattaya getaway from ₹28,500. City life, culture & beaches.',
  '["bangkok tour","pattaya package","thailand travel","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'bangkok-pattaya-classic-escape-5d');

-- ── 2. Phuket & Krabi ────────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Phuket & Krabi Tropical Bliss',
  'phuket-krabi-tropical-bliss-6d',
  'Experience the ultimate Andaman coastal journey with stunning limestone cliffs, emerald lagoons, and the vibrant beach culture of Phuket.',
  'international', 'Thailand', 'thailand',
  35000, 42000, '5 Nights / 6 Days', 5, 6,
  'Phuket, Krabi', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Phuket","description":"Arrive in Phuket and transfer to your beachfront resort. Spend the rest of the day unwinding on Patong Beach or exploring the vibrant local nightlife along Bangla Road."},{"day":2,"title":"Phi Phi Islands Excursion","description":"Embark on a full-day speedboat tour to the Phi Phi Islands. Visit Maya Bay, Viking Cave, and enjoy snorkeling in the vibrant turquoise waters. Return to the hotel by evening."},{"day":3,"title":"Transfer to Krabi","description":"Travel by land to Krabi. On the way, stop at the scenic viewpoints. Check into your hotel in Ao Nang and enjoy a peaceful evening watching the sunset over the iconic limestone karst formations."},{"day":4,"title":"Four Island Tour","description":"Hop on a traditional long-tail boat to visit Koh Poda, Chicken Island, Koh Tub, and Koh Mor. Spend the day swimming, sunbathing, and enjoying a picnic lunch on the white sandy beaches."},{"day":5,"title":"Krabi Relaxation","description":"Spend a leisurely day. Optionally, visit the Emerald Pool and Hot Springs, or take a kayaking trip through the mangrove forests. Enjoy a final beachside farewell dinner."},{"day":6,"title":"Departure","description":"After a hearty breakfast, transfer to Krabi International Airport for your flight home, concluding your tropical escape."}]'::jsonb,
  '["Phi Phi Islands speedboat tour","Maya Bay visit","Krabi Four Island hopping","Limestone cliff scenery","Emerald Pool tour"]'::jsonb,
  '["5 nights accommodation","Daily breakfast","All ground transfers","Speedboat & long-tail boat tours","Local guide services"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses","Travel insurance"]'::jsonb,
  '["High-SPF sunscreen is essential","Check tide timings for island hopping","Respect marine conservation rules"]'::jsonb,
  '["Phuket","Krabi"]'::jsonb,
  4.8, 620,
  'Phuket & Krabi Beach Tour | 360 Travellers',
  'Experience island life in Phuket and Krabi. Book now with 360 Travellers.',
  '["phuket tour","krabi package","thailand beaches","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'phuket-krabi-tropical-bliss-6d');

-- ── 3. Chiang Mai & Chiang Rai ───────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Cultural Northern Thailand',
  'cultural-northern-thailand-7d',
  'Discover the spiritual and cultural heart of Thailand. Visit ancient temples, meet majestic elephants, and explore the serene mountains of the north.',
  'international', 'Thailand', 'thailand',
  32000, 40000, '6 Nights / 7 Days', 6, 7,
  'Chiang Mai, Chiang Rai', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Chiang Mai","description":"Arrive at Chiang Mai International Airport. Transfer to your hotel. In the evening, visit the famous Chiang Mai Night Bazaar for local handicrafts and delicious northern street food."},{"day":2,"title":"Temple & Culture Day","description":"Visit the iconic Wat Phra That Doi Suthep, located on a mountain with a panoramic view of the city. Spend the afternoon exploring the Old City and its historic temple ruins."},{"day":3,"title":"Elephant Sanctuary","description":"Spend a full day at an ethical elephant sanctuary. Learn about elephant conservation, feed, walk, and bathe them in a natural, non-riding environment."},{"day":4,"title":"Journey to Chiang Rai","description":"Drive north through scenic mountain passes to Chiang Rai. Visit the unique Karen Long Neck village to learn about their culture. Overnight in Chiang Rai."},{"day":5,"title":"The White Temple","description":"Visit the breathtaking Wat Rong Khun (White Temple) and the Blue Temple. These modern architectural marvels are a must-see in the north."},{"day":6,"title":"Golden Triangle","description":"Travel to the Golden Triangle where the borders of Thailand, Laos, and Myanmar meet. Take a river boat tour and visit a local opium museum."},{"day":7,"title":"Departure","description":"Enjoy breakfast at your hotel before your transfer to Chiang Rai airport for your return journey."}]'::jsonb,
  '["Doi Suthep Temple","Ethical Elephant Sanctuary","White & Blue Temples","Golden Triangle boat tour","Karen Long Neck Village"]'::jsonb,
  '["6 nights boutique hotel stay","Daily breakfast","All private sightseeing transfers","Sanctuary entrance fees","Knowledgeable local guide"]'::jsonb,
  '["Flights","Visa","Lunch and dinner","Tips","Travel insurance"]'::jsonb,
  '["Temperatures can be cooler in the mountains; pack a light jacket","Respect temple silence rules"]'::jsonb,
  '["Chiang Mai","Chiang Rai"]'::jsonb,
  4.7, 450,
  'Northern Thailand Culture Tour | 360 Travellers',
  'Explore the cultural heart of Thailand. Book your trip with 360 Travellers.',
  '["chiang mai tour","chiang rai package","thailand culture","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'cultural-northern-thailand-7d');

-- ── 4. Complete Thailand ──────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'The Complete Thailand Experience',
  'complete-thailand-experience-10d',
  'An immersive 10-day journey covering the bustling capital, the serene cultural north, and the breathtaking southern beaches.',
  'international', 'Thailand', 'thailand',
  65000, 80000, '9 Nights / 10 Days', 9, 10,
  'Bangkok, Chiang Mai, Phuket', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Bangkok Arrival","description":"Arrive in Bangkok. Relax after your flight and enjoy an evening stroll in the vibrant city center."},{"day":2,"title":"Bangkok City Wonders","description":"Visit the Grand Palace and explore the bustling Chinatown district and local markets."},{"day":3,"title":"Flight to Chiang Mai","description":"Fly to Chiang Mai. Check into your hotel and enjoy a traditional Khantoke dinner with cultural performances."},{"day":4,"title":"Northern Exploration","description":"Visit Doi Suthep and an elephant sanctuary to experience the best of northern Thai nature."},{"day":5,"title":"Flight to Phuket","description":"Fly to Phuket. Enjoy an evening at leisure at Patong or Karon Beach."},{"day":6,"title":"Phi Phi Adventure","description":"A full-day speedboat tour of the Phi Phi Islands, including snorkeling and beach time."},{"day":7,"title":"Island Relaxation","description":"Day at leisure. Enjoy a spa session or explore the historic Phuket Old Town with its Sino-Portuguese architecture."},{"day":8,"title":"Water Activities","description":"Optional scuba diving or a day trip to the Similan Islands for pristine white sand."},{"day":9,"title":"Return to Bangkok","description":"Fly back to Bangkok for some final shopping at the weekend markets or luxury malls."},{"day":10,"title":"Departure","description":"Final breakfast before your transfer to the airport for your flight home."}]'::jsonb,
  '["Comprehensive Thailand coverage","Grand Palace","Ethical elephant interaction","Phi Phi island hopping","Sino-Portuguese architecture"]'::jsonb,
  '["9 nights accommodation","Daily breakfast","Internal domestic flights","All transfers","Guided tours"]'::jsonb,
  '["International flights","Visa fees","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Book internal flights well in advance","Pack a variety of clothes for city, mountains, and beach"]'::jsonb,
  '["Bangkok","Chiang Mai","Phuket"]'::jsonb,
  4.9, 1200,
  'Complete Thailand Tour | 360 Travellers',
  'From city to beach, cover all of Thailand. Book with 360 Travellers.',
  '["thailand tour package","complete thailand","thailand vacation","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'complete-thailand-experience-10d');

-- ── 5. Koh Samui Island Adventure ────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Samui Island Adventure',
  'samui-island-adventure-7d',
  'Escape to the Gulf of Thailand for luxury resorts, pristine beaches, and vibrant island-hopping adventures.',
  'international', 'Thailand', 'thailand',
  42000, 52000, '6 Nights / 7 Days', 6, 7,
  'Koh Samui, Koh Phangan', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Koh Samui","description":"Arrive at Samui International Airport. Relax at your luxury beachfront resort and enjoy the sunset over the Gulf of Thailand."},{"day":2,"title":"Ang Thong Marine Park","description":"Full-day boat tour to Ang Thong National Marine Park. Explore hidden lagoons, go kayaking, and hike to viewpoints for spectacular island vistas."},{"day":3,"title":"Koh Phangan Day Trip","description":"Take a ferry to Koh Phangan. Visit local beaches, enjoy the jungle atmosphere, and return in the evening."},{"day":4,"title":"Samui Leisure","description":"A day of pampering. Enjoy a world-class Thai spa treatment, followed by a visit to the Fisherman Village for shopping and dinner."},{"day":5,"title":"Island Highlights","description":"Visit the iconic Big Buddha Temple and Wat Plai Laem. Spend the afternoon swimming at Chaweng Beach."},{"day":6,"title":"Water Activities","description":"Choose between snorkeling, diving, or a private sailing trip to enjoy the clear blue waters of the Gulf."},{"day":7,"title":"Departure","description":"After a final beach breakfast, transfer to Samui airport for your return flight."}]'::jsonb,
  '["Ang Thong Marine Park kayak","Big Buddha temple visit","Fisherman Village dinner","Koh Phangan day trip","Luxury beach resort"]'::jsonb,
  '["6 nights luxury resort stay","Daily breakfast","All ferry and local transfers","Marine park boat tours","Itinerary support"]'::jsonb,
  '["Flights","Visa","Lunch and dinner","Personal shopping"]'::jsonb,
  '["Check ferry schedules for seasonal changes","Carry comfortable swimwear and a dry bag for boat trips"]'::jsonb,
  '["Koh Samui","Koh Phangan"]'::jsonb,
  4.6, 540,
  'Koh Samui Island Tour | 360 Travellers',
  'Luxury island hopping in Koh Samui. Book with 360 Travellers.',
  '["koh samui tour","thailand island hopping","samui package","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'samui-island-adventure-7d');
