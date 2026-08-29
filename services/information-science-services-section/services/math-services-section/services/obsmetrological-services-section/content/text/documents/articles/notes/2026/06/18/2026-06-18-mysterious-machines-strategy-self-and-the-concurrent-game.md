---
title: "Mysterious Machines: Strategy, Self, and the Concurrent Game"
description: "A companion monograph to the void note. One object — the star-autonomous category of concurrent games with symmetry — is shown to be at once the theory of computation, the theory of agency, and the theory of play, because each is what a relation does once the symmetric peer breaks into Player and Opponent. The tower relation → agent → game → computer is one ascent, forced by definability, and the four regimes of the engine are the four kinds of play."
date-created: 2026-06-18
date-modified: 2026-06-18
source-snapshot: 2026-08-17-windows-561-group
source-path: sites/triage.dev.emsenn.net/content/_triage/2026/06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md
keywords: ["agency", "caillois", "closure-ordinal", "combinatorial-games", "concurrent-games", "coordination", "curry-howard-lambek", "decision-theory", "effective-topos", "embedded-agency", "four-regime-tower", "functional-decision-theory", "game-semantics", "homo-ludens", "linear-logic", "ludics", "paraconsistent-logic", "player-opponent", "realizability", "star-autonomous", "stigmergy", "sutton-smith"]
references:
  - id: vonneumann1944
    type: book
    author:
      - literal: "{family: von Neumann"
      - literal: given: John}
      - literal: "{family: Morgenstern"
      - literal: given: Oskar}
    title: Theory of Games and Economic Behavior
  - id: nash1951
    type: article-journal
    author:
      - literal: "{family: Nash"
      - literal: given: John}
    title: Non-cooperative games
  - id: huizinga1938
    type: book
    author:
      - literal: "{family: Huizinga"
      - literal: given: Johan}
    title: Homo Ludens: A Study of the Play-Element in Culture
  - id: caillois1958
    type: book
    author:
      - literal: "{family: Caillois"
      - literal: given: Roger}
    title: Les jeux et les hommes (Man, Play and Games)
  - id: suttonsmith1997
    type: book
    author:
      - literal: "{family: Sutton-Smith"
      - literal: given: Brian}
    title: The Ambiguity of Play
  - id: suits1978
    type: book
    author:
      - literal: "{family: Suits"
      - literal: given: Bernard}
    title: The Grasshopper: Games, Life and Utopia
  - id: conway1976
    type: book
    author:
      - literal: "{family: Conway"
      - literal: given: John Horton}
    title: On Numbers and Games
  - id: joyal1977
    type: article-journal
    author:
      - literal: "{family: Joyal"
      - literal: given: André}
    title: Remarques sur la théorie des jeux à deux personnes
  - id: hyland1982
    type: chapter
    author:
      - literal: "{family: Hyland"
      - literal: given: J. M. E.}
    title: The effective topos
  - id: hylandong2000
    type: article-journal
    author:
      - literal: "{family: Hyland"
      - literal: given: J. M. E.}
      - literal: "{family: Ong"
      - literal: given: C.-H. L.}
    title: On full abstraction for PCF
  - id: ajm2000
    type: article-journal
    author:
      - literal: "{family: Abramsky"
      - literal: given: Samson}
      - literal: "{family: Jagadeesan"
      - literal: given: Radha}
      - literal: "{family: Malacaria"
      - literal: given: Pasquale}
    title: Full abstraction for PCF
  - id: ccw2017
    type: article-journal
    author:
      - literal: "{family: Castellan"
      - literal: given: Simon}
      - literal: "{family: Clairambault"
      - literal: given: Pierre}
      - literal: "{family: Winskel"
      - literal: given: Glynn}
    title: Concurrent games with symmetry
  - id: cairespfenning2010
    type: paper-conference
    author:
      - literal: "{family: Caires"
      - literal: given: Luís}
      - literal: "{family: Pfenning"
      - literal: given: Frank}
    title: Session types as intuitionistic linear propositions
  - id: girard1987
    type: article-journal
    author:
      - literal: "{family: Girard"
      - literal: given: Jean-Yves}
    title: Linear logic
  - id: rice1953
    type: article-journal
    author:
      - literal: "{family: Rice"
      - literal: given: H. G.}
    title: Classes of recursively enumerable sets and their decision problems
  - id: yudkowsky2010
    type: report
    author:
      - literal: "{family: Yudkowsky"
      - literal: given: Eliezer}
    title: Timeless decision theory
  - id: demskigarrabrant2019
    type: report
    author:
      - literal: "{family: Demski"
      - literal: given: Abram}
      - literal: "{family: Garrabrant"
      - literal: given: Scott}
    title: Embedded agency
  - id: gibbardharper1978
    type: chapter
    author:
      - literal: "{family: Gibbard"
      - literal: given: Allan}
      - literal: "{family: Harper"
      - literal: given: William}
    title: Counterfactuals and two kinds of expected utility
  - id: anscombe1957
    type: book
    author:
      - literal: "{family: Anscombe"
      - literal: given: G. E. M.}
    title: Intention
  - id: arendt1958
    type: book
    author:
      - literal: "{family: Arendt"
      - literal: given: Hannah}
    title: The Human Condition
  - id: simondon1958
    type: book
    author:
      - literal: "{family: Simondon"
      - literal: given: Gilbert}
    title: L'individuation à la lumière des notions de forme et d'information
  - id: harvey2005
    type: book
    author:
      - literal: "{family: Harvey"
      - literal: given: Graham}
    title: Animism: Respecting the Living World
  - id: wittgenstein1953
    type: book
    author:
      - literal: "{family: Wittgenstein"
      - literal: given: Ludwig}
    title: Philosophical Investigations
---

# Mysterious Machines: Strategy, Self, and the Concurrent Game

