-- ============================================================
-- 360 Travellers — Gujarat packages seed (9 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

-- ── 1. Kutch Rann Utsav ──────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Rann of Kutch Desert Experience – White Sands',
  'rann-of-kutch-desert-experience-3n-4d',
  'Witness the surreal beauty of the White Desert under the moonlight. Explore the unique culture, handicrafts, and vibrant textiles of the Kutch region. From the salt flats to the local village life, this is Gujarat at its most ethereal.',
  'domestic', 'Gujarat', 'gujarat',
  18500, 23500, '3 Nights / 4 Days', 3, 4,
  'Bhuj, Dhordo, Rann of Kutch', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Bhuj","description":"Arrive at Bhuj airport and transfer to your resort. Spend the afternoon visiting Aina Mahal and Prag Mahal, marveling at the unique blend of European and local architecture. In the evening, walk through the vibrant local bazaars to shop for Rogan art and Kutchi embroidery. Enjoy a traditional dinner at the hotel before resting for the desert adventure ahead."},{"day":2,"title":"The White Desert","description":"After breakfast, drive to Dhordo to experience the Rann Utsav. Walk across the endless expanse of the White Rann, where the salt flats meet the horizon. Spend the afternoon visiting local craft villages like Hodka, meeting artisans and seeing their work firsthand. In the evening, witness a mesmerizing sunset over the salt desert, followed by a cultural performance and dinner under the stars at the tent city."},{"day":3,"title":"Kutch Culture & Heritage","description":"Visit the Kala Dungar, the highest point in Kutch, for a panoramic view of the vast desert landscape. Explore the nearby villages to understand the intricate traditions of the Rabari and Mutwa communities. Afternoon is at leisure to enjoy the resort amenities or interact with local folk artists. In the evening, enjoy a final bonfire dinner, reflecting on the unique landscape of the Great Rann."},{"day":4,"title":"Departure","description":"After a peaceful morning breakfast, depart for Bhuj. If time permits, visit the Swaminarayan Temple, known for its intricate wood carvings. Our representative will transfer you to the Bhuj airport or railway station for your return journey, carrying memories of the salt desert."}]'::jsonb,
  '["White Rann sunset","Kutchi handicrafts","Kala Dungar viewpoint","Traditional folk dance","Stay in luxury tents","Artisan village tours"]'::jsonb,
  '["3 nights in desert resort/tent","Daily breakfast and dinner","Private AC cab for transfers","Local guide for sightseeing","All entry fees for listed sites","Airport/station pickup and drop","Mineral water throughout","All applicable taxes","24/7 dedicated support","Itinerary assistance"]'::jsonb,
  '["Flights or train tickets","Lunch during travel","Camera fees at monuments","Tips and gratuities","Personal shopping","Travel insurance"]'::jsonb,
  '["Best time: November to February","Carry sunglasses and a hat for the salt flats","Respect local village customs","Keep warm clothing for chilly desert nights"]'::jsonb,
  '["Bhuj","Dhordo","Kutch"]'::jsonb,
  4.7, 420,
  'Rann of Kutch Tour 2025 | White Desert Experience',
  'Book Kutch Rann Utsav tour from ₹18,500. White desert, local crafts & culture. Experience Gujarat with 360 Travellers.',
  '["rann of kutch tour","rann utsav package","gujarat tourism","white desert india","kutch heritage tour","bhuj sightseeing","gujarat holiday","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'rann-of-kutch-desert-experience-3n-4d');

-- ── 2. Dwarka & Somnath ──────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Divine Gujarat Pilgrimage – Dwarka & Somnath',
  'divine-gujarat-pilgrimage-4n-5d',
  'Seek blessings in the holy land of Lord Krishna and the sacred shores of the first Jyotirlinga. This tour takes you through the spiritual heart of Gujarat, blending faith with architectural marvels. Experience peace on the coastal shores where religion meets the ocean.',
  'domestic', 'Gujarat', 'gujarat',
  21000, 27000, '4 Nights / 5 Days', 4, 5,
  'Dwarka, Somnath, Porbandar', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Dwarka","description":"Arrive at Jamnagar or Rajkot and transfer to the holy city of Dwarka. Spend the afternoon visiting the Dwarkadhish Temple, a stunning structure dedicated to Lord Krishna. Explore the temple complex and attend the evening Aarti, an experience that fills the heart with peace. Stay in a comfortable hotel near the temple and enjoy a traditional Gujarati dinner."},{"day":2,"title":"Dwarka Spiritual Tour","description":"Start your day with a morning visit to the Beyt Dwarka, an island accessible by ferry, believed to be the original residence of Lord Krishna. Return and visit the Nageshwar Jyotirlinga, one of the 12 sacred Shiva shrines. Spend the late afternoon at the Gomti Ghat, watching the waves wash the steps of the ancient city. The evening is free to stroll the markets, known for religious artifacts and souvenirs."},{"day":3,"title":"Dwarka to Somnath","description":"Drive to Somnath, passing through Porbandar, the birthplace of Mahatma Gandhi. Visit the Kirti Mandir, the ancestral house of the Mahatma, and the Sudama Temple. Continue your journey to Somnath, a town that resonates with the sound of the ocean and prayers. Upon arrival, check into your hotel and prepare for the evening light and sound show at the Somnath temple complex."},{"day":4,"title":"Somnath Temple Blessings","description":"Wake up to the sound of the ocean and head to the Somnath Temple, the first among the twelve Jyotirlingas of Shiva. Explore the temple architecture, which stands as a symbol of resilience. In the afternoon, visit the Bhalka Tirth, where it is believed Lord Krishna departed from the earth. The evening is spent walking on the Somnath beach, enjoying the sea breeze and the temple illumination."},{"day":5,"title":"Departure","description":"After breakfast, spend your final hours in the peaceful atmosphere of the coastal town. Depending on your travel plans, we will arrange a transfer to the nearest airport or railway station, concluding your spiritual journey through the holy cities of Gujarat."}]'::jsonb,
  '["Dwarkadhish Temple aarti","Nageshwar Jyotirlinga visit","Somnath Temple architecture","Mahatma Gandhi birthplace","Coastal temple views","Spiritual serene experience"]'::jsonb,
  '["4 nights accommodation","Daily breakfast and dinner","Private AC vehicle","Ferry tickets for Beyt Dwarka","All local sightseeing","Airport/station transfers","Dedicated travel manager","Mineral water","All applicable taxes","24/7 support"]'::jsonb,
  '["Flights or train tickets","Lunch","Entry fees to museums","Personal expenses","Tips","Travel insurance"]'::jsonb,
  '["Dress modestly at temples","Book temple darshan in advance if available","Carry comfortable footwear","Respect local religious customs"]'::jsonb,
  '["Dwarka","Porbandar","Somnath"]'::jsonb,
  4.8, 350,
  'Gujarat Pilgrimage Tour 2025 | Dwarka & Somnath',
  'Book Dwarka Somnath tour from ₹21,000. Divine blessings, coastal views & heritage. Spiritual travel with 360 Travellers.',
  '["dwarka somnath tour","gujarat pilgrimage","lord krishna temple","somnath jyotirlinga","gujarat spiritual tour","dwarka sightseeing","india heritage tour","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'divine-gujarat-pilgrimage-4n-5d');

-- ── 3. Gir Wildlife ──────────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Gir National Park Wildlife Safari',
  'gir-national-park-wildlife-safari-2n-3d',
  'Get up close with the majestic Asiatic Lion in its only natural home in the world. Experience the thrill of a jungle safari and connect with nature in the lush forests of Gir. Perfect for wildlife enthusiasts and nature lovers.',
  'domestic', 'Gujarat', 'gujarat',
  14500, 19000, '2 Nights / 3 Days', 2, 3,
  'Gir National Park', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Gir","description":"Arrive at Rajkot or Diu and drive to Gir National Park. Check into your jungle resort surrounded by lush greenery. The afternoon is free to relax and enjoy the forest environment. In the evening, join a local naturalist for a forest orientation and learn about the unique biodiversity of the region before a quiet dinner under the stars."},{"day":2,"title":"Lion Safari Adventure","description":"Wake up early for the morning jungle safari in an open jeep. This is your chance to spot the Asiatic Lion, along with leopards, deer, and hundreds of bird species. Return for lunch and a siesta. In the afternoon, visit the Devalia Safari Park, a fenced area that offers guaranteed sightings of lions in a natural setting. The evening is spent around a bonfire, sharing stories of wildlife encounters."},{"day":3,"title":"Departure","description":"Enjoy a final nature walk or bird watching session before breakfast. Check out and head toward your departure point, whether it is the beach town of Diu or the city of Rajkot. We ensure a comfortable transfer, leaving you with memories of the king of the jungle."}]'::jsonb,
  '["Asiatic Lion safari","Devalia Safari Park","Naturalist forest tour","Nature trail walk","Stay in luxury jungle resort","Bird watching sessions"]'::jsonb,
  '["2 nights luxury resort stay","All meals included","Open jeep safari tickets","Forest guide and naturalist","Airport/station transfers","Local transport","All taxes","24/7 assistance","Mineral water","Safety gear"]'::jsonb,
  '["Flights","Camera fees for safari","Personal shopping","Tips","Additional safaris","Travel insurance"]'::jsonb,
  '["Book safaris 90 days in advance","Wear earth-toned clothing","Maintain silence during safari","Follow naturalist instructions"]'::jsonb,
  '["Gir"]'::jsonb,
  4.9, 510,
  'Gir Lion Safari Tour 2025 | Wildlife Escape',
  'Explore Gir National Park from ₹14,500. Asiatic lion safari, nature trails & luxury stay. Book with 360 Travellers.',
  '["gir national park","asiatic lion safari","wildlife tour gujarat","gir safari package","gujarat nature tour","wildlife holidays india","gir forest trip","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'gir-national-park-wildlife-safari-2n-3d');

-- ── 4. Statue of Unity ───────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Statue of Unity & Heritage Discovery',
  'statue-of-unity-heritage-discovery-2n-3d',
  'Visit the world tallest statue and experience the pride of modern India. This trip combines the architectural wonder of the Statue of Unity with the serene beauty of the Narmada river and nearby heritage sites.',
  'domestic', 'Gujarat', 'gujarat',
  12000, 15500, '2 Nights / 3 Days', 2, 3,
  'Kevadia, Statue of Unity', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival at Kevadia","description":"Arrive at Vadodara and transfer to Kevadia. Check into a resort near the Statue of Unity. Spend the afternoon at the Valley of Flowers and the Cactus Garden, marveling at the vast botanical collection. In the evening, witness the breathtaking laser light and sound show at the base of the statue, a world-class spectacle."},{"day":2,"title":"Statue of Unity Visit","description":"Start your day with a visit to the observation deck of the Statue of Unity, offering a stunning view of the Sardar Sarovar Dam and the surrounding hills. Afterward, visit the Jungle Safari park, which houses diverse wildlife from around the globe. Spend the late afternoon enjoying a serene boat ride on the Narmada River. Evening is free to explore the local artisan village within the complex."},{"day":3,"title":"Departure","description":"After breakfast, visit the Sardar Sarovar Dam viewpoint for one last look at the engineering marvel. Check out and begin your drive back to Vadodara. Our driver will transfer you to the airport or railway station, concluding your visit to the pride of modern India."}]'::jsonb,
  '["Observation deck visit","Laser light & sound show","Valley of Flowers","Jungle Safari park","Narmada river boating","Sardar Sarovar Dam view"]'::jsonb,
  '["2 nights resort stay","Breakfast and dinner","Private AC cab","Statue of Unity entry tickets","Safari park tickets","Guide for sightseeing","Airport/station transfers","Mineral water","All taxes","Travel support"]'::jsonb,
  '["Flights","Lunch","Personal expenses","Tips","Camera charges","Travel insurance"]'::jsonb,
  '["Book tickets online in advance","Wear comfortable walking shoes","Follow all site safety guidelines","Respect restricted zones"]'::jsonb,
  '["Kevadia"]'::jsonb,
  4.8, 680,
  'Statue of Unity Tour 2025 | Pride of India',
  'Book Statue of Unity tour from ₹12,000. Observation deck, safari & laser show. Perfect family trip with 360 Travellers.',
  '["statue of unity tour","kevadia trip","sardar sarovar dam","gujarat tour package","statue of unity tickets","modern india tour","family getaway gujarat","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'statue-of-unity-heritage-discovery-2n-3d');

-- ── 5. Ahmedabad ─────────────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Ahmedabad Heritage & Food Walk',
  'ahmedabad-heritage-food-walk-2n-3d',
  'Experience the old-world charm of India first UNESCO World Heritage City. Dive into the vibrant culture, intricate havelis, and the world-famous street food of Ahmedabad. This is a city that breathes history and flavor.',
  'domestic', 'Gujarat', 'gujarat',
  9500, 12500, '2 Nights / 3 Days', 2, 3,
  'Ahmedabad', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Ahmedabad","description":"Arrive in Ahmedabad and check into a boutique heritage hotel. Spend the afternoon visiting the Sabarmati Ashram, the peaceful home of Mahatma Gandhi. In the evening, walk through the Law Garden night market, famous for its colorful handicrafts and traditional attire. End the day with a dinner featuring authentic Gujarati thali at a renowned local restaurant."},{"day":2,"title":"Heritage & Food Walk","description":"Start your day with a guided heritage walk through the walled city, exploring the unique pols (traditional housing clusters) and beautiful havelis. Visit the Jama Masjid and Sidi Saiyyed Mosque with its iconic stone lattice work. In the evening, embark on a curated food walk through Manek Chowk, tasting everything from pav bhaji to chocolate sandwiches in the middle of a jewelry market."},{"day":3,"title":"Departure","description":"After breakfast, visit the Adalaj Stepwell, an architectural masterpiece of the 15th century. Spend your final hours browsing for local textiles before your transfer to the airport or railway station for your onward journey."}]'::jsonb,
  '["Heritage walk in Walled City","Sabarmati Ashram visit","Manek Chowk street food","Adalaj Stepwell","Local handicraft shopping","Authentic Gujarati Thali"]'::jsonb,
  '["2 nights accommodation","Daily breakfast","Private taxi","Heritage walk guide","Street food tour","Airport transfers","24/7 travel support","Mineral water","All taxes","Itinerary planning"]'::jsonb,
  '["Flights","Lunch and dinner","Entry fees","Personal expenses","Tips","Travel insurance"]'::jsonb,
  '["Be adventurous with street food","Wear light cotton clothing","Carry a water bottle","Respect local customs in old city areas"]'::jsonb,
  '["Ahmedabad"]'::jsonb,
  4.7, 400,
  'Ahmedabad Heritage Tour 2025 | Culture & Food',
  'Ahmedabad heritage & food tour from ₹9,500. UNESCO city, havelis & street food. Book with 360 Travellers.',
  '["ahmedabad heritage walk","ahmedabad food tour","unesco world heritage city","gujarat culture tour","sabarmati ashram","ahmedabad tourism","weekend in ahmedabad","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'ahmedabad-heritage-food-walk-2n-3d');

-- ── 6. Diu Beach Escape ──────────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Diu Coastal Beach Escape',
  'diu-coastal-beach-escape-3n-4d',
  'Relax on the pristine beaches of Diu, where Portuguese history meets the serene blue waters of the Arabian Sea. This island getaway is perfect for those seeking sun, sand, and a touch of colonial heritage.',
  'domestic', 'Gujarat', 'gujarat',
  13500, 17500, '3 Nights / 4 Days', 3, 4,
  'Diu', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Diu","description":"Arrive in Diu and check into your beach-facing resort. Spend the afternoon relaxing at Nagoa Beach, one of the most popular and clean beaches on the island. Enjoy the cool breeze and the sound of the ocean before a seafood-rich dinner at a beachfront shack. The island atmosphere is calm and immediately puts you at ease."},{"day":2,"title":"History & Beaches","description":"Explore the Diu Fort, a massive colonial structure with panoramic views of the sea. Visit the St. Paul Church, famous for its baroque architecture. Spend the afternoon at Ghoghla Beach, which is ideal for water sports like parasailing and jet skiing. In the evening, enjoy a sunset stroll along the coast, watching the sky change colors over the Arabian Sea."},{"day":3,"title":"Island Exploration","description":"Visit the Naida Caves, a series of rock formations that are great for photography. Spend the day at Jalandhar Beach, which offers a more private and quiet environment. You might also choose to explore the local markets for Portuguese-influenced handicrafts. Enjoy a farewell dinner at a colonial-style villa restaurant, reflecting on your peaceful island getaway."},{"day":4,"title":"Departure","description":"Enjoy a final beach breakfast before your transfer. Depending on your schedule, we will arrange a transfer to the airport or bus stand. Depart with the relaxed spirit of an island vacation."}]'::jsonb,
  '["Nagoa Beach relaxation","Diu Fort history","Naida Caves photography","Water sports at Ghoghla Beach","Colonial architecture","Seafood dinner experience"]'::jsonb,
  '["3 nights beach resort","Daily breakfast and dinner","Local transportation","Airport transfers","All listed sightseeing","Mineral water","All taxes","24/7 travel support","Itinerary planning","Beach activity assistance"]'::jsonb,
  '["Flights","Lunch","Water sports fees","Personal expenses","Tips","Travel insurance"]'::jsonb,
  '["Carry sunscreen and hats","Stay hydrated","Book water sports in advance","Respect local island atmosphere"]'::jsonb,
  '["Diu"]'::jsonb,
  4.7, 290,
  'Diu Beach Tour 2025 | Island Escape',
  'Relax in Diu from ₹13,500. Beautiful beaches, Portuguese heritage & water sports. Book your getaway with 360 Travellers.',
  '["diu tour package","beach vacation india","diu island tourism","coastal gujarat tour","water sports diu","weekend beach getaway","diu sightseeing","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'diu-coastal-beach-escape-3n-4d');

-- ── 7. Saputara Hill Station ─────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Saputara Hill Station Retreat',
  'saputara-hill-station-retreat-2n-3d',
  'Nestled in the lush Dang forest, Saputara is Gujarat only hill station. Enjoy the misty mountains, serene lakes, and tribal culture in this perfect weekend escape from the heat.',
  'domestic', 'Gujarat', 'gujarat',
  10500, 13500, '2 Nights / 3 Days', 2, 3,
  'Saputara', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Saputara","description":"Arrive at Surat or Nashik and drive to Saputara. Check into your mountain-view resort. Spend the afternoon at the Saputara Lake, enjoying a pedal boat ride in the cool waters. In the evening, walk through the Sunset Point area to catch a beautiful view of the hills as the sun sets over the valley."},{"day":2,"title":"Nature & Views","description":"Visit the Governor Hill for a panoramic view of the hill station and the surrounding forest. Explore the Rose Garden and the Step Garden, which are beautifully maintained and perfect for morning walks. In the afternoon, visit the Tribal Museum to understand the lifestyle of the Dangs tribe. The evening is spent relaxing at the resort, enjoying the cool mountain air."},{"day":3,"title":"Departure","description":"After breakfast, enjoy a final walk through the forest trails before your transfer. We arrange your drive back to Surat or Nashik for your return flight or train, concluding your cool mountain getaway."}]'::jsonb,
  '["Saputara Lake boating","Sunset Point views","Tribal Museum visit","Step Garden walk","Cool mountain climate","Forest trail walks"]'::jsonb,
  '["2 nights hill resort","Breakfast and dinner","Private cab for travel","All sightseeing","Airport/station pickup and drop","Mineral water","All taxes","24/7 support","Itinerary assistance","Mountain activity guide"]'::jsonb,
  '["Flights","Lunch","Entry fees","Personal expenses","Tips","Travel insurance"]'::jsonb,
  '["Carry a light jacket","Wear comfortable walking shoes","Respect tribal customs","Book resort in advance"]'::jsonb,
  '["Saputara"]'::jsonb,
  4.6, 210,
  'Saputara Hill Tour 2025 | Cool Mountain Retreat',
  'Cool off in Saputara from ₹10,500. Hill station, lake & forest trails. Book your mountain getaway with 360 Travellers.',
  '["saputara tour package","hill station gujarat","saputara weekend trip","gujarat mountain getaway","nature tourism gujarat","saputara sightseeing","cool weather trips","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'saputara-hill-station-retreat-2n-3d');

-- ── 8. Modhera & Patan Heritage ──────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Modhera Sun Temple & Patan Heritage Tour',
  'modhera-sun-temple-patan-heritage-2d',
  'Step back into the golden age of Gujarat architecture. Visit the world-famous Sun Temple at Modhera and the intricate stepwells of Patan, a testament to ancient Indian engineering and artistic brilliance.',
  'domestic', 'Gujarat', 'gujarat',
  7500, 10000, '1 Night / 2 Days', 1, 2,
  'Modhera, Patan', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Modhera & Patan","description":"Drive from Ahmedabad to Modhera. Explore the Sun Temple, known for its intricate carvings and the stunning stepwell-tank in front. Continue to Patan to visit the Rani Ki Vav, a UNESCO World Heritage site and a breathtaking stepwell that is a masterpiece of subterranean architecture. Check into a hotel in Patan and enjoy a traditional Gujarati dinner."},{"day":2,"title":"Patan & Departure","description":"After breakfast, visit a Patola silk weaving center to see the famous double-ikat weaving process. It is a slow, meticulous art that is unique to this region. Spend your afternoon exploring the local town markets before your transfer back to Ahmedabad for your departure, completing your short heritage immersion."}]'::jsonb,
  '["Modhera Sun Temple","Rani Ki Vav Stepwell","Patola silk weaving demo","Ancient architectural tours","Heritage walk","Traditional Gujarati cuisine"]'::jsonb,
  '["1 night accommodation","Breakfast and dinner","Private AC taxi","Local guide for heritage sites","Airport/station transfers","Mineral water","All taxes","24/7 travel support","Itinerary planning","Entry assistance"]'::jsonb,
  '["Flights","Lunch","Personal expenses","Tips","Camera fees","Travel insurance"]'::jsonb,
  '["Carry a hat and water","Wear comfortable shoes for stepwell stairs","Respect photography restrictions","Book guide in advance"]'::jsonb,
  '["Modhera","Patan"]'::jsonb,
  4.8, 380,
  'Gujarat Heritage Tour 2025 | Modhera & Patan',
  'Explore Modhera Sun Temple & Patan stepwell from ₹7,500. Heritage tour of Gujarat. Book with 360 Travellers.',
  '["modhera sun temple","patan heritage","rani ki vav","gujarat heritage tour","ancient architecture india","patola silk weaving","gujarat day trip","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'modhera-sun-temple-patan-heritage-2d');

-- ── 9. Vadodara & Champaner ──────────────────────────────────────────────────
INSERT INTO packages (
  title, slug, description, category, destination, destination_slug,
  price, original_price, duration, nights, days, location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count, meta_title, meta_description, keywords
)
SELECT
  'Vadodara Palace & Champaner History Tour',
  'vadodara-palace-champaner-heritage-3d',
  'Discover the royal heritage of the Gaekwads in Vadodara and the ancient ruins of the Champaner-Pavagadh Archaeological Park. A perfect mix of regal history and ancient archeology.',
  'domestic', 'Gujarat', 'gujarat',
  11500, 15000, '2 Nights / 3 Days', 2, 3,
  'Vadodara, Champaner', '/images/placeholder.svg', '[]'::jsonb,
  '[{"day":1,"title":"Arrival in Vadodara","description":"Arrive in Vadodara and visit the Laxmi Vilas Palace, a massive residence that is four times the size of Buckingham Palace. Explore the museum housing royal collections. In the evening, take a stroll through the Sayaji Baug gardens, enjoying the peaceful atmosphere of the city. Dinner at a royal heritage restaurant in the city."},{"day":2,"title":"Champaner Archaeology","description":"Drive to the Champaner-Pavagadh Archaeological Park, a UNESCO World Heritage site. Explore the ancient mosques, tombs, and fortifications that span several centuries. In the afternoon, take a cable car ride to the Pavagadh temple located on a hilltop, offering spectacular views of the landscape. Return to Vadodara in the evening for a relaxed dinner."},{"day":3,"title":"Departure","description":"After breakfast, visit the Maharaja Fateh Singh Museum, which hosts a large collection of European and Indian art. Spend the afternoon shopping for local textiles before your transfer to the airport or railway station."}]'::jsonb,
  '["Laxmi Vilas Palace tour","Champaner archaeological ruins","Pavagadh hilltop temple","Cable car ride","Royal heritage museum","UNESCO World Heritage exploration"]'::jsonb,
  '["2 nights accommodation","Daily breakfast","Private AC cab","Local historian guide","Entry fees for major sites","Airport transfers","Mineral water","All taxes","24/7 support","Itinerary planning"]'::jsonb,
  '["Flights","Lunch and dinner","Personal expenses","Tips","Camera fees","Travel insurance"]'::jsonb,
  '["Carry comfortable walking shoes","Stay hydrated","Book cable car in advance","Respect all heritage sites"]'::jsonb,
  '["Vadodara","Champaner"]'::jsonb,
  4.7, 310,
  'Vadodara Heritage Tour 2025 | Palace & Ruins',
  'Vadodara Palace & Champaner tour from ₹11,500. Heritage tour of royal Gujarat. Book with 360 Travellers.',
  '["vadodara palace tour","champaner heritage","laxmi vilas palace","gujarat history tour","pavagadh temple","unesco heritage gujarat","royal gujarat","360 travellers"]'::jsonb
WHERE NOT EXISTS (SELECT 1 FROM packages WHERE slug = 'vadodara-palace-champaner-heritage-3d');
