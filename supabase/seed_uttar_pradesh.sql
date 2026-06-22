-- ============================================================
-- 360 Travellers — Uttar Pradesh packages seed (8 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- ── 1. Spiritual Varanasi & Sarnath ─────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Spiritual Varanasi & Sarnath',
  'spiritual-varanasi-sarnath-3d',
  'An immersive journey into one of the oldest living cities on earth, focusing on the holy Ganges and the Buddhist heritage of Sarnath.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  9500, 12000, '2 Nights / 3 Days', 2, 3,
  'Varanasi, Sarnath', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Ganga Aarti","description":"Arrive in Varanasi and transfer to your hotel near the historic ghats. In the evening, witness the divine Ganga Aarti ceremony, an unforgettable experience of light and sound. The chanting and lamps reflecting on the holy river create a spiritually charged atmosphere. Enjoy a traditional dinner in a restaurant overlooking the river to end your first day."},{"day":2,"title":"Ghats & Sarnath Exploration","description":"Wake up before dawn for a peaceful boat ride on the Ganges to witness the sunrise and morning rituals. Visit the Kashi Vishwanath Temple, one of the most sacred Shiva temples in the entire country. Spend your afternoon exploring Sarnath, the site where Lord Buddha gave his first sermon, to experience deep inner peace. Return to Varanasi in the evening to explore the narrow, historic lanes filled with ancient shrines and local artisans."},{"day":3,"title":"Departure","description":"Enjoy a final morning breakfast and take a short walk near the riverbanks to capture the serene morning views. Visit any remaining local sites like the Manikarnika Ghat before preparing for your departure. Our representative will ensure a timely transfer to the airport or railway station for your return journey. Depart with a sense of spiritual fulfillment and gratitude for this sacred experience."}]'::jsonb,
  '["Ganga Aarti","Boat Ride","Kashi Vishwanath","Sarnath"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private transfers","Local sightseeing"]'::jsonb,
  '["Flights/Trains","Lunch and dinner","Guide tips"]'::jsonb,
  '["Dress modestly for temple visits","Keep small change for offerings"]'::jsonb,
  '["Varanasi","Sarnath"]'::jsonb,
  4.7, 450,
  'Varanasi Tour | 360 Travellers',
  'Explore the spiritual heart of India in Varanasi.',
  '["varanasi","uttar pradesh","sarnath","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'spiritual-varanasi-sarnath-3d');

-- ── 2. Agra Heritage Tour ────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Agra Heritage Tour',
  'agra-heritage-tour-2d',
  'A classic historical journey featuring the iconic Taj Mahal and the grandeur of the Agra Fort.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  7500, 9500, '1 Night / 2 Days', 1, 2,
  'Agra', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Taj Mahal","description":"Arrive in Agra and check into your hotel before heading straight to the mesmerizing Taj Mahal. Spend your afternoon admiring the intricate marble craftsmanship and the beautiful symmetry of this world-famous monument. As the sun sets, walk through the Mehtab Bagh gardens across the river for a different, serene perspective of the Taj. Enjoy a traditional Mughal-style dinner at a local restaurant, famous for its rich, spicy curries."},{"day":2,"title":"Agra Fort & Departure","description":"After breakfast, visit the imposing Agra Fort, a massive red sandstone structure that served as the main residence of the Mughal emperors. Explore the beautiful palaces, audience halls, and mosques within the fort walls that tell stories of a golden age. Take some time for local shopping in Agra, known for its marble inlay work and leather goods. Our representative will pick you up for a comfortable transfer back to your departure point."}]'::jsonb,
  '["Taj Mahal","Agra Fort","Mehtab Bagh","Marble shopping"]'::jsonb,
  '["1 night stay","Breakfast","All private transfers","Sightseeing entrance fees"]'::jsonb,
  '["Transport to Agra","Lunch and dinner","Guide fees"]'::jsonb,
  '["Taj Mahal is closed on Fridays","Book entrance tickets in advance"]'::jsonb,
  '["Agra"]'::jsonb,
  4.8, 800,
  'Agra Heritage Tour | 360 Travellers',
  'Witness the timeless beauty of the Taj Mahal.',
  '["agra","taj mahal","mughal history","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'agra-heritage-tour-2d');

-- ── 3. Lucknow Culture & Cuisine ─────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Lucknow Culture & Cuisine',
  'lucknow-culture-cuisine-3d',
  'Experience the refined elegance of Awadhi culture, famous architecture, and legendary street food in Lucknow.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  8500, 10500, '2 Nights / 3 Days', 2, 3,
  'Lucknow', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Chowk Food Walk","description":"Arrive in Lucknow and check into your hotel before heading to the vibrant Chowk area for a food walk. Taste legendary Awadhi dishes like Galouti Kebab, Tunday Kababi, and rich buttery kulchas that define the culinary fame of the city. Immerse yourself in the bustling atmosphere of one of the oldest markets in the city. End your night by enjoying a classic Lucknowi biryani at a renowned local spot."},{"day":2,"title":"Architecture & History","description":"Start your day with a visit to the magnificent Bara Imambara, famous for its grand architecture and the intriguing Bhulbhulaiya maze. Continue to the Chota Imambara and the Rumi Darwaza, iconic structures that showcase the refined style of the Nawabs of Oudh. In the afternoon, take a leisurely stroll through the lush Ambedkar Park to appreciate the modern design and calm space. Spend your final evening shopping for delicate Chikan embroidery clothing, a world-famous craft from Lucknow."},{"day":3,"title":"Departure","description":"Enjoy a final Lucknowi breakfast featuring delicious poori-sabzi and tea before preparing for your departure. Take a short walk through Hazratganj, the heart of modern Lucknow, to see the blend of old-world charm and new development. Our team will ensure a smooth transfer to the airport or railway station for your journey home. Leave with a taste of the famous hospitality and exquisite culinary traditions the city is known for."}]'::jsonb,
  '["Bara Imambara","Chowk Food Walk","Chikan Embroidery","Rumi Darwaza"]'::jsonb,
  '["2 nights accommodation","Breakfast","Private car for sightseeing","Local guide"]'::jsonb,
  '["Air/Rail travel","Lunch and dinner","Shopping expenses"]'::jsonb,
  '["Lucknow is best visited in winter","Try the street food from reputable shops"]'::jsonb,
  '["Lucknow"]'::jsonb,
  4.6, 320,
  'Lucknow Tour | 360 Travellers',
  'Experience the nawabi culture and world-famous food of Lucknow.',
  '["lucknow","nawabi culture","lucknow food","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'lucknow-culture-cuisine-3d');

-- ── 4. Ayodhya Spiritual Journey ─────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Ayodhya Spiritual Journey',
  'ayodhya-spiritual-journey-3d',
  'A peaceful visit to the birthplace of Lord Rama, featuring iconic temples and the serene banks of the Sarayu River.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  11000, 14000, '2 Nights / 3 Days', 2, 3,
  'Ayodhya', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival & Sarayu River","description":"Arrive in Ayodhya and check into your hotel, located near the most significant religious sites. Spend your afternoon at the banks of the Sarayu River, a place of immense historical and spiritual significance. Participate in the evening Aarti at the riverbank, an experience filled with devotion and peaceful atmosphere. Enjoy a simple, traditional vegetarian dinner to start your pilgrimage with local flavors."},{"day":2,"title":"Temple Exploration","description":"Spend your day visiting the Ram Janmabhoomi temple site, a place of deep devotion and significant historical importance for pilgrims. Explore the Hanuman Garhi temple, which is perched on a hill and offers a panoramic view of the surrounding holy city. Visit the Kanak Bhawan, known for its beautiful idols and intricate interior decorations, reflecting the richness of local art. Spend your evening exploring the quiet, temple-filled lanes to soak in the atmosphere of faith."},{"day":3,"title":"Departure","description":"Enjoy a slow breakfast and visit any remaining local shrines before preparing for your departure. Take a quiet walk near the riverbanks once more to reflect on the peaceful energy of the city. Our representative will ensure a timely transfer to the airport or railway station for your return journey. Depart feeling spiritually enriched after your pilgrimage to this ancient, sacred city."}]'::jsonb,
  '["Ram Janmabhoomi","Hanuman Garhi","Sarayu Aarti","Kanak Bhawan"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private local transport","Temple guide"]'::jsonb,
  '["Travel fares","Meals","Personal offerings"]'::jsonb,
  '["Follow local temple protocols","Maintain silence in sacred areas"]'::jsonb,
  '["Ayodhya"]'::jsonb,
  4.7, 500,
  'Ayodhya Pilgrimage | 360 Travellers',
  'Visit the sacred birthplace of Lord Rama in Ayodhya.',
  '["ayodhya","ram mandir","pilgrimage","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'ayodhya-spiritual-journey-3d');

-- ── 5. Prayagraj Sangam Tour ─────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Prayagraj Sangam Tour',
  'prayagraj-sangam-tour-3d',
  'Visit the holy confluence of the three rivers — Ganges, Yamuna, and Saraswati — in the ancient city of Prayagraj.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  9000, 11500, '2 Nights / 3 Days', 2, 3,
  'Prayagraj', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Prayagraj","description":"Arrive in Prayagraj and transfer to your hotel near the riverside to prepare for your sacred experience. Spend your first afternoon walking near the Sangam area to get an idea of the vastness of the river confluence. Enjoy a traditional dinner at a local restaurant, soaking in the unique energy of this historic city. Get ready for an early start tomorrow, when you will visit the most significant site in the entire region."},{"day":2,"title":"The Sangam Experience","description":"Wake up early to take a private boat ride to the Sangam, the sacred meeting point of the Ganges, Yamuna, and the hidden Saraswati rivers. Witness the morning rituals and the spiritual devotion of thousands of pilgrims who visit this site every single day. In the afternoon, visit the historic Allahabad Fort and the Anand Bhavan, the famous former home of the Nehru family. Spend your final evening in the city exploring the local markets and tasting the local sweets that the city is known for."},{"day":3,"title":"Departure","description":"Enjoy a final, quiet breakfast before heading out to visit the Hanuman Mandir, a local site of deep religious significance. Take one last walk along the riverbanks, reflecting on the profound spiritual experience you have had during your visit. Our team will provide a smooth transfer to the airport or train station for your journey home. Depart with a feeling of deep peace and spiritual clarity after your time in this holy city."}]'::jsonb,
  '["Triveni Sangam","Allahabad Fort","Anand Bhavan","Hanuman Mandir"]'::jsonb,
  '["2 nights stay","Daily breakfast","All transfers","Sangam boat ride"]'::jsonb,
  '["Travel fares","Meals","Guide tips"]'::jsonb,
  '["Boat rides are subject to weather","Respect local religious customs"]'::jsonb,
  '["Prayagraj"]'::jsonb,
  4.6, 280,
  'Prayagraj Sangam Tour | 360 Travellers',
  'Experience the holy confluence in Prayagraj.',
  '["prayagraj","sangam","allahabad","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'prayagraj-sangam-tour-3d');

-- ── 6. Mathura & Vrindavan Divine Tour ──────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Mathura & Vrindavan Divine Tour',
  'mathura-vrindavan-divine-tour-3d',
  'A journey into the heart of Lord Krishna childhood, exploring the historic temples and spiritual atmosphere of the Braj region.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  10500, 13000, '2 Nights / 3 Days', 2, 3,
  'Mathura, Vrindavan', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Mathura","description":"Arrive in Mathura, the birthplace of Lord Krishna, and check into your hotel. Spend your afternoon visiting the Krishna Janmabhoomi temple, a site of immense importance and devotion for followers. In the evening, walk along the Yamuna River bank to witness the quiet, spiritual atmosphere and the local evening prayers. Enjoy a dinner of authentic Mathura-style vegetarian food, famous for its richness and traditional use of dairy."},{"day":2,"title":"Vrindavan Temples","description":"Spend your full day in Vrindavan, a town filled with thousands of temples dedicated to the life and pastimes of Lord Krishna. Visit the Banke Bihari Temple, one of the most popular and vibrant shrines, known for its unique rituals and energy. Continue to the Prem Mandir, a massive and beautiful marble temple that is especially stunning when it is lit up at night. Experience the deep devotional songs and kirtans that echo through the narrow streets of this vibrant, holy town."},{"day":3,"title":"Departure","description":"Enjoy a final breakfast with the famous local Mathura Peda and visit any remaining local shrines before your departure. Take a slow walk through the market to see the vibrant local life and pick up some traditional religious crafts as souvenirs. Our representative will ensure a smooth transfer for your return journey home. Leave feeling spiritually refreshed after your journey into the heart of the Braj land."}]'::jsonb,
  '["Krishna Janmabhoomi","Banke Bihari Temple","Prem Mandir","Mathura Peda"]'::jsonb,
  '["2 nights stay","Daily breakfast","Private transfers","Local sightseeing"]'::jsonb,
  '["Travel fares","Meals","Personal expenses"]'::jsonb,
  '["Temples are crowded on weekends","Dress modestly for all shrines"]'::jsonb,
  '["Mathura","Vrindavan"]'::jsonb,
  4.7, 650,
  'Mathura Vrindavan Tour | 360 Travellers',
  'Visit the sacred birthplace of Krishna.',
  '["mathura","vrindavan","krishna","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'mathura-vrindavan-divine-tour-3d');

-- ── 7. Jhansi & Orchha Historic Tour ────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Jhansi & Orchha Historic Tour',
  'jhansi-orchha-historic-tour-4d',
  'Explore the legacy of Rani Laxmibai and the stunning ancient architecture of the medieval city of Orchha.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  13000, 16000, '3 Nights / 4 Days', 3, 4,
  'Jhansi, Orchha', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Jhansi","description":"Arrive in Jhansi and check into your hotel before visiting the iconic Jhansi Fort, famous for the bravery of Rani Laxmibai. Spend your afternoon exploring the fort walls, cannons, and the historical museum that tells the story of the 1857 revolt. In the evening, take a slow walk around the local city center to get a feel for the historic capital of the Bundelkhand region. Enjoy a simple, delicious local dinner at a traditional restaurant."},{"day":2,"title":"Drive to Orchha","description":"Drive to the nearby medieval town of Orchha, a place known for its stunning palaces, temples, and riverside location. Check into your hotel and spend the afternoon visiting the Orchha Fort complex, which includes the Raj Mahal and the Jehangir Mahal. The architecture of these palaces is among the finest examples of Bundela style anywhere in India. Spend your evening by the Betwa River, enjoying the sunset views of the cenotaphs that stand tall against the sky."},{"day":3,"title":"Orchha Temple Exploration","description":"Spend your day visiting the unique Ram Raja Temple, the only place where Lord Rama is worshipped as a king, complete with armed guards. Continue to the Chaturbhuj Temple, a massive and beautiful structure that dominates the skyline of the town. In the afternoon, enjoy a quiet walk in the riverside park, surrounded by nature and the ancient ruins of the once-great city. Spend your final evening in Orchha with a quiet dinner at a restaurant overlooking the river."},{"day":4,"title":"Departure","description":"Wake up to a final peaceful morning in the ancient town before your transfer back to Jhansi for your departure. Take a final stroll to see the cenotaphs in the morning light, perfect for capturing photos of the serene riverbank. Our team will ensure a smooth transfer to the airport or train station for your journey home. Depart with deep memories of the history, architecture, and peace of this fascinating region."}]'::jsonb,
  '["Jhansi Fort","Orchha Palace","Ram Raja Temple","Betwa River"]'::jsonb,
  '["3 nights stay","Daily breakfast","Private transfers","Entrance fees"]'::jsonb,
  '["Travel fares","Meals","Guide fees"]'::jsonb,
  '["Carry water for the fort visits","Hire a guide for historical context"]'::jsonb,
  '["Jhansi","Orchha"]'::jsonb,
  4.5, 210,
  'Jhansi Orchha Tour | 360 Travellers',
  'Discover the history of Jhansi and the beauty of Orchha.',
  '["jhansi","orchha","history","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'jhansi-orchha-historic-tour-4d');

-- ── 8. Complete UP Heritage Tour ─────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Complete UP Heritage Tour',
  'complete-up-heritage-tour-10d',
  'A massive 10-day expedition covering the most significant spiritual and historical landmarks across all of Uttar Pradesh.',
  'domestic', 'Uttar Pradesh', 'uttar-pradesh',
  35000, 45000, '9 Nights / 10 Days', 9, 10,
  'Lucknow, Varanasi, Agra, Ayodhya', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Lucknow","description":"Arrive in Lucknow, the capital city, and settle into your hotel before exploring the historic and refined culture of the region. Spend your first afternoon visiting the Bara Imambara and taking a food walk in the famous Chowk market. Enjoy a traditional dinner of authentic kebabs and biryani, the perfect start to your 10-day tour of Uttar Pradesh. Get ready for a journey that will take you through the heart of India history and spirituality."},{"day":2,"title":"Lucknow to Ayodhya","description":"Drive from Lucknow to Ayodhya, the holy birthplace of Lord Rama, and check into your hotel. Spend your afternoon visiting the significant temple sites and experiencing the peaceful energy of the Sarayu River. In the evening, participate in the local river Aarti, which is a truly spiritual experience for every visitor. Enjoy a quiet, traditional vegetarian dinner before preparing for a day of deeper exploration tomorrow."},{"day":3,"title":"Ayodhya Exploration","description":"Spend your full day in Ayodhya exploring the Ram Janmabhoomi site, Hanuman Garhi, and the many other historic and sacred temples. Take your time to soak in the atmosphere of faith and devotion that defines this ancient city in every street corner. In the afternoon, visit the local markets to see the unique crafts and mementos that are sold to pilgrims. Spend your final evening in the city with a quiet dinner, reflecting on the peaceful and sacred time you have had."},{"day":4,"title":"Journey to Varanasi","description":"Travel from Ayodhya to the ancient city of Varanasi, one of the oldest and most sacred cities in the world. Check into your hotel and spend your afternoon relaxing or taking a short walk near the riverbanks. In the evening, witness the famous Ganga Aarti ceremony, which is a must-see for anyone visiting this holy city. Enjoy a traditional dinner in a restaurant overlooking the river, taking in the unique energy of the city at night."},{"day":5,"title":"Varanasi Culture","description":"Wake up for a sunrise boat ride on the Ganges to witness the daily life and rituals of the people who live along the river. Visit the Kashi Vishwanath Temple, a site of immense spiritual importance, before exploring the narrow, historic lanes of the old city. In the afternoon, head to Sarnath to see the Buddhist site where Lord Buddha gave his first sermon. Spend your evening exploring the local markets and enjoying the famous street food that defines the city culinary scene."},{"day":6,"title":"Varanasi to Prayagraj","description":"Drive to Prayagraj, the city where the three sacred rivers meet, and check into your hotel before exploring the Sangam area. Visit the historic Allahabad Fort and Anand Bhavan to learn about the modern history and its connection to the struggle for independence. Spend your afternoon walking by the riverbanks, reflecting on the sacred importance of this confluence. Enjoy a delicious dinner at a local restaurant, famous for its hearty and traditional North Indian dishes."},{"day":7,"title":"Prayagraj to Lucknow","description":"Spend your morning visiting the local shrines before beginning your drive back towards the central region of the state. Enjoy a peaceful drive through the countryside, stopping to see the local village life and beautiful landscapes along the way. Arrive in the evening and check into your hotel, ready for a final few days of your UP tour. Spend your last night in this historic city exploring any sights you might have missed on your first day."},{"day":8,"title":"Journey to Agra","description":"Take a train or drive to the city of Agra, home to the iconic Taj Mahal. Check into your hotel and spend your afternoon relaxing or taking a slow walk in the local area. In the evening, visit the Mehtab Bagh gardens for a breathtaking sunset view of the Taj Mahal across the river. Enjoy a delicious dinner at a restaurant, looking forward to your visit to the monument tomorrow."},{"day":9,"title":"Agra History","description":"Spend your full day visiting the Taj Mahal and the massive Agra Fort, the centers of Mughal history and architectural brilliance. Learn the stories behind these world-famous monuments from a local expert who can bring the history to life. In the afternoon, do some shopping for the famous marble inlay work or leather goods made by local artisans. Spend your final night in the city enjoying a high-quality Mughal-style dinner to celebrate your tour."},{"day":10,"title":"Departure","description":"Enjoy a final, quiet breakfast before your transfer to the airport or train station for your departure. Take one last look at the beautiful historic city as you head to your terminal, reflecting on all the incredible experiences across Uttar Pradesh. We hope you leave with a wealth of memories and the intention to return to explore more of this historic and diverse state. Have a safe and pleasant journey home."}]'::jsonb,
  '["Comprehensive UP Tour","Taj Mahal","Varanasi Ghats","Sangam","Lucknow Cuisine"]'::jsonb,
  '["9 nights accommodation","Daily breakfast","All transfers","Guided tours","Entrance fees"]'::jsonb,
  '["Travel fares to UP","Lunch and dinner","Personal expenses"]'::jsonb,
  '["Pack for multiple climates","Book major monuments in advance"]'::jsonb,
  '["Lucknow","Ayodhya","Varanasi","Prayagraj","Agra"]'::jsonb,
  4.8, 1200,
  'Complete UP Tour | 360 Travellers',
  'Cover all major heritage and spiritual sites in Uttar Pradesh.',
  '["uttar pradesh tour","up heritage","india tour","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'complete-up-heritage-tour-10d');
