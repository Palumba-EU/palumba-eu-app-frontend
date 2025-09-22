import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:palumba_eu/data/manager/data_manager.dart';
import 'package:palumba_eu/data/model/election.dart';
import 'package:palumba_eu/data/model/elections_response.dart';
import 'package:palumba_eu/data/model/goingToVote_model.dart';
import 'package:palumba_eu/data/model/localization_data.dart';
import 'package:http/http.dart' as http;
import 'package:palumba_eu/data/model/responses_patch_request.dart';
import 'package:palumba_eu/data/model/responses_request.dart';
import 'package:palumba_eu/data/model/responses_response.dart';
import 'package:palumba_eu/data/model/results_data.dart';
import 'package:palumba_eu/data/model/sponsors_data.dart';
import 'package:palumba_eu/data/model/statements_data.dart';
import 'package:palumba_eu/data/model/user_model.dart';
import 'package:palumba_eu/data/repositories/local/local_data_repository.dart';
import 'package:palumba_eu/utils/managers/election_manager.dart';
import 'package:palumba_eu/utils/managers/language_manager.dart';
import 'package:palumba_eu/utils/managers/user_manager.dart';

class DataAPI {
  var baseUrl = 'https://api.palumba-app.palumba.eu';
  // var baseUrl = 'https://palumba-staging.bitperfect-software.com/api';

var mock_localizations = '''
{
  "countries": [
    { "id": 101, "name": "Manhattan", "country_code": "MN", "flag_image": null },
    { "id": 102, "name": "Brooklyn", "country_code": "BK", "flag_image": null },
    { "id": 103, "name": "Queens", "country_code": "QN", "flag_image": null },
    { "id": 104, "name": "The Bronx", "country_code": "BX", "flag_image": null },
    { "id": 105, "name": "Staten Island", "country_code": "SI", "flag_image": null }
  ],
  "languages": [
    { "id": 1, "name": "English", "language_code": "en" },
    { "id": 2, "name": "Spanish", "language_code": "es-US" }
  ]
}
''';

