---
title: "Arena Games, Ludics, and Character-as-Mask: An Asset Inventory"
description: "Full-corpus inventory of assets tied to game-semantic arenas, Girard's ludics, and the character/mask apparatus built on both."
date-created: 2026-07-26
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section
tags:
  - arena-games
  - ludics
  - game-semantics
  - masks
  - character-agent
  - asset-inventory
status: settled
declared-by: claude-interactive-session
---
# Arena Games, Ludics, and Character-as-Mask: An Asset Inventory

This note is the object: a full-corpus inventory of every asset tied to game-semantic arenas, Girard's ludics, and the character/mask apparatus built on both. A subagent produced it using `grep -rniE`, file/directory-name search, and a full git-history search (commit messages, deletions, file-history) through the sanctioned Git Services Section wrapper, since raw `git` is blocked by standing order.

## 1. Arena games (game-semantics arenas)

**Live primary asset.** `@emsenn/gaming`, a TypeScript package, implements Castellan-Clairambault-Winskel-style concurrent game systems with symmetry. Its `arena.mts` defines the literal `Arena` carrier — `{kind: "game.arena", structure: PrimeEventStructure, symmetry: SymmetryGroupoid}` — with a `symmetryJudgment` function checking polarity/causality/conflict preservation, and states: "An arena is the board of a running game: a polarized prime event structure together with a symmetry groupoid... When the groupoid contains FSym(𝔸) (finite permutations of a name set), strategy equivalence becomes nominal equivariance." The package's `ROADMAP.md` states plainly: "A full Hyland-Ong PCF type-to-arena former remains named, not faked, because the local corpus has not supplied a primitive implementation" — a named, open gap.

**Live research paper.** `2026-07-07-research-on-gaming-arenas.md`, "Arenas, Plays, and Strategies: A Mathematical Account of Concurrent Games," formally defines prime event structures, polarity, symmetry groupoids, arenas, plays, prestrategies, receptivity, innocence, symmetric strategies, and the arena category, and ties Girard's ludics directly into the arena formalism in its section on loci, designs, and ludic arenas.

**Live Lean-formalized side.** `Obsmetrologia/GameTheory/VerificationTournament.lean` records "the Lean-backed part of the gaming verification-tournament certificate... Nash stability with survivor correspondence."

**Historical.** An extensive 2026-05 voidmath prior-art tree names a full arena/game-semantics category taxonomy by directory alone (`hyland-ong-embedding/`, `agmos-embedding/`, `caires-pfenning-embedding/`, `dialectica-category/`, `concurrent-game-category/`) with no live counterpart. A deleted game asset, `apps/games/durante/src/arena.mjs` (a "Quake-like" first-playable proof), is fully absent from the live tree, not even under a legacy path. A shipped browser game, "aletheon," built its "Ludics Dispute" mechanic on literal Girard-ludics game rules — "each side holds a STANCE... and the four illocutionary forces ARE the moves (assert=t, deny=f, abstain=⊥, contest=⊤)... Convergence = a stance settles to f and YIELDS (the daimon †)" — and survives only as a legacy snapshot, moved out of any live app path.

## 2. Ludics (Girard)

**Live core implementation.** `@emsenn/playing`, subpath `ludics`, states: "A Design is playing's primary carrier: a partial charge-valuation over a locus tree... The Behaviour is the bi-orthogonal closure of a set of Designs... The Interaction is the binary cut of two dual Designs — the knowledge-join of their overlapping loci (Girard's cut law)." Its `locus.mts` states: "Girard 2001 builds ludics on three primitives: loci (addresses), designs (dialogical objects located at loci), and interaction." Its `design.mts` maps the four charge values potential/active/stable/absurd to Proponent/Opponent/Daimon/none. The package's identity module implements the Girard-2001 "Locus Solum" identity design, `Fax`, as an η-expanded copycat strategy satisfying `cut(Fax_B, d) ≃ d`.

**Historical.** A near-duplicate prior generation of the same library, with the same module names, survives as a legacy snapshot under a koios.news archive path. A "Girard-Caillois substrate correspondence" conjecture exists in at least four near-duplicate legacy copies, proposing a faithful functor between Caillois/Huizinga/Sutton-Smith cultural-ludics and Girard's paraconsistent-linear-logic dialogical games, with thirteen explicit structural correspondences (magic circle ↔ entity-fiber boundary; design polarities ↔ bilattice polarities; agon/alea/mimicry/ilinx as specific algebraic phenomena). A separate ~30-file archive covers the adjacent, distinct cultural-ludics sense (Caillois/Huizinga terms), connected to Girard's ludics only through that correspondence conjecture and through live modules (`caillois.mts`, `homo-ludens.mts`, `magic-circle.mts`, `paidia-ludus.mts`) that sit in the same live `playing` package.

