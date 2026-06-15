INSERT INTO packages (
  title, slug, description, category,
  destination, destination_slug,
  price, original_price, duration, nights, days,
  location, image_url, gallery,
  itinerary, highlights, inclusions, exclusions, know_before, route,
  rating, review_count
) VALUES

-- 1. Spiti Valley Classic Circuit (9N/10D)
(
  'Spiti Valley Classic Circuit',
  'spiti-valley-classic-circuit-10d',
  'The most loved Spiti Valley road trip starting from Shimla and exiting via Manali. Covers every iconic landmark — Tabo, Dhankar, Kaza, Key Monastery, Chandratal, and more.',
  'domestic',
  'Spiti', 'spiti-valley',
  42999, 52999, '9 Nights / 10 Days', 9, 10,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Shimla to Narkanda","description":"Depart from Shimla and drive to Narkanda through apple orchards and dense pine forests. Overnight stay in Narkanda."},
    {"day":2,"title":"Narkanda to Sangla","description":"Drive through Kinnaur along the Satluj River. Arrive in the beautiful Sangla Valley nestled in the Baspa River basin."},
    {"day":3,"title":"Sangla to Tabo via Nako","description":"Cross into Spiti district. Visit the serene Nako Lake and ancient Tabo Monastery, over 1,000 years old. Overnight in Tabo."},
    {"day":4,"title":"Tabo to Kaza via Dhankar","description":"Visit the ancient Dhankar Monastery perched like an eagle on a cliff. Explore the Dhankar Lake (short trek). Drive to Kaza for overnight stay."},
    {"day":5,"title":"Kaza Local Exploration","description":"Explore the Pin Valley National Park and Mudh village. Return to Kaza for the evening."},
    {"day":6,"title":"Key, Kibber & High-Altitude Villages","description":"Visit the iconic Key Monastery. Drive to Kibber, Chicham Bridge (Asia''s highest bridge), Gette and Tashigang villages."},
    {"day":7,"title":"Hikkim, Komik & Langza","description":"Visit the world''s highest post office in Hikkim. Explore the highest motorable village of Komik, and Langza with its giant Buddha statue and Ammonite fossils."},
    {"day":8,"title":"Kaza to Chandratal","description":"Drive over Kunzum Pass (4,551m) to the crescent-shaped Chandratal Lake. Camp overnight under a sky full of stars."},
    {"day":9,"title":"Chandratal to Manali","description":"Drive through Batal and Rohtang Pass to arrive in Manali. Rest and explore the local market."},
    {"day":10,"title":"Departure from Manali","description":"After a hearty breakfast, check out and conclude your epic Spiti circuit."}
  ]'::jsonb,
  to_jsonb(ARRAY['Tabo Monastery (1000+ years old)','Dhankar Monastery','Key Monastery','Hikkim Post Office','Chandratal Lake Camping','Kibber & Chicham Bridge']),
  to_jsonb(ARRAY['9 Nights Accommodation (hotels/camps/homestays)','Breakfast and Dinner (MAP plan)','Private Tempo Traveller','Experienced local Spiti guide','All toll & parking charges']),
  to_jsonb(ARRAY['Inner Line Permits for restricted areas','Chandratal camping meals','Lunch','Adventure activities','Personal expenses','Travel insurance']),
  to_jsonb(ARRAY['Minimum age recommended: 10 years','High risk of AMS above 4000m — acclimatize properly','Carry sufficient cash; no ATMs beyond Kaza','Mobile network available only at Kaza and major villages','Chandratal camping involves basic facilities']),
  to_jsonb(ARRAY['Shimla','Narkanda','Sangla','Tabo','Dhankar','Kaza','Chandratal','Manali']),
  4.9, 312
),

-- 2. Spiti Valley Express (6N/7D)
(
  'Spiti Valley Express',
  'spiti-valley-express-7d',
  'A fast-paced, compact Spiti circuit via the Manali–Kunzum–Kaza route. Ideal for those with limited time but maximum adventure spirit.',
  'domestic',
  'Spiti', 'spiti-valley',
  29999, 37999, '6 Nights / 7 Days', 6, 7,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Kaza via Rohtang & Kunzum","description":"Early morning departure from Manali. Cross Rohtang Pass and Kunzum Pass. Arrive in Kaza by evening. Overnight stay."},
    {"day":2,"title":"Pin Valley Excursion","description":"Drive to the Pin Valley and Mudh village. Spot the elusive Snow Leopard territory and return to Kaza."},
    {"day":3,"title":"Key Monastery & High Villages","description":"Visit Key Gompa, Kibber, Chicham Bridge, Gette, and Tashigang. Return to Kaza for overnight."},
    {"day":4,"title":"Hikkim, Komik & Langza","description":"Cover the three high-altitude villages — the world''s highest post office at Hikkim, the highest motorable village at Komik, and fossil-rich Langza."},
    {"day":5,"title":"Kaza to Dhankar & Tabo","description":"Drive south via Dhankar Monastery and the stunning Dhankar Lake. Continue to Tabo for overnight stay."},
    {"day":6,"title":"Tabo to Nako & Kalpa","description":"Visit the famous Tabo caves and monastery. Drive through Kinnaur to Kalpa for a stunning view of Kinner Kailash at sunset."},
    {"day":7,"title":"Kalpa to Shimla / Departure","description":"Drive from Kalpa back to Shimla via Rampur and Narkanda. Drop at Shimla railway station or airport."}
  ]'::jsonb,
  to_jsonb(ARRAY['Key Monastery','Kunzum Pass','Chandratal Lake','Hikkim Post Office','Kibber Village','Tabo Monastery']),
  to_jsonb(ARRAY['6 Nights Accommodation','Daily Breakfast & Dinner','Private SUV/Innova','Driver cum guide','All road permits']),
  to_jsonb(ARRAY['Rohtang Pass permit fees (₹500)','Lunch','Personal shopping','Travel insurance']),
  to_jsonb(ARRAY['Road via Rohtang can be closed due to snowfall, even in summer','Start early each day to avoid mountain rain','Carry ORS sachets and altitude sickness tablets']),
  to_jsonb(ARRAY['Manali','Rohtang Pass','Kaza','Key Monastery','Dhankar','Tabo','Kalpa','Shimla']),
  4.7, 198
),

