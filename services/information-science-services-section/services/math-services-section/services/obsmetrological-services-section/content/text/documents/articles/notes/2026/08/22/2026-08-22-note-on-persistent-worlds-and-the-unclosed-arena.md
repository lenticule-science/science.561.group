---
name: note-on-persistent-worlds-and-the-unclosed-arena
description: >-
  Survey note welding the corpus's ludic apparatus (the arena theorem, the
  magic circle as admission codec, Caillois's four categories as the four
  regimes, deep play as codec breach, Sutton-Smith's ambiguity as H¹) to the
  externally gathered literature on online web games and persistent worlds —
  the games whose settling never reaches a fixed point. Contributes: the
  persistence thesis stated from four independent registers; a refinement of
  the single admission codec into Stenros's bubble/contract/arena triple with
  Goffman's transformation-membrane; the finding that state-based CRDT merge
  is the settlement operator's algebra by literal external theorem while
  rollback netcode is a documented counterexample at the presentation level;
  the LambdaMOO arc and the god problem as settlement-authority case law; the
  operator as a standing observation organ and boredom as premature closure;
  and idle play as settlement in the player's absence. Every cross-domain
  resonance is graded: theorem, established external result, reported at
  second hand, or rhyme.
date-created: 2026-08-22
keywords:
  - obsmetrologia
  - ludics
  - persistent-world
  - arena
  - settlement
  - magic-circle
  - crdt
  - rollback-netcode
  - interest-management
  - governance
  - telemetry
  - idle-games
  - playbour
---

# Persistent Worlds and the Unclosed Arena

**Abstract.** The corpus already holds a serious theory of play: the [arena theorem](../../07/07/2026-07-07-note-on-obsmetrologia-arenas.md) packages the finite settled polarized site-arena from formalized constituents, and the [Mysterious Machines monograph](../../06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md) reads Huizinga's magic circle as the admission codec, Caillois's four categories as the four regimes, Suits's lusory attitude as strategy-receptivity, Sutton-Smith's ambiguity as the obstruction H¹, and Geertz's deep play as a codec breach. This note sets that package against the externally gathered literature on online web games and persistent worlds — gathered and adversarially critiqued 2026-08-22 across six angles (foundations, boundary, web temporality, distributed substrate, governance, measurement) — because persistent worlds are exactly the case the corpus's finite apparatus does not yet cover: games with no maximal position, whose settling never reaches a fixed point and whose circle never dissolves. Grading discipline as in [the study of five](./2026-08-22-note-on-the-study-of-five.md): every cross-domain claim below is marked **[theorem]** (proved in a cited formal source), **[established]** (published external result, read directly in this sweep), **[reported]** (relayed at second hand; flagged), or **[rhyme]** (structural resonance proposed by this note, not present in the source). Nothing here is claimed as a new theorem of Obsmetrologia.

## 1. The persistence thesis

The definitional literature states the note's premise before the mathematics does. Bartle's five necessary conditions for a virtual world make persistence co-equal, not decorative: "the environment continues to exist and develop internally... even when there are no people interacting with it" **[established]**. Castronova's 2001 economic definition turns on the same clause: "the program continues to run whether anyone is using it or not; it remembers the location of people and things, as well as the ownership of objects" **[established]**. Bell's 2008 synthesis definition glosses what this does to the player's standing: "No longer is one participant the center of the world but a member of a dynamic community and evolving economy. A participant has a sense the systems in the space... exist with or without a participant's presence" **[established]**. Koster's operator's law supplies the practical face: "Once you open your online world, expect to keep your team on it indefinitely. Some of these games have never closed" **[established]** — and it is Koster, not Bartle, who states the categorical form ("It's a WORLD. Not a game"); the sweep's critic confirmed no such phrase occurs in Bartle, who argues the point through his change/persistence ownership grid instead.

The corpus reading: a persistent world is an arena with no maximal configuration. In the [arena theorem](../../07/07/2026-07-07-note-on-obsmetrologia-arenas.md)'s terms, strategies are settlement-compatible families whose *maximal finite positions* carry settled valuations, and Proposition 3.15 guarantees stabilization on a finite support. A persistent world denies both premises: the event support grows without bound (the operator patches new events into the arena while it runs), and no position is maximal — every configuration extends. The four practitioner formulations above are the same claim from operations, economics, definition-writing, and design **[established that they converge; rhyme that the convergence instantiates the unclosed-settling premise]**. The critic's caution is adopted here: the convergence is unsurprising (all four describe the same server architecture) and is *consistency with* the corpus's framing, not independent corroboration of it.