  var mock_statements = '''
{
  "data": [
    {
      "id": 32,
      "statement": "Tutorial statement: I’m unsure who to vote for in the November NYC election.",
      "details": "<p>Welcome! You’ll see short, plain-language statements on big New York City issues. Tap agree/disagree, then read quick explainers with pros & cons.</p>",
      "footnote": "<p>Tip: You can change your answers anytime.</p>",
      "emojis": "🤷‍♂️🗳️🗽",
      "weights": [],
      "is_tutorial": true
    },
    {
      "id": 34,
      "statement": "NYC should legalize more housing near transit by allowing taller, denser buildings.",
      "details": "<p><strong>What this means:</strong> Upzoning around subway and bus hubs so more apartments can be built.<br><strong>Pros:</strong> Increases supply, can lower pressure on rents, supports car-free living.<br><strong>Cons:</strong> Concerns about neighborhood character, shadows, and infrastructure strain.</p>",
      "footnote": "<p>Key topics: housing supply, zoning, transit-oriented development.</p>",
      "emojis": "🏗️🚇🏙️",
      "weights": [
        {"topic_id": 10, "weight": 70},
        {"topic_id": 9,  "weight": 40},
        {"topic_id": 12, "weight": 10},
        {"topic_id": 11, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 35,
      "statement": "NYC should implement congestion pricing in Manhattan’s central business district.",
      "details": "<p><strong>What this means:</strong> Charging most vehicles to enter parts of Manhattan to reduce traffic and fund transit.<br><strong>Pros:</strong> Less gridlock and pollution; dedicated revenue for subways & buses.<br><strong>Cons:</strong> Added costs for drivers and some businesses; questions about exemptions and fairness.</p>",
      "footnote": "<p>Key topics: transit funding, traffic, air quality.</p>",
      "emojis": "🚗💳🚦",
      "weights": [
        {"topic_id": 9,  "weight": 80},
        {"topic_id": 10, "weight": -30},
        {"topic_id": 12, "weight": 10},
        {"topic_id": 11, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 33,
      "statement": "The city should expand rent protections like ‘Good Cause’ and strengthen enforcement against illegal evictions.",
      "details": "<p><strong>What this means:</strong> Limiting large rent hikes and making it harder to evict tenants without a valid reason.<br><strong>Pros:</strong> Helps tenants stay housed; stability for families.<br><strong>Cons:</strong> Landlords say it can discourage maintenance and new construction.</p>",
      "footnote": "<p>Key topics: tenant rights, affordability, small landlords.</p>",
      "emojis": "🏠🧾🛡️",
      "weights": [
        {"topic_id": 10, "weight": -80},
        {"topic_id": 11, "weight": -40},
        {"topic_id": 9,  "weight": 0},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 36,
      "statement": "NYC should invest more in shelters and legal aid for newly arrived asylum seekers while speeding work authorization help.",
      "details": "<p><strong>What this means:</strong> More funding for intake, case management, and legal services; city support navigating federal work permits.<br><strong>Pros:</strong> Reduces street homelessness and speeds self-sufficiency.<br><strong>Cons:</strong> Budget trade-offs; concerns about city capacity.</p>",
      "footnote": "<p>Key topics: immigration, city budget, shelters.</p>",
      "emojis": "🛬🛏️📄",
      "weights": [
        {"topic_id": 13, "weight": 90},
        {"topic_id": 11, "weight": -70},
        {"topic_id": 10, "weight": -30},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 9,  "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 37,
      "statement": "Close Rikers Island on schedule and replace it with smaller borough-based facilities and expanded diversion/mental-health care.",
      "details": "<p><strong>What this means:</strong> Phasing out the Rikers jail complex; building smaller jails closer to courts; expanding treatment and alternatives to detention.<br><strong>Pros:</strong> Safety, oversight, and access to services may improve; reduces abuses.<br><strong>Cons:</strong> Construction costs; local siting opposition; public safety concerns.</p>",
      "footnote": "<p>Key topics: criminal justice, mental health, capital projects.</p>",
      "emojis": "🏝️🔒🏥",
      "weights": [
        {"topic_id": 11, "weight": -80},
        {"topic_id": 10, "weight": -20},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 13, "weight": -10},
        {"topic_id": 9,  "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 38,
      "statement": "Make the subway and buses faster and more reliable by prioritizing bus lanes, signal upgrades, and better station staffing.",
      "details": "<p><strong>What this means:</strong> More dedicated bus lanes & camera enforcement; modern train signals; platform staffing for safety and cleanliness.<br><strong>Pros:</strong> Shorter commutes, higher ridership, economic benefits.<br><strong>Cons:</strong> Construction disruption; trade-offs with street parking and car lanes.</p>",
      "footnote": "<p>Key topics: public transit, street design, commute times.</p>",
      "emojis": "🚌🚦⏱️",
      "weights": [
        {"topic_id": 9,  "weight": 40},
        {"topic_id": 10, "weight": 20},
        {"topic_id": 12, "weight": 10},
        {"topic_id": 11, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 39,
      "statement": "Expand protected bike lanes and redesign dangerous corridors to cut traffic deaths (‘Vision Zero’).",
      "details": "<p><strong>What this means:</strong> More physically protected bike/scooter lanes, safer intersections, and lower speed limits on high-injury streets.<br><strong>Pros:</strong> Fewer crashes; more options beyond cars; cleaner air.<br><strong>Cons:</strong> Fewer car lanes/parking; construction impacts; delivery logistics.</p>",
      "footnote": "<p>Key topics: street safety, micromobility, freight/delivery.</p>",
      "emojis": "🚴‍♀️🛣️🛑",
      "weights": [
        {"topic_id": 9,  "weight": 60},
        {"topic_id": 10, "weight": -10},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 11, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 40,
      "statement": "Fully fund smaller class sizes and school supports without cutting arts, after-school, or special education services.",
      "details": "<p><strong>What this means:</strong> Hiring teachers and staff so classes shrink; protecting enrichment and mandated services.<br><strong>Pros:</strong> Better student outcomes; more attention per child.<br><strong>Cons:</strong> Higher recurring costs; hiring and space constraints.</p>",
      "footnote": "<p>Key topics: education funding, equity, class-size law.</p>",
      "emojis": "🏫📚👩‍🏫",
      "weights": [
        {"topic_id": 11, "weight": -40},
        {"topic_id": 10, "weight": -50},
        {"topic_id": 12, "weight": 10},
        {"topic_id": 9,  "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 41,
      "statement": "Accelerate building decarbonization by enforcing Local Law 97 while offering bigger incentives for retrofits.",
      "details": "<p><strong>What this means:</strong> Pollution caps for large buildings with fines for exceedances, paired with rebates/financing to upgrade heating, insulation, and controls.<br><strong>Pros:</strong> Cleaner air, lower emissions, long-term energy savings.<br><strong>Cons:</strong> Upfront costs for owners; co-op/condo affordability concerns.</p>",
      "footnote": "<p>Key topics: climate, buildings, energy bills.</p>",
      "emojis": "🏢🌿⚡",
      "weights": [
        {"topic_id": 9,  "weight": 100},
        {"topic_id": 10, "weight": -40},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 11, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 42,
      "statement": "Roll out containerized trash and citywide composting faster to get garbage bags off sidewalks and cut rats.",
      "details": "<p><strong>What this means:</strong> Using sealed containers and curbside organics pickup across neighborhoods.<br><strong>Pros:</strong> Cleaner streets, fewer pests, climate benefits from composting.<br><strong>Cons:</strong> Space and cost for containers; building logistics.</p>",
      "footnote": "<p>Key topics: sanitation, public health, quality of life.</p>",
      "emojis": "🗑️🧰🪳",
      "weights": [
        {"topic_id": 9,  "weight": 40},
        {"topic_id": 10, "weight": -10},
        {"topic_id": 11, "weight": 0},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 43,
      "statement": "Create and preserve more supportive and affordable housing, including legalizing safe basement/ADU apartments.",
      "details": "<p><strong>What this means:</strong> Fund and zone for supportive housing with onsite services; allow code-compliant basement and accessory units.<br><strong>Pros:</strong> Moves people from shelters to homes; adds lower-cost units quickly.<br><strong>Cons:</strong> Upfront subsidies; safety upgrades and inspections required.</p>",
      "footnote": "<p>Key topics: homelessness, ADUs, services.</p>",
      "emojis": "🏠🧑‍⚕️🧱",
      "weights": [
        {"topic_id": 10, "weight": 30},
        {"topic_id": 11, "weight": -30},
        {"topic_id": 9,  "weight": 10},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 13, "weight": 0}
      ],
      "is_tutorial": false
    },
    {
      "id": 44,
      "statement": "Shift some NYPD responsibilities (mental-health crises, traffic enforcement) to civilian teams while keeping focused crime enforcement.",
      "details": "<p><strong>What this means:</strong> Pilot/responders like clinicians for certain 911 calls; automated or civilian traffic enforcement; NYPD remains focused on serious crime.<br><strong>Pros:</strong> Frees officers for priority work; better outcomes in health-related calls.<br><strong>Cons:</strong> Implementation risk; union and legal concerns; coordination complexity.</p>",
      "footnote": "<p>Key topics: public safety, crisis response, budgets.</p>",
      "emojis": "🚓🧑‍⚕️📞",
      "weights": [
        {"topic_id": 11, "weight": -60},
        {"topic_id": 10, "weight": 0},
        {"topic_id": 12, "weight": 0},
        {"topic_id": 9,  "weight": 0},
        {"topic_id": 13, "weight": -10}
      ],
      "is_tutorial": false
    }
  ]
}
''';