-- 3. Spiti + Kinnaur Grand Circuit (12N/13D)
(
  'Spiti & Kinnaur Grand Circuit',
  'spiti-kinnaur-grand-circuit-13d',
  'The ultimate combined circuit of Spiti Valley and the Kinnaur district. Apples, monasteries, fossils, and the cold desert — all in one journey.',
  'domestic',
  'Spiti', 'spiti-valley',
  61999, 78999, '12 Nights / 13 Days', 12, 13,
  'Kaza & Reckong Peo, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Delhi / Shimla to Sarahan","description":"Depart from Delhi or Shimla. Drive to Sarahan to visit the famous Bhimakali Temple. Overnight stay."},
    {"day":2,"title":"Sarahan to Sangla","description":"Drive through Kinnaur valley with stunning views of the Satluj River gorge. Explore Sangla village and Kamru Fort."},
    {"day":3,"title":"Sangla to Chitkul & Kalpa","description":"Day trip to Chitkul — the last inhabited village near the Indo-Tibetan border. Return and drive to Kalpa."},
    {"day":4,"title":"Kalpa Sunrise & Drive to Nako","description":"Catch the sunrise over Kinner Kailash from your room. Drive to Nako via Khab confluence. Visit Nako Lake."},
    {"day":5,"title":"Nako to Tabo","description":"Cross from Kinnaur into Spiti district. Visit the ancient Tabo Monastery and explore the caves. Overnight in Tabo."},
    {"day":6,"title":"Tabo to Kaza via Dhankar","description":"Stop at Dhankar Monastery and Dhankar Lake trek. Continue to Kaza for check-in."},
    {"day":7,"title":"Pin Valley Excursion","description":"Drive through Pin Valley to Mudh village. Visit the Pin Valley National Park — habitat of Snow Leopard."},
    {"day":8,"title":"Key Monastery, Kibber & Chicham","description":"Morning visit to Key Monastery. Drive to Kibber and cross the iconic Chicham Bridge. Explore Tashigang."},
    {"day":9,"title":"High Altitude Village Trail","description":"Visit Hikkim, Komik, and Langza. Send a postcard from the highest post office in the world."},
    {"day":10,"title":"Rest & Acclimatize in Kaza","description":"Free day in Kaza. Explore the local market, try butter tea, and visit the Sakya Monastery in town."},
    {"day":11,"title":"Kaza to Chandratal","description":"Drive over Kunzum La to Chandratal Lake. Overnight camping at the star-studded lakeside."},
    {"day":12,"title":"Chandratal to Manali","description":"Early morning at the lake. Drive through Batal, cross Rohtang Pass, and arrive in Manali. Overnight."},
    {"day":13,"title":"Departure","description":"Check out and depart from Manali to your onward destination."}
  ]'::jsonb,
  to_jsonb(ARRAY['Bhimakali Temple Sarahan','Chitkul Last Village','Khab Confluence','Tabo Monastery Caves','Key Monastery','Chandratal Lake','World Highest Post Office']),
  to_jsonb(ARRAY['12 Nights Accommodation (hotels/camps/guesthouses)','All meals MAP (Breakfast & Dinner)','Private 7-seater Innova Crysta','Expert local guide for full duration','Spiti Inner Line Permits']),
  to_jsonb(ARRAY['Rohtang Pass permit','Chitkul permit','Lunch','Adventure sports','Personal expenses','Travel insurance']),
  to_jsonb(ARRAY['13-day trip requires good physical fitness','Carry multiple ID proofs — checkpoints are frequent','Temperature can drop below 0°C at Chandratal even in July','Book well in advance for summer season (June–Sept)']),
  to_jsonb(ARRAY['Delhi','Sarahan','Sangla','Chitkul','Kalpa','Nako','Tabo','Kaza','Chandratal','Manali']),
  4.9, 145
),