One decoupling the finite picture cannot express at all: Pearce's Uru diaspora **[established]**. When Uru's servers closed in 2004, a ~350-member community wept as the avatars froze, then migrated intact — a "fictive ethnicity" — across four other worlds over eighteen months. The arena was deleted; the strategy persisted and re-embedded elsewhere. In Conway's finite regime a finished game settles into a number; here nothing settled — the community carried an open, renegotiated identity into a new event structure entirely. Ending and closure came apart **[rhyme]**.

## 2. The boundary, refined: bubble, contract, arena, membrane

The corpus currently reads the magic circle as one object — the admission codec at the game's boundary. The boundary literature, read directly, recommends a decomposition.

Stenros (2014) splits what prior scholarship conflated into three **[established]**: the *psychological bubble* (Apter's protective frame — personal, phenomenological, present even in solitary play); the *magic circle proper* ("the social contract that is created through implicit or explicit social negotiation and metacommunication in the act of playing," which other social systems — law, economics — can come to recognize); and the *arena* (the culturally recognized site that persists as residue of play even when empty — the tennis court, the unset chessboard). The corpus mapping suggested by this triple **[rhyme]**: Stenros's arena is the corpus's event-structure arena, the thing that outlives any session; his magic circle is the codec proper — the negotiated admission contract that turns configurations into valued utterances; his bubble is a per-player frame the corpus does not currently model at all. The current single-codec reading fuses the first two; splitting them the way Stenros does would let the corpus say cleanly what a persistent world makes obvious — that the arena persists while the contract is renegotiated continuously and the bubble is per-strategy.

The critique wave and its resolution, in brief. Consalvo: "we cannot say that games are magic circles, where the ordinary rules of life do not apply. Of course they apply, but in addition to, in competition with, other rules" **[established, key passage verbatim; full article paywalled]**. Malaby rejects separable/safe/pleasurable as intrinsic features — they are "cultural accomplishments" — and redefines: "a game is a semibounded and socially legitimate domain of contrived contingency that generates interpretable outcomes," processual, "always in the process of becoming," never reducible to its rules **[established]**. Juul's resolution: "the magic circle is best understood as *the boundary that players negotiate*," with the puzzle piece as the better image — "a game must be integrated into a context in order to be experienced as separate from that context" **[established]**. Castronova's economic version: the "almost-magic circle," a membrane "definitely there but also definitely porous, and this is by choice of the users" **[reported; chapter paywalled, quote cross-confirmed]**. The mechanism underneath all of these is Goffman's *interaction membrane*, via Stenros **[established]**: the border is permeable, it *transforms* what crosses (rules of transformation) rather than blocking it, and "it is possible for play to be collapsed by external events."

The corpus reading **[rhyme]**: the codec is not a characteristic function on the boundary but a transformation applied to whatever crosses, with porosity a graded, direction-dependent, *player-tuned* parameter (Castronova: "by choice of the users"; the empirical Splitter/Migrator/Blender typology of Huynh et al. shows players individually setting it). This is a refinement, not a contradiction, of [the deep-play reading](../../06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md): deep play remains the codec breach, but in a persistent world the breach is the standing condition — the playbour literature (Kücklich, Yee, Heeks, Dibbell) documents a permanent economic pipeline through the membrane, with Heeks's flat conclusion "there is no 'real economics' to counterpose against a 'virtual economics;' there is just 'economics'" **[established]**. And Malaby's four sources of contrived contingency — stochastic, social, performative, semiotic — invite comparison with the four regimes (stochastic ≈ alea/scott is plausible; the other three do not align cleanly) **[rhyme, held loosely; the mapping is not attempted here]**.

Two breach case studies worth holding as exemplars. *Corrupted Blood* (2005): a raid debuff escaped containment via hunter pets and propagated through World of Warcraft's persistent population; Lofgren and Fefferman argued in *The Lancet Infectious Diseases* that the world could serve real epidemiology precisely because invested people fled, quarantined, and — the behavior compartmental models lacked — traveled *toward* the plague out of curiosity **[reported; the Lancet piece itself was not directly read]**. The Serenity Now funeral raid (2006): Gibbs, Carter, Arnold and Nansen analyze the seven-years-unresolved controversy as boundary-work along three simultaneous axes — ethical, ontological, aesthetic — "largely unresolved and... perhaps irreconcilable" **[established]**. The corpus reading of the latter **[rhyme]**: a single breach event carrying nonzero obstruction along several independent axes at once, with the persistent world propagating the unsettled charge forward indefinitely — a concrete picture of what H¹ ≠ 0 looks like outside the formalism, adjacent to the Sutton-Smith reading already in the corpus.

## 3. The settling substrate: how shared worlds actually settle

The distributed-systems literature is where the identifications can be tested hardest, because both sides are formal. The results are split, and the split is itself the finding.

**CRDT merge is the settlement algebra, by external theorem.** Shapiro, Preguiça, Baquero and Zawirski (2011) require a state-based CRDT's payload to form a monotonic join-semilattice: a partial order with merge computing the least upper bound, proved commutative, associative, idempotent, and monotonically non-decreasing, with Strong Eventual Consistency following as a theorem (replicas that have delivered the same updates have equivalent state) **[theorem, in the cited source]**. This is not an analogy to the corpus's knowledge order and settlement closure — it is the identical algebraic shape, independently formalized with a convergence theorem attached, and Vogels's Amazon shopping-cart example (divergent partition-era replicas merged on heal) is a production instance of local sections glued by join **[established]**. The honest limit the same paper proves: SEC is *incomparable* to sequential consistency, exhibited by the add-wins set where concurrent add(e)‖remove(e) merges to a state no sequential execution could produce — and add-wins, remove-wins, and reset-to-⊥ are all equally SEC-valid **[theorem, in the cited source]**. The corpus reading **[rhyme, with a caution]**: concurrent add‖remove is structurally a for-against collision — a `top` charge — and the CRDT literature's own framing shows the merge at such junctures is a *chosen arbitration policy*, not a recovered truth. Whether the corpus's settlement operator is truth-tracking or policy-committed at its `top` junctures is a real question this external result sharpens; the critic correctly notes the Belnap-side of the identification (the four values as derived from Scott approximation lattices) was not re-verified against Belnap's primary papers in this sweep, though the corpus holds the FOUR lattice formalized independently.

**Rollback netcode is a counterexample — at one level.** GGPO predicts remote inputs, and when the real input contradicts the guess, "rolls back the state of the game to the last correct state, then replays all players' revised inputs back until the current frame" **[established]**. TimeWarp does the same with snapshots and cascading anti-messages **[established]**. Bernier's lag compensation has the server deliberately "step back in time" — re-instantiating a retracted past world-state to adjudicate a shot against what the shooter actually saw, then restoring the present, with the "shot around a corner" artifact acknowledged as undissolved **[established]**. All of this retracts previously shown state: it is not monotone. The resolution the sources themselves support **[rhyme]**: distinguish the *underlying deterministic causal history* (once all inputs are known, it never changes — monotone, and the thing the corpus's knowledge order can model) from the *presentation* — the client-visible, committed-so-far view, which is a fallible finite approximation that gets overwritten. Rollback is not settlement failing to be monotone; it is a time-indexed family of partial climbs toward a monotone object, with the visible member retracted when late evidence arrives. The corpus does not currently have a presentation layer distinct from its settlement; this literature says it needs one. Lag compensation adds a second lesson **[rhyme]**: the adjudicated question ("what did this shooter see") is irreducibly *per-observer* — local time is a real parameter of the arena, which is congenial to the corpus's fiber-local site structure and hostile to any single global clock.