    var mock_results_info = '''
{
  "topics": [
    {
      "id": 9,
      "name": "Climate & Resiliency (NYC)",
      "icon": "TBD",
      "color": "#248f2f",
      "extreme1": "Opposing Climate Action 😌",
      "extreme1_emojis": "🌍 💪 🚫",
      "extreme1_details": "<p>You prefer minimal regulation and prioritize economic growth and personal freedom over city-led climate rules. You oppose measures like congestion pricing, building emissions caps, and gas hook-up bans if they raise costs or limit choice.</p><p><strong>#GrowthOverClimate #FreeSpirit</strong></p>",
      "extreme2": "Climate Action 🌱",
      "extreme2_emojis": "🌍 🌊 🌳 ",
      "extreme2_details": "<p>You want aggressive climate policy from City Hall: expanding bike/bus lanes, flood protections, building decarbonization, and zero-emission transit—arguing resilience and clean air outweigh short-term costs.</p><p><strong>#ClimateActionNow #PlanetFirst</strong></p>",
      "associated_statements": [34, 35, 38, 39, 41, 42, 43]
    },
    {
      "id": 12,
      "name": "City–State–Federal Relations",
      "icon": "TBD",
      "color": "#2742cf",
      "extreme1": "Local Control First",
      "extreme1_emojis": "🛡️ 🏛️ 👑",
      "extreme1_details": "<p>You want NYC to maximize home rule—less Albany or Washington interference. You oppose state preemptions on issues like congestion pricing, zoning, or criminal justice, and prefer NYC-crafted solutions.</p><p><strong>#HomeRule #NYCDecides</strong></p>",
      "extreme2": "Intergovernmental Integration",
      "extreme2_emojis": "🏙️🇺🇸 🧩 🏗️",
      "extreme2_details": "<p>You see coordination with New York State and the federal government as essential—accepting shared standards and funding strings to solve big problems like transit, housing, and public safety.</p><p><strong>#TeamNY #PartnershipsWork</strong></p>",
      "associated_statements": [34, 35, 38, 40]
    },
    {
      "id": 11,
      "name": "Social Values",
      "icon": "TBD",
      "color": "#B8A4CC",
      "extreme1": "Social Justice ☀️",
      "extreme1_emojis": "👨‍👩‍👧‍👦 🛡️ 🏛️",
      "extreme1_details": "<p>You emphasize civil rights, LGBTQ+ equality, racial justice, reproductive freedom, and policing reforms. You support city programs that protect marginalized New Yorkers.</p><p><strong>#EqualRightsForEveryone #DiversityWins</strong></p>",
      "extreme2": "Traditional Values 💪",
      "extreme2_emojis": "🌈 ✊🏿 ⚖️",
      "extreme2_details": "<p>You feel cultural change is moving too fast and want to emphasize public order, parental control in schools, and preserving traditional norms; you’re wary of expanding certain city protections.</p><p><strong>#PreserveTradition #OrderFirst</strong></p>",
      "associated_statements": [33, 36, 37, 40, 43, 44]
    },
    {
      "id": 13,
      "name": "Immigration & Sanctuary City",
      "icon": "TBD",
      "color": "#c71666",
      "extreme1": "Enforcement-First",
      "extreme1_emojis": "🇺🇸🛡️🧱",
      "extreme1_details": "<p>You favor stricter limits on NYC’s sanctuary policies, stronger coordination with federal authorities, and prioritizing city resources for longtime residents; you worry about shelter costs and capacity.</p><p><strong>#NYCSafety #SecureBorders</strong></p>",
      "extreme2": "Welcoming City",
      "extreme2_emojis": "🌎🤝🇺🇸",
      "extreme2_details": "<p>You support a strong right-to-shelter, expanded work authorization assistance, legal services, and integration programs—arguing immigrants strengthen NYC’s economy and culture.</p><p><strong>#OpenArms #WelcomeNewYorkers</strong></p>",
      "associated_statements": [36, 44]
    },
    {
      "id": 10,
      "name": "Economy, Cost of Living & Housing",
      "icon": "TBD",
      "color": "#389bd1",
      "extreme1": "Tax the Wealthy",
      "extreme1_emojis": "🔧 🌳 🌈",
      "extreme1_details": "<p>You back progressive taxation, rent protections, city-owned services (e.g., public groceries), and robust labor standards to make NYC affordable for workers and families.</p><p><strong>#PeopleOverProfits #FairShare</strong></p>",
      "extreme2": "Deregulation",
      "extreme2_emojis": "🏦 📈 💰",
      "extreme2_details": "<p>You emphasize cutting red tape, speeding permits, easing mandates, and lowering business costs to spur growth, build more housing, and expand jobs.</p><p><strong>#EconomicGrowth #TheInvisibleHand</strong></p>",
      "associated_statements": [33, 34, 35, 38, 40, 41, 42, 43]
    }
  ],
  "parties": [
    {
      "id": 101,
      "name": "Democratic Party (Zohran Mamdani)",
      "color": "#1E5AA7",
      "logo": "TBD",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.zohranfornyc.com/",
      "acronym": "DEM",
      "answers": [
        {"statement_id": 34, "answer": 0.5},
        {"statement_id": 35, "answer": 1},
        {"statement_id": 33, "answer": 1},
        {"statement_id": 36, "answer": 1},
        {"statement_id": 37, "answer": 1},
        {"statement_id": 38, "answer": 1},
        {"statement_id": 39, "answer": 1},
        {"statement_id": 40, "answer": 1},
        {"statement_id": 41, "answer": 1},
        {"statement_id": 42, "answer": 1},
        {"statement_id": 43, "answer": 1},
        {"statement_id": 44, "answer": 1}
      ],
      "positions": [],
      "in_parliament": false,
      "unavailable_in": []
    },
    {
      "id": 102,
      "name": "Independent (Eric Adams)",
      "color": "#2AACAC",
      "logo": "TBD",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://eric2025.com/",
      "acronym": "IND-ADAMS",
      "answers": [
        {"statement_id": 34, "answer": 0.5},
        {"statement_id": 35, "answer": 0},
        {"statement_id": 33, "answer": -0.5},
        {"statement_id": 36, "answer": 0},
        {"statement_id": 37, "answer": -0.5},
        {"statement_id": 38, "answer": 1},
        {"statement_id": 39, "answer": 0.5},
        {"statement_id": 40, "answer": 0.5},
        {"statement_id": 41, "answer": 0},
        {"statement_id": 42, "answer": 1},
        {"statement_id": 43, "answer": 0.5},
        {"statement_id": 44, "answer": -0.5}
      ],
      "positions": [],
      "in_parliament": false,
      "unavailable_in": []
    },
    {
      "id": 103,
      "name": "Republican Party (Curtis Sliwa)",
      "color": "#C82333",
      "logo": "TBD",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.sliwafornyc.com/",
      "acronym": "REP",
      "answers": [
        {"statement_id": 34, "answer": -0.5},
        {"statement_id": 35, "answer": -1},
        {"statement_id": 33, "answer": -1},
        {"statement_id": 36, "answer": -1},
        {"statement_id": 37, "answer": -1},
        {"statement_id": 38, "answer": 0.5},
        {"statement_id": 39, "answer": -1},
        {"statement_id": 40, "answer": 0.5},
        {"statement_id": 41, "answer": -1},
        {"statement_id": 42, "answer": 0},
        {"statement_id": 43, "answer": 0.5},
        {"statement_id": 44, "answer": -1}
      ],
      "positions": [],
      "in_parliament": false,
      "unavailable_in": []
    },
    {
      "id": 104,
      "name": "Independent (Andrew Cuomo)",
      "color": "#800080",
      "logo": "TBD",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "https://www.andrewcuomo.com/",
      "acronym": "IND-CUOMO",
      "answers": [
        {"statement_id": 34, "answer": 0.5},
        {"statement_id": 35, "answer": 0.5},
        {"statement_id": 33, "answer": 0},
        {"statement_id": 36, "answer": 0},
        {"statement_id": 37, "answer": 0},
        {"statement_id": 38, "answer": 1},
        {"statement_id": 39, "answer": 0.5},
        {"statement_id": 40, "answer": 0.5},
        {"statement_id": 41, "answer": 0.5},
        {"statement_id": 42, "answer": 1},
        {"statement_id": 43, "answer": 1},
        {"statement_id": 44, "answer": -0.5}
      ],
      "positions": [],
      "in_parliament": false,
      "unavailable_in": []
    },
    {
      "id": 105,
      "name": "Conservative Party (Irene Estrada)",
      "color": "TBD",
      "logo": "TBD",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "TBD",
      "acronym": "CON",
      "answers": [
        {"statement_id": 34, "answer": -0.5},
        {"statement_id": 35, "answer": -1},
        {"statement_id": 33, "answer": -1},
        {"statement_id": 36, "answer": -1},
        {"statement_id": 37, "answer": -1},
        {"statement_id": 38, "answer": 0},
        {"statement_id": 39, "answer": -1},
        {"statement_id": 40, "answer": 0},
        {"statement_id": 41, "answer": -1},
        {"statement_id": 42, "answer": 0},
        {"statement_id": 43, "answer": 0},
        {"statement_id": 44, "answer": -1}
      ],
      "positions": [],
      "in_parliament": false,
      "unavailable_in": []
    },
    {
      "id": 106,
      "name": "Quality of Life Party (Joseph Hernandez)",
      "color": "TBD",
      "logo": "TBD",
      "local_parties": [],
      "policies": [],
      "images": [],
      "link": "TBD",
      "acronym": "QOL",
      "answers": [
        {"statement_id": 34, "answer": 0},
        {"statement_id": 35, "answer": -0.5},
        {"statement_id": 33, "answer": 0},
        {"statement_id": 36, "answer": -0.5},
        {"statement_id": 37, "answer": -0.5},
        {"statement_id": 38, "answer": 1},
        {"statement_id": 39, "answer": -0.5},
        {"statement_id": 40, "answer": 0.5},
        {"statement_id": 41, "answer": 0},
        {"statement_id": 42, "answer": 1},
        {"statement_id": 43, "answer": 0.5},
        {"statement_id": 44, "answer": -0.5}
      ],
      "positions": [],
      "in_parliament": false,
      "unavailable_in": []
    }
  ]
}
''';