-- 4. Chandratal Lake Weekend Camping (3N/4D)
(
  'Chandratal Lake Weekend Camping',
  'chandratal-lake-weekend-camping-4d',
  'A short, thrilling weekend getaway to the breathtaking crescent moon lake of Chandratal. Camp beside the pristine high-altitude lake.',
  'domestic',
  'Spiti', 'spiti-valley',
  15999, 19999, '3 Nights / 4 Days', 3, 4,
  'Chandratal, Spiti, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Batal","description":"Depart early from Manali. Drive through Rohtang Pass and the lunar landscape of Lahaul to reach Batal. Basic campsite overnight."},
    {"day":2,"title":"Batal to Chandratal Lake Camp","description":"Short morning drive followed by a 2 km hike to the Chandratal Lake. Set up camp. Spend the afternoon exploring the turquoise lake and surrounding landscape."},
    {"day":3,"title":"Chandratal Sunrise & Return to Manali","description":"Wake up at 5 AM for the golden sunrise reflected on the lake. Spend the morning at leisure before driving back to Manali via Rohtang."},
    {"day":4,"title":"Departure from Manali","description":"Breakfast in Manali and proceed for your onward journey."}
  ]'::jsonb,
  to_jsonb(ARRAY['Chandratal Lake (4,300m)','Rohtang Pass Views','Kunzum Pass','Stargazing at 4300m','Milky Way Photography']),
  to_jsonb(ARRAY['3 Nights Camp/Basic Guesthouse','All Meals (Breakfast, Lunch & Dinner)','Manali–Chandratal–Manali shared vehicle','Camping equipment provided']),
  to_jsonb(ARRAY['Sleeping bags (can be rented in Manali)','Personal trekking gear','Travel insurance','Tips']),
  to_jsonb(ARRAY['Chandratal is accessible only June to October','2 km walking on rough trail to lake is mandatory','Carry warm clothes — night temps drop to -5°C even in summer','No mobile network or electricity at campsite']),
  to_jsonb(ARRAY['Manali','Rohtang Pass','Batal','Chandratal Lake','Manali']),
  4.8, 427
),

-- 5. Key Monastery & Kaza Spiti Sampler (5N/6D)
(
  'Key Monastery & Kaza Spiti Sampler',
  'key-monastery-kaza-sampler-6d',
  'A focused 6-day exploration of the Spiti heartland — Kaza and its surrounding villages. Ideal for first-timers and photography enthusiasts.',
  'domestic',
  'Spiti', 'spiti-valley',
  22999, 28999, '5 Nights / 6 Days', 5, 6,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Kaza","description":"Drive from Manali via Rohtang Pass and Kunzum Pass. Arrive in Kaza by late afternoon. Acclimatize and rest."},
    {"day":2,"title":"Pin Valley National Park","description":"Full day excursion to Pin Valley. Visit Mudh village, the last village in the Pin Valley. Spot Snow Leopard paw prints if lucky."},
    {"day":3,"title":"Key Monastery, Kibber & Chicham Bridge","description":"Early morning visit to Key Gompa (4,166m). Drive to Kibber village and cross the newly built Chicham suspension bridge."},
    {"day":4,"title":"Hikkim, Komik & Langza Village Trail","description":"Post the world''s highest postcard from Hikkim Post Office. Walk through Komik village. Spot ammonite fossils in Langza."},
    {"day":5,"title":"Sakya Monastery & Kaza Local Walk","description":"Visit the Sakya Monastery in Kaza town. Walk through the local market and interact with Spitian families. Evening rest."},
    {"day":6,"title":"Kaza to Manali / Departure","description":"Early morning departure via Kunzum Pass and Rohtang Pass. Reach Manali by late afternoon."}
  ]'::jsonb,
  to_jsonb(ARRAY['Key Monastery','Pin Valley Wildlife','Kibber Village','Hikkim Post Office','Langza Fossils','Kaza Market']),
  to_jsonb(ARRAY['5 Nights Hotel/Homestay in Kaza','Breakfast and Dinner','Private cab for all transfers and sightseeing','Local Spiti guide throughout']),
  to_jsonb(ARRAY['Rohtang Pass permit','Lunch','Personal shopping','Travel insurance']),
  to_jsonb(ARRAY['Altitude sickness common between days 1-2 — rest is essential','Altitude of Key Monastery is 4166m, go slow','Carry warm layers at all times']),
  to_jsonb(ARRAY['Manali','Kaza','Pin Valley','Key Monastery','Kibber','Langza','Manali']),
  4.8, 263
),

-- 6. Spiti Photography & Nature Expedition (8N/9D)
(
  'Spiti Photography & Nature Expedition',
  'spiti-photography-nature-expedition-9d',
  'A carefully curated trip for photographers and nature enthusiasts. Timed for golden hour captures, night sky photography, and rare wildlife sightings.',
  'domestic',
  'Spiti', 'spiti-valley',
  48999, 60999, '8 Nights / 9 Days', 8, 9,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Shimla to Sangla Valley","description":"Depart Shimla. Arrive in Sangla Valley through the stunning Kinnaur gorge. Evening blue-hour photography along the Baspa River."},
    {"day":2,"title":"Chitkul & Sunset from Kamru Fort","description":"Morning drive to Chitkul. Photograph the crystal-clear Baspa River. Return for a golden hour from Kamru Fort."},
    {"day":3,"title":"Sangla to Tabo via Nako Lake","description":"Stop at Nako Lake for reflections photography. Arrive in Tabo. Visit the ancient monastery for evening shots."},
    {"day":4,"title":"Dhankar — Cliff Monastery & Lake Trek","description":"Golden hour photography at Dhankar Monastery on the cliff. Trek to Dhankar Lake — excellent landscape photography."},
    {"day":5,"title":"Kaza & Pin Valley","description":"Arrive in Kaza. Afternoon excursion to Pin Valley for snow leopard habitat photography."},
    {"day":6,"title":"Key Monastery & Village Portraits","description":"Sunrise shoot at Key Monastery. Spend time in Kibber interacting with locals. Portrait photography session with monks."},
    {"day":7,"title":"Langza Fossils, Buddha & Stargazing","description":"Photograph the giant Buddha with Himalayan backdrop in Langza. Fossil hunting. Midnight Milky Way shoot (clear skies permitting)."},
    {"day":8,"title":"Chandratal — Sunrise & Reflections","description":"Drive to Chandratal Lake via Kunzum Pass. Catch the golden sunrise reflected on the crescent lake. Evening camp stay."},
    {"day":9,"title":"Return to Manali","description":"Final images at the lake. Drive through Lahaul and Rohtang to Manali. Tour concludes."}
  ]'::jsonb,
  to_jsonb(ARRAY['Milky Way Night Photography','Chandratal Sunrise Reflections','Dhankar Cliff Monastery','Langza Buddha Portrait','Chitkul River','Monk Portraits at Key']),
  to_jsonb(ARRAY['8 Nights Accommodation (hotels/camps/homestays)','Breakfast and Dinner','Private SUV with photography-friendly scheduling','Expert photography guide for 3 days','Tripod and ND filter loan']),
  to_jsonb(ARRAY['Professional camera body/lens','Drone permits (if applicable)','Lunch','Travel insurance','Personal trekking gear']),
  to_jsonb(ARRAY['Trip timings adjusted for golden hour — early starts mandatory','Clear skies for Milky Way not guaranteed','Drone flying requires prior DGCA permit']),
  to_jsonb(ARRAY['Shimla','Sangla','Chitkul','Nako','Tabo','Dhankar','Kaza','Chandratal','Manali']),
  4.9, 87
),

