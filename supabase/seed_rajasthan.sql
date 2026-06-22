-- ============================================================
-- 360 Travellers — Rajasthan packages seed (8 packages)
-- Safe to re-run: skips rows whose slug already exists.
-- Run in: Supabase → SQL Editor → New query → Run
-- ============================================================

INSERT INTO packages (
  title, slug, description, category,
  destination, destination_slug,
  price, original_price, duration, nights, days,
  location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count,
  meta_title, meta_description, keywords
)
SELECT v.title, v.slug, v.description, v.category,
       v.destination, v.destination_slug,
       v.price, v.original_price, v.duration, v.nights, v.days,
       v.location, v.image_url, v.gallery,
       v.itinerary, v.highlights, v.inclusions, v.exclusions, v.know_before, v.route,
       v.rating, v.review_count,
       v.meta_title, v.meta_description, v.keywords
FROM (VALUES

-- ── 1. Classic Rajasthan ─────────────────────────────────────────────────────
(
  'Classic Rajasthan Tour – Jaipur, Jodhpur & Jaisalmer',
  'classic-rajasthan-jaipur-jodhpur-jaisalmer-7d',
  'Immerse yourself in the timeless beauty of the Thar Desert and the grandeur of royal Rajputana architecture. Wander through the pink-hued streets of Jaipur, the blue-washed alleys of Jodhpur, and the golden, shifting dunes of Jaisalmer. This journey promises a perfect blend of history, vibrant local culture, and the magical solitude of the desert under a starlit sky. This is Rajasthan at its most royal.',
  'domestic',
  'Rajasthan', 'rajasthan',
  24999::numeric, 31999::numeric, '6 Nights / 7 Days', 6, 7,
  'Jaipur, Jodhpur, Jaisalmer',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaipur","description":"Arrive at Jaipur International Airport or Railway Station where our representative will welcome you with a traditional tilak ceremony. Transfer to your 3-star heritage hotel and spend the afternoon relaxing after your journey. In the evening, head to the vibrant Chokhi Dhani village resort for an authentic Rajasthani cultural experience. Indulge in a hearty traditional thali featuring dal baati churma while watching folk dancers and puppet shows. Return to the hotel for a peaceful night of rest before the sightseeing begins tomorrow."},
    {"day":2,"title":"Jaipur Royal Heritage","description":"Begin your morning with a guided walk through the pink-hued lanes of the old city before the crowds arrive. By 9 AM, head to the majestic Amber Fort, where your guide will explain the stunning Mughal-Rajput architecture, the intricate mirrored Sheesh Mahal, and the secret passages once used by queens. Post lunch at a rooftop haveli restaurant overlooking the City Palace, visit the Jantar Mantar UNESCO World Heritage Site and admire the Hawa Mahal facade. In the evening, browse the chaotic and colourful Johari Bazaar for bangles, blue pottery, and block-print fabrics. Return to your hotel for dinner and overnight stay."},
    {"day":3,"title":"Jaipur to Jodhpur","description":"After a wholesome breakfast, check out from your hotel and embark on a scenic drive to Jodhpur, the Blue City. The journey takes approximately 6 hours, winding through the arid landscapes of central Rajasthan. Upon arrival, check into your hotel and take some time to freshen up before heading out to the base of the Clock Tower. Explore the Sardar Market, known for its spices, leather goods, and hand-woven textiles. Enjoy a relaxed dinner at a local cafe and soak in the evening atmosphere of this historic city under the shadow of the imposing Mehrangarh Fort."},
    {"day":4,"title":"Jodhpur to Jaisalmer","description":"Wake up to the sight of the sun rising over the blue-painted houses of Jodhpur. Spend your morning at the magnificent Mehrangarh Fort, exploring its intricate palaces, armories, and museums that offer a window into the life of the Rathore dynasty. After a quick visit to the Jaswant Thada, a marble cenotaph dedicated to Maharaja Jaswant Singh II, begin your drive toward Jaisalmer. The 5-hour drive leads you into the heart of the Thar Desert. Reach Jaisalmer by evening, check into your hotel, and enjoy a quiet dinner reflecting on the golden-hued architecture you will explore tomorrow."},
    {"day":5,"title":"Jaisalmer & Desert Dunes","description":"Start your day early to explore the living Jaisalmer Fort, a UNESCO World Heritage site where hundreds of families still reside within the ancient walls. Visit the beautifully carved Patwon Ki Haveli and the intricate Salim Singh Ki Haveli to appreciate the fine stone craft. By late afternoon, we drive to the Sam Sand Dunes, where your camel safari awaits to take you deep into the desert landscape. Enjoy the mesmerizing sunset as the horizon turns a deep crimson and gold, followed by a cultural show with music and dance. Spend the night in a luxurious Swiss tent under a canopy of stars."},
    {"day":6,"title":"Desert Magic & Return","description":"Wake up to the fresh desert breeze and enjoy a hot breakfast at the camp. Take a short morning stroll through the dunes to witness the tranquil desert life before driving back to Jaisalmer city. Spend the afternoon at leisure, perhaps picking up some local handicrafts or visiting the serene Gadsisar Lake to see the evening reflection of the temples. Spend your final night in Jaisalmer enjoying a grand farewell dinner at your hotel, reflecting on the memories made during this week of discovery."},
    {"day":7,"title":"Departure","description":"Enjoy a slow breakfast at your hotel, taking in the golden morning light of the city. Depending on your flight or train schedule, we will arrange a transfer to the Jaisalmer airport or railway station. Bid farewell to the royal land of Rajasthan as you begin your journey home. We ensure a comfortable and timely drop-off, leaving you with memories of colourful bazaars, majestic forts, and the warmth of the Thar desert people."}
  ]'::jsonb,
  to_jsonb(ARRAY['Amber Fort camel ride','Mehrangarh Fort guided tour','Camel safari on Sam Sand Dunes','Overnight desert camp with cultural show','Jaisalmer havelis & bazaar walk','Sunset at Gadsisar Lake']),
  to_jsonb(ARRAY['6 nights accommodation (3-star hotels)','Daily breakfast and dinner','Private AC cab throughout','Professional English-speaking guide','Camel safari in Jaisalmer','Overnight desert camp (deluxe tent)','All sightseeing as per itinerary','Airport/railway pickup and drop','Mineral water during transfers','All taxes and service charges']),
  to_jsonb(ARRAY['Airfare / train tickets','Lunch at restaurants','Entry fees to monuments','Personal expenses and tips','Travel insurance','Anything not mentioned in inclusions']),
  to_jsonb(ARRAY['Best visited October to March','Carry light cotton clothes plus a light jacket for evenings','Keep cash handy — many desert areas have no ATMs','Bargain at local bazaars — it is expected!']),
  to_jsonb(ARRAY['Jaipur','Jodhpur','Jaisalmer']),
  4.8::numeric, 543,
  'Classic Rajasthan Tour 2025 | Jaipur Jodhpur Jaisalmer',
  'Book Classic Rajasthan 6N/7D from ₹24,999. Jaipur forts, Jodhpur blue city & Jaisalmer desert camp. Call 360 Travellers!',
  '["rajasthan tour package","jaipur jodhpur jaisalmer package","rajasthan trip 7 days","desert safari jaisalmer","rajasthan holiday package from delhi","rajasthan travel itinerary","royal rajasthan","360 travellers"]'::jsonb
),

