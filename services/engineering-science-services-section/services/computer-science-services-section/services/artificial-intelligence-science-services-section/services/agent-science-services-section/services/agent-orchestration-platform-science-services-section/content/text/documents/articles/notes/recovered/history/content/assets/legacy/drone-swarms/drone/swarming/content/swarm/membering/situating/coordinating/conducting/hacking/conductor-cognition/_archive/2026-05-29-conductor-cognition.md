---
date: 2026-05-29
kind: support-cluster-placement
$thing: conductor-cognition
parent-category: agentic-orchestration-platform
schema: ../../conductor-cognition.schema.json
script: ../scripts/conductor-cognition.mjs
status: hacking-placement
---

# conductor-cognition placement

## Why this exists

To make `@561/claude-code-harness` a thin wrapper, it must hold **no substrate of its own** — just the wiring of the swarm into Claude's tools/hooks/MCP (user directive, 2026-05-29).
The harness's glue still depended on a cluster of recall/projection/capture verbs that it had implemented in its own catalog: `recognizing`, `suiting`, `remembering`, `wondering`, `imagining`, `ruminating`, `exploring`, `capturing`, and the SHP `projecting` packet (`project`/`parse`/`extract`).

Per `docs/GENEALOGY.md`, **memory and its recall are the swarm's** (the carrier only triggers and consumes).
So these verbs are lifted here, verbatim in behavior, and exposed via the package index.
The harness now imports them from `@561/swarm-intelligence` and deletes its own copies.

## What it provides

- recognition: `provenanceOf`, `weightOf`, `recognizing` (sense > remembered-sense > learning; learning decays).
  Legacy tier ranking; the proper machinery is `hacking/q-relevance` (`docs/GENEALOGY.md` §6) and `suiting` will migrate onto Q later.
- `suiting`: compose the context-spacesuit by restriction to a task within a token budget.
- recall verbs: `remembering` (recognition-weighted recall), `wondering` (surface unsettled), `imagining` (hypothetical recombination), `ruminating` (bounded re-derivation via the dreaming finite corner).
- `exploring`: the outward sensing hand; network lives in an injected reader.
- `capturing`: IO → utterance → `articulating` → claim (reuses `#script/decoding`, `#script/articulating`).
- `projecting`: claims ↔ SHP packet (`project`/`parse`/`extract`), the finite + Scott-continuous (operational/TDP) readings per `spotcomp/SHP.md`.

## Why `hacking/`, and why one cluster

These are the conductor's **conscious vocabulary** (claude-code-flavored) lifted into the substrate — a recall-as-recall coincidence, admitted not derived.
Kept as one support cluster rather than nine TRC triples because they are co-evolving conductor support, not nine independent morphisms; the closure rules are the individual exports.
Cross-$thing deps use `#alias` (`#script/decoding`, `#script/articulating`, `#script/dreaming`); intra-cluster calls are direct.

## Obligations

- Migrate `suiting`'s recognition ranking onto `hacking/q-relevance` (Q-enriched), retiring the tier `weightOf` here.
- If the discipline later demands it, split the cluster into per-verb TRC triples under `memory/` (recall) and the ingress (`capturing`).