-- 7. Budget Spiti Backpacker (9N/10D)
(
  'Budget Spiti Backpacker Circuit',
  'budget-spiti-backpacker-circuit-10d',
  'Experience the raw, untamed beauty of Spiti Valley on a budget — shared vehicles, dormitory stays, and local dhabas. The real Spiti on your own terms.',
  'domestic',
  'Spiti', 'spiti-valley',
  18999, 24999, '9 Nights / 10 Days', 9, 10,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Delhi to Shimla (Overnight Bus)","description":"Board an overnight HRTC Volvo bus from Delhi to Shimla. Budget accommodation on arrival."},
    {"day":2,"title":"Shimla to Reckong Peo","description":"Take the HRTC bus from Shimla to Reckong Peo via Rampur. Check in to a budget guesthouse."},
    {"day":3,"title":"Reckong Peo to Nako","description":"Shared jeep to Nako via Khab confluence. Short walk to Nako Lake. Budget monastery guesthouse."},
    {"day":4,"title":"Nako to Tabo","description":"Morning shared jeep to Tabo. Explore the monastery and the famous Tabo caves. Dormitory stay."},
    {"day":5,"title":"Tabo to Kaza","description":"Shared cab to Kaza via Dhankar. Explore Dhankar on the way. Check into a Kaza hostel."},
    {"day":6,"title":"Key, Kibber, Chicham — Local Bus","description":"Hire a local taxi or take the once-daily bus to Key Monastery and Kibber. Walk back if feeling adventurous."},
    {"day":7,"title":"Village Hop — Hikkim, Komik, Langza","description":"Hire a shared cab for the day to visit the three high-altitude villages. Send your postcard from Hikkim."},
    {"day":8,"title":"Rest Day in Kaza / Pin Valley","description":"Rest and explore Kaza market. Optional: hitch to Pin Valley with other travellers."},
    {"day":9,"title":"Kaza to Chandratal — Hitch or Shared Cab","description":"Find a shared cab or hitch to Chandratal. Camp overnight near the lake (tents for hire on site)."},
    {"day":10,"title":"Chandratal to Manali — Shared Cab","description":"Early morning at the lake. Take a shared cab back to Manali via Rohtang. Tour concludes."}
  ]'::jsonb,
  to_jsonb(ARRAY['Budget guesthouses & hostels','Local Spiti dhabas experience','Shared jeep culture','Tabo Monastery','Hikkim Post Office','Chandratal Camping']),
  to_jsonb(ARRAY['9 Nights Dormitory/Budget Guesthouse Stay','Daily Breakfast (at guesthouse)','Shared vehicle transfers throughout','One experienced local companion guide']),
  to_jsonb(ARRAY['All lunches and dinners (local dhaba meals ₹100-200)','Personal toiletries','Travel insurance','Sleeping bag (recommend carrying own)']),
  to_jsonb(ARRAY['This is a group sharing trip — not a private tour','Shared cabs run on fill-and-go basis — be flexible with timings','Cash mandatory as there are no ATMs after Kaza']),
  to_jsonb(ARRAY['Delhi','Shimla','Reckong Peo','Nako','Tabo','Kaza','Chandratal','Manali']),
  4.6, 541
),