-- ── 2. Honeymoon ─────────────────────────────────────────────────────────────
(
  'Royal Rajasthan Honeymoon – Luxury & Romance',
  'royal-rajasthan-honeymoon-jaipur-udaipur-mount-abu-6d',
  'Celebrate your new beginning in the most romantic landscapes of India. From the majestic palaces of Jaipur to the tranquil, shimmery lakes of Udaipur and the misty hills of Mount Abu, this package is meticulously crafted for love. Experience private candlelit dinners, luxurious heritage stays, and serene boat rides. This is Rajasthan at its most royal and intimate.',
  'domestic',
  'Rajasthan', 'rajasthan',
  48500::numeric, 62000::numeric, '5 Nights / 6 Days', 5, 6,
  'Jaipur, Udaipur, Mount Abu',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaipur","description":"Arrive in Jaipur and check into your luxurious heritage palace hotel. A traditional welcome with marigold garlands awaits you, followed by a rose-petal decoration in your room. Spend the afternoon resting in the plush surroundings or enjoying a couple spa session at the hotel. In the evening, we arrange a private car to take you for a sunset view at Nahargarh Fort, offering a panoramic look at the glowing Pink City. Dinner is served on a rooftop terrace with a view of the illuminated city, accompanied by soft music."},
    {"day":2,"title":"Jaipur Palace Romance","description":"Start your day with a royal breakfast in the courtyard before heading out for a private tour of the City Palace. Your guide will walk you through the private quarters, showing you the fine craftsmanship of the royal family. In the afternoon, visit Hawa Mahal and take a private rickshaw ride through the chaotic, colorful markets of Bapu Bazaar. We conclude the day with an exclusive, candlelit dinner in a private garden setting, surrounded by soft lighting and traditional decor. This is an intimate experience designed to give you privacy and time to cherish each other."},
    {"day":3,"title":"Jaipur to Udaipur","description":"After breakfast, we drive to Udaipur, the Venice of the East. The 7-hour journey offers a look at the changing landscape of Rajasthan, from arid plains to the lush Aravali hills. Upon arrival in Udaipur, check into a lake-view heritage resort that offers stunning vistas of Lake Pichola. Spend the evening walking hand-in-hand along the quiet banks of the lake, listening to the gentle lapping of the water. Dinner is served at a fine-dining restaurant overlooking the water, making for a truly magical start to your time in the City of Lakes."},
    {"day":4,"title":"Udaipur Romantic Boat Ride","description":"The day begins with a visit to the grandeur of the City Palace complex, which overlooks the Pichola lake. Explore the Crystal Gallery and the beautiful courtyards before heading to the serene Saheliyon Ki Bari garden. In the late afternoon, we have reserved a private sunset boat ride on Lake Pichola, where the changing hues of the sky reflect beautifully on the water and the marble palaces. As the sun sets, visit the Jag Mandir Island. Return to your hotel for an evening at leisure or an optional private dinner by the lakeside, enjoying the cool evening breeze."},
    {"day":5,"title":"Udaipur to Mount Abu","description":"Depart for Mount Abu, the only hill station in Rajasthan, located about 3 hours from Udaipur. The road winds up through the hills, providing a refreshing change of scenery. Check into your hotel and enjoy lunch amidst the greenery. In the afternoon, visit the stunning Dilwara Temples, known for their incredible marble carvings. Head to Nakki Lake in the evening for a serene boat ride followed by a walk to Sunset Point, where you can watch the sun disappear behind the misty hills. It is a peaceful, quiet experience perfect for couples wanting a break from the desert heat."},
    {"day":6,"title":"Departure","description":"Enjoy a slow, relaxed breakfast on the balcony overlooking the hills of Mount Abu. Reflect on your romantic journey through the most beautiful corners of Rajasthan before our driver assists with checkout. We will provide a private transfer to the nearest railway station or airport in Udaipur, ensuring your journey home is as seamless as your trip. We hope the memories of the sunsets and palatial stays stay with you forever, serving as a beautiful reminder of your honeymoon."}
  ]'::jsonb,
  to_jsonb(ARRAY['Private boat ride on Lake Pichola','Jaipur Palace candlelit dinner','Mount Abu sunset point walk','Romantic heritage palace stay','Couple photoshoot at City Palace','Hill station serenity in Mount Abu']),
  to_jsonb(ARRAY['5 nights in 4-star heritage hotels','Private SUV for entire trip','Daily breakfast and candlelight dinner','Flowers and cake on arrival','Private sunset boat ride','Local guide for all sightseeing','All airport/station transfers','All applicable taxes','Complimentary couple spa voucher','Dedicated 24/7 travel concierge']),
  to_jsonb(ARRAY['Flights or train tickets','Lunch during travel','Monument entry fees','Laundry and dry cleaning','Personal shopping expenses','Anything not mentioned in inclusions']),
  to_jsonb(ARRAY['Mount Abu can be chilly — pack a light jacket','Book boat rides in advance during peak season','Respect local customs at heritage sites','Confirm dietary preferences for candlelit dinners']),
  to_jsonb(ARRAY['Jaipur','Udaipur','Mount Abu']),
  4.9::numeric, 285,
  'Rajasthan Honeymoon Package 2025 | Luxury Tour',
  'Book luxury Rajasthan honeymoon from ₹48,500. Udaipur lakes, Jaipur palaces & Mount Abu hills. Celebrate love with 360 Travellers.',
  '["rajasthan honeymoon package","romantic rajasthan tour","udaipur honeymoon","jaipur luxury hotels","rajasthan honeymoon itinerary","best honeymoon destinations india","honeymoon in udaipur","luxury travel rajasthan"]'::jsonb
),

