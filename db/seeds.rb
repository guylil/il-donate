campaign = Campaign.find_or_initialize_by(slug: "help-coral-reef-eilat")
campaign.update!(
  title: "Help the Coral Reef in Eilat",
  organization_name: "Eilat Marine Nature Reserve",
  organization_description: "The Eilat Marine Nature Reserve is dedicated to protecting the northernmost coral reef in the world. Located in the Gulf of Aqaba, this unique ecosystem hosts over 250 species of coral and 1,200 species of fish. Our mission is to preserve this natural treasure for future generations through research, conservation, and education.",
  description: <<~TEXT,
    The coral reef in Eilat is one of the most unique marine ecosystems in the world. As the northernmost coral reef on the planet, it serves as a critical habitat for hundreds of species of fish, corals, and marine life found nowhere else in the Mediterranean.

    In recent years, the reef has faced unprecedented challenges. Rising water temperatures, pollution, and increased human activity have put immense pressure on this fragile ecosystem. Coral bleaching events have become more frequent, and we've lost nearly 15% of our living coral cover in the past decade alone.

    But there is hope.

    With your help, we can:
    • Restore damaged coral sections through our innovative nursery program
    • Expand our marine monitoring and research efforts
    • Run educational programs for local schools and community groups
    • Implement sustainable tourism practices that protect the reef

    Your donation directly funds coral restoration dives, scientific research equipment, and community education initiatives. Every contribution, no matter the size, brings us one step closer to saving this underwater treasure.

    Join us in protecting the Coral Reef of Eilat — because when the reef thrives, we all thrive.
  TEXT
  cover_pic_name: "Gulf_of_Eilat_(Red_Sea)_coral_reefs.jpg",
  goal_amount: 500_000,
  amount_raised: 289_500,
  status: "active"
)

campaign2 = Campaign.find_or_initialize_by(slug: "help-the-dead-sea")
campaign2.update!(
  title: "Help the Dead Sea",
  organization_name: "Dead Sea Preservation Trust",
  organization_description: "The Dead Sea Preservation Trust is committed to safeguarding one of the world's most unique natural wonders. Through scientific monitoring, public advocacy, and rehabilitation projects, we work to slow the ecological decline of the Dead Sea and preserve its cultural and environmental heritage for future generations.",
  description: <<~TEXT,
    The Dead Sea is Earth's lowest point at 430 meters below sea level, and one of the saltiest bodies of water on the planet — 34.2% salinity, 9.6 times saltier than the ocean. Its extreme environment makes it a natural wonder unlike any other.

    But the Dead Sea is dying. Its water level is dropping by over one meter every year. The surface area has shrunk from 1,050 km² in 1930 to just 605 km² today — a loss of over 40%. The main cause is the diversion of the Jordan River, its primary water source, for agriculture and industry. The results are devastating: receding shorelines, thousands of sinkholes, and the collapse of unique ecosystems.

    With your help, we can:
    • Fund scientific research to monitor the Dead Sea's changing conditions
    • Advocate for sustainable water management in the Jordan River basin
    • Develop rehabilitation plans for affected ecosystems
    • Educate the public about the importance of this global treasure

    Your donation directly supports monitoring stations, conservation research, and community outreach programs. Every contribution helps fight for the future of this irreplaceable natural wonder.

    Join us in saving the Dead Sea — because some things are worth preserving for all humanity.
  TEXT
  cover_pic_name: "Dead_Sea_Jordan_01.jpg",
  goal_amount: 500_000,
  amount_raised: 145_000,
  status: "active"
)

campaign3 = Campaign.find_or_initialize_by(slug: "help-sea-turtles")
campaign3.update!(
  title: "Help the Sea Turtles",
  organization_name: "Israel Nature and Parks Authority",
  organization_description: "The Israel Nature and Parks Authority (INPA) is responsible for protecting Israel's natural heritage. Since 1999, INPA has operated the National Sea Turtle Rescue Center in Michmoret, treating and rehabilitating injured sea turtles. Through nest relocation programs, marine reserves, and public education, INPA works tirelessly to save sea turtles from extinction.",
  description: <<~TEXT,
    Sea turtles have existed for over 200 million years, but today all seven species worldwide are endangered. In Israel, two species nest on our beaches: the green sea turtle (Chelonia mydas) and the loggerhead (Caretta caretta). Only about 450 green turtle females remain in the entire Mediterranean — and fewer than 15 nest on Israeli shores.

    From the moment they hatch, sea turtles face impossible odds. Only 1 in 100 hatchlings survives to adulthood. They navigate by moonlight toward the sea, but coastal lights from roads, restaurants, and buildings disorient them, sending them toward danger instead of the water.

    The threats don't end at the shoreline. Adult turtles are caught in fishing nets, entangled in plastic waste, hit by boat propellers, and lose their nesting beaches to coastal development. Many arrive at the rescue center with hooks embedded in their throats or shells cracked by propellers.

    With your help, we can:
    • Operate the National Sea Turtle Rescue Center's rehabilitation program
    • Protect nests through our annual relocation and hatchery project
    • Run the Green Turtle breeding core for reintroduction into the wild
    • Monitor nesting beaches and safeguard them during breeding season
    • Educate the public and reduce light pollution on nesting beaches

    Your donation directly funds medical treatment for injured turtles, hatchery operations, scientific monitoring, and community awareness programs. Every contribution saves a life.

    Join us in protecting Israel's sea turtles — because every turtle matters.
  TEXT
  cover_pic_name: "turtle_Mydas.JPG",
  goal_amount: 250_000,
  amount_raised: 78_000,
  status: "active"
)

puts "Seeded campaign: #{campaign.title} (#{campaign.slug})"
puts "Seeded campaign: #{campaign2.title} (#{campaign2.slug})"
puts "Seeded campaign: #{campaign3.title} (#{campaign3.slug})"