-- 8. Spiti Homestay Immersion (7N/8D)
(
  'Spiti Village Homestay Immersion',
  'spiti-village-homestay-immersion-8d',
  'Live with Spitian families in their traditional mud-brick homes. Cook local food, attend monastery prayers, and experience the real rhythm of high-altitude life.',
  'domestic',
  'Spiti', 'spiti-valley',
  32999, 41999, '7 Nights / 8 Days', 7, 8,
  'Kaza & Langza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Kaza","description":"Drive from Manali to Kaza via Kunzum Pass. Evening orientation and welcome dinner with your host family in Kaza."},
    {"day":2,"title":"Cooking & Monastery Morning","description":"Assist your host in making traditional Spitian breakfast (tsampa, butter tea). Morning prayer ceremony at the local monastery."},
    {"day":3,"title":"Langza Homestay Transfer","description":"Transfer to a traditional homestay in Langza village. Afternoon walk to spot Ammonite fossils and the golden Buddha statue."},
    {"day":4,"title":"Langza Village Life & Farming","description":"Spend a full day assisting the family in their fields (peas and barley cultivation). Sunset at the village rooftop with mountain views."},
    {"day":5,"title":"Hikkim & Komik Day Walk","description":"Morning walk from Langza to Hikkim and Komik. Visit the post office, chat with locals. Return on foot or by local vehicle."},
    {"day":6,"title":"Key Monastery Overnight Stay","description":"Transfer to Key Monastery for an overnight stay in the monks'' guesthouse. Attend the evening prayers and interact with young novice monks."},
    {"day":7,"title":"Kibber Village Homestay","description":"Move to a homestay in Kibber village. Evening walk to the Chicham Bridge viewpoint. Learn about the traditional Spitian way of life."},
    {"day":8,"title":"Return to Manali","description":"Breakfast with the host family. Drive back to Manali via Kunzum Pass."}
  ]'::jsonb,
  to_jsonb(ARRAY['Cooking local Spitian food','Monastery overnight stay','Fossil walk in Langza','Kibber village life','Rooftop stargazing','Farming with local family']),
  to_jsonb(ARRAY['7 Nights Authentic Homestays (no hotels)','All Meals (prepared with the host family)','Private vehicle for all inter-village transfers','Cultural immersion guide throughout']),
  to_jsonb(ARRAY['Personal toiletries','Gifts for host families (optional but appreciated)','Travel insurance','Sleeping bag (provided by homestay, or carry own)']),
  to_jsonb(ARRAY['Homestays have basic facilities (shared bathroom, squat toilet) — be open-minded','Host families may have limited English — guide translates','No Wi-Fi in village homestays']),
  to_jsonb(ARRAY['Manali','Kaza','Langza','Hikkim','Key Monastery','Kibber','Manali']),
  4.9, 178
),

-- 9. Spiti Winter Snow Expedition (5N/6D)
(
  'Spiti Winter Snow Expedition',
  'spiti-winter-snow-expedition-6d',
  'Experience the frozen, desolate, and surreal winter Spiti — accessible only via Shimla. Snow-covered monasteries, frozen rivers, and sub-zero temperatures await.',
  'domestic',
  'Spiti', 'spiti-valley',
  34999, 44999, '5 Nights / 6 Days', 5, 6,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Shimla to Reckong Peo","description":"Drive from Shimla to Reckong Peo. Snow-covered Kinnaur welcomes you. Check-in and rest."},
    {"day":2,"title":"Reckong Peo to Nako & Tabo","description":"Cross the snow-covered Kinnaur–Spiti border. Stop at Nako (partially frozen lake). Reach Tabo for overnight."},
    {"day":3,"title":"Tabo to Kaza (Winter Road)","description":"Drive the Spiti road through snow and ice. Arrive in Kaza — the only town open in winter Spiti."},
    {"day":4,"title":"Key Monastery in Snow","description":"Visit Key Monastery draped in white snow — one of the most photographed winter scenes in India. Drive to Kibber (if road is open)."},
    {"day":5,"title":"Langza & Hikkim in Deep Winter","description":"Walk through knee-deep snow to Langza and Hikkim. See the Buddha statue in snow. Visit the world''s highest post office."},
    {"day":6,"title":"Return to Shimla","description":"Depart Kaza early and drive back to Shimla. This is a long drive on icy roads — 10+ hours."}
  ]'::jsonb,
  to_jsonb(ARRAY['Key Monastery in snow','Frozen Nako Lake','Tabo Monastery in winter','Langza Buddha in snow','Milky Way over frozen Spiti']),
  to_jsonb(ARRAY['5 Nights Accommodation (heated rooms)','All Meals (Breakfast, Lunch & Dinner)','Private 4WD vehicle (mandatory in winter)','Snow chains and emergency equipment','Experienced winter-driving chauffeur']),
  to_jsonb(ARRAY['Specialized winter clothing (available to rent in Shimla)','Personal medications','Travel insurance with emergency evacuation cover','Tips']),
  to_jsonb(ARRAY['Winter Spiti is accessible only via Shimla (Manali route closed Nov–May)','Temperatures drop to -25°C at night — carry extreme cold weather gear','Road closures are common after heavy snowfall — be prepared for delays','Medical help is 5-8 hours away — carry a personal first-aid kit']),
  to_jsonb(ARRAY['Shimla','Reckong Peo','Nako','Tabo','Kaza','Key Monastery','Langza','Shimla']),
  4.8, 93
),