-- ── 3. Royal Heritage Grand Tour ─────────────────────────────────────────────
(
  'Royal Heritage Rajasthan Grand Tour – 8 Nights',
  'royal-heritage-rajasthan-grand-circuit-8n-9d',
  'Step back in time with a comprehensive tour dedicated to the princely states of Rajasthan. Stay in converted heritage palaces, explore architectural marvels, and uncover the centuries-old history of four distinct royal cities. This is the ultimate premium experience for heritage enthusiasts who seek comfort, history, and the finest hospitality in the heart of the desert. This is Rajasthan at its most royal.',
  'domestic',
  'Rajasthan', 'rajasthan',
  58000::numeric, 75000::numeric, '8 Nights / 9 Days', 8, 9,
  'Jaipur, Bikaner, Jodhpur, Udaipur',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaipur","description":"Arrive in Jaipur and check into a converted heritage haveli that transports you to a bygone era. Spend the afternoon exploring the royal gardens or relaxing in the beautifully carved courtyard. In the evening, we head to a traditional restaurant to sample the finest Rajasthani cuisine, including authentic gatte ki sabzi and ker sangri. The evening ends with a stroll through the illuminated old city markets, which feel like a living museum of crafts and culture. You will feel the royal touch from the very first moment you set foot in this majestic city."},
    {"day":2,"title":"Jaipur Architectural Marvels","description":"Dedicate your entire day to the architectural grandeur of Jaipur. Start at Amber Fort, riding an elephant or taking a jeep up to the entrance, and marvel at the Sheesh Mahal. Post-lunch, visit the City Palace, home to the current royal family, and explore the museum with its incredible collection of royal costumes and weaponry. In the late afternoon, visit the Jantar Mantar observatory and witness the accuracy of 18th-century astronomy. The day concludes with dinner at a boutique palace hotel, where you can watch a live folk performance under the stars."},
    {"day":3,"title":"Jaipur to Bikaner","description":"Check out and depart for Bikaner, a desert city known for its magnificent forts and temples. The 6-hour drive is an exploration of Rajasthan changing topography. Upon arrival, check into a luxury heritage property. In the evening, visit the world-famous Karni Mata Temple in Deshnok, where thousands of rats are worshipped and cared for, creating a unique experience. Return to the city for a traditional Bikaneri dinner, famous for its spicy snacks and rich sweets, and enjoy the tranquil atmosphere of the hotel courtyard."},
    {"day":4,"title":"Bikaner Forts & Culture","description":"Spend your morning exploring the red-sandstone Junagarh Fort, a fortress that was never conquered and features beautiful mirror work and stone carvings. Visit the National Research Centre on Camel to learn about the desert ship, which is integral to local life. The afternoon is kept free for exploring the narrow, labyrinthine alleys of the old city, where you can find artisans working on delicate camel-hide products. In the evening, visit a local haveli for a heritage tour and enjoy dinner at the hotel, which often hosts private folk music sessions."},
    {"day":5,"title":"Bikaner to Jodhpur","description":"After breakfast, drive to Jodhpur, the Blue City. The 5-hour journey through the Thar Desert provides glimpses of nomadic life and rural beauty. Check into your heritage mansion in Jodhpur, which overlooks the city and the fort. Spend the afternoon wandering the blue-painted streets of the old city, where every corner offers a new photographic opportunity. In the evening, head to the Stepwell Cafe for a unique view of the ancient Toorji Ka Jhalra stepwell, enjoying a coffee while the sun sets behind the fort."},
    {"day":6,"title":"Jodhpur Imperial History","description":"Dedicate the day to the colossal Mehrangarh Fort, one of the largest in India. Your private historian guide will explain the legacy of the Rao Jodha and the battles fought in these courtyards. Visit Jaswant Thada, the white marble cenotaph that is a vision of serenity against the backdrop of the fort. Spend the afternoon at Umaid Bhawan Palace, a stunning blend of Eastern and Western architecture, and visit the vintage car museum. In the evening, enjoy a private heritage dinner on a rooftop terrace with an unparalleled view of the fort walls illuminated against the night sky."},
    {"day":7,"title":"Jodhpur to Udaipur","description":"Drive to Udaipur, with a significant stop at the Ranakpur Jain Temple. This temple is world-renowned for its 1,444 uniquely carved pillars and intricate marble work. The drive takes you through the verdant Aravali mountains, a striking contrast to the desert we left behind. Arrive in Udaipur by late afternoon and check into a lakeside heritage hotel. Take a slow walk along the Ghats, watching the lamps being lit by the water side, and enjoy a quiet, romantic dinner overlooking the dark, still waters of Lake Pichola."},
    {"day":8,"title":"Udaipur City of Lakes","description":"Explore the City Palace, the largest palace complex in Rajasthan, offering panoramic views of the city. Visit the Jagdish Temple, an Indo-Aryan masterpiece, and then explore the Saheliyon Ki Bari, the Garden of the Maidens. In the afternoon, enjoy a boat ride on Lake Pichola, visiting the Jag Mandir island. For your final evening, we have arranged a special heritage dinner at a lakeside venue, featuring classical Rajasthani music. The experience is designed to be the grand finale of your royal circuit, highlighting the culture, hospitality, and luxury of Udaipur."},
    {"day":9,"title":"Departure","description":"Enjoy a leisurely breakfast overlooking the lake, soaking in the peace before your departure. Our representative will assist with your checkout and arrange a private transfer to the Udaipur airport or railway station. As you drive to the airport, reflect on the last nine days of opulence, royal history, and warm hospitality that have defined your Rajasthan heritage circuit. We hope you return home with stories of forts, palaces, and the majestic spirit of the Rajputs."}
  ]'::jsonb,
  to_jsonb(ARRAY['Stay in boutique heritage havelis','Bikaner Junagarh Fort guided tour','Mehrangarh Fort private history tour','Udaipur City Palace exploration','Traditional Rajasthani folk music show','Authentic royal cuisine dinner experiences']),
  to_jsonb(ARRAY['8 nights in 4-star/5-star heritage hotels','Daily buffet breakfast and dinner','Luxury Innova/XUV for all transfers','Professional historian guide for all tours','All sightseeing tickets (VIP access)','Traditional Rajasthani cultural show','Airport/station transfers','24/7 dedicated support','Mineral water throughout','All applicable taxes']),
  to_jsonb(ARRAY['Flights or train tickets','Lunch at local restaurants','Personal shopping expenses','Tips and gratuities','Camera entry fees at monuments','Travel insurance']),
  to_jsonb(ARRAY['Dress modestly at all temple complexes','Confirm if your heritage hotel has an elevator','Carry comfortable walking shoes for forts','Stay hydrated during desert transfers']),
  to_jsonb(ARRAY['Jaipur','Bikaner','Jodhpur','Udaipur']),
  4.8::numeric, 192,
  'Royal Heritage Rajasthan Tour 2025 | Heritage Hotels',
  'Explore royal Rajasthan in 9 days. Heritage hotels, Jaipur, Bikaner, Jodhpur & Udaipur. Premium tour from ₹58,000. Book now!',
  '["rajasthan heritage hotel stay","luxury rajasthan tour","rajasthan grand circuit","royal rajasthan itinerary","jaipur bikaner jodhpur udaipur","heritage tour india","rajasthan premium package","best rajasthan trip"]'::jsonb
),

