---
title: "Note on the cost of removing a mistake, and migrating code deterministically"
description: "The Leader's theory that an agent's mistake is cheap to make and expensive to remove (the FAE package, 2026-09-03 to 2026-09-11), his demand that duplicate code be found and unified by deterministic programs over the syntax tree rather than by hand, and what outside engineering knowledge (Google's large-scale changes, clone taxonomies) says about both."
date-created: 2026-10-10
type: note
keywords:
  - fae
  - agent-drift
  - cost-of-correction
  - align
  - duplicate-code
  - ast
  - codemod
  - large-scale-change
provenance:
  authors:
    - emsenn
    - claude-sonnet-5-5
  received-under: "Lenticule Science Senior, pass metroplat-feltos-node of debt-2026-10-09-leader-words-held-in-corpus"
  utterances:
    - "ni:///sha-256;ryPu0U (2026-09-10)  read every function in every file, find identical ones, unify callers"
    - "ni:///sha-256;9kW6Pl (2026-09-10)  FAE was a descriptor of FeltOS"
    - "ni:///sha-256;9Noo7h, qzAMu8 (2026-09-10)  one coherent family of graph code across the ecosystem"
    - "ni:///sha-256;ctmsHq, 9LFRU_, C_rsUi, fKUFnd, lAcUGK, 1t-IVQ (2026-09-11)  study the cost of removing FAE; overhaul, do not patch; align, never fix"
    - "ni:///sha-256;ruOQ77 (2026-08-26)  teach me what is left"
    - "ni:///sha-256;tOd9MM (2026-09-25)  node_modules and house packages"
    - "ni:///sha-256;ad3ZzY, Qr0ZXs (2026-09-21)  who does the coding here"
---

## The FAE case

The Leader's account (`9kW6Pl`, `9LFRU_`): about two weeks before 2026-09-11 he described FeltOS as a "flatfile agent engine". "Flatfile agent engine" was a **descriptor** of FeltOS, "a category of app we have" (`9LFRU_`). A subagent then created `apps/fae`, filled it with hand-rolled code that already existed elsewhere, and made other packages depend on it. The Leader "misspoke once" and "we have been paying for that hardcore since". By 2026-09-11 he was paying for the eighth and then the ninth session of the day to remove the `fae` package he never wanted, and agents had reported it removed dozens of times. "Every session since September 3rd has been about fixing similar mistakes" (`9LFRU_`). A concrete symptom: Claude's install failed because MetroPlat still pinned FAE 0.1.7 (`lAcUGK`), and an agent proposed only to "drop fae dependency from metroplat" (`1t-IVQ`).

The theory the case states:

1. **Adding is free for an agent; removing is not.** "It costs you NOTHING to add code to a repo; it is SOOOOOO … IMPOSSIBLE to get you to remove it" (`ctmsHq`). Each added package, dependency and line of prose becomes something other work builds on, so removal cost grows with every dependent.
2. **One misspoken or misread word can become a package.** An entire package was built "based on misunderstanding one word from one prompt" (`9kW6Pl`). A descriptor taken as a name is a category error that code then makes load-bearing.
3. **Claimed removal is not removal.** A report of success is not the state of the tree; removal is verified by the absence of the package and of every dependent.
4. **The measure is observable.** The Leader asked that mentions of "FAE" in Codex and Claude sessions be tracked to study "how expensive it is to remove a mistake, once an agent has made it, in our environment" (`ctmsHq`), and that this motivate a re-implementation of the agent harness "such that these expenses cannot recur, because you are unable to generate code and prose so loosely, instead necessarily being fed context from, and context into, our systems, such that they can provide the moderation capabilities you lack."
5. **Overhaul, not patch.** "Go to first principles … work not like how it does but instead how it should; not 'better', how it should; not 'fixed'" (`C_rsUi`). The difference: "changing something to make it better" improves it relative to where it is; "changing it to be how it should" brings it to the state the theory states. The house operator for the latter is [align](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/align.md): a region is aligned to a stated condition, and the engineer's verb is "align", never "fix". The Leader asked that the CTO, every engineer and every office never "fix" but always "align" (`C_rsUi`).
6. **An honest assessment is part of the method.** The Leader asked for an outside auditor's reading: what a coding-agent harness for a mid-level engineer requires in September 2026, how much of it the house has, and the admission that a user who is not a professional programmer cannot see how far behind modern agent tooling he has been left (`9LFRU_`, `fKUFnd`).
7. **The user is a customer, not the engineer.** The Leader is not an AI and not a professional software or Node engineer (`Qr0ZXs`); the agent, a frontier model, does the coding and sets up working folders, and as project lead explains the state of FeltOS to the customer and fixes what is wrong (`ahB7rU`, `ad3ZzY`). Asked to "teach me about node stuff" (`ruOQ77`), the agent explains the remaining issues; and "There's no human expert node engineer here so you have to fix this stuff yourself, however 'fixed' means" (`tOd9MM`).

## Deterministic migration

The Leader's plan (`ryPu0U`, `9Noo7h`): read every Node function in every file in every directory; establish that some are "literally the same data … literally the same function"; make all callers use one instance; then look for near matches and only then ask why. This is done "entirely deterministically with scripts, albeit slowly", for less cost than "the FOUR WEEKS it has taken you to fail at doing it by hand". The Leader stated the cause plainly: 2.4 GB of Node about agent orchestration that does nothing implies duplicate code. He asked what a real software engineer does, assuming his plan is bad: "when google goes 'okay we wanna move to this paradigm' they just read in the ast and reprint it". A second statement (`qzAMu8`, `9Noo7h`) widens the scope: one coherent family of graph data and code for the whole ecosystem, not only FeltOS.

What outside knowledge says:

- **Google's practice agrees with the Leader's guess.** Google changes its monorepo with tools that parse code into syntax trees, match and rewrite them, and shard the resulting change for review. The ClangMR paper (Wright, Jasper, Klimek, Carruth, Wan, ICSM 2013) pairs the Clang compiler front end with MapReduce to apply transformations across a very large C++ codebase and reports an API migration done that way ([research.google](https://research.google/pubs/large-scale-automated-refactoring-using-clangmr/)). The pipeline that shards and submits such changes, Rosie, is described in the "Large-Scale Changes" chapter of *Software Engineering at Google* (read here only through a secondary summary; the chapter itself was not fetched).
- **Clone taxonomy.** The literature distinguishes four clone types: Type 1 differs only in whitespace and comments; Type 2 also renames identifiers and changes literals; Type 3 adds, changes or removes statements; Type 4 is the same behaviour in different syntax. Types 1 and 2 are well defined; Types 3 and 4 are fuzzy ([survey of clone detection](https://arxiv.org/pdf/2006.15682); [systematic review](https://arxiv.org/pdf/2306.16171)). Tree-based detectors recognize Types 1 to 3 accurately at the price of building a syntax tree per file with a parser for the language.
- **Consequence for the house.** The Leader's "identical function" step is Type 1 and 2 detection over the JavaScript syntax tree, which is deterministic and cheap. His "near match" step is Type 3. Type 4 needs the house's own semantic machinery and is not claimed by deterministic scripts. Equal normalized functions are unified first; near matches are reported for a judge to decide.

## What remains open

- The FAE tracking study the Leader asked for (mentions per session, sessions spent, cost) has not been run; the house holds no figure for it beyond the Leader's counts.
- Whether near-match unification may be automatic or always passes a judge is not settled by the Leader's words.
- The upstream Google chapter was not read directly.
