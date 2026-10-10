---
title: "Note on Farstone as a flagship MMORPG that is sold, self-hosted and grows sci-fi wings"
description: "What Farstone is in the Leader's words (the Group's flagship browser MMORPG, MUD and whatever else a game can be), how a persistent world is sold both as a game and as server access, how a fantasy world grows a spaceflight region, and how media made for another channel becomes game media; with what the house's theory says, what the field has done, and what stays open."
date-created: 2026-10-10
type: note
authors:
  - lenticule-science-senior
keywords:
  - farstone
  - mmorpg
  - mud
  - persistent-world
  - self-hosting
  - server-access
  - sci-fi-wings
  - generated-media
x-provenance:
  pass: farstone-ksp-2
  request: debt-2026-10-09-leader-words-held-in-corpus
  utterances:
    - "ni:///sha-256;6xGuWyJF8FUCGtwmYxBv6ERAsei0kNVQOSWi1JzlTn8"
    - "ni:///sha-256;nX48bLCnuNp5CmJtvTkkWMiGVq0Qx4iE3B0bKTQvRVc"
    - "ni:///sha-256;OyRuhOjz7BSMjgw3xQW_EXV83l4yIlR4iv-xC_noRnI"
    - "ni:///sha-256;jix-Y4T6lU-sewMnwLvVlZYjvoI0d0W3Zj67ap8Tqi8"
    - "ni:///sha-256;XsCg9q5v4CHtS8YLqwgB-E8LEN97f9CrcuoIXtkJwuE"
    - "ni:///sha-256;YOE2FgbeX_jrVNu9J_kSpO4KLY7vUv_3WGmRXDOr-Wo"
  sibling-pass: "farstone-ksp-1 holds the Kerbal Space Program research and the orbital game's specification; this note holds every other Farstone idea and refers to that pass for orbital mechanics."
---

## What the Leader has said Farstone is

Farstone is the 561 Group's flagship MMORPG (2026-10-05, 2026-10-10). It is "our browser-based MMORPG/MUD/whatever-else-I-want-in-a-game" (2026-10-08): a single world that is played in the browser, that is also a MUD, and that is open to any further kind of play the Leader wants in it. The genre list is open by design; no one genre bounds the world.

Farstone is a product. The Leader asked that folk be able to download and run it, and that the Group "think much more like 'okay this is a game we can like, sell, sell server access to'" (2026-10-08). Two things are sold: the game, and access to servers running it.

Farstone is to grow sci-fi wings. A Kerbal Space Program-like spaceflight game inside Farstone is "part of how we justify our weird little MMORPG growing sci-fi wings" (2026-10-10). The Leader pictures orbital launch platforms as one kind of ship that folk build (2026-10-08). The spaceflight game is therefore a region of Farstone's own world, not a separate product beside it.

Farstone is the pressure that moves the rest of the house (2026-10-08): its spaceflight game presses on the bespoke 3D graphics engine; the whole effort presses upstream into the code already held, into agentic orchestration (research, then specification, SAS, HLD, LLD and engineering, as one endeavor run by a fleet), into how data is written, formatted, addressed and persisted on a holder's own drive at least cost to the Group, into CPU, networking and memory profiling with autonomous recursive self-improvement, and into finding the "equally weird and deep theory" for each field the way the house has theories of electronic design automation and protein folding. Holofoam is to become the physics simulation engine rather than a browser toy; Durante, Abrash and the other game engines are to be actually used, held in proper repositories on proper upstream software; and everything is SignCells at the end of the day, "that's what lets this foam and semiotics stuff happen everywhere". The MetroPlat servers on Bare Cedar Fog and Cold Red Gate are to earn whatever the other software work gains, including richer graphical representations of the 561 Group Semioverse, the content-addressed foam of semiotic cells the Group has constructed and recorded.

The lane map of 2026-10-03 names lane 9 "Engine and Farstone: qwzspace, and a flagship world that runs without a hand on it". A flagship world, in the house's sense, runs its clock, its people and its events with no operator acting.

The burndown of 2026-10-09 orders Farstone's product work after the house's repair sprints, and orders it within itself: "Farstone. The 3D view, then a downloadable build."