-- ── 4. Desert Safari ─────────────────────────────────────────────────────────
(
  'Jaisalmer Desert Safari Escape – 3 Nights',
  'jaisalmer-desert-safari-adventure-3n-4d',
  'Escape the mundane and lose yourself in the endless, shimmering expanse of the Thar Desert. Spend your days exploring the living Jaisalmer Fort and your nights under a brilliant blanket of stars at a luxury camp. This short, high-energy trip offers pure adrenaline and deep cultural immersion for the modern traveller. This is Rajasthan at its most raw and beautiful.',
  'domestic',
  'Rajasthan', 'rajasthan',
  12500::numeric, 16000::numeric, '3 Nights / 4 Days', 3, 4,
  'Jaisalmer, Sam Sand Dunes',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaisalmer","description":"Arrive in the Golden City of Jaisalmer, where your driver will meet you for a transfer to your boutique hotel. Spend the afternoon wandering through the vibrant local markets, picking up handmade leather journals, silver jewelry, and vibrant fabrics. In the evening, visit Vyas Chhatri to witness a beautiful sunset over the city, followed by dinner at a local rooftop restaurant with a direct view of the illuminated fort walls. The night is yours to relax and prepare for the desert adventure that awaits you the next day."},
    {"day":2,"title":"Forts and Golden Sands","description":"Start your morning with a guided tour of the Jaisalmer Fort, one of the few living forts in the world. Walk through the narrow, bustling streets inside the fort walls, observing the daily life of residents in their centuries-old homes. Visit the Patwon Ki Haveli, known for its intricate stone work and history as the home of wealthy merchants. By late afternoon, we drive to the Sam Sand Dunes. Your desert adventure begins here with a camel safari that takes you deep into the heart of the dunes. As the sun sets, return to your luxury tented camp for a traditional folk performance and a bonfire dinner under the desert sky."},
    {"day":3,"title":"Desert Life & Kuldhara","description":"Wake up to a quiet desert morning and enjoy breakfast among the dunes. Before heading back to the city, visit the abandoned village of Kuldhara, which is shrouded in mystery and folklore, offering a hauntingly beautiful photographic opportunity. Return to Jaisalmer by noon and spend the afternoon at leisure. You might choose to visit the Gadsisar Lake to feed the catfish or spend time at the desert culture centre. In the evening, enjoy a final dinner at your hotel, perhaps trying the local Ker Sangri vegetable dish which is a desert specialty."},
    {"day":4,"title":"Departure","description":"Enjoy a final sunrise over the golden city walls and a warm cup of masala chai. After a hearty breakfast, our driver will assist you with checkout and transport you to the Jaisalmer airport or railway station. As you leave the Thar Desert behind, carry with you the memories of the golden architecture and the silence of the dunes. We ensure a seamless departure, leaving you satisfied with your quick but profound desert adventure."}
  ]'::jsonb,
  to_jsonb(ARRAY['Sam Sand Dunes dune bashing','Camel safari at sunset','Traditional Kalbeliya folk dance','Luxury Swiss tent desert stay','Jaisalmer Fort walking tour','Local desert craft market visit']),
  to_jsonb(ARRAY['3 nights accommodation (1 night in luxury camp)','Daily breakfast and dinner','Private taxi for all transfers','Camel safari in the dunes','Traditional folk dance performance','Airport/railway station pickup','Local guide for fort tour','Mineral water during transfers','All applicable taxes','24/7 travel support']),
  to_jsonb(ARRAY['Flights or train tickets','Lunch during travel','Entry fees to monuments','Personal expenses','Gratuities and tips','Travel insurance']),
  to_jsonb(ARRAY['Best time to visit: October to March','Carry warm clothing for cold desert nights','Respect local culture in rural areas','Keep a power bank handy — desert electricity can be intermittent']),
  to_jsonb(ARRAY['Jaisalmer','Sam Sand Dunes']),
  4.7::numeric, 890,
  'Jaisalmer Desert Safari Package 2025 | 3 Nights',
  'Experience desert safari Jaisalmer from ₹12,500. Luxury camps, dunes & culture. Perfect short adventure trip. Book 360 Travellers!',
  '["desert safari jaisalmer","jaisalmer tour package","rajasthan adventure tour","thar desert camp","short rajasthan trip","jaisalmer fort tour","best time to visit rajasthan","weekend rajasthan"]'::jsonb
),

