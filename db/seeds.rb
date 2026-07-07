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
  goal_amount: 300_000,
  amount_raised: 89_250,
  status: "active"
)

puts "Seeded campaign: #{campaign.title} (#{campaign.slug})"