    var mock_sponsors = '''
{
  "data": [
    {
      "id": 1,
      "name": "NYC Campaign Finance Board",
      "logo": "https://www.nyccfb.info/images/nyccfb-logo.png",
      "link": "https://www.nyccfb.info",
      "banner_image": "https://www.nyccfb.info/images/elections-banner.jpg",
      "banner_link": "https://www.nyccfb.info",
      "banner_description": "<p>Official guide to NYC elections and campaign financing for the 2025 mayoral race.</p>",
      "category": "main partner"
    },
    {
      "id": 2,
      "name": "League of Women Voters NYC",
      "logo": "https://www.lwvnyc.org/images/lwvnyc-logo.png",
      "link": "https://www.lwvnyc.org",
      "banner_image": "https://www.lwvnyc.org/images/voter-guide-banner.jpg",
      "banner_link": "https://www.lwvnyc.org",
      "banner_description": "<p>Nonpartisan voter education and debate organizer for the NYC 2025 elections.</p>",
      "category": "civic partner"
    },
    {
      "id": 3,
      "name": "WNYC / Gothamist",
      "logo": "https://media.wnyc.org/i/800/800/l/80/1/WNYC_LOGO.jpg",
      "link": "https://gothamist.com",
      "banner_image": "https://media.wnyc.org/i/1500/900/c/80/1/election-coverage.jpg",
      "banner_link": "https://gothamist.com/tags/elections",
      "banner_description": "<p>Media partner providing coverage, debates, and analysis of the mayoral race.</p>",
      "category": "media partner"
    },
    {
      "id": 4,
      "name": "NY1 Spectrum News",
      "logo": "https://ny1.com/images/ny1-logo.png",
      "link": "https://ny1.com",
      "banner_image": "https://ny1.com/images/election-night-coverage.jpg",
      "banner_link": "https://ny1.com",
      "banner_description": "<p>Broadcast partner for live debates and election night results.</p>",
      "category": "media partner"
    },
    {
      "id": 5,
      "name": "Common Cause New York",
      "logo": "https://www.commoncause.org/wp-content/uploads/2021/03/common-cause-logo.png",
      "link": "https://www.commoncause.org/new-york/",
      "banner_image": "https://www.commoncause.org/wp-content/uploads/2021/03/voting-rights.jpg",
      "banner_link": "https://www.commoncause.org/new-york/",
      "banner_description": "<p>Advocacy group promoting transparency and civic participation in NYC elections.</p>",
      "category": "advocacy partner"
    },
    {
      "id": 6,
      "name": "Citizens Union of the City of New York",
      "logo": "https://citizensunion.org/wp-content/uploads/2020/01/CU-logo.png",
      "link": "https://citizensunion.org",
      "banner_image": "https://citizensunion.org/wp-content/uploads/2021/09/elections-nyc.jpg",
      "banner_link": "https://citizensunion.org",
      "banner_description": "<p>Independent civic organization providing policy analysis and voter guides.</p>",
      "category": "civic partner"
    },
    {
      "id": 7,
      "name": "NYC Votes",
      "logo": "https://nycvotes.org/assets/images/nycvotes-logo.png",
      "link": "https://nycvotes.org",
      "banner_image": "https://nycvotes.org/assets/images/voting-nyc.jpg",
      "banner_link": "https://nycvotes.org",
      "banner_description": "<p>Official voter engagement initiative of the NYC Campaign Finance Board.</p>",
      "category": "main partner"
    }
  ]
}

''';