-- ── 5. Jaipur Weekend ────────────────────────────────────────────────────────
(
  'Jaipur Weekend Bliss – 3 Days City Break',
  'jaipur-weekend-getaway-2n-3d',
  'Short on time but craving culture? Experience the very best of the Pink City in a quick, action-packed weekend break. From vibrant bazaars and majestic forts to mouth-watering local snacks, Jaipur offers a perfect dose of royal history in just three days. This is the ideal short escape for those who want to experience the magic of Rajasthan without taking a full week off.',
  'domestic',
  'Rajasthan', 'rajasthan',
  8500::numeric, 11000::numeric, '2 Nights / 3 Days', 2, 3,
  'Jaipur',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaipur","description":"Arrive in Jaipur and check into your centrally located 3-star hotel. Begin your short trip with a visit to the Birla Temple, a stunning marble structure that glows brilliantly under the evening lights. Spend your evening strolling through the nearby areas, getting your first taste of the city culture. Dinner is at a traditional restaurant where you can try authentic Rajasthani kadhi. Get a good night sleep so you are energized for the massive sightseeing day ahead of you tomorrow."},
    {"day":2,"title":"Forts and Bazaars","description":"Dedicate your entire day to the icons of Jaipur. Start at the Amer Fort, spending time walking through the courtyards and enjoying the view of Maota Lake. On your way back to the city, stop at the Jal Mahal for a photo opportunity. Post-lunch, visit the Hawa Mahal to see the incredible facade, followed by a tour of the City Palace. Spend your late afternoon in the Johari Bazaar, where you can buy traditional jewelry, block-printed fabrics, and souvenirs. End your day at Nahargarh Fort to watch the city lights flicker on as the sun goes down."},
    {"day":3,"title":"Departure","description":"Enjoy a slow breakfast at the hotel, perhaps trying some local Pyaaz Kachori for an authentic taste. Spend your final hours picking up any last-minute gifts at the local market near your hotel before we arrange your transfer to the Jaipur airport or railway station. As you head home, you will have completed a whirlwind tour of the Pink City, filled with memories of forts, markets, and the vibrant culture of Rajasthan. We ensure a comfortable and timely transfer for your flight or train."}
  ]'::jsonb,
  to_jsonb(ARRAY['Hawa Mahal photo op','Amer Fort panoramic views','Johari Bazaar shopping walk','Nahargarh Fort sunset view','Local food tasting tour','City Palace history tour']),
  to_jsonb(ARRAY['2 nights accommodation in 3-star hotel','Daily breakfast','Private AC taxi for all sightseeing','Airport/railway station pickup','Professional local guide for forts','Mineral water during travel','All applicable taxes','24/7 dedicated support','Itinerary planning assistance','VIP entry arrangements']),
  to_jsonb(ARRAY['Lunch and dinner','Entry fees to monuments','Personal expenses','Gratuities and tips','Travel insurance','Flights or train tickets']),
  to_jsonb(ARRAY['Book your local guide in advance','Wear comfortable walking shoes for fort visits','Try the Pyaaz Kachori for breakfast','Download a cab app for easy local transit']),
  to_jsonb(ARRAY['Jaipur']),
  4.6::numeric, 450,
  'Jaipur Weekend Getaway 2025 | Budget Rajasthan Trip',
  'Quick 3-day Jaipur trip from ₹8,500. Ideal weekend break in Rajasthan. Explore forts & markets. Book now with 360 Travellers!',
  '["jaipur city break","weekend in jaipur","budget rajasthan trip","jaipur tour from delhi","rajasthan short trip","jaipur sightseeing","affordable rajasthan","360 travellers"]'::jsonb
),

