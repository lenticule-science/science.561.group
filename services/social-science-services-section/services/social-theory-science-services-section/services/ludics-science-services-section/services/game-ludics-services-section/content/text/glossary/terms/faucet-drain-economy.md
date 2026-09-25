---
name: "Faucet and Drain Economy"
description: "The design vocabulary, coined by Zachary Booth Simpson from Ultima Online's economic failures, for a virtual economy's points of resource creation (faucets) and resource destruction (drains or sinks)."
instance-of: concept
date-created: 2026-08-22
references:
  simpson1999:
    authors: ["Zachary Booth Simpson"]
    title: "The In-game Economics of Ultima Online"
    publication: "Origin Research Fellow report, presented at Computer Game Developer's Conference 2000"
    year: 1999
  ivanik2023:
    authors: ["Ivan Ivanik"]
    title: "Monetary Value of a Player in GTA Online: Role of Inflation"
    publication: "MSc Degree Project in Economics, Umeå University"
    year: 2023
---

The faucet-and-drain vocabulary was coined by Zachary Booth Simpson in "The In-game Economics of Ultima Online" (Origin Research Fellow report, 1999; presented at CGDC 2000), the founding document of this whole tradition and unusually candid because Simpson wrote it as an Origin employee documenting his own team's mistakes in real time. A faucet introduces new resources into the economy from nothing, at a roughly constant rate; a drain, or sink, is a terminal point where items are simply destroyed, removing them from circulation permanently.

The vocabulary was born from a documented failure, not designed in advance. Ultima Online's original economy was a closed loop: all resource drains fed back to the top of the system, on the theory that a fixed quantity of resources circulating from abstract to concrete and back would prevent inflation. It failed completely, but not through inflation — through hoarding. Resources accumulated in player inventories and simply sat there; the game's bank of virtual resources dried up, monsters stopped spawning loot, and, in Simpson's words, "the world became boring and the players began to complain loudly." The fix replaced the closed loop with an explicit faucet and drain. Simpson is explicit that fixing hoarding is a political problem rather than a technical one: designers know the available mechanisms — taxes, decay, maintenance fees — but "many of these drains feel too much like real world 'work' and are therefore politically unacceptable."

UO's economy demonstrated a second, related failure at the same time. NPC shopkeepers ran "a very complicated artificial intelligence algorithm to simulate supply and demand," but because players had a non-demand incentive to produce — an "improve-by-doing" skill system meant abilities improved through use regardless of whether the resulting output could be sold — overproduction crashed prices and the shopkeepers "went broke." Simpson's verdict: "central planning doesn't work." His proposed remedy anticipates the observational apparatus this section documents under game-telemetry: tracking player-to-player, player-to-NPC, and player-to-vendor trades, vendor and account stock levels, inflow and outflow, and player churn — turning the operator into a standing observer of the economy's own state, not a one-time designer of it.

The same logic reappears decades later in the GTA Online literature. Ivan Ivanik's 2023 Umeå University thesis frames GTA Online explicitly as a monopoly economy, where the publisher is the sole retailer of virtual goods and currency, and reapplies Simpson's subsidy-requires-a-sink logic with real-money Shark Cards functioning as the faucet's on-ramp — see whale for the thesis's own counterintuitive finding about who those purchases actually correlate with. The same political reluctance Simpson documents around unpopular in-world drains — taxes, decay, maintenance costs — reappears in the dark-pattern literature's account of monetization design built around real-money purchases rather than unpopular in-world costs.