The name "Lorenzen" — the dialogical-logic tradition distinct from Girard's — does not occur anywhere in the repository, in the working tree or (as far as pickaxe search could reach) in git history.

## 3. Characters and masks — the game-semantic sense

This is a genuine crossover with the repository's own persona system, not a coincidence of shared English words.

**Live.** `mask.mts` formally defines a game-theoretic Mask as "a participant's HANDEDNESS as the I/O FACE it turns to an arena," partitioned by the Player/Opponent duality, and states plainly: "It is not a self; it carries no algebra and no interior. There is no character 'behind' it — the dramatic character is the GLUING of an agent's masks... not a substance beneath them." `character-agent.mts` states this repo's own rejection of the industry sense of the term: "The corpus REJECTED the industry 'character-agent = governed state machine'... A character-agent is NOT a policy stack; it is a bundle of: PERSONAS — the masks it presents... DISCIPLINES... SKILLS... PLAYS — its performance history." It defines `identity(agent)` as the superposition ("gluing") of masks, with an identity-drift obstruction at loci where masks glue to contradiction. `persona.mts` reads mask/character/persona through the same ludics substrate, implementing Deleuze/Lévi-Strauss mask-as-delocation, Jungian `personaShadow`, and Goffman/Stanislavski/Brecht `roleDistance` as literal ludics functions over `Design`. `session-character.mts` reconstructs a Claude agent session's own identity as a `CharacterAgent` built from its chronicle of actions — this repository's own interactive-session self-model is explicitly typed through the same Mask/Character apparatus.

**Historical.** The direct predecessor of the live `mask.mts`, named `character.mts`, survives only in a koios.news legacy snapshot, with a nearly identical docstring calling the same object `Character` rather than `Mask`. A 2026-06-05 design note, "seam-characters," first states: "A Character is a morphism A → B in CGS — a strategy on A^⊥ ∥ B... A swarm of Characters is their parallel composition ∥ (federation IS ∥)... their disagreement is H¹" — preserved only in a legacy snapshot alongside its companion code.

Outside this seam, the repository's large persona/agent-roster system under `board-of-directors/lib/agency/characters/` is the ordinary sense of "character" and is not itself game-semantic.

## 4. Bibliography links found

`2026-07-07-research-on-gaming-arenas.md` cites, with DOI or URL: Nielsen-Plotkin-Winskel (Petri Nets/Event Structures/Domains I), Winskel (Event Structures; Event Structures with Symmetry), Rideau-Winskel (Concurrent Strategies), Castellan-Clairambault-Winskel (Thin Games with Symmetry), Castellan-Clairambault-Rideau-Winskel (Games and Strategies as Event Structures), Girard (Locus Solum), Faggian-Hyland (Designs, Disputes and Strategies), Hyland-Ong and Abramsky-Jagadeesan-Malacaria (Full Abstraction for PCF), and Belnap (A Useful Four-Valued Logic). The companion obsmetrologia paper adds arXiv, Springer, and Stanford Encyclopedia links for the same authors, plus Bombelli-Lee-Meyer-Sorkin ("Space-Time as a Causal Set") and Fitting ("Bilattices in Logic Programming").

## Legacy/historical-only findings

`apps/games/durante/{src/arena.mjs,tests/arena.test.mjs}` — not recoverable at any live path, including legacy-asset directories. The koios-news `character.mts`/`character-morphism.mts` pair — the live package has since renamed `Character` to `Mask` and moved "character" up one layer to mean the gluing of masks. The 2026-05 voidmath game-semantics category taxonomy — exists only as dated journal entries inside a legacy snapshot, with no live counterpart directory tree. The "aletheon" MMORPG and its Ludics-Dispute mechanic — code survives only under a legacy snapshot, not in any active app directory.

## What would falsify this inventory

A live implementation of the named-but-not-yet-built Hyland-Ong PCF type-to-arena former, or a single hit for "Lorenzen" anywhere in the repository's git history, would falsify the two open gaps stated above.