-- ── 6. Family Tour ───────────────────────────────────────────────────────────
(
  'Rajasthan Family Holiday – Wildlife & Palaces',
  'rajasthan-family-tour-jaipur-ranthambore-agra-8d',
  'A journey designed specifically for families seeking both education and excitement. Experience the thrill of a Tiger Safari in Ranthambore, the awe-inspiring beauty of the Taj Mahal in Agra, and the regal history of Jaipur palaces. This package is safe, comfortable, and packed with interactive experiences that will keep both kids and adults engaged. This is Rajasthan at its most family-friendly.',
  'domestic',
  'Rajasthan', 'rajasthan',
  38000::numeric, 49000::numeric, '7 Nights / 8 Days', 7, 8,
  'Jaipur, Ranthambore, Agra',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaipur","description":"Arrive in Jaipur and check into a family-friendly resort. The evening is yours to relax after the travel. We suggest a visit to the Chokhi Dhani village, where kids can enjoy camel rides, magic shows, and traditional puppet plays. Dinner is a communal affair featuring a grand thali. Get some rest as tomorrow starts early with history and exploration."},
    {"day":2,"title":"Jaipur Exploration","description":"Start at the Amber Fort, where children will love the elephant ride or jeep transport to the top. Explore the Sheesh Mahal, which is always a hit with kids due to the mirror work. After lunch, visit the Jantar Mantar observatory, which doubles as a massive science park for children, and then the Hawa Mahal. End the day with a visit to a local workshop where you can see block printing in action. It is an educational and fun day that captures the spirit of Rajasthan."},
    {"day":3,"title":"Jaipur to Ranthambore","description":"After breakfast, drive to Ranthambore National Park. The 4-hour drive takes you through the beautiful countryside. Upon arrival, check into a luxury jungle resort. The afternoon is kept free for you to relax by the pool or enjoy the nature trails within the resort. In the evening, the kids can participate in a wildlife orientation workshop conducted by a naturalist. Dinner is served in an open-air area, where you might even hear the sounds of the jungle coming alive at night."},
    {"day":4,"title":"Wildlife Safari Adventure","description":"Wake up before dawn for your first open-jeep jungle safari. This is the highlight of the trip, where you will look for tigers, leopards, and crocodiles in their natural habitat. Your naturalist guide will help the children spot birds and explain the flora of the park. Return to the resort for lunch and a siesta. In the afternoon, you can choose a second safari or visit the ancient Ranthambore Fort that sits inside the park. The fort offers incredible views and is a great spot for family photos."},
    {"day":5,"title":"Ranthambore to Agra","description":"Check out and drive to Agra, the city of the Taj Mahal. The journey takes about 5 hours. Check into a high-end family hotel in Agra and spend the afternoon at the hotel pool. In the evening, walk through the local markets of Agra, known for their marble handicrafts and sweet petha. Dinner is at a restaurant that offers a view of the Taj Mahal from its rooftop, creating a beautiful memory for the whole family."},
    {"day":6,"title":"Agra & the Taj Mahal","description":"Visit the Taj Mahal at sunrise. Seeing the marble change color as the sun rises is a spiritual experience for the whole family. After breakfast, head to the Agra Fort, where the kids can explore the massive walls and halls. In the afternoon, visit the Baby Taj or explore the gardens across the river for a different perspective of the monument. It is a day filled with wonder and history, perfectly balanced to keep the kids interested and engaged throughout."},
    {"day":7,"title":"Back to Jaipur","description":"Enjoy a leisurely breakfast and drive back to Jaipur. The journey takes about 5 hours. Upon arrival in Jaipur, check back into your resort. The afternoon is free for you to do some final souvenir shopping or simply enjoy the resort amenities. We have arranged a final family dinner at the hotel to celebrate the trip. The kids will love the local treats, and the parents can relax and enjoy the final evening of their Rajasthan holiday."},
    {"day":8,"title":"Departure","description":"Enjoy a final breakfast and check out from your hotel. Depending on your flight or train schedule, we will arrange a transfer to the airport or railway station. As you leave Jaipur, reflect on the tiger sightings, the Taj Mahal, and the forts that made this trip unforgettable. We ensure a comfortable and timely transfer, leaving you with nothing but fond memories of your family holiday in Rajasthan."}
  ]'::jsonb,
  to_jsonb(ARRAY['Tiger Safari in Ranthambore','Taj Mahal sunrise tour','Elephant village visit in Jaipur','Interactive puppet shows at Chokhi Dhani','Kid-friendly resort activities','Historical fort walking tours']),
  to_jsonb(ARRAY['7 nights in family-friendly resorts','All meals included (daily)','Private XL-SUV for all family travel','Tiger safari tickets (pre-booked)','Professional tour guide','Airport/station transfers','Kid-friendly activities and workshops','Dedicated family travel assistance','Mineral water throughout','All applicable taxes']),
  to_jsonb(ARRAY['Flights or train tickets','Tips and gratuities','Camera entry fees','Laundry services','Personal shopping expenses','Anything not mentioned in inclusions']),
  to_jsonb(ARRAY['Pack comfortable clothes for safari','Book safaris at least 90 days in advance','Carry snacks for kids during road travel','Follow all instructions given by safari naturalists']),
  to_jsonb(ARRAY['Jaipur','Ranthambore','Agra']),
  4.8::numeric, 610,
  'Rajasthan Family Tour 2025 | Jaipur Ranthambore Agra',
  'Book Rajasthan family tour from ₹38,000. Tiger safari, Taj Mahal & Jaipur palaces. Perfect family holiday with 360 Travellers.',
  '["rajasthan family tour","rajasthan family package","ranthambore safari","agra tour package","family trip rajasthan","rajasthan kids tour","rajasthan trip from delhi","best rajasthan family vacation"]'::jsonb
),