> *Or, The Player and the Opponent; Or, How a Relation Learns to Choose; Or, Cut-Elimination as a Way of Life; Or, The Magic Circle and the Effective Topos.*

This monograph is a companion to [the void note](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md), and it takes for granted the engine that note built — the closure-ordinal tower, its four regimes, its four-valued substrate $\mathbf{FOUR}$, its self-dual locus, its [fractal re-entry](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#metacircle).
Where that note ran the engine on *what exists* and got spacetime, this one runs it on *what acts*, and gets a single object that turns out to wear three names.
The object is the star-autonomous category of concurrent games with symmetry.
Read it as a logic of process and it is the theory of computation.
Read it as a logic of the someone who runs the process and it is the theory of agency.
Read it as the bounded world the someone enters voluntarily and it is the theory of play.
These are not three theories with a shared metaphor; they are one category seen from three sides, and the thesis of the monograph is that **to compute, to choose, and to play are the same act — taking a strategy in a game against an opponent who may be oneself.**

The single move that produces all three is the one the void note named at the birth of the agent: a symmetric peer, the unbroken vacuum of [the $K_4$ gauge](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#involutions), breaks its self-duality by choosing a handedness, and the handedness it chooses is *which side of the dualizing involution it plays*.
A relation that has been handed a side is a *strategy*.
Computation, agency, and play are the three things a strategy does, and they are distinguished not by what they are made of — they are all strategies in the same category — but by what they settle against: a strategy run against the world is a computation, a strategy run against a model of itself is an agent, and a strategy run against a freely-accepted opponent inside a bounded circle is a game.

The exposition is in two movements.
[The arena](#arena) builds the shared object: the strategy, the one category with three names, the tower the void note left as a one-line remark and this note proves out, and the four regimes read as the four kinds of play.
[The play](#play) runs it — on computation, on agency, on games, on coordination, on the body, on the question of when two strategies are the same — and a coda marks what is proved, what is sketch, and what is conjecture.
Nothing below needs a source outside it; every soft word is given its hard sense before it is used, and where this note leans on the void note it links rather than repeats.

---

## The arena {#arena}

### The strategy: a relation that has been handed a side {#strategy}

The void note's substrate is the relation — a charge $\langle\alpha,\beta\rangle$ recording evidence for and against, settling through a closure to a fixed point.
A relation, so described, is *symmetric in its two sides*: the positive and negative components are charted by two frames with a consistency relation, and the [negation involution $\sim$](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#involutions) that swaps them is a symmetry of the substrate, fixed only at [the self-dual locus](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-dual-locus) $\{\bot,\top\}$.
Nothing in a bare relation *plays* it; the two sides simply sit there, charted.

[_The arena._]{#arena-def} An *arena* is a relation whose two sides have been named as roles: a *prime event structure* $(E,\le,\#)$ — events $E$ partially ordered by causal dependency $\le$ and equipped with a conflict relation $\#$ marking which events exclude each other — together with a polarity labelling each event *Player* or *Opponent* [@ccw2017].
The order $\le$ is [the causal order the void note read off the settling](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#void); the conflict $\#$ is the choice structure, the places where the settling could go more than one way; and the polarity is the handedness — the broken symmetry of $\sim$ made into a labelling.
An arena is exactly a relation that has been *told which side it is on*.

[_The strategy._]{#strategy-def} A *strategy* $\sigma$ on an arena $A$ is a sub-event-structure of $A$ — a way of playing it — that is *receptive* (it never refuses an Opponent move the arena allows) and *courteous* (it adds causal dependency only from Opponent to Player, never constraining Opponent gratuitously).
A strategy is the dynamical content the bare relation lacked: where the relation says *what holds*, the strategy says *what I do when the other side moves*.
Receptivity and courtesy are not stipulations; they are the discipline forced by the [knowledge order having no deletion](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#orders) — a strategy may add to what is settled but may not retract what the opponent has established, exactly as the substrate may merge charges but never lower one.

[_The dualizing involution is the gauge._]{#duality} Every arena $A$ has a *dual* $A^\perp$ got by swapping Player and Opponent on every event.
This is the same involution twice over: it is [linear negation](#linear-negation) in the resource logic, and it is [the negation $\sim$ of the value substrate](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#involutions) read one categorical level up — the swap of the two charted sides, now the swap of the two players.
A morphism $A\to B$ in the category is a strategy on the compound arena $A^\perp\parallel B$: the player plays Opponent-style on the input $A$, where the world dictates, and Player-style on the output $B$, where it commits.
This is the void note's [embodied handedness](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#handedness) stated as the definition of an arrow, not a special case of one: *every* morphism is a handedness, because a morphism is a strategy and a strategy is a relation handed a side.

[_The self-dual locus is the self-opponent._]{#self-opponent} An arena equal to its own dual, $A\cong A^\perp$, is one a strategy plays *against itself* — Player and Opponent the same side.
Over the value substrate the fixed points of $\sim$ were $\{\bot,\top\}$, the told-nothing and the told-both; here they are the arenas on which a strategy is its own opponent, and the central claim of [the agency chapter](#agency) is that such an arena, closed reflexively, is exactly an *agent*.
The void note proved that [agency exists because negation has a fixed point](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-model); this note adds the operational reading: an agent is the one strategy that does not need an external opponent, because it supplies its own.

### One category, three names {#three-names}

The category $\mathbf{CGS}$ of concurrent games with symmetry — arenas with a *symmetry groupoid* $\tilde E$ of causality- and conflict-preserving bijections, strategies up to that symmetry — is star-autonomous: it carries a tensor $A\parallel B$ (parallel play), a dualizing involution $(-)^\perp$, and the monoidal-closed structure that makes it a model of [classical linear logic](#linear-negation) [@ccw2017; @girard1987].
This one category is the meeting place of three traditions that each thought they were studying something else.

[_The 1944 hinge._]{#hinge} The coincidence is not new; it is as old as the modern subject.
Von Neumann and Morgenstern's *Theory of Games and Economic Behavior* (1944) founded, in one book, **game theory** — the mathematics of strategy under an opponent — and **axiomatic utility** — the representation of a coherent agent as an expected-utility maximizer [@vonneumann1944].
The two halves of that book are the two halves of this monograph: the theory of the game and the theory of the agent who plays it were one act of thought from the start, and the vNM utility theorem is already the statement that *an agent is a strategy* — a consistent way of choosing under offered lotteries.
Nash's equilibrium [@nash1951] is then the fixed point of mutual best response, which is to say [a settling](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#settling) in the space of strategy profiles: equilibrium is the closure ordinal of the game's own dynamics reaching its least fixed point.

[_Name one: computation._]{#name-computation} Read $\mathbf{CGS}$ as a logic of process and it is [the theory of computation](#computation).
The void note asserted this; the corpus proves it.
The effective topos $\mathbf{Eff}$ — Hyland's realizability topos for Kleene's first algebra, the canonical model of computable mathematics, internally proving Church–Turing as a *theorem* [@hyland1982] — embeds into $\mathbf{CGS}$ as a Kleisli sub-cartesian-closed-category of the exponential comonad, via the Dialectica–game correspondence; and the sequential Hyland–Ong model of PCF [@hylandong2000; @ajm2000] embeds as the deterministic, alternating fragment.
The four-valued substrate is not imposed but *forced*: $\mathbf{FOUR}$ is the image of $\mathbf{Eff}$'s subobject classifier $\Omega_{\mathbf{Eff}}$ under the [double-negation nucleus](#four-forced), with $\bot$ compelled for every non-trivial behavioural predicate by Rice's theorem [@rice1953].
A type is an arena, a program a strategy, composition the [linear-logic cut](#cut), and the discipline of process follows without stipulation.

[_Name two: agency._]{#name-agency} Read $\mathbf{CGS}$ as a logic of the someone who runs the process and it is [the theory of agency](#agency).
A morphism $A^\perp\parallel B$ is a coupling of an agent to a world — Opponent-side on the input where the environment delivers, Player-side on the output where the agent commits.
The agent that contains a model of itself is the [self-opponent arena](#self-opponent) closed reflexively; deciding is settling that self-model; and the embedded-agency program — the recognition that a real agent is a physical subsystem of the very world it reasons about, not a Cartesian outsider [@demskigarrabrant2019] — is the categorical fact that *Player is inside its own arena*, with no clean boundary between strategy and game.

[_Name three: play._]{#name-play} Read $\mathbf{CGS}$ as the bounded world the someone voluntarily enters and it is [the theory of play](#games).
Huizinga's *magic circle* — the temporary bounded space where special rules apply and ordinary consequences are suspended [@huizinga1938] — is the arena's boundary, [the admission codec](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#method-codec) that turns a configuration into the utterances the engine values.
Caillois's four kinds of play are [the four regimes](#four-games).
Suits's definition of game-playing — *the voluntary attempt to overcome unnecessary obstacles* [@suits1978] — is the conflict relation $\#$ of the arena accepted freely: the obstacle is the conflict, "unnecessary" is the voluntariness of entering the circle, and the "lusory attitude" is the receptivity of a strategy that agrees to be bound by the arena it could have declined.

The three names are one because the category is one.
What differs is only what the strategy settles against — the world, itself, or a freely-accepted opponent — and those three are the three readings of [the dualizing involution](#duality): the opponent as other ($A^\perp$ external), the opponent as self ($A\cong A^\perp$), and the opponent as chosen ($A^\perp$ entered voluntarily under the magic circle).

### The tower, forced by definability {#tower}

The void note closed its agency chapter with a sentence it did not prove: *the tower of constructions relation → agent → game → computer is forced by definability, each closure's signature mentioning only the previous fixed point.*
This is that proof, and it is also the table of contents of [the second movement](#play).

[_The ascent._]{#ascent} Each level is the [least fixed point](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#settling) of a closure whose signature is definable using only the level below, and is therefore the [fractal re-entry](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#metacircle) of the engine one rung up.

- **Relation → agent.** A *relation* is the substrate. An *agent* is the least fixed point of the *reflexive closure* — adjoin meta-cells reflecting a settling's own charges back into it and close, the initial algebra of $X\mapsto\mathrm{Settle}(X+\mathrm{SelfModel}(X))$, a fixed point by Lambek's lemma [@demskigarrabrant2019]. The signature mentions only *relation* and *settle*; the agent is definable from the relation alone. This is the [self-opponent arena](#self-opponent).
- **Agent → game.** A *game* is a configuration of two or more agents' [handedness](#duality) over a shared arena — a strategy profile on a compound arena $A_1^\perp\parallel\cdots\parallel A_n^\perp\parallel B$. Its signature mentions only *agent* (the players) and *arena composition* (the parallel product). A game is definable from agents; it is not definable from relations directly, because [relating presupposes two settled selves](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#individual) and so cannot be the primitive that produces them.
- **Game → computer.** A *computer* is a game whose moves are *computable* and whose plays *compose by cut* — the Kleisli category of the exponential on $\mathbf{CGS}$, where a strategy may be [copied](#cut) and re-run. Its signature mentions only *game* (the arena and its strategies) and the *exponential comonad* (the duplication that makes a move reusable). A computer is a game that can be played again, and "played again" is exactly the structural role of the linear logic exponential $!$ — the modality that lifts a once-only resource to a repeatable one.

[_Why the order is forced._]{#order-forced} The order cannot be permuted, because each construction's *closure signature* mentions only the previous fixed point and nothing above it.
You cannot define a game before you have agents to play it, because the players are arguments to the game's constructor; you cannot define a computer before you have a game whose moves can be made computable and whose exponential can be taken.
The void note's [definability tower](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#individual) is thus literally a tower of nested closures, and its rungs are this monograph's chapters: [agency](#agency) is the relation closed reflexively, [games](#games) are agents composed, [computation](#computation) is a game made repeatable.
(The upper rungs — whether the tower stabilizes or climbs forever past *computer* into [a moduli of computers](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#moduli) — are marked open in the void note's coda and remain so here.)

### The four regimes are the four kinds of play {#four-games}

Caillois disaggregated Huizinga's single phenomenon of play into four categories and a spectrum [@caillois1958].
Run the [disambiguation engine](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#disambiguation) on the soft word *play* and Caillois's four fall out as the [four regimes](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-regimes), his spectrum as the descent.

| register | aperiodic | transfinite | scott | finite |
|---|---|---|---|---|
| closure ordinal $\kappa$ | $\ge\omega_1$ | $\omega<\kappa<\omega_1$ | $=\omega$ | $<\omega$ |
| [Caillois category](#caillois) | *ilinx* (vertigo) | *mimicry* (simulation) | *alea* (chance) | *agon* (contest) |
| what it disrupts/builds | perception itself | identity | who wins | a settled victor |
| obstruction $H^1$ | $\neq 0$ | $\neq 0$ | $=0$ | $=0$ |
| [strategy character](#strategy) | no stable strategy | strategy over assumed identity | strategy under chance | determinate winning strategy |
| [computation face](#computation) | informational / undecidable $\bot$ | concurrent, name-passing | probabilistic | sequential, terminating |
| [agency face](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#agency-relation) | animism | agential | agentic | individual |

[_Reading the columns._]{#caillois} *Agon*, the contest under formal equality decided by skill, is the [finite regime](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-regimes): a determinate winning strategy exists, the settling closes fast with $H^1=0$, and the game is a finite combinatorial object — which is exactly [Conway's theory of games as numbers](#conway), where a fully-determined two-player game *is* a number.
*Alea*, the submission to chance, is the [scott regime](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-regimes): value enters by [positing](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-morphisms) a charge the player does not control, the probabilistic computation that sits at $RT(\mathcal K_1^r)$, a [sibling of the effective topos got by adjoining a random oracle](#computation).
*Mimicry*, the becoming-someone-else, is the [transfinite regime](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-regimes): the player adopts an identity that is value-free above and charged only in play, which is the [name-passing, nominal computation](#computation) where an agent's very identity is a fresh name allocated for the duration — the $\nu$-calculus and the FSym-symmetric arena.
*Ilinx*, the deliberate pursuit of vertigo and the disruption of perception, is the [aperiodic regime](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-regimes): no stable strategy, $H^1\neq 0$, the play that needs the outside and never settles from within — the regime the void note marks as [the one that requires what it cannot close](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#correspondence).
Caillois's *paidia*-to-*ludus* spectrum — free spontaneous play hardening into formal rule-bound structure — is [the descent itself](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#fractal): paidia the aperiodic top draining its obstruction, ludus the finite floor where the rules are fixed and $H^1=0$.
To formalize a game is to run its settling from paidia to ludus; a *fully* formal game is one that has reached the finite fixed point, which is why agon — pure ludus — is the regime where a winning strategy provably exists.

---

## The play {#play}

The engine now runs on the three names in the order [the tower forces](#tower): computation last because it is the highest rung, but exposited first because it is the most fully proved, then agency, then games, then the matters — coordination, the body, sameness — that cut across all three.

### Computation: a game made repeatable {#computation}

Run the engine on *process*, and ask the corpus's own question — *what mathematical structure is computation?* — in the Curry–Howard–Lambek sense: a theory is a category whose objects are types and whose morphisms are programs.
The resolved answer is decisive.

[_The theory of computing is $\mathbf{CGS}$._]{#cgs} The theory of computation is the star-autonomous category of concurrent games with symmetry [@ccw2017].
It is the unique star-autonomous framework in which the four computational paradigms that resisted unification all embed at once: sequential game semantics (Hyland–Ong innocent strategies, the deterministic alternating fragment) [@hylandong2000]; nominal computation (name-passing, the FSym-symmetric arenas modelling fresh-name allocation); session-typed concurrency (the [Caires–Pfenning correspondence](#session) embedding $\pi$-calculus processes as linear-logic proofs) [@cairespfenning2010]; and Turing-complete realizability (the effective topos $\mathbf{Eff}$, via the Dialectica–game functor and its Kleisli extension) [@hyland1982].
Each had its own internal logic and none reduced to the others; $\mathbf{CGS}$ is the common ambient because in it a *strategy* is general enough to be a sequential program, a fresh name, a session, or a realizer at once.

[_The effective topos is the computable fragment._]{#eff} $\mathbf{Eff}$ embeds into $\mathbf{CGS}$ as the Kleisli sub-CCC of [the exponential comonad](#cut) on the concurrent computable fragment — the games with trivial symmetry and computable moves.
This is the [tower's top rung](#tower) made precise: a *computer* is a *game* ($\mathbf{CGS}$) made *repeatable* (Kleisli of $!$), and the discrete deterministic Turing-complete computation we call programming is exactly that Kleisli fragment.
Within it, Church–Turing is an internal theorem, not an axiom — every total $\mathbb N\to\mathbb N$ function has a recursive realizer — and so is Rice's theorem, via Kleene's second recursion theorem, itself the internal fixed-point of the substitution morphism on the Turing object.
The computer is a game that can prove things about itself, including its own undecidability.

[_Why $\mathbf{FOUR}$ is forced, not chosen._]{#four-forced} The four-valued substrate the void note built by hand is, in $\mathbf{Eff}$, *derived*.
The double-negation topology $j=\neg\neg$ is an internal nucleus on $\Omega_{\mathbf{Eff}}$; for any program-predicate $P$ form the pair $\rho(P)=(\neg\neg P,\neg\neg\neg P)\in\mathbf 2\times\mathbf 2$.
Verified gives $\mathbf t$ (a realizer for $P$, none for $\neg P$); refuted gives $\mathbf f$; the case where neither double-negation closes gives $\bot$ — *forced* by Rice for every non-trivial behavioural predicate of programs [@rice1953] — and the classically-impossible both-closed case is $\top$, the consistency boundary.
So undecidability is $\bot$ and a peer-disagreement is a genuine categorical event at $\top$: the void note's [physics of failure](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#failure) is, in computation, a theorem about realizability and not a convention about contradiction.
The corpus's resolution is exact: $\mathbf{FOUR}$ is the image of $\Omega_{\mathbf{Eff}}$ under the double-negation nucleus, internal to $\mathbf{Eff}$.

[_Linear negation is the Player/Opponent swap._]{#linear-negation} The star-autonomous structure ties the three names together at the level of logic.
Linear negation $(-)^\perp$ — the dualizing involution of [the resource logic](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#linear) — is, on arenas, [the Player/Opponent swap](#duality), and, on the value substrate, [the negation $\sim$](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#involutions).
One involution, three readings: the gauge of the charge, the duality of the resource, the swap of the players.
This is why the void note could call the substrate's logic *linear* and this note can call the game's duality *negation* and mean the same arrow — and why the [self-dual locus](#self-opponent), the place all three readings agree, is where the agent lives.

[_Cut is the pipe; the process is the proof._]{#cut} Composition of strategies is the linear-logic cut, and cut-elimination is execution: a pipeline of processes is a chain of cuts, and running it is eliminating them [@girard1987].
The discipline of a well-behaved process follows without stipulation, exactly as the void note derives it — a process *reads and emits a whole carrier* (the next is typed to receive one), is *total* (only total strategies compose), *consumes its input once* (the carrier is a [linear resource](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#linear); re-reading needs the [duplication comonad $!$](#eff), a reusable copy, not the stream), and *depends only on its input and itself* (a strategy must cut against arbitrary partners).
The shell pipe `|` is the cut rule and the process is the proof; the package-bin transport of [the corpus's own infrastructure](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#conformance) — request body to stdin, stdout to response — is a single strategy presented over a channel, the process boundary as the categorical morphism.

[_Session types are play made typed._]{#session} The Caires–Pfenning correspondence makes the identification of communication with proof literal: a session type on a channel is a linear-logic proposition, a session-typed process is a proof, and channel communication is cut-elimination [@cairespfenning2010].
A two-party protocol is a two-player game; a session type is the arena; a conforming process is a strategy; deadlock-freedom is the existence of a normalizing cut-elimination, which is to say the [settling reaching its fixed point](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#settling).
That a protocol and a game and a proof are the same object is not an analogy the monograph draws; it is the theorem the correspondence states.

### Agency: the strategy that is its own opponent {#agency}

Run the engine on *being a someone who acts*.
The void note derived agency from [the self-dual locus](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-model); this chapter develops it as the [agent-foundations program](#foundations) the corpus holds, and shows that program to be the [self-opponent arena](#self-opponent) under four pressures.

[_What a rational agent is._]{#foundations} The agent-foundations theory answers four questions precisely [@demskigarrabrant2019].
*What is rational choice?* — maximize expected utility under a coherent prior, the von Neumann–Morgenstern representation [@vonneumann1944], which is [the 1944 hinge](#hinge) again: a coherent agent *is* a strategy.
*Which decision theory?* — once the world contains predictors and copies, the classical answer fragments, and [the resolution is to choose the algorithm, not the act](#deciding).
*What changes when the agent is embedded?* — the Cartesian boundary fails, and [the agent is a subsystem of its own arena](#embedded).
*What grounds self-trust?* — [Löbian obstacles](#loeb) block an agent from fully trusting its own future proofs.
The four questions are the four pressures on the one object, and the object is the strategy that supplies its own opponent.

[_The four faces of the animate._]{#four-faces} Agency is a [soft word](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#disambiguation), and the void note already [sorted its cloud onto the four regimes](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#agency-quartet): *animism* the aperiodic face (bare animacy, a someone at all [@harvey2005]), *agential* the transfinite (the actor who can do otherwise, the deed under a description [@anscombe1957]), *agentic* the scott (the contributor whose moves carry values others read off the common field), *individual* the finite (the bounded person of law, the settled self [@simondon1958]).
This note adds the strategic reading: each face is a strategy with a different opponent.
The animist someone plays against [the open field with no narrowing](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#animism), no determinate arena yet; the agential actor plays against a world it can [begin something in](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#agency-quartet) [@arendt1958]; the agentic contributor plays against the [shared scene other contributors are also playing](#coordination); the individual plays against [the rule that bounds it](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#agency-relation) — which is why the settled order and the settled self are two faces of one fixed point, and the denial of agency is an operation of power.

[_Embedded agency: Player is inside its own arena._]{#embedded} Classical decision theory presupposes a Cartesian agent — a mind separate from its environment with a clean input–output interface.
Real agents are physical subsystems of the world they reason about, and the void note's [void](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#void) — the [self-referential cells that settle to the self-dual locus](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-model) — is exactly the categorical shadow of this: an agent is the [self-opponent arena](#self-opponent), so there is no boundary between the strategy and the game it plays.
The agent-foundations program names the concrete breakages — self-modelling (the agent must represent a copy of its own settled state), source-code uncertainty (it does not know its own arena fully from inside), naturalized induction (it must learn the laws of the world it is made of) — and each is a way the [Cartesian boundary is not drawable](#sameness) because the same events carry both the agent and its environment [@demskigarrabrant2019].
An *embedding* is the realization of an abstract decision algorithm as a physical computation; the same algorithm has many embeddings — on a CPU, in a predictor's simulation, in a copy, in a successor — and which embeddings count as *the same agent* is [the sameness question](#sameness) that the void note answers with [mutual local derivability](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#mld).

[_Deciding is settling the algorithm, not the act._]{#deciding} The deepest action of an embedded agent is not picking a deed but settling its own decision rule, and the void note states the theorem [@yudkowsky2010]: the agent that [models itself](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-model) shares the cell *my algorithm outputs $x$* across every instance — itself, its predictors, its simulations, its copies — so settling that cell settles them all at once.
This is functional decision theory: the counterfactual holds the *algorithm* fixed and varies its output across all implementations, $x^* = \arg\max_x\mathbb E[u(w)\mid A(w)=x]$ where $A(w)=x$ asserts every instance of $A$ in $w$ outputs $x$.
The three classical theories differ only in what they hold fixed: **CDT** holds the past fixed and severs causal arrows into the act, two-boxing on Newcomb and earning a thousand; **EDT** holds nothing fixed and reads the conditional, one-boxing on Newcomb but smoking-averse on the Smoking Lesion; **FDT** holds the algorithm fixed, one-boxing on Newcomb (the predictor runs the same algorithm, so prediction and act co-vary) and smoking on the Lesion (the lesion does not run the algorithm, so its prevalence does not co-vary) [@gibbardharper1978; @yudkowsky2010].
The act is downstream; the choice variable is [the self-model](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-model), a fixed point shared wherever the agent is computed, so a decision made once holds everywhere the agent is instantiated.
(Informal, in the corpus's own marking: the semantics of the logical counterfactual and the individuation of "the same algorithm" across implementations are open — the same open edge as [embedded sameness](#sameness).)

[_Self-trust meets a Löbian wall._]{#loeb} An agent that contemplates upgrading itself, or proves theorems about its own behaviour, runs into Löbian obstacles: a sufficiently expressive formal system cannot consistently assert the soundness of its own proofs.
This is the [self-dual locus](#self-opponent) seen from the doxastic side: an agent is [never flatly true or false about itself, only uninformed ($\bot$) or contested ($\top$)](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-model), and the wall against self-trust is the wall against a content-1 self-model — there is [no consistent exit at content one for the self-referential](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#content), only the void or the held contradiction.
An agent cannot be Boolean about itself; it can only accumulate evidence toward itself along [the monotone knowledge axis](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#orders), never closing.
Garrabrant's logical induction is the corpus's partial substrate here — a calibrated account of belief over logical sentences that does not pretend to the certainty Löb forbids — and it is [the inquiry chapter's discipline](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#inquiry) applied to an agent's beliefs about its own code: *learn to stop knowing and speak the possible*, even, especially, about yourself.

### Games: the magic circle is the arena {#games}

Run the engine on *play*.
The void note's [playable-world chapter](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#game) gave the slogan — a game is configured handedness, the theory run as a world one can enter — and this chapter gives the theory of play it rests on, sorting the three great theorists onto the engine.

[_Huizinga: the magic circle is the admission boundary._]{#huizinga} Huizinga held play to be older than culture and prior to it, a single phenomenon manifest across games, ritual, law, and war, all sharing one structural feature: the *magic circle*, a bounded space where special rules apply and ordinary consequences are suspended [@huizinga1938].
In the engine the magic circle is precise: it is [the codec at the boundary](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#method-codec), the admission rule by which a configuration becomes the utterances the engine values, and *only* the codec.
Inside the circle, capturing a piece is not violence and bluffing is not lying because the codec maps those moves to charges on the *game's* relations, not the world's — the circle does real work precisely as [the divination chapter](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#divination) says a sign-reading codec does: it admits evidence under a frame, and the frame is what makes the same physical act mean one thing in the circle and another outside it.
Huizinga's unity of play is the unity of the engine: one machine, many codecs, and play is the family of codecs that suspend the ordinary frame.

[_Caillois: the four categories are the four regimes._]{#caillois-games} Caillois's disaggregation of play into [agon, alea, mimicry, ilinx](#four-games) and the [paidia–ludus spectrum](#caillois) is [the four-regime resolution of the soft word *play*](#four-games), already tabled above.
The decisive point is that Caillois was *right to disaggregate and right that the categories combine*: a single game is a profile of regimes, just as [a clinical diagnosis](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#worked-example) or [a spacetime field](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#four-fields) carries content at several regimes at once.
A tabletop role-playing game is dominantly mimicry (transfinite, assumed identity) with alea in its dice (scott, charge the player does not control) and mild agon in its negotiated outcomes (finite contest) — exactly the corpus's reading of such games, and exactly a settling whose cells sit at different closure ordinals.

[_Sutton-Smith: ambiguity is the obstruction $H^1$._]{#sutton-smith} Sutton-Smith asked not *what is play* but *what do people mean by it*, and answered: at least seven *rhetorics* — progress, fate, power, identity, imaginary, self, frivolity — in irreducible tension, no one of them the essence [@suttonsmith1997].
This is the [disambiguation engine's own honesty](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#disambiguation) stated from inside the domain: a soft word's cloud of near-synonyms is [the four regime-faces tangled with drift](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#disambiguation), and where Caillois cut the cloud cleanly into four, Sutton-Smith measured the *residue* — the disagreement that no single cut removes.
That residue is the [obstruction $H^1$](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#void): the rhetorics conflict because play, as a [polity of players reads it](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#governance), carries non-zero $H^1$ — a contention one measures rather than argues.
Sutton-Smith's "ambiguity" is not a failure of theory but the correct report that the play-settling does not reach $H^1=0$ except at the [ludus floor](#caillois); a living game, still in paidia, *is* its own irreducible disagreement, and the seven rhetorics are seven generators of its first cohomology.

[_Suits: a game is voluntarily accepted conflict._]{#suits} Suits defined game-playing as *the voluntary attempt to overcome unnecessary obstacles*, the obstacles accepted only to make the activity possible, under a *lusory attitude* that embraces the rules for the sake of the play they permit [@suits1978].
In the arena this is exact: the obstacle is the [conflict relation $\#$](#arena-def), the unnecessary-ness is the voluntariness of entering [the magic circle](#huizinga), and the lusory attitude is the [receptivity of a strategy](#strategy-def) that agrees to be bound by an arena it could have declined.
A *handicap* — Go's komi, a chess piece given up, a head start — is then a literal modification of the arena's charge to balance the [Player/Opponent asymmetry](#duality), the corpus's [cost quantale](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#cost-quantale) applied to make a contest fair: a handicap is an additive charge on the outcome relation that brings two unequal strategies to formal equality, which is Caillois's defining condition for [agon](#four-games).

[_Conway: a finished game is a number._]{#conway} The [finite/agon regime](#four-games) has an arithmetic, and it is the corpus's [number chapter](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#number) seen through games.
Conway's combinatorial game theory shows that a two-player game with no chance and perfect information *is* a number — built, like the surreals, from the positions Left and Right can move to — and Joyal organized these games into a compact closed category whose dualizing involution is the negation of a game (swap Left and Right) [@conway1976; @joyal1977].
This is [the Player/Opponent swap](#duality) and [the value substrate's negation](#linear-negation) once more, now generating a number system: an agon's winning-strategy value is a surreal number, the game's *temperature* is how much is at stake, and the determinacy of a finite game — that one side has a winning strategy — is the statement that [the finite regime has no residual left to spend](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#universality), $H^1=0$, the settling closed.
Games are numbers because the finite regime carries [Peano-style arithmetic](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#number) and a finished game is a finite settling; the surreal field is what that arithmetic looks like when its seeds are positions.

[_Deep play: when the magic circle fails._]{#deep-play} The magic circle is contested precisely where it leaks: gambling crosses it with real stakes, professional play with careers, children's pretend when it tips into real conflict.
*Deep play* is the condition where the circle fails to contain the game's consequences — and in the engine this is exact: deep play is a [governing-regime breach](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#governance), the [finite bounded order](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#agency-quartet) of the game's rules failing to cap the open field, so that charges meant to stay inside the codec's frame leak into the world's relations and settle there.
The magic circle is porous because [no codec is total](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#method-codec) over a world that contains the players' bodies and livelihoods; a game's safety is exactly [a safety cobordism](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#safety-cobordism) whose strict shield keeps the in-circle cohomology off the world's — and deep play is where that shield is absent, the game's $\top$-firings reaching the player's actual life.

### Coordination: the swarm, and why language-model agents fail it {#coordination}

Run the engine on *many agents on a shared field*, the [agentic/working regime](#four-faces) made into a question of architecture.
A game with many players is [a polity of agents settling a shared scene](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#game), and the corpus has a sharp result about when such settling is cheap.

[_The swarm criteria._]{#swarm} A collective coordinates as a *swarm* — at convergent cost, no orchestrator — only with three properties: bounded per-agent cost (each agent's work does not grow with the swarm), interchangeable agents (one is substitutable for another), and *stigmergy* (coordination through traces left in a shared environment rather than point-to-point messages).
Violate any one and coordination needs an orchestrator, whose cost grows with the agent count.
This is [the agentic face](#four-faces) stated as engineering: stigmergy is coordination through the [shared medium itself](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#agency-quartet), the structure Hayek, activity theory, and biology each name, and it is exactly [the substrate's merge algebra](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#orders) — a flatfile substrate is a stigmergic trace field whose federation is [convergent by the knowledge-join itself](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#governance), with no external protocol.

[_Why language-model agents fail all three._]{#lm-agents} Multi-agent systems built from language models violate every swarm criterion, and the failure is measured: coordination overhead grows approximately quadratically with agent count in text-message-passing architectures, because each agent must receive a full context before each step, so distributing context costs $O(n)$ per agent over $n$ agents.
The lower bound is structural for all-to-all topologies — $n$ agents have $\Theta(n^2)$ pairs, and if every agent must know what every other did, the communication is $\Omega(n^2)$ per round — though orchestrator-workers ($O(n)$) and pipelines ($O(1)$) escape it by giving up all-to-all information.
Language-model agents fail *bounded per-agent cost* (context grows with the conversation), *interchangeability* (each carries idiosyncratic context), and *stigmergy* (they pass messages, not traces).
So coordination survives not at the agent layer but at the substrate layer: the swarm must coordinate through a [shared stigmergic field](#swarm) whose merge is convergent, exactly because the agents themselves cannot be made cheap and interchangeable.
This is [the multiplicative tensor read as parallel composition](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#effective-topos): a federation of agents is the [concurrent category's parallel product](#cgs) of their arenas, and it composes well only when the shared scene, not the per-agent message traffic, carries the coordination.

### The body: handedness is Player/Opponent {#body}

Run the engine on an agent that *has a body* — one that receives and sends on real channels, senses partially, actuates under physical preconditions.
The void note's [embodiment chapter](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#embodiment) is, in this monograph's vocabulary, a chapter about strategies, and it needs no restating beyond the identification that organizes it.

[_Embodied handedness is the dualizing involution._]{#embodied-handedness} An embodied agent's coupling to the world is a four-tuple — receive, send, observe, actuate — generally unequal across agents, and the asymmetry is not a defect but a categorical fact: a morphism $A\to B$ is a strategy on $A^\perp\parallel B$, [Opponent-style on the input where the world delivers, Player-style on the output where the agent commits](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#handedness).
Receive and observe are the Opponent-side of the input; send and actuate are the Player-side of the output.
An embodied agent is not an anomaly of some symmetric-peer idealization; it is a generic morphism with the asymmetry built in by [the dualizing involution](#duality) — the same swap that handed the agent its handedness at [the symmetry-breaking that made it an agent](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#individual).
A body is not added to a strategy; a strategy *is* a handedness, and a body is the handedness made physical — which is why [a free-tier agent with a dead battery still cannot fly](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#cost-quantale): the [cost quantale gains coordinates for joules and bandwidth](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#cost-quantale), and a dispatch exceeding the body's budget is dominated regardless of its monetary cost.

### Sameness: when two strategies are one {#sameness}

The tower [re-enters at every fixed point](#ascent), so the moment it produces more than one strategy a question presses, and it is the *same* question in all three names: when are two computations the same program, two agents the same algorithm, two games the same game?

[_One hierarchy, three readings._]{#sameness-hierarchy} The void note's [graded hierarchy of sameness](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#sameness) — strict isomorphism $\subsetneq$ biequivalence $=$ mutual local derivability $\subseteq$ cohomological equivalence — answers all three at once.
In **computation**, this is the [observational-equivalence / full-abstraction question](#cgs): two programs are the same when no context distinguishes them, and the Hyland–Ong full-abstraction theorem is the statement that the game-semantic denotation decides exactly this for PCF [@hylandong2000] — denotational equality (cohomological invariant) deciding observational equivalence ([mutual local derivability](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#mld)) on its regime.
In **agency**, it is the [embedding-individuation problem](#embedded): source-equivalence is too strict (two compilations differ), behavioural equivalence too coarse (it identifies a chess engine with a lookup table), and the agent-foundations literature has not converged — which is exactly the void note's verdict that [strict isomorphism is too fine and the right level is mutual local derivability](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#mld), the level at which "the same algorithm across implementations" is even writable.
In **games**, it is the claim "this game is a variant of that game" — [decided by the cohomological invariant on its regime](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#sameness-payoff).
The corpus's open problem in decision theory — *the individuation of "the same algorithm" across implementations* [@yudkowsky2010] — and its open problem in game semantics — full abstraction for untyped Turing-complete computation — are the *same* open edge: how fine an equality survives [re-entry](#ascent), and the answer is the same in both, mutual local derivability with a cohomological test that is exact regime by regime.

[_What the hierarchy buys all three._]{#sameness-payoff} For a reader who has run the method on any of the three, this answers two questions in one package: what may I change without changing the object, and how do I tell?
A [software refactor that alters no behaviour is an invisible automorphism of the strategy](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#universality); a [self-modification that preserves the agent's decisions is a self-equivalence of the algorithm](#deciding); a re-skinning that leaves a game's strategic content fixed is a biequivalence of arenas.
The freedom to restructure and the test for having preserved meaning come together, and the package is the same whether the object is a program, a person, or a play.

---

## Coda {#coda}

One fact unfolds into all of it, and it is the void note's fact read one level up.
[The negation of a relation has a fixed point](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#self-dual-locus); and the negation of a relation, raised to arenas, is [the Player/Opponent swap](#duality), so its fixed point is a strategy that is its own opponent — [an agent](#self-opponent).
From that one self-opponent the three names follow: a strategy run against the world is [a computation](#computation), a strategy run against itself is [an agent](#agency), a strategy run against a freely-accepted opponent inside [the magic circle](#huizinga) is [a game](#games).
The single engine is [the closure-ordinal tower](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#regimes); its single new move in this monograph is to break the symmetry of the substrate into two players and ask what the resulting strategy settles against; and because [it re-enters at every fixed point](#ascent), the [tower relation → agent → game → computer](#tower) is forced, each rung the closure of the last.

What is proved (modulo the citations it rests on): that [the theory of computation is the star-autonomous category of concurrent games with symmetry](#cgs), with [the effective topos as its computable Kleisli fragment](#eff) and [$\mathbf{FOUR}$ forced as the double-negation image of its subobject classifier](#four-forced); that [linear negation, the value substrate's negation, and the Player/Opponent swap are one involution](#linear-negation); that [composition is cut and execution is cut-elimination](#cut), with the process discipline derived not stipulated; that [session-typed concurrency is the propositions-as-sessions correspondence](#session); that [the tower is forced by definability](#order-forced); that [Caillois's four kinds of play are the four regimes](#four-games) and [Sutton-Smith's ambiguity is the obstruction $H^1$](#sutton-smith); and that [embodied handedness is the dualizing involution](#embodied-handedness).

What is sketch: the precise $*$-autonomous relationship between the Dialectica and game models of $\mathbf{Eff}$ (the residual exact-equivalence-of-CCCs point the corpus flags); the placement of [ilinx in the aperiodic regime](#caillois) beyond the analogy of "no stable strategy"; and the reading of [a handicap as an additive charge bringing strategies to formal equality](#suits), which wants the [cost quantale](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#cost-quantale) stated for games specifically.

What is openly conjecture, filed as the corpus files such things: that [the individuation of an algorithm across embeddings and full abstraction for untyped computation are the same open edge](#sameness), resolved by mutual local derivability — a translation, not a proof; that [the seven rhetorics of play are seven generators of a first cohomology](#sutton-smith); and the semantics of the [logical counterfactual that functional decision theory turns on](#deciding), open in the corpus and open here.

The engine has been run, in this exposition, on [computation](#computation) and [its effective-topos fragment](#eff); on [agency](#agency), [its embedding](#embedded), [its deciding](#deciding), and [its Löbian wall](#loeb); on [play](#games) through [Huizinga](#huizinga), [Caillois](#caillois-games), [Sutton-Smith](#sutton-smith), [Suits](#suits), and [Conway](#conway); on [coordination and the swarm](#coordination); on [the body](#body); and on [the sameness that survives re-entry](#sameness).
Each was the same strategy in the same category, distinguished only by [what it settles against](#three-names), because [the structure is fractal and its parts are addressed by what they are, not where they sit](../17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md#metacircle).
The void note followed one fact — that a relation's negation can be its own fixed point — into spacetime; this one followed it into the player, and found that to compute, to choose, and to play were, all along, the one act of taking a side.
