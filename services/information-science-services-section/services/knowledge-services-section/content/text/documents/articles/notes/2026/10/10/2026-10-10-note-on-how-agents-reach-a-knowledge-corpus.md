---
title: "How agents reach a knowledge corpus"
description: "Research note: the Leader's theory that the Group's agents reach the house's knowledge through its content-addressed knowledge lattice, its terms and notes, and the Sign libraries, not by scanning files; that the knowledge is to be condensed from fuzzy notes to machine-readable information; what external practice in 2024–2026 offers; and what remains open."
date-created: 2026-10-10
type: note
kind: research-note
keywords:
  - knowledge-corpus
  - retrieval
  - formal-concept-analysis
  - nomenclature-register
  - content-addressing
provenance:
  authors:
    - emsenn
  written-by: "Lenticule Science Senior, development pass signstuff-substrate of debt-2026-10-09-leader-words-held-in-corpus"
  utterances:
    - "ni:///sha-256;JjnbWN-ES8e0bxwEwDq0GApqIfMTV5F0tXqR71SKGTY"
    - "ni:///sha-256;UYet9r-CWYfRh69F6feuekXMCWPfKO4WPfE0uvloRDw"
    - "ni:///sha-256;-sHJDfqVRYtvHxSzrHh4b5bqul3wN07TfGVJie8CtMs"
    - "ni:///sha-256;_OOyRCIVFsiPjgEnwYGFYnfZThyY33gwnfuMoy3RIwc"
---

# How agents reach a knowledge corpus

## The theory

1. **The corpus is read before code is written from it.** The house holds tens
   of thousands of Markdown notes so that the code derived from them follows
   them. A session that writes code without reading the notes it derives from
   has wasted the notes (Leader, 2026-10-09). Rules
   `read-the-house-notes-for-a-leader-term` and
   `leader-prompts-become-research-before-code` hold the duty.
2. **Scanning files is not how agents reach knowledge.** In October 2026,
   `grep`, `git grep` and `find /` over a knowledge corpus are the wrong
   instrument, and in a repository with world-class research on
   content-addressed knowledge lattices they are absurd (Leader, 2026-10-09).
   They also crash the Leader's laptop (rule
   `no-whole-tree-scans-on-bare-cedar-fog`). Agents reach the corpus through
   its glossary terms, notes, indexes and MetroPlat.
3. **The Group's own software is that instrument.** The house has SignCell,
   SignChain (meant to beat LangChain) and SignGraph (meant to be the Group's
   LangGraph) for exactly this (Leader, 2026-10-09). An agent's retrieval and
   chaining runs on them, over content-addressed records.
4. **The knowledge is to be condensed.** The house's knowledge is scattered
   across too many notes, too few terms and too little hyperlinking. Many notes
   say the same thing in slightly different ways, written as the Group learned
   the concept. The work settles knowledge from fuzzy, opaque notes toward
   machine-readable, determined, clean information, with durable tooling for
   rewriting notes and links instead of hand edits (Leader, 2026-09-25).
   Ironically, much of the opaque knowledge is about how to do this.
5. **Registers of nomenclature matter.** The corpus names the same mathematics
   in several registers (algebraic, analytic, processual, geometric, dynamic,
   relational). Understanding those registers and their relation to formal
   concept analysis (FCA) is part of condensing the knowledge (Leader,
   2026-09-25; see `2026-07-04-nomenclature-registers-as-forced-readouts.md` in
   the emsenn section, which conjectures the registers are forced by the
   complexity of the structures named).
6. **The tooling is GEODE and VaultMaze.** GEODE meets and then beats
   Obsidian through a web interface and an API for agents. VaultMaze grows into
   FeltOS plus GEODE so agents can play the knowledge as Encarta's MindMaze let
   players walk an encyclopedia, improved by pedagogy. See the engineering
   glossary terms `geode` and `vaultmaze`.
7. **The knowledge lives in three places.** This repository, Cold Red Gate (the
   Group's VPS) and the Group's GitHub repositories. Agents have had no
   graphing or semantic search over them.
8. **The house's research is the ground.** The repository holds world-class
   research in semiotics, FCA, logic and mathematics that bears directly on
   building this software, beyond the public literature and model training
   data (Leader, 2026-09-25 and 2026-09-26).

## What external practice offers

As known to the writer in October 2026, without a fresh search:

- **Retrieval-augmented generation** (Lewis et al., 2020) retrieves passages by
  embedding similarity and conditions generation on them. It finds passages,
  not structure, and does not condense duplicates.
- **Graph-based retrieval.** Microsoft's GraphRAG (Edge et al., 2024) extracts
  an entity graph from a corpus, clusters it into communities and summarizes
  each, answering global questions from the summaries. HippoRAG (2024) and
  LightRAG (2024) are lighter graph-indexed variants. All build the graph by
  model extraction, so the graph is a derived, unverified reading.
- **Tool protocols.** The Model Context Protocol (Anthropic, 2024) standardizes
  how an agent calls a server for resources and tools; it says nothing about
  how the server organizes knowledge.
- **Personal knowledge tools.** Obsidian offers Markdown vaults, backlinks, a
  graph view, Canvas and, since 2025, Bases (database views over note
  properties); plugins such as Dataview query frontmatter. Its graph is
  link-only and its API is a desktop plugin API, not an agent service.
- **Formal concept analysis for navigation.** FCA builds a concept lattice from
  an object–attribute incidence; the lattice has been used for document
  navigation and query refinement since the 1990s (for example Carpineto and
  Romano, *Concept Data Analysis*, 2004). A concept lattice is exact, not
  learned, and each concept is a determined set of documents.
- **Content addressing.** Git, IPFS and RFC 6920 `ni:` names identify content by
  its hash, so a reference never drifts from what it names.

The house's position differs from each: its graph is to be exact (FCA and
predication), its references content-addressed, and its retrieval run on its
own evidence logic, so that what an agent reads carries its witnesses.

## Open

- Which index answers "what does the house hold on X" for an agent: the
  glossary, an FCA lattice over terms and notes, a SignGraph projection, or
  MetroPlat's world-connect, and how they compose.
- How condensing works on a note that duplicates another: which survives, and
  how its links and citations are carried.
- Whether embedding search has any place beside the exact lattice, for
  example as a proposal step whose results are then admitted by evidence.