    var mock_election = '''
{
  "data": [
    {
      "id": 2,
      "name": "Deutschlandwahl 2025",
      "date": "2025-02-23",
      "country": {
        "id": 11,
        "name": "Germany",
        "country_code": "de",
        "flag_image": "https://storage.palumba-app.palumba.eu/flags/de.svg"
      },
      "egg_screen": {
        "title": "Surprise! You've received a free youth card.",
        "description": "<p>Click below to claim it!&nbsp;</p>",
        "image": "https://storage.palumba-app.palumba.eu/elections/egg_screen/01JMF5QVGFEV472N2HP8NTKM4K.jpeg",
        "yes_btn_text": "Claim ",
        "yes_btn_link": "https://docs.google.com/forms/d/e/1FAIpQLSd_sRJWKOlNKDZXq4u_Zxf_XafnunCtWr4wZPLRNM-EWTcdog/viewform?usp=header",
        "no_btn_text": "Close "
      },
      "local_party_screen": {
        "logo": "https://storage.palumba-app.palumba.eu/elections/local_party_screen/01JMF5WBXFW1VV4CF6RTTZXKRC.png",
        "text": "In Collaboration with Brand New Bundestag ",
        "link": "https://brandnewbundestag.de/"
      }
    },
    {
      "id": 1,
      "name": "European elections 2024",
      "date": "2024-06-06",
      "country": null,
      "egg_screen": {
        "title": "Surprise! You've received a free youth card",
        "description": "<p>Click below to claim it!&nbsp;</p>",
        "image": "https://storage.palumba-app.palumba.eu/elections/egg_screen/01JMF5SWXWXB028PDTTEW2DQ2B.jpeg",
        "yes_btn_text": "Claim ",
        "yes_btn_link": "https://docs.google.com/forms/d/e/1FAIpQLSd_sRJWKOlNKDZXq4u_Zxf_XafnunCtWr4wZPLRNM-EWTcdog/viewform?usp=header",
        "no_btn_text": "Close"
      },
      "local_party_screen": {
        "logo": null,
        "text": null,
        "link": null
      }
    },
    {
      "id": 3,
      "name": "New York City mayoral election 2025",
      "date": "2025-11-04",
      "country": {
        "id": 840,
        "name": "United States",
        "country_code": "us",
        "flag_image": "https://storage.palumba-app.palumba.eu/flags/us.svg"
      },
      "egg_screen": {
        "title": "Surprise! You've received a free youth card.",
        "description": "<p>Click below to claim it!&nbsp;</p>",
        "image": "https://storage.palumba-app.palumba.eu/elections/egg_screen/NYC2025-mayoral.jpeg",
        "yes_btn_text": "Claim ",
        "yes_btn_link": "https://vote.nyc",
        "no_btn_text": "Close"
      },
      "local_party_screen": {
        "logo": "https://storage.palumba-app.palumba.eu/elections/local_party_screen/NYC2025-logo.png",
        "text": "NYC Votes",
        "link": "https://vote.nyc/elections"
      }
    }
  ]
}

''';