-- 10. Pin Parvati Pass Trek (8N/9D)
(
  'Pin Parvati Pass High Altitude Trek',
  'pin-parvati-pass-trek-9d',
  'One of India''s most challenging and rewarding Himalayan passes connecting the Parvati Valley in Kullu to the Pin Valley in Spiti. For experienced trekkers only.',
  'domestic',
  'Spiti', 'spiti-valley',
  52999, 65999, '8 Nights / 9 Days', 8, 9,
  'Pin Valley, Spiti, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Kasol","description":"Drive from Manali to Kasol in Parvati Valley. Trek briefing and gear check by the guide. Overnight at the guest house."},
    {"day":2,"title":"Kasol to Kheerganga","description":"Begin the trek from Barshaini to Kheerganga through pine forests and waterfalls. Camp overnight at the famous hot springs."},
    {"day":3,"title":"Kheerganga to Thakur Kuan","description":"Trek further into the valley, crossing meadows and glacial streams to reach Thakur Kuan campsite."},
    {"day":4,"title":"Thakur Kuan to Odi Thach","description":"Ascend higher into the Himalayan wilderness. Camp at the scenic Odi Thach meadow."},
    {"day":5,"title":"Odi Thach to Mantalai Lake","description":"Reach the sacred Mantalai Lake — the source of the Parvati River at 4100m. Overnight camp at the lake."},
    {"day":6,"title":"Mantalai to Pin Parvati Pass Base","description":"Trek to the base of the Pin Parvati Pass. Acclimatize and rest. Camp at the glacier base."},
    {"day":7,"title":"Cross Pin Parvati Pass (5319m)","description":"The summit day — cross the Pin Parvati Pass at 5319m. Descend into the Pin Valley on the other side. Camp on the Spiti side."},
    {"day":8,"title":"Descent to Mudh Village","description":"Trek down to Mudh, the last village of the Pin Valley. Overnight in a local homestay."},
    {"day":9,"title":"Mudh to Kaza & Departure","description":"Drive from Mudh to Kaza. Proceed to Manali or Shimla for departure."}
  ]'::jsonb,
  to_jsonb(ARRAY['Pin Parvati Pass (5319m)','Kheerganga Hot Springs','Mantalai Lake','Mudh Village Homestay','Crossing two valleys','Himalayan Glacier Camp']),
  to_jsonb(ARRAY['8 Nights Tented Camps & Homestay','All Meals during trek','Experienced Himalayan trek guide & assistant','High-altitude mountain porter','Safety equipment (ropes, crampons)','Emergency medical kit']),
  to_jsonb(ARRAY['Personal trekking gear (boots, ropes, layers)','Travel insurance with emergency helicopter evacuation','Any extra porter charges','Personal medications','Tips for guide and porter']),
  to_jsonb(ARRAY['This is a grade: Difficult trek — prior Himalayan trekking experience required','Maximum group size: 8 trekkers','Min age: 18 years','Altitude sickness is a serious risk above 4500m']),
  to_jsonb(ARRAY['Manali','Kasol','Kheerganga','Mantalai Lake','Pin Parvati Pass','Mudh','Kaza']),
  4.9, 64
),

-- 11. Spiti Motorcycle Expedition (9N/10D)
(
  'Spiti Valley Motorcycle Expedition',
  'spiti-valley-motorcycle-expedition-10d',
  'Ride through one of the world''s most extreme and breathtaking biking routes. Conquer Kunzum Pass, Rohtang Pass, and the open roads of Spiti on a Royal Enfield.',
  'domestic',
  'Spiti', 'spiti-valley',
  49999, 61999, '9 Nights / 10 Days', 9, 10,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Shimla — Bike Pickup & Briefing","description":"Collect your Royal Enfield from our Shimla depot. Bike check, gear fitting, and route briefing."},
    {"day":2,"title":"Shimla to Sangla","description":"First ride through Kinnaur along the Satluj River. Arrive in beautiful Sangla Valley."},
    {"day":3,"title":"Sangla to Kalpa via Chitkul","description":"Ride to the last village Chitkul and back. Continue to Kalpa for Kinner Kailash sunset views."},
    {"day":4,"title":"Kalpa to Tabo via Nako","description":"Descend into the Spiti River valley. Stop at the Nako Lake. Arrive in Tabo."},
    {"day":5,"title":"Tabo to Kaza via Dhankar","description":"Ride past Dhankar Monastery on the cliff. Arrive in Kaza — the mecca of bikers."},
    {"day":6,"title":"Village Ride — Key, Kibber, Langza","description":"Ride to Key Monastery, Kibber village, and the fossil village of Langza. Interact with local children."},
    {"day":7,"title":"Kaza to Chandratal via Kunzum","description":"The most epic day — cross Kunzum La (4,551m) and ride to Chandratal Lake. Camp overnight."},
    {"day":8,"title":"Chandratal to Manali via Rohtang","description":"Ride over Rohtang Pass and back to civilization in Manali. Bike handover or continue to Delhi."},
    {"day":9,"title":"Manali Rest Day","description":"Rest, service your bike, and explore Manali. Optional Beas River rafting."},
    {"day":10,"title":"Manali to Delhi (Volvo)","description":"Board an overnight Volvo from Manali to Delhi with your gear. Bike returned to depot."}
  ]'::jsonb,
  to_jsonb(ARRAY['Royal Enfield on Kunzum Pass','Chandratal on Bike','Chitkul Ride','Rohtang Pass Crossing','Key Monastery Bike Parking','Biker culture of Kaza']),
  to_jsonb(ARRAY['9 Nights Accommodation (hotels & camps)','Royal Enfield Himalayan 450 / Classic 350 rental','Breakfast and Dinner','Route support vehicle (for breakdowns & luggage)','Riding gear: helmet, knee & elbow guards']),
  to_jsonb(ARRAY['Riding jacket, gloves & boots (own)','Fuel costs (average ₹4,000–6,000 for the circuit)','Rohtang Pass permit','Lunch','Travel insurance with bike accident cover']),
  to_jsonb(ARRAY['Valid driving licence (2-wheeler) mandatory','Prior mountain biking experience recommended','Riding in groups only — no solo ahead of support vehicle','In case of bike breakdown, support vehicle assists']),
  to_jsonb(ARRAY['Shimla','Sangla','Chitkul','Kalpa','Tabo','Kaza','Chandratal','Manali','Delhi']),
  4.8, 221
),