-- ── 7. Udaipur City Escape ───────────────────────────────────────────────────
(
  'Udaipur Romantic Lake City Escape',
  'udaipur-lake-city-escape-3n-4d',
  'Known as the Venice of the East, Udaipur is the epitome of serenity. Spend your days admiring tranquil lakes, white marble palaces, and lush green gardens. This escape is meticulously crafted for those who need a soulful reset in the heart of Rajasthan, away from the chaos of modern life. This is Rajasthan at its most romantic and peaceful.',
  'domestic',
  'Rajasthan', 'rajasthan',
  15999::numeric, 20500::numeric, '3 Nights / 4 Days', 3, 4,
  'Udaipur',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Udaipur","description":"Arrive in Udaipur and transfer to your stunning lake-view hotel. The city welcomes you with its gentle breeze and views of the Pichola lake. Spend the afternoon resting in the plush surroundings or enjoying a slow walk along the Ghats. In the evening, watch the sunset over the lake as the water reflects the palace lights. Dinner is at a lakeside restaurant where you can enjoy local delicacies under the stars, feeling the peace of this magical city sink in. It is the perfect start to your romantic getaway."},
    {"day":2,"title":"City Palace Grandeur","description":"The day begins with a visit to the grandeur of the City Palace complex, which overlooks the Pichola lake. Explore the Crystal Gallery, the ornate courtyards, and the museum that tells the story of the Maharanas. Afterward, head to the serene Saheliyon Ki Bari garden, famous for its fountains and lush greenery. In the late afternoon, we have reserved a boat ride on Lake Pichola, where the changing hues of the sky reflect beautifully on the water and the marble palaces. Return to your hotel for an evening at leisure or an optional private dinner by the waterside."},
    {"day":3,"title":"Art and Heritage","description":"Visit the Jagdish Temple, an Indo-Aryan masterpiece, and then spend your morning at the Vintage Car Museum, a treat for automotive enthusiasts. In the afternoon, take a drive to the Fateh Sagar lake, where you can enjoy a coffee and the local atmosphere. You might also choose to visit the Shilpgram art complex to see traditional Rajasthani crafts being made by artisans from across Rajasthan. The evening is kept free for you to explore the local markets, where you can pick up some unique jewelry or fine textiles. End the day with a farewell dinner at your resort."},
    {"day":4,"title":"Departure","description":"Enjoy a final slow breakfast overlooking the lake, soaking in the peace before your departure. Our representative will assist with your checkout and arrange a private transfer to the Udaipur airport or railway station. As you leave, reflect on the last few days of peace, history, and the quiet beauty of Udaipur. We hope the memories of the lake sunsets stay with you as a beautiful reminder of your visit to the Venice of the East."}
  ]'::jsonb,
  to_jsonb(ARRAY['Lake Pichola sunset boat ride','City Palace heritage tour','Saheliyon Ki Bari gardens visit','Vintage car museum','Fateh Sagar lake drive','Local artisanal market walk']),
  to_jsonb(ARRAY['3 nights in lake-view hotel','Daily breakfast','Private taxi for all travel','Guided city tour of Udaipur','Boat ride tickets included','Airport/station pickup and drop','Mineral water throughout','All applicable taxes','24/7 dedicated travel support','Itinerary planning assistance']),
  to_jsonb(ARRAY['Flights or train tickets','Lunch and dinner','Entry fees to monuments','Personal expenses','Gratuities and tips','Laundry services']),
  to_jsonb(ARRAY['Book boat rides early in the day','Respect local temple customs','Udaipur old city is best explored on foot','Keep a camera ready at all times for lake views']),
  to_jsonb(ARRAY['Udaipur']),
  4.9::numeric, 320,
  'Udaipur Lake City Tour 2025 | Romantic Rajasthan',
  'Romantic 4-day Udaipur tour from ₹15,999. Lakes, palaces & culture. Book your lake city escape with 360 Travellers.',
  '["udaipur tour package","romantic udaipur","rajasthan city break","udaipur vacation","lake city rajasthan","best time to visit udaipur","udaipur sightseeing","360 travellers"]'::jsonb
),