  var headers = {
    'Accept': 'application/json',
  };

  String urlLang() {
    return baseUrl + '/${LanguageManager.currentLanguage}/';
  }

  String urlLangAndEl() {
    return urlLang() +
        'elections/${ElectionManager.currentElection.value.backend}/';
  }

  Future<LocalizationData?> fetchLocalizations() async {
    try {
      // TODO Clean this up when backend is updated
      var response_body = "";
      if (ElectionManager.currentElection.value.backend == 3) {
        response_body = mock_localizations;
      } else {
        final url = Uri.parse('${urlLangAndEl()}' 'localization');
        final response = await http.get(
          url,
          headers: headers,
        );

        if (response.statusCode != 200) {
          throw Exception(response.reasonPhrase);
        }
        response_body = response.body;
      }

      var localization = LocalizationData.fromJson(json.decode(response_body));
      DataManager().setLanguages(localization.languages ?? []);
      DataManager().setCountries(localization.countries);
      return localization;
    } catch (e) {
      return null;
    }
  }

  Future<StatementsData?> fetchStatements() async {
    try {
      // TODO Clean this up when backend is updated
      var response_body = "";
      if (ElectionManager.currentElection.value.backend == 3) {
        response_body = mock_statements;
      } else {
        final url = Uri.parse('${urlLangAndEl()}' 'statements?include_tutorial');
        final response = await http.get(
          url,
          headers: headers,
        );

        if (response.statusCode != 200) {
          throw Exception(response.reasonPhrase);
        }
        response_body = response.body;
      }
      
      var statements = StatementsData.fromJson(json.decode(response_body));
      DataManager().setStatements(statements.data);
      return statements;
    } catch (e) {
      return null;
    }
  }