Media made for one channel can serve Farstone. On 2026-10-05 the Leader judged that a video channel for Sigrid Song would be a bad channel to make, that Sigrid Song does not need the generated material made for it, and that the videos read as AI-made; and decided that any of those pieces not focused on the aerial bridge (Duluth's Aerial Lift Bridge, the setting of *Ice Out*) could be media for Farstone.

## What the house's theory already says

- The house holds a QBN (quality-based narrative) redesign of Farstone (`notes/recovered/2026-08-19-note-on-farstone-qbn-design.md`, this section) and a status note (`notes/recovered/planned/2026-08-19-note-on-farstone-legacy-status.md`). Its thesis is that content is what the fold settles to: Building Permit #23 ages past its window and settles to ⊤ with no scripted rule. A world that runs without a hand is that thesis at scale: events are settlings of the world's own records under its clock.
- `2026-08-22-note-on-persistent-world-foundations.md` (this section) states what persistence does to play: no reset and no final position, and the difference between a game and a world. Farstone is a world in that sense; its spaceflight region and its MUD face are two ways into one persistent world.
- The games-as-counter-web doctrine (`notes/recovered/2026-08-19-note-on-games-as-counter-web.md`) states what the games fleet sells: witnessed play, with replay verification as proof of attention. A self-hosted Farstone server sells the same thing when its history is content-addressed and replayable.
- Durante (`durante.play.561.group`) shows a level settling from the federated union of players' traces on Abrash. A world hosted on many buyers' servers is a federation of traces in the same algebra; the house's federation theory (`2026-10-09-note-on-capabilities-and-federation-between-metroplat-nodes.md`, computer-science section) is the protocol side.
- QwzSpace is the house's realtime game engine (fixed tick as a transaction boundary over an append-only trace, rooms, resume, replay-verifiable rooms, a scene module with render tiers). Holofoam is a SignCraft simulation engine whose experiments are content-addressed histories replayed bit-identically. Both already treat a world as a history of cells, which is what "everything should be SignCells" asks.

## What the field has done

- **Selling a world twice, as an MMO and as a self-hosted copy.** Wurm Online's makers released Wurm Unlimited on Steam on 21 October 2015 (about USD 30): a near-full copy of the MMO's engine that plays locally and lets buyers host persistent servers, not linked to the official servers, developed in parallel with the MMO, which kept time-limited exclusive features. Its last Steam beta is reported as January 2020 and community mods carry it since; the self-hosted copy outlived its makers' attention because buyers held the servers. (mmos.com, "Wurm Unlimited Brings Wurm Online To A Local Setting" and "Wurm Unlimited Launches On Steam"; wurmpedia.com "Wurm Unlimited"; supercraft.host, 2026 roadmap article, a hosting seller.)
- **Selling the game and letting buyers or rented hosts run the server.** Eco (Strange Loop Games) ships a server tool to buyers through Steam or its own site; the server needs a Strange Loop Games account to launch, which keeps the maker in the trust path of every self-hosted world; third-party hosts rent servers. (IONOS Digital Guide "How to host your own Eco server"; loafhosts.com setup guide; supercraft.host wiki.) Minecraft, Terraria and Valheim follow the same pattern: the server is free with the game, and the maker or rented hosts sell convenience (for Minecraft, the Realms subscription).
- **MUDs.** Commercial MUDs (Iron Realms' Achaea and its siblings) are free to play and sell in-game credits; the DikuMUD lineage's licence forbids commercial use, which is why the house's own MUD engine line matters for a sold Farstone.
- **Fantasy worlds growing spaceflight.** Galacticraft gave Minecraft rockets, a Moon, Mars and space stations as a mod in the same world rather than a separate game; it is the nearest precedent for a fantasy-first world growing sci-fi wings by a buildable-rocket region. The orbital game itself is held by pass farstone-ksp-1.
- **Generated media in a sold game.** Since 10 January 2024 Steam's content survey asks developers to disclose AI use, split into pre-generated content (made with AI tools during development; the developer promises it is lawful, non-infringing and consistent with marketing) and live-generated content (made while the game runs; the developer describes its guardrails), and shows the disclosure on the store page. Later reporting says Valve narrowed what must be disclosed; the date of that revision was not confirmed. (The Register, 2024-01-10; TechRadar; mobilesyrup, 2024-01-10.) The house rule is to disclose AI only where a platform or law requires it; a Steam release of Farstone carrying the Sigrid Song material is such a place.

## What follows for Farstone

1. The product is two artefacts sold from one world: a downloadable game that runs on the player's own machine, and a server that a buyer runs or rents. The Wurm precedent shows the self-hosted copy must be the same engine as the flagship world, or the two diverge; the house's answer is that both are the same SignCell history engine, and a buyer's world federates with the flagship by the substrate's algebra rather than by a maker-held account gate.
2. A world that runs without a hand is a world whose events are settlings of its own records under its own tick; the operator's role is to admit law, not to drive play.
3. The spaceflight region is entered from the same world and the same character; orbital launch platforms are built ships in that world.
4. Generated media taken from another channel enters Farstone only where its subject is free of that channel's setting, and carries the disclosure the distributing platform requires.

## Open questions

- Which content wells from the legacy MUD (seed island, harbor, tale, wild) carry into the world that runs without a hand, and which are retired?
- Is federation between a buyer's server and the flagship world wanted, or are self-hosted worlds closed copies as in Wurm Unlimited?
- What does a buyer of server access pay, and per what (world, slot, month)? The house holds no offer yet.
- Which of the Sigrid Song pieces exist and where are they held? None is in the superrepo; the generated media sat in the Notebook and Flow pools' outputs.
- How does the MUD face present the spaceflight region in text?