**Trailing State Synchronization is an engineered graded settlement family.** Cronin et al. keep several live, continuously executing copies of the same simulation at increasing synchronization delays: the leading copy is rendered and least settled; trailing copies have seen fewer misorderings; corrections copy from a *more settled live state*, not a static snapshot **[established]**. This is a real system built as a graded family of settlement stages of one causal history — an existence proof that "multiple simultaneous closure stages" is implementable engineering, not just formal tidiness **[rhyme]**.

**Deterministic lockstep makes desync a gluing failure.** Bettner and Terrano's Age of Empires architecture replicates *inputs*, not state: every peer runs the identical simulation, and divergence — detected by checksum — is a bug, not an event with reconciliation machinery **[established]**. The corpus reading **[rhyme]**: each client's simulation is a local section computed independently; the checksum is a coherence-of-overlap check; a desync *is* a gluing failure, and this regime handles it by construction (the arena is built so sections always agree) rather than by settlement. This is the strict-finite-regime answer, and its fragility (banning every locally varying code path) is the cost of demanding H¹ = 0 by fiat.

**Interest management is a fiber-local cover — boundedly.** Colyseus gives every object one authoritative primary plus weakly consistent replicas fetched via spatial range-query subscriptions, with staleness empirically bounded (<100ms for 93% of node pairs) and TACT's "conit" naming the bounded-inconsistency view **[established]**; the aura/focus/nimbus and region taxonomies say the same at design level **[established]**. Area-of-interest filtering is genuinely a restriction-to-local-support structure — but the gluing is staleness-bounded and probabilistic, never exact **[rhyme]**: the sheaf condition holds only up to a conit, and any corpus use of this identification should carry that bound rather than idealize it away. The one direct CRDT-in-games study (Dantas and Baquero 2025) supplies the honest failure case: rotation composition is non-commutative, breaking the op-based commutativity precondition outright, and the fix bolted arbitration metadata alongside the lattice rather than deriving it **[established]** — the lattice discipline does not extend to every game datum.