  Future<ResultsData?> fetchResultsInfo() async {
    try {
      // TODO Clean this up when backend is updated
      var response_body = "";
      if (ElectionManager.currentElection.value.backend == 3) {
        response_body = mock_results_info;
      } else {
        final url = Uri.parse('${urlLangAndEl()}' 'results');
        final response = await http.get(
          url,
          headers: headers,
        );

        if (response.statusCode != 200) {
          throw Exception(response.reasonPhrase);
        }
        
        response_body = response.body;
      } 

      var results = ResultsData.fromJson(json.decode(response_body));
      DataManager().setParties(results.parties);
      DataManager().setTopics(results.topics);
      return results;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to load results info response");
      return null;
    }
  }

  Future<SponsorsData?> fetchSponsors() async {
    try {
       // TODO Clean this up when backend is updated
      var response_body = "";
      if (ElectionManager.currentElection.value.backend == 3) {
        response_body = mock_sponsors;
      } else {
        final url = Uri.parse('${urlLangAndEl()}' 'sponsors');
        final response = await http.get(
          url,
          headers: headers,
        );

        if (response.statusCode != 200) {
          throw Exception(response.reasonPhrase);
        }
        response_body = response.body;
      }
      var sponsors = SponsorsData.fromJson(json.decode(response_body));
      DataManager().setSponsors(sponsors.data);
      return sponsors;
    } catch (e) {
      return null;
    }
  }