-- ── 8. Grand Circuit ─────────────────────────────────────────────────────────
(
  'The Grand Rajasthan Circuit – 12 Day Complete Tour',
  'complete-rajasthan-grand-circuit-11n-12d',
  'This is the ultimate Rajasthan pilgrimage for the serious traveller. Explore every iconic city, hidden haveli, and shimmering dune of this incredible state. A comprehensive, luxury-led journey through India vibrant culture, this circuit ensures you see the best of palaces, wildlife, and desert life. This is Rajasthan at its most complete.',
  'domestic',
  'Rajasthan', 'rajasthan',
  82000::numeric, 105000::numeric, '11 Nights / 12 Days', 11, 12,
  'Jaipur, Bikaner, Jaisalmer, Jodhpur, Udaipur, Pushkar',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Arrival in Jaipur","description":"Arrive in Jaipur and check into your heritage haveli. Spend the day relaxing and enjoying the palace architecture before your grand 12-day circuit begins. In the evening, enjoy a welcome dinner in the haveli courtyard with live folk music, getting your first true taste of Rajasthani hospitality. Your travel manager will brief you on the journey ahead, ensuring you feel prepared and excited for the weeks of discovery that lie in front of you."},
    {"day":2,"title":"Jaipur Exploration","description":"Spend the full day exploring the iconic landmarks of the Pink City. Begin with the Amber Fort, where your private historian guide will explain the rise of the Kachwaha clan and the architectural genius behind the palace. After lunch, visit the City Palace and the Jantar Mantar observatory, which offers fascinating insights into 18th-century astronomy. The afternoon is spent in the Johari Bazaar, browsing the city famous for its jewelry, block prints, and blue pottery."},
    {"day":3,"title":"Jaipur to Bikaner","description":"After breakfast, drive to Bikaner, a lesser-visited gem of Rajasthan. Upon arrival, visit the Karni Mata temple in Deshnok, known for its unusual and sacred rats that are believed to be reincarnations of devotees. Check into your luxury heritage property and enjoy a traditional Bikaneri dinner featuring bhujia and the famous Bikaneri rasgulla. The evening offers a cultural session inside the hotel, giving you a deeper appreciation of this proud desert city."},
    {"day":4,"title":"Bikaner to Jaisalmer","description":"Explore the imposing red-sandstone Junagarh Fort in the morning, a fortress that was never conquered in its long history. Your guide will walk you through the lavishly decorated rooms and the fascinating collection of artefacts. After an early lunch, begin the long drive to the Golden City of Jaisalmer. The drive takes you deep into the Thar Desert, where the landscape becomes increasingly dramatic and arid. Arrive in Jaisalmer by evening and check in for a quiet dinner under the desert sky."},
    {"day":5,"title":"Jaisalmer Fort & Havelis","description":"Tour the magnificent Jaisalmer Fort, a living UNESCO World Heritage site, in the cool morning hours. Walk through its narrow alleyways, exploring the Jain temples and the ornate havelis of wealthy merchants. Visit the Patwon Ki Haveli and the Salim Singh Ki Haveli to appreciate the intricate golden stone carving that defines Jaisalmer architecture. By late afternoon, drive to the Sam Sand Dunes where a camel safari awaits, followed by a sunset cultural show and an overnight stay in a luxury desert camp."},
    {"day":6,"title":"Desert Morning & Kuldhara","description":"Wake up before sunrise to witness the desert come alive in the golden light of the morning. After breakfast at the camp, visit the hauntingly beautiful abandoned village of Kuldhara, shrouded in legend and mystery. Return to Jaisalmer city and spend the afternoon at the Gadsisar Lake, watching the ornate chhatris reflect in the still water. In the evening, attend a classical folk music session at the Desert Culture Centre before a relaxed dinner at your hotel."},
    {"day":7,"title":"Jaisalmer to Jodhpur","description":"Drive to Jodhpur, the Blue City, through the heart of the Thar Desert. The 5-hour journey is filled with sweeping views of the endless arid landscape. Upon arrival, check into your heritage mansion, many of which sit directly in the shadow of the Mehrangarh Fort. Spend the evening exploring the vibrant Sardar Market and the ancient Toorji Ka Jhalra stepwell. Have dinner at a local rooftop restaurant with a stunning view of the illuminated fort."},
    {"day":8,"title":"Jodhpur Imperial Legacy","description":"Dedicate your entire day to Mehrangarh Fort, one of the most magnificent forts in all of India. Your private historian guide will lead you through the museums, the palaces, and the battlements, explaining the military history and the cultural legacy of the Rathore dynasty. Visit Jaswant Thada, the ethereal white marble cenotaph, before heading to the Umaid Bhawan Palace, which still serves as a royal residence. End your day with a heritage dinner at a rooftop venue overlooking the glowing fort walls."},
    {"day":9,"title":"Jodhpur to Udaipur via Ranakpur","description":"Drive to Udaipur with a key detour to the Ranakpur Jain Temple, one of the most beautiful and intricate temples in India. Its 1,444 uniquely carved marble pillars are a testament to the devotion and artistry of medieval Rajasthan. Continue the drive through the lush Aravali mountains, a welcome change of scenery from the desert. Arrive in Udaipur by evening and check into a lakeside heritage hotel. Take a slow walk along the ghats before a quiet lakeside dinner."},
    {"day":10,"title":"Udaipur Lakes & Palaces","description":"Explore the City Palace, the largest palace complex in Rajasthan, in the morning. Your guide will take you through the Crystal Gallery, the royal apartments, and the courtyards that overlook the shimmering Lake Pichola. Visit the Jagdish Temple and the beautiful Saheliyon Ki Bari garden in the afternoon. In the late afternoon, enjoy a private boat ride on Lake Pichola, followed by a special heritage dinner at a waterside venue featuring classical Rajasthani music performed live."},
    {"day":11,"title":"Udaipur to Pushkar","description":"Drive to the holy town of Pushkar, considered one of the most sacred pilgrimage sites in Hinduism. Visit the Brahma Temple, one of the very few temples in the world dedicated to Lord Brahma, and take a ceremonial walk around the holy Pushkar Lake. Explore the vibrant town market, filled with colourful handicrafts, sacred items, and unique desert souvenirs. Spend the night at a luxury tent camp on the edge of the Pushkar hills, enjoying a bonfire dinner under a canopy of stars."},
    {"day":12,"title":"Departure","description":"After a final breakfast reflecting on 12 extraordinary days across six cities, our driver will transfer you to the nearest airport or railway station. As Rajasthan fades in the rearview mirror, carry with you the memories of its golden forts, desert nights, and the warmth of its people. We at 360 Travellers hope this grand circuit has left you with a deep and lasting love for the royal land of Rajasthan."}
  ]'::jsonb,
  to_jsonb(ARRAY['Full circuit across 6 major cities','Luxury private desert camp in Jaisalmer','Ranakpur Jain Temple detour','Holy Pushkar Brahma Temple visit','VIP access to all major forts','Authentic culinary trail across regions']),
  to_jsonb(ARRAY['11 nights luxury accommodation','All meals included (daily)','Private Innova/Crysta for all 12 days','Historian guides at all heritage locations','All entry fees for listed monuments','Camel safari and jeep safari included','Traditional cultural shows en route','Airport/station transfers','Dedicated travel manager','All applicable taxes']),
  to_jsonb(ARRAY['International/domestic airfare','Personal shopping expenses','Camera entry fees at select monuments','Tips and gratuities','Travel insurance','Beverages and alcohol']),
  to_jsonb(ARRAY['Stay hydrated while traversing desert regions','Pack versatile clothing for changing climates','Keep your ID handy for hotel check-ins','Be prepared for long drives between cities — carry snacks and entertainment']),
  to_jsonb(ARRAY['Jaipur','Bikaner','Jaisalmer','Jodhpur','Udaipur','Pushkar']),
  4.9::numeric, 480,
  'Complete Rajasthan Grand Tour 2025 | 12 Day Circuit',
  'Experience the ultimate 12-day Rajasthan tour from ₹82,000. All major cities included. Luxury circuit with 360 Travellers. Book now!',
  '["rajasthan tour package","rajasthan grand circuit","rajasthan trip from mumbai","best rajasthan tour","rajasthan 12 days","luxury rajasthan tour","rajasthan holiday","360 travellers rajasthan"]'::jsonb
)

) AS v(
  title, slug, description, category,
  destination, destination_slug,
  price, original_price, duration, nights, days,
  location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count,
  meta_title, meta_description, keywords
)
WHERE NOT EXISTS (
  SELECT 1 FROM packages p WHERE p.slug = v.slug
);
