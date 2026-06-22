
-- ============================================================
-- 360 Travellers — package seed data
-- Adds 16 packages (8 domestic + 8 international).
-- All use the local placeholder image; swap image_url per row
-- with your Supabase Storage URLs once uploaded:
--   https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/packages/<file>
--
-- Safe to re-run: rows are matched by title and skipped if present.
-- ============================================================

insert into public.packages (title, description, category, price, duration, image_url, itinerary)
select v.title, v.description, v.category, v.price, v.duration, v.image_url, v.itinerary
from (values
  -- ---------------- DOMESTIC (India) ----------------
  (
    'Ladakh Adventure Expedition',
    'High-altitude desert, turquoise lakes and ancient monasteries — a road trip through Leh, Nubra and the unreal blue of Pangong Tso.',
    'domestic', 27999, '6 Nights / 7 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Leh","description":"Acclimatise at 11,500 ft. Easy evening stroll through Leh market."},
      {"day":2,"title":"Leh Monasteries","description":"Thiksey, Hemis and Shey monasteries, plus the Shanti Stupa at sunset."},
      {"day":3,"title":"Leh to Nubra Valley","description":"Cross Khardung La, one of the world''s highest passes. Camel ride on Hunder dunes."},
      {"day":4,"title":"Nubra to Pangong","description":"Drive to the famous Pangong Tso, changing colours through the day."},
      {"day":5,"title":"Pangong to Leh","description":"Sunrise by the lake, return via Chang La with photo stops."},
      {"day":6,"title":"Sham Valley","description":"Magnetic Hill, Gurudwara Pathar Sahib and the Indus-Zanskar confluence."},
      {"day":7,"title":"Departure","description":"Transfer to Leh airport."}
    ]'::jsonb
  ),
  (
    'Spiti Valley Circuit',
    'Cold desert mountains, cliff-side monasteries and the world''s highest villages on a rugged Himalayan loop.',
    'domestic', 24490, '7 Nights / 8 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Shimla Arrival","description":"Meet and overnight in colonial-era Shimla."},
      {"day":2,"title":"Shimla to Kalpa","description":"Drive along the Sutlej with apple orchards and Kinnaur Kailash views."},
      {"day":3,"title":"Kalpa to Tabo","description":"Enter Spiti; visit the 1,000-year-old Tabo monastery."},
      {"day":4,"title":"Tabo to Kaza","description":"Dhankar monastery and the Pin Valley en route."},
      {"day":5,"title":"Key & Kibber","description":"Iconic Key monastery and Kibber, one of the highest villages."},
      {"day":6,"title":"Chandratal Lake","description":"Drive to the moon lake; camp under brilliant night skies."},
      {"day":7,"title":"Chandratal to Manali","description":"Cross Kunzum and Rohtang passes into Manali."},
      {"day":8,"title":"Departure","description":"Transfer onward from Manali."}
    ]'::jsonb
  ),
  (
    'Kerala Backwaters & Hills',
    'Houseboats on palm-fringed canals, tea-carpeted hills and spice gardens across God''s own country.',
    'domestic', 32999, '5 Nights / 6 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Kochi","description":"Fort Kochi, Chinese fishing nets and a Kathakali performance."},
      {"day":2,"title":"Kochi to Munnar","description":"Drive up to tea country with waterfall stops."},
      {"day":3,"title":"Munnar","description":"Tea museum, Eravikulam National Park and rolling plantations."},
      {"day":4,"title":"Munnar to Thekkady","description":"Spice plantation tour and a Periyar lake cruise."},
      {"day":5,"title":"Alleppey Houseboat","description":"Overnight on a private houseboat through the backwaters."},
      {"day":6,"title":"Departure","description":"Disembark and transfer to Kochi airport."}
    ]'::jsonb
  ),
  (
    'Rajasthan Royal Heritage',
    'Forts, palaces and desert dunes across the pink, blue and golden cities of regal Rajasthan.',
    'domestic', 41999, '6 Nights / 7 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Jaipur","description":"The Pink City; evening at a local bazaar."},
      {"day":2,"title":"Jaipur Sightseeing","description":"Amber Fort, Hawa Mahal and City Palace."},
      {"day":3,"title":"Jaipur to Jodhpur","description":"Drive to the Blue City with a stop at Pushkar."},
      {"day":4,"title":"Jodhpur","description":"Mehrangarh Fort and the old town''s indigo lanes."},
      {"day":5,"title":"Jodhpur to Jaisalmer","description":"Into the Thar; sunset camel safari on the dunes."},
      {"day":6,"title":"Jaisalmer","description":"Golden fort, havelis and a desert camp night."},
      {"day":7,"title":"Departure","description":"Transfer to Jaisalmer station/airport."}
    ]'::jsonb
  ),
  (
    'Andaman Islands Getaway',
    'White-sand beaches, coral reefs and turquoise lagoons across Havelock and Neil islands.',
    'domestic', 36500, '4 Nights / 5 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Port Blair","description":"Cellular Jail and the evening light-and-sound show."},
      {"day":2,"title":"Havelock Island","description":"Ferry across; sunset at Radhanagar Beach."},
      {"day":3,"title":"Scuba & Snorkel","description":"Reef diving and snorkeling in clear lagoons."},
      {"day":4,"title":"Neil Island","description":"Natural Bridge and Bharatpur Beach."},
      {"day":5,"title":"Departure","description":"Return ferry and flight home."}
    ]'::jsonb
  ),
  (
    'Meghalaya Living Roots Trek',
    'Living root bridges, the cleanest village in Asia and rain-washed waterfalls in the abode of clouds.',
    'domestic', 29999, '5 Nights / 6 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Guwahati","description":"Transfer to Shillong via Umiam Lake."},
      {"day":2,"title":"Shillong","description":"Elephant Falls, Shillong Peak and local cafes."},
      {"day":3,"title":"Cherrapunji","description":"Nohkalikai Falls and Mawsmai caves."},
      {"day":4,"title":"Double-Decker Root Bridge","description":"Trek to Nongriat''s living root bridge."},
      {"day":5,"title":"Mawlynnong & Dawki","description":"Asia''s cleanest village and crystal-clear Umngot river."},
      {"day":6,"title":"Departure","description":"Return to Guwahati for departure."}
    ]'::jsonb
  ),
  (
    'Coorg Coffee Country Retreat',
    'Misty hills, coffee estates and cardamom-scented forests in Karnataka''s Scotland of India.',
    'domestic', 19999, '3 Nights / 4 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Coorg","description":"Estate check-in and a guided coffee plantation walk."},
      {"day":2,"title":"Waterfalls & Views","description":"Abbey Falls and Raja''s Seat sunset point."},
      {"day":3,"title":"Dubare & Monastery","description":"Elephant camp at Dubare and the Golden Temple at Bylakuppe."},
      {"day":4,"title":"Departure","description":"Leisurely breakfast and transfer out."}
    ]'::jsonb
  ),
  (
    'Sikkim & Darjeeling Hills',
    'Kanchenjunga sunrises, toy trains and Buddhist monasteries across the eastern Himalaya.',
    'domestic', 28499, '5 Nights / 6 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Gangtok","description":"Transfer from Bagdogra; evening at MG Marg."},
      {"day":2,"title":"Tsomgo Lake","description":"Day trip to the glacial Tsomgo Lake and Baba Mandir."},
      {"day":3,"title":"Gangtok to Pelling","description":"Scenic drive; Pemayangtse monastery."},
      {"day":4,"title":"Pelling to Darjeeling","description":"Cross into West Bengal''s queen of hills."},
      {"day":5,"title":"Tiger Hill Sunrise","description":"Kanchenjunga at dawn and a toy-train joyride."},
      {"day":6,"title":"Departure","description":"Transfer to Bagdogra airport."}
    ]'::jsonb
  ),

  -- ---------------- INTERNATIONAL ----------------
  (
    'Dubai City of Gold',
    'Skyline thrills, desert dunes and gold-souk glamour in the dazzling heart of the UAE.',
    'international', 89999, '5 Nights / 6 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Dubai","description":"Evening dhow cruise dinner on Dubai Creek."},
      {"day":2,"title":"City Tour","description":"Burj Khalifa, Dubai Mall fountains and the gold souk."},
      {"day":3,"title":"Desert Safari","description":"Dune bashing, camel ride and a BBQ desert camp."},
      {"day":4,"title":"Abu Dhabi Day Trip","description":"Sheikh Zayed Grand Mosque and Ferrari World."},
      {"day":5,"title":"Leisure & Shopping","description":"Palm Jumeirah, Atlantis and last-minute shopping."},
      {"day":6,"title":"Departure","description":"Airport transfer."}
    ]'::jsonb
  ),
  (
    'Singapore City Explorer',
    'Futuristic gardens, island fun and a melting-pot food scene in the Lion City.',
    'international', 78999, '4 Nights / 5 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Singapore","description":"Marina Bay and the Spectra light show."},
      {"day":2,"title":"City Highlights","description":"Gardens by the Bay, Merlion Park and Chinatown."},
      {"day":3,"title":"Sentosa Island","description":"Universal Studios and the SkyHelix."},
      {"day":4,"title":"Culture & Shopping","description":"Little India, Orchard Road and a night safari."},
      {"day":5,"title":"Departure","description":"Transfer to Changi airport."}
    ]'::jsonb
  ),
  (
    'Thailand Beaches & Temples',
    'Golden temples, floating markets and island-hopping across Bangkok, Phuket and Phi Phi.',
    'international', 69999, '6 Nights / 7 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Bangkok","description":"Settle in; evening at Asiatique riverfront."},
      {"day":2,"title":"Bangkok Temples","description":"Grand Palace, Wat Arun and a floating market."},
      {"day":3,"title":"Fly to Phuket","description":"Patong Beach and Bangla Road nightlife."},
      {"day":4,"title":"Phi Phi Islands","description":"Speedboat tour to Maya Bay and snorkeling."},
      {"day":5,"title":"Phang Nga Bay","description":"James Bond Island and sea-cave canoeing."},
      {"day":6,"title":"Leisure Day","description":"Optional spa day or Old Phuket town."},
      {"day":7,"title":"Departure","description":"Airport transfer."}
    ]'::jsonb
  ),
  (
    'Switzerland Alpine Dream',
    'Snow peaks, glacier trains and storybook lakeside towns across the Swiss Alps.',
    'international', 224999, '7 Nights / 8 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Zurich","description":"Old town walk and lakeside evening."},
      {"day":2,"title":"Lucerne","description":"Chapel Bridge and a Lake Lucerne cruise."},
      {"day":3,"title":"Mount Titlis","description":"Rotair cable car and the cliff walk."},
      {"day":4,"title":"Interlaken","description":"Between two lakes; optional paragliding."},
      {"day":5,"title":"Jungfraujoch","description":"Top of Europe by cogwheel train."},
      {"day":6,"title":"Zermatt","description":"Matterhorn views and Gornergrat railway."},
      {"day":7,"title":"Geneva","description":"Jet d''Eau and lakeside leisure."},
      {"day":8,"title":"Departure","description":"Transfer to Geneva airport."}
    ]'::jsonb
  ),
  (
    'Vietnam Heritage Trail',
    'Limestone bays, lantern-lit old towns and bustling deltas from Hanoi to Ho Chi Minh.',
    'international', 74999, '6 Nights / 7 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Hanoi","description":"Old Quarter walk and a water-puppet show."},
      {"day":2,"title":"Halong Bay","description":"Overnight cruise among the limestone karsts."},
      {"day":3,"title":"Cruise & Caves","description":"Kayaking and Sung Sot cave before returning to Hanoi."},
      {"day":4,"title":"Fly to Da Nang","description":"Golden Bridge at Ba Na Hills."},
      {"day":5,"title":"Hoi An","description":"Lantern-lit ancient town and tailor shops."},
      {"day":6,"title":"Ho Chi Minh City","description":"Cu Chi tunnels and the War Remnants museum."},
      {"day":7,"title":"Departure","description":"Airport transfer."}
    ]'::jsonb
  ),
  (
    'Bali & Nusa Islands',
    'Rice terraces, volcano sunrises and island lagoons across Bali and Nusa Penida.',
    'international', 71999, '5 Nights / 6 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive in Bali","description":"Seminyak beach club sunset."},
      {"day":2,"title":"Ubud Culture","description":"Tegallalang terraces and the monkey forest."},
      {"day":3,"title":"Mount Batur","description":"Sunrise volcano trek and hot springs."},
      {"day":4,"title":"Nusa Penida","description":"Kelingking Beach and Angel''s Billabong."},
      {"day":5,"title":"Temples & Spa","description":"Tanah Lot and a traditional Balinese spa."},
      {"day":6,"title":"Departure","description":"Airport transfer."}
    ]'::jsonb
  ),
  (
    'Japan Cherry Blossom Tour',
    'Neon cities, serene shrines and pink-blossom gardens from Tokyo to Kyoto.',
    'international', 198999, '7 Nights / 8 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Tokyo","description":"Shinjuku lights and an izakaya dinner."},
      {"day":2,"title":"Tokyo Highlights","description":"Sensoji temple, Shibuya and Meiji shrine."},
      {"day":3,"title":"Mount Fuji","description":"Hakone and lake Ashi with Fuji views."},
      {"day":4,"title":"Bullet Train to Kyoto","description":"Fushimi Inari''s torii gates."},
      {"day":5,"title":"Kyoto Temples","description":"Kinkaku-ji and Arashiyama bamboo grove."},
      {"day":6,"title":"Nara Day Trip","description":"Todai-ji temple and the deer park."},
      {"day":7,"title":"Osaka","description":"Dotonbori and Osaka castle."},
      {"day":8,"title":"Departure","description":"Transfer to Kansai airport."}
    ]'::jsonb
  ),
  (
    'Paris & French Riviera',
    'Iconic landmarks, art and azure-coast glamour from Paris to Nice.',
    'international', 184999, '6 Nights / 7 Days', '/images/placeholder.svg',
    '[
      {"day":1,"title":"Arrive Paris","description":"Seine river cruise and Eiffel Tower by night."},
      {"day":2,"title":"Paris Icons","description":"Louvre, Notre-Dame and the Champs-Elysees."},
      {"day":3,"title":"Versailles","description":"Palace and gardens day trip."},
      {"day":4,"title":"Train to Nice","description":"Promenade des Anglais and old town."},
      {"day":5,"title":"Monaco & Eze","description":"Monte Carlo casino and the hilltop village of Eze."},
      {"day":6,"title":"Cannes","description":"Riviera leisure and seaside dining."},
      {"day":7,"title":"Departure","description":"Transfer to Nice airport."}
    ]'::jsonb
  )
) as v(title, description, category, price, duration, image_url, itinerary)
where not exists (
  select 1 from public.packages p where p.title = v.title
);