  Future<int?> fetchStatistics() async {
    try {
      final url = Uri.parse('${baseUrl}/statistics');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(response.reasonPhrase);
      }

      var data = json.decode(response.body);
      return data['responses_last_24h'];
    } catch (e) {
      return null;
    }
  }

  Future<ResponsesResponse?> postResponses() async {
    try {
      final url = Uri.parse('${baseUrl}/responses');
      var body = UserManager.userData.toJson();

      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(body));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }
      var responsesResponse =
          ResponsesResponse.fromJson(json.decode(response.body));
      LocalDataRepository().currentResponseData = responsesResponse.toJson();
      return responsesResponse;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to load responses response");
      return null;
    }
  }

  Future<bool> patchResponses(GoingToVote goingToVote) async {
    try {
      var id = await LocalDataRepository().getCurrentResponseUuid();
      final url = Uri.parse('${baseUrl}/responses/${id}');
      var request = ResponsesPatchRequest(goingToVote: goingToVote);

      final response = await http.patch(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(request.toJson()));

      if (response.statusCode < 200 || response.statusCode > 201) {
        throw Exception(response.reasonPhrase);
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to patch going to vote question");
      return false;
    }
  }

  Future<bool> postResponsesAnswer(Answer answer) async {
    try {
      // TODO: Revert when backend is updated
      // var id = await LocalDataRepository().getCurrentResponseUuid();
      // final url = Uri.parse('${baseUrl}/responses/${id}/answers');
      // var request = ResponsesRequest(answers: [answer]);

      // final response = await http.post(url,
      //     headers: {
      //       'Content-Type': 'application/json',
      //     },
      //     body: json.encode(request.toJson()));

      // if (response.statusCode < 200 || response.statusCode > 201) {
      //   throw Exception(response.reasonPhrase);
      // }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to post answer");
      return false;
    }
  }

  Future<ElectionResponse?> getElection() async {
    try {
      // TODO Clean this up when backend is updated
      var response_body = "";
      if (ElectionManager.currentElection.value.backend == 3) {
        response_body = mock_election;
      } else {
        final url = Uri.parse('${urlLang()}elections');

        final response = await http.get(url, headers: {
          'Content-Type': 'application/json',
        });

        if (response.statusCode < 200 || response.statusCode > 201) {
          throw Exception(response.reasonPhrase);
        }
        response_body = response.body;
      }
      

      var electionsResponse =
          ElectionsResponse.fromJson(json.decode(response_body));
      var electionResponse = electionsResponse.data.firstWhere(
          (er) => er.id == ElectionManager.currentElection.value.backend);
      ElectionManager.eggInfo = electionResponse.eggScreen;
      ElectionManager.localPartyScreen = electionResponse.localPartyScreen;
      ElectionManager.electionDate = electionResponse.date;
      return electionResponse;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("failed to get election");
      return null;
    }
  }
}