-- 12. Spiti Healing & Wellness Retreat (6N/7D)
(
  'Spiti Healing & Wellness Retreat',
  'spiti-healing-wellness-retreat-7d',
  'A rejuvenating wellness journey in the silence of the cold desert. Tibetan healing practices, monastery meditation, yoga at 4000m, and mindful nature walks.',
  'domestic',
  'Spiti', 'spiti-valley',
  38999, 49999, '6 Nights / 7 Days', 6, 7,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Kaza — Arrival & Rest","description":"Drive from Manali to Kaza. Arrive by evening. Grounding ceremony and introduction to your wellness guide. Early sleep."},
    {"day":2,"title":"Acclimatize with Gentle Morning Walk","description":"Guided nature walk along the Spiti River at sunrise. Afternoon: Tibetan sound healing session. No strenuous activity."},
    {"day":3,"title":"Key Monastery Meditation","description":"Visit Key Gompa for a guided meditation session with a resident monk. Afternoon: Journaling and reflection time by the river."},
    {"day":4,"title":"Langza Buddha & Silent Walk","description":"Hike to Langza village in silence (mindful walk). Sit with the giant Buddha for 30 minutes of silent contemplation. Return."},
    {"day":5,"title":"Yoga at 4000m & Tibetan Medicine Walk","description":"Sunrise yoga session at the camp. Walk with our Tibetan herbalist to identify healing mountain plants."},
    {"day":6,"title":"Dhankar Monastery & Lake Meditation","description":"Drive to Dhankar Monastery. Guided breathwork session at the Dhankar Lake. Return by sunset."},
    {"day":7,"title":"Closing Ceremony & Departure","description":"Closing gratitude circle. Breakfast. Departure to Manali."}
  ]'::jsonb,
  to_jsonb(ARRAY['Tibetan Sound Healing','Monk-guided meditation at Key Monastery','Yoga at 4000m altitude','Tibetan herbalist walk','Mindful walks in total silence','Dhankar Lake breathwork']),
  to_jsonb(ARRAY['6 Nights Accommodation at a boutique Kaza guesthouse','All 3 Meals (sattvic vegetarian)','Private vehicle for all transfers','Wellness guide for full duration','2 Sound Healing sessions','Daily yoga classes']),
  to_jsonb(ARRAY['Personal yoga mat','Travel insurance','Tips','Alcoholic beverages (no alcohol on this retreat)']),
  to_jsonb(ARRAY['This is an alcohol and non-veg free retreat','Digital detox encouraged — minimum phone use','Not suitable for those with serious cardiac conditions at high altitude','Bring a personal journal for the retreat exercises']),
  to_jsonb(ARRAY['Manali','Kaza','Langza','Dhankar','Key Monastery','Manali']),
  4.9, 132
),

-- 13. Quick Spiti Sampler (4N/5D)
(
  'Quick Spiti Long Weekend Sampler',
  'quick-spiti-long-weekend-sampler-5d',
  'Five days is all you need to taste the raw magic of Spiti Valley. Kaza, Key Monastery, and the high-altitude villages — a quick but unforgettable dip into the cold desert.',
  'domestic',
  'Spiti', 'spiti-valley',
  19999, 24999, '4 Nights / 5 Days', 4, 5,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Manali to Kaza (via Kunzum)","description":"Early departure from Manali. Cross Rohtang Pass and Kunzum La. Arrive in Kaza by late afternoon. Rest and acclimatize."},
    {"day":2,"title":"Pin Valley & Mudh Village","description":"Day trip to Pin Valley. Walk through Mudh village — the gateway to the Snow Leopard heartland."},
    {"day":3,"title":"Key Monastery & Kibber","description":"Morning at Key Gompa. Afternoon at Kibber village and Chicham Bridge. Sunset from the monastery."},
    {"day":4,"title":"Hikkim, Komik & Langza","description":"Send a postcard from Hikkim. Explore Komik and Langza. Afternoon rest in Kaza."},
    {"day":5,"title":"Kaza to Manali — Return","description":"Early morning departure. Drive back via Kunzum and Rohtang. Reach Manali by evening."}
  ]'::jsonb,
  to_jsonb(ARRAY['Key Monastery','Kunzum Pass','Kibber Village','Hikkim Post Office','Langza Buddha','Pin Valley']),
  to_jsonb(ARRAY['4 Nights Hotel Stay in Kaza','Breakfast and Dinner','Private Innova for all transfers','Local Kaza guide for 2 days']),
  to_jsonb(ARRAY['Rohtang Pass permit (₹500)','Lunch','Personal expenses','Travel insurance']),
  to_jsonb(ARRAY['This is a fast-paced sampler, not a slow circuit','Acclimatization on Day 1 is mandatory — no hikes on arrival day','Altitude tablets recommended']),
  to_jsonb(ARRAY['Manali','Rohtang Pass','Kunzum La','Kaza','Pin Valley','Key Monastery','Manali']),
  4.7, 388
),