## 4. Governance: amending the arena from inside

A persistent world cannot end a dispute by ending. The finite game discharges its charges at the maximal position; the persistent world must grow standing settlement institutions instead, and the primary documents of the founding case survive verbatim.

LambdaMOO, 1992–96 **[established, primary documents read]**: Curtis's "LambdaMOO Takes a New Direction" (December 1992) withdrew the wizards from "the discipline/manners/arbitration business"; the Bungle breach (March 1993) forced the vacuum closed — a meeting settled nothing, one wizard acted unilaterally, and the wizards then instituted petitions and binding ballots; "LambdaMOO Takes Another Direction" (May 1996) reversed the abdication — "The line between 'technical' and 'social' is not a clear one, and never can be" — reserving an explicit veto over any passed ballot; and the population ratified the reversal by ballot, 321 for, 111 against, 272 abstaining. Lessig's gloss: "From a space self-regulated to a space regulated by self" **[established]**. The corpus reading **[rhyme]**: this is settlement-authority case law — an operator attempting to hand the closure operator to an open community process, the process failing to converge on a live breach, and a privileged fixed point (wizardly veto) being reasserted from outside the normal closure, with the reassertion itself then settled by the community's own machinery. The arc is the clearest documented instance of what "who owns the settlement operator" means in a running world.

Grimmelmann's god problem **[established]**: "there is no way to depose the designers of a game," and the restraints that actually function are exit (a continuous signal exercised *outside* the game's interface — "'Quit' is not really a command in the game interface"), the investor analogy, and constitutional self-binding. The corpus translation — the operator as an agent genuinely outside the arena, holding the power to rewrite the event structure mid-play, breaking the Player/Opponent symmetry that the dualizing involution presumes — is graded **[rhyme]** and flagged per the critic: Grimmelmann frames this as sovereignty and rule of law, not game semantics, and the involution language is this note's translation, not his claim. The sovereigns themselves concede the structure: CCP's CSM white paper states that real democratic accountability "cannot be emulated" because the world "relies on the technical support of CCP," and declares player crime out of jurisdiction — "under no circumstances will the legislator interfere" — which is what licenses EVE's tolerated-scam culture and the private institutions (EVE University's volunteer counterintelligence department) that grow in the gap **[established]**.

The empirical regularity: Frey et al. (2022), applying Ostrom's institutional framework across ~80,000 communities (Minecraft servers, subreddits, private WoW servers), find institutional formalization rising with age, population, and engagement on all three platforms, with convergence on weak norms over strong requirements **[established]**. Their reproduction of Ostrom and Basurto's "state of nature" table — the seven institutional defaults of an ungoverned space — is a candidate description of the bare, uncodec'd arena before any admission rule exists **[rhyme; Ostrom's primary text not read in this sweep — the critic flags this hook for re-verification]**. Griefing closes the loop definitionally: "any activity that genuinely bothers most players of the game in question" (Grimmelmann, quoting Hunter and Lastowka) **[established]** — the charge is community-relative, resolvable only through the community's own adjudication, never computable from the move alone; and the sanction structure is degenerate ("the set of... wrongful acts players might wish to deter is identical to the set of... effective sanctions available"; Bungle re-registered as Dr. Jest — no expulsion exists from a world with no outside) **[established]**.

## 5. The operator as standing observation organ