-- 14. Spiti Valley Premium Luxury Circuit (9N/10D)
(
  'Spiti Valley Premium Luxury Circuit',
  'spiti-valley-premium-luxury-10d',
  'The finest way to experience Spiti — boutique eco-stays, curated meals, private chauffeur, photography guide, and exclusive monastery access. A luxury wilderness escape.',
  'domestic',
  'Spiti', 'spiti-valley',
  89999, 110999, '9 Nights / 10 Days', 9, 10,
  'Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Private Helicopter: Shimla to Kaza","description":"Skip the long road and arrive in Kaza via a scenic helicopter flight from Shimla. Check in to the boutique eco-lodge."},
    {"day":2,"title":"Kaza Rest, Spa & Monastery Walk","description":"Indulge in a Tibetan hot stone massage. Gentle evening walk to the local Sakya Monastery. Welcome dinner under the stars."},
    {"day":3,"title":"Pin Valley Private Expedition","description":"Private 4x4 to Pin Valley. Exclusive Snow Leopard tracking session with an expert naturalist guide."},
    {"day":4,"title":"Key Monastery Private Audience","description":"Private sunrise viewing at Key Monastery before tourists arrive. Guided interaction with the head lama. Gourmet packed lunch in the mountains."},
    {"day":5,"title":"Village Photography with a Pro","description":"A professional photographer guides you through Langza and Hikkim for portraits and landscape shots."},
    {"day":6,"title":"Kibber Nature Walk & Glamping","description":"Walk through Kibber village. Afternoon set up at a luxury glamping site near Chicham Bridge."},
    {"day":7,"title":"Chandratal Private Campsite","description":"Exclusive drive to Chandratal Lake. Private luxury tented camp on the lake shore. Champagne sunset."},
    {"day":8,"title":"Chandratal Sunrise & Manali Drive","description":"Exclusive golden-hour access to the lake. Drive to Manali and check in to a 5-star spa hotel."},
    {"day":9,"title":"Manali Spa & Leisure Day","description":"Full spa day at your premium Manali hotel. Optional Solang Valley excursion or Beas River fly fishing."},
    {"day":10,"title":"Departure","description":"Departure by private charter or first class Volvo from Manali to Delhi."}
  ]'::jsonb,
  to_jsonb(ARRAY['Private helicopter Shimla–Kaza','Exclusive Key Monastery access','Snow Leopard tracking','Chandratal glamping','Pro photography session','Tibetan hot stone massage']),
  to_jsonb(ARRAY['9 Nights Boutique/Luxury Accommodation','All gourmet meals (Breakfast, Lunch & Dinner)','Private Innova Crysta with dedicated chauffeur','Professional photography guide (2 days)','Tibetan spa sessions (2)','All permits and entry fees']),
  to_jsonb(ARRAY['Helicopter costs (included for upgrade — see note)','Personal shopping','Alcoholic beverages beyond welcome package','Tips (at your discretion)']),
  to_jsonb(ARRAY['Helicopter availability subject to weather and pre-booking (60 days advance)','Luxury does not guarantee 5-star amenities in remote Spiti — expect premium rustic comfort','Emergency medical evacuation by helicopter is included in the package']),
  to_jsonb(ARRAY['Shimla','Kaza','Pin Valley','Key Monastery','Kibber','Chandratal','Manali']),
  5.0, 42
),

-- 15. Tabo to Kaza Slow Travel (7N/8D)
(
  'Tabo to Kaza Slow Spiti Journey',
  'tabo-to-kaza-slow-spiti-journey-8d',
  'A slow, immersive journey from the ancient Tabo Monastery to the heart of Spiti at Kaza. Ideal for travellers who want depth over distance and authentic experiences.',
  'domestic',
  'Spiti', 'spiti-valley',
  26999, 33999, '7 Nights / 8 Days', 7, 8,
  'Tabo & Kaza, Spiti Valley, Himachal Pradesh',
  '/images/placeholder.svg', '[]'::jsonb,
  '[
    {"day":1,"title":"Shimla to Nako","description":"Depart Shimla. Cross into the Spiti district and arrive at the tranquil Nako village. Evening walk around Nako Lake."},
    {"day":2,"title":"Nako to Tabo","description":"Short morning drive to Tabo. Spend the entire afternoon and evening at the Tabo Monastery complex — murals, caves, and shrines."},
    {"day":3,"title":"Tabo Rest & Cave Exploration","description":"A relaxed day in Tabo. Morning cave meditation session. Afternoon: help with the monastery''s community kitchen if permitted."},
    {"day":4,"title":"Tabo to Dhankar","description":"Drive to Dhankar Monastery. Trek to Dhankar Lake and back. Overnight in Dhankar."},
    {"day":5,"title":"Dhankar to Kaza","description":"Arrive in Kaza. Explore the Kaza market and the local Sakya Monastery. Check in and rest."},
    {"day":6,"title":"Pin Valley Day Trip","description":"Full-day excursion to Pin Valley National Park and Mudh village. Return to Kaza."},
    {"day":7,"title":"Key, Kibber & High Villages","description":"Visit Key Monastery. Drive to Kibber, Gette, and Tashigang villages. Evening in Kaza."},
    {"day":8,"title":"Kaza to Manali","description":"Early morning departure via Kunzum Pass and Rohtang Pass. Arrive in Manali by evening."}
  ]'::jsonb,
  to_jsonb(ARRAY['Tabo Monastery Cave Meditation','Nako Lake Evening Walk','Dhankar Lake Trek','Pin Valley National Park','Key Monastery','Kaza Market Experience']),
  to_jsonb(ARRAY['7 Nights Accommodation (guesthouses & homestays)','Breakfast and Dinner','Private vehicle for all transfers','Local guide for monastery and cave tours']),
  to_jsonb(ARRAY['Lunch','Inner line permit (if required)','Travel insurance','Personal expenses']),
  to_jsonb(ARRAY['Tabo Monastery is a working religious site — dress modestly','Photography inside the main shrine hall not permitted','This trip is designed to be unhurried — embrace slow mornings']),
  to_jsonb(ARRAY['Shimla','Nako','Tabo','Dhankar','Kaza','Pin Valley','Key Monastery','Manali']),
  4.8, 167
);