This is the obsmetrological angle proper: a live persistent world is a world under continuous instrumented observation by its operator, who adjusts the arena in response. The literature documents the loop from five sides.

Simpson's Ultima Online postmortem (1999) is the founding document **[established]**: the closed-loop economy failed through *hoarding* — resources flowed into inventory "and just sat there," spawning stopped, and "the world became boring and the players began to complain loudly"; the fix introduced the faucet/drain vocabulary; the simulated NPC economy went broke ("central planning doesn't work"); and Simpson's closing section proposes exactly a standing telemetry apparatus — trades, stocks, inflow, outflow, churn. Castronova then measured a world as an economy (Norrath's GNP per capita "roughly equal to Russia," a currency above the yen, chronic deflation from non-decaying items) **[established]**; EVE institutionalized the observer as an employee — Guðmundsson's team publishing quarterly economic reports, and discovering via the same apparatus that bots comprising 2% of players consumed 30% of server CPU **[established]**; and the player-modeling literature (Drachen et al.) defines the discipline — "any action the player takes while playing can potentially be recorded and stored" — with the methodological caveat that the choice of clustering apparatus determines whether the resulting player-model is even interpretable as a claim about the world (PCA/NMF bases corresponded to game-impossible behaviors) **[established]**. That last point is a small, real lesson for any observation theory **[rhyme]**: a section computed by an ill-chosen local method need not be a section of the actual behavior space at all.

The corpus reading this note wants to register as its own **[conjecture]**: *boredom is premature closure.* UO's hoarding failure was not the economy failing to settle — it was the economy settling: value accumulated into a frozen configuration, the settling reached a fixed point, and the world died as a game ("the world became boring"). The operator's faucets, drains, content patches, and rebalances are anti-closure operations — deliberate injections of unsettledness that hold the world above the finite regime, away from the ludus floor where H¹ = 0 and a winner exists. On this reading the operator of a persistent world is a *standing settlement organ run in reverse*: it observes continuously precisely in order to keep the settling from completing, because a fully settled world is a finished game, and a finished game is a number, and nobody lives in a number. None of the sources state this; Simpson's data is consistent with it; it is filed as conjecture.

The critique literature is the loop's conscience **[established]**: Zagal, Björk and Lewis's dark patterns ("used intentionally by a game creator to cause negative experiences for players which are against their best interests and likely to happen without their consent" — definition recovered via directly quoting secondary sources; the original was unfetchable) **[reported]**, and Deterding, Stenros and Montola's demolition of it — ontologically incoherent, ethically unstated, historically biased toward canonizing AAA design as neutral **[established]**. The tempting corpus reading — that their incoherence objection is an argument for a four-valued rather than two-valued treatment of "dark" — is *not in the source* and is explicitly filed here as this note's own apparatus applied externally **[rhyme, flagged]**. The unverified "4% of players fund ~74% of GTA Online's revenue" statistic circulating in trade coverage is recorded here only as *unverified* and must not be cited from this note.

## 6. Play in the player's absence

The web's native game-forms complete the picture, because they are settlement in the player's absence made into a genre. The idle-game literature's working definition: games that "require players to leave the game and return to it at a later, unspecified point, where the game progresses on its own during that time" **[established]**. The designer of Kittens Game: "You are, essentially, not a center of the world but a spectator, world goes on with or without you" **[established]**. Bogost locates the structure exactly: "It's not just the asynchrony between players... but it's asynchrony with the state, with the game itself" **[established — the quote is from the CHI PLAY 2019 interview study, read in full; the critic's worry about it applied to the unread Cow Clicker essay, a different text]**. Fizek's interpassivity names the delegation — "giving up their agency and delegating it to the clicker algorithms" — and her Galloway-derived distinction does the formal work: an ordinary game's idle animation "has no effect," while an idle game's absent-time changes are permanent and significant **[established]**.

The corpus reading **[rhyme]**: idle and tick-based games are arenas whose Opponent-side causal development does not pause for Player absence — the settling climbs on its own clock, and the player's strategy is receptive to an arena that has been doing work between sessions. Urban Dead's twenty-year run is the plain-language limit case ("There is no way for the game to end other than quitting... There is no end"; "The biggest threat in Malton isn't zombies, it's entropy") **[established]**. Two designed countercurrents deserve note: idle designers engineering endings against their genre's default (Lantz: "at the end, it's done and it lets you go") — closure as an ethical choice **[established]**; and Wordle's shared daily instance ("it's one puzzle, and everybody is solving it") — a circle drawn in time, synchronizing millions of solitary sessions into one event, built by explicitly refusing the engagement loop **[established]**. And De Paoli's bot study poses a genuinely open question for the strategy formalism **[rhyme]**: when the receptive, courteous sub-event-structure executing against the arena is an automaton the player delegated, what — formally — distinguishes the player's strategy from the player's *absence*? The literature treats this as a labor question (deskilling, Marx); the corpus's vocabulary could treat it as one about which agent holds the handedness, and does not yet.

## 7. The open front, restated formally

The sweep sharpens the corpus's open front into one formal obligation and several reading debts.

**The formal obligation: the unclosed arena.** The [arena theorem](../../07/07/2026-07-07-note-on-obsmetrologia-arenas.md) is deliberately finite: finite event support, finite configurations, settlement stabilizing by finiteness (Prop. 3.15), maximal positions carrying settled valuations. A persistent world needs the object this note has been describing throughout: an arena with countable (growing) event support, no maximal configuration, a settlement that climbs without a reachable fixed point, an operator morphism that extends the event structure mid-play, and a presentation layer (§3) distinct from the underlying monotone history. The concurrent-games literature the corpus already cites (Winskel; Castellan–Clairambault–Winskel) works over general, not finite, event structures, so the raw material exists; whether the corpus's settled-sheaf semantics survives the passage to non-well-founded configurations — and what replaces "settled at maximal positions" when there are none (settled-on-every-finite-prefix? settled-in-the-limit along the knowledge order?) — is the open formalization question this note files. The four practitioner literatures (§1), the membrane literature (§2), the netcode split (§3), the governance arc (§4), and the idle genre (§6) are all, on this reading, phenomenology of that one missing object.

**Reading debts, from the adversarial critique of the sweep.** Not read directly and wanted: Turkle's *Life on the Screen* and Boellstorff's *Coming of Age in Second Life* (the missing ethnographic flank); Nardi's WoW ethnography; Yee's Daedalus Project survey corpus (the empirical successor to Bartle's types); T.L. Taylor's *Play Between Worlds* and Castronova's *Synthetic Worlds* in primary text (both relayed here through verified quotations only); Consalvo's *Cheating*; Carter's *Treacherous Play* (open access, bot-walled this pass); the Lofgren–Fefferman Lancet piece; Zagal et al.'s original dark-patterns catalogue; Lehdonvirta and Castronova's *Virtual Economies* in primary text; Ostrom's *Governing the Commons* (the IAD hook in §4 leans on Frey et al.'s use of it); Belnap's 1977 papers re-read against the CRDT arbitration question (§3); Bragg v. Linden Research (the missing case law for the virtual-property notes); the gold-farming labor flank beyond Heeks and Dibbell (Nakamura's racialization study); loot-box scholarship (Zendle and Cairns); Lamport clocks and the consensus paradigm (the strong-consistency rival to §3's CRDT story — the other answer to how a shared world settles, unswept); and EVE's Time Dilation — a single-shard world literally slowing its own clock server-side to preserve settlement consistency under load, confirmed to exist and exactly on-theme, unread. The tick-based PBBG era (Planetarion, OGame, Travian, Utopia) appears to be genuinely under-documented — a gap in the literature itself, not just in this sweep.

Companion triage notes carrying the concept-level material land alongside this note in the philosophy section's triage: persistent-world, player-types, magic-circle-debate, playbour, idle-game, asynchronous-play, virtual-economy, god-problem, virtual-property, griefing, dark-pattern. The standing home for this line of study is the computer-game-science section's research portfolio (established this same day): six programs — Persistent World Foundations, Boundary and Membrane, Web Temporality, Settlement Substrate, Ludocratic Institutions, and Obsmetrology of Play — each with a charter, an explanation guide, an annotated bibliography carrying read-status flags, and its share of a sixty-term section glossary; the Settlement Substrate program owns the unclosed-arena obligation from this note's §7 on the phenomena side, and the Obsmetrology of Play program owns the boredom-as-premature-closure conjecture from §5.

## Bibliography

Alharthi, Sultan A., et al. "Playing to Wait: A Taxonomy of Idle Games." CHI 2018. (Definition relayed via Spiel et al. 2019; original paywalled.)

Bartle, Richard. "Hearts, Clubs, Diamonds, Spades: Players Who Suit MUDs." *Journal of MUD Research* 1(1), 1996. https://mud.co.uk/richard/hcds.htm

Bartle, Richard. *Designing Virtual Worlds.* New Riders, 2003. https://mud.co.uk/richard/DesigningVirtualWorlds.pdf

Bell, Mark W. "Toward a Definition of 'Virtual Worlds'." *Journal of Virtual Worlds Research* 1(1), 2008. https://jvwr-ojs-utexas.tdl.org/jvwr/article/view/283/237

Bernier, Yahn W. "Latency Compensating Methods in Client/Server In-game Protocol Design and Optimization." GDC 2001. http://web.cs.wpi.edu/~claypool/courses/4513-B03/papers/games/bernier.pdf

Bettner, Paul, and Mark Terrano. "1500 Archers on a 28.8: Network Programming in Age of Empires and Beyond." GDC 2001. https://zoo.cs.yale.edu/classes/cs538/readings/papers/terrano_1500arch.pdf

Bharambe, Ashwin, Jeffrey Pang, and Srinivasan Seshan. "Colyseus: A Distributed Architecture for Online Multiplayer Games." NSDI 2006. https://www.comp.nus.edu.sg/~bleong/hydra/related/bharambe06colyseus.pdf

Brooks, Ian G. "Is Betrayal in EVE Online Unethical?" *Journal of Virtual Worlds Research* 10(3), 2017. https://jvwr-ojs-utexas.tdl.org/jvwr/article/view/7259/6412

Cannon, Tony. GGPO rollback netcode documentation. https://github.com/pond3r/ggpo

Castronova, Edward. "Virtual Worlds: A First-Hand Account of Market and Society on the Cyberian Frontier." CESifo Working Paper 618, 2001. https://www.ifo.de/DocDL/cesifo_wp618.pdf

Castronova, Edward. *Synthetic Worlds.* University of Chicago Press, 2005. (Ch. 6, "The Almost-Magic Circle"; key quote cross-confirmed, chapter not directly read.)

CCP Games. Council of Stellar Management White Paper. https://cdn1.eveonline.com/community/csm/CSM-WHITEPAPER.pdf

Consalvo, Mia. "There is No Magic Circle." *Games and Culture* 4(4), 2009. (Key passage verbatim; full article paywalled.)

Consalvo, Mia. "Using your friends: Social mechanics in social games." FDG 2011. https://dspace.mit.edu/bitstream/handle/1721.1/100463/Using_Your_Friends.pdf

Cronin, Eric, et al. "An Efficient Synchronization Mechanism for Mirrored Game Architectures." NetGames 2001 / MTA 2004. https://www.comp.nus.edu.sg/~bleong/hydra/related/cronin03efficient.pdf

Curtis, Pavel (Haakon). "LambdaMOO Takes a New Direction" (1992); "LambdaMOO Takes Another Direction" (1996); ballot LTAD-Legality. https://sites.cc.gatech.edu/classes/AY2001/cs6470_fall/LTAND.html

Dantas, Abel, and Carlos Baquero. "CRDT-Based Game State Synchronization in Peer-to-Peer VR." PaPoC 2025. https://arxiv.org/pdf/2503.17826

De Paoli, Stefano. "Automatic-Play and Player Deskilling in MMORPGs." *Game Studies* 13(1), 2013. http://gamestudies.org/1301/articles/depaoli_automatic_play

Deterding, Sebastian, Jaakko Stenros, and Markus Montola. "Against 'Dark Game Design Patterns'." DiGRA 2020. https://eprints.whiterose.ac.uk/156460/

Dibbell, Julian. "A Rape in Cyberspace." *The Village Voice*, 1993. http://gunkelweb.com/coms465/texts/rape_cyberspace.pdf

Dibbell, Julian. "The Life of the Chinese Gold Farmer." *New York Times Magazine*, 2007. (Read via author-site archive.)

Drachen, Anders, et al. "A Comparison of Methods for Player Clustering via Behavioral Telemetry." arXiv:1407.3950, 2014. https://arxiv.org/pdf/1407.3950

Fairfield, Joshua A. T. "Virtual Property." *Boston University Law Review* 85, 2005. https://www.bu.edu/law/journals-archive/bulr/volume85n4/FAIRFIELD.pdf

Fizek, Sonia. "Interpassivity and the Joy of Delegated Play in Idle Games." ToDiGRA draft, 2018. https://gamephilosophy2017.wordpress.com/wp-content/uploads/2017/11/fizek_interpassivity-and-the-joy-of-delegated-play_draft.pdf

Foo, Chek Yang, and Elina M. I. Koivisto. "Defining Grief Play in MMORPGs." ACE 2004. (Taxonomy reported via citing literature; original paywalled.)

Frey, Seth, et al. "Governing Online Goods: Maturity and Formalization in Minecraft, Reddit, and World of Warcraft Communities." CSCW 2022. https://arxiv.org/pdf/2202.01317

Gambetta, Gabriel. "Fast-Paced Multiplayer" series. https://www.gabrielgambetta.com/client-server-game-architecture.html

Gibbs, Martin, Marcus Carter, Michael Arnold, and Bjorn Nansen. "Serenity Now bombs a World of Warcraft funeral." AoIR 14.0, 2013. https://spir.aoir.org/ojs/index.php/spir/article/download/8845/7050/57859

Grimmelmann, James. "Virtual Worlds as Comparative Law." *New York Law School Law Review* 49, 2004. https://james.grimmelmann.net/files/articles/virtual-comparative.pdf

Heeks, Richard. "Understanding 'Gold Farming' and Real-Money Trading as the Intersection of Real and Virtual Economies." *JVWR* 2(4), 2010. https://jvwr-ojs-utexas.tdl.org/jvwr/article/view/868/633

Juul, Jesper. "The Magic Circle and the Puzzle Piece." Philosophy of Computer Games 2008. https://jesperjuul.net/text/magiccirclepuzzlepiece.pdf

Koster, Raph. "The Laws of Online World Design" (1998); "Declaring the Rights of Avatars" (2000). https://www.raphkoster.com/games/laws-of-online-world-design/

Kücklich, Julian. "Precarious Playbour: Modders and the Digital Games Industry." *Fibreculture* 5, 2005. https://five.fibreculturejournal.org/fcj-025-precarious-playbour-modders-and-the-digital-games-industry/

Lastowka, F. Gregory, and Dan Hunter. "The Laws of the Virtual Worlds." *California Law Review* 92, 2004. https://lawcat.berkeley.edu/record/1119331

Lessig, Lawrence. *Code: Version 2.0.* Basic Books, 2006. https://upload.wikimedia.org/wikipedia/commons/f/fd/Code_v2.pdf

Lofgren, Eric T., and Nina H. Fefferman. "The untapped potential of virtual game worlds to shed light on real world epidemics." *Lancet Infectious Diseases* 7(9), 2007. (Not directly read; reconstructed from secondary sources.)

Malaby, Thomas M. "Beyond Play: A New Approach to Games." *Games and Culture* 2(2), 2007. https://voidnetwork.gr/wp-content/uploads/2016/09/Beyond-Play-A-New-Approach-to-Gamesby-T.-M.-Malaby.pdf

Pearce, Celia. "Communities of Play." Electronic Book Review / MIT Press, 2009. https://electronicbookreview.com/publications/communities-of-play-the-social-construction-of-identity-in-persistent-online-game-worlds/

Shapiro, Marc, Nuno Preguiça, Carlos Baquero, and Marek Zawirski. "Conflict-free Replicated Data Types." SSS 2011. https://gsd.di.uminho.pt/members/cbm/members/cbm/ps/sss2011.pdf

Simpson, Zachary Booth. "The In-game Economics of Ultima Online." 1999. http://www.mine-control.com/zack/uoecon/uoecon.html

Spiel, Katta, et al. "'It Started as a Joke': On the Design of Idle Games." CHI PLAY 2019. https://par.nsf.gov/servlets/purl/10174274

Stenros, Jaakko. "In Defence of a Magic Circle: The Social, Mental and Cultural Boundaries of Play." *ToDiGRA* 1(2), 2014. https://todigra.org/index.php/todigra/article/download/1701/1701

Vogels, Werner. "Eventually Consistent." *CACM* 52(1), 2009. https://cs.brown.edu/courses/cs227/archives/2012/papers/weaker/p40-vogels.pdf

Yee, Nick. "The Labor of Fun." *Games and Culture* 1(1), 2006. https://nickyee.com/daedalus/archives/pdf/Yee_labor_of_fun.pdf

Zagal, José P., Staffan Björk, and Chris Lewis. "Dark Patterns in the Design of Games." FDG 2013. (Definition recovered via directly quoting secondary sources; original unfetchable this pass.)
