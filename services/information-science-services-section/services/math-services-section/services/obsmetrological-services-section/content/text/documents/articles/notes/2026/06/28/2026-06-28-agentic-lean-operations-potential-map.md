---
title: Agentic Lean operations potential map
date-created: 2026-06-28
description: This note records a broad external checklist for agentic Lean tooling and translates it into the RelMath / ICK maturity discipline.
keywords:
  - computing
  - organizing
  - agent
  - witness
  - settlement
  - sheaf
  - structure
  - closure
---
# Agentic Lean operations potential map

Date: 2026-06-28

## Purpose

This note records a broad external checklist for agentic Lean tooling and translates it into the RelMath / ICK maturity discipline.

The checklist is useful because it names the ordinary infrastructure a proof-operating agent eventually wants: pinned toolchains, build gates, proof-state extraction, tactic execution, premise retrieval, proof traces, search controllers, benchmark suites, CI, memory, and refactor support.

The translation matters because RelMath already has a specific architecture:

- `lean/` is the checked Lean library and proof frontier.
- `src/apps/computing` admits host-neutral Lean project data and build-oracle observations.
- `src/services/organizing` reflects Lean modules as dependency topology and proof-obligation agendas.
- `src/apps/knowing` can preserve dreaming-style proofing notes as research-grade guidance, not proof.

The operating rule is simple: heuristic systems may propose, rank, retrieve, search, dream, or remember; Lean alone verifies proofs.

## Claim-site fiber system

A proof-oriented knowledge system should be treated as one relational object over claim-sites, not as a pile of linked artifacts.

A claim-site is the shared address of a claim: a topic, construction, named definition, theorem, lemma, example, interface, invariant, or other typed position where a claim can live.
The claim-site is not identical to any carrier.
It is the base point over which several fibers may exist:

- Lean is the settlement fiber: declarations, checked constructions, examples, theorems, proofs, admitted frontier, dependency closure, and kernel admission.
- Blueprint is the incidence and frontier fiber: nodes, edges, stated/proved/frontier/blocked status, dependency pressure.
- Verso is the exposition and gluing fiber: readable explanation, tutorials, examples, and reference prose welded back to the formal claim-site.
- API docs are the declaration-interface fiber: names, signatures, docstrings, imports, generated search structure.
- Provenance is the origin and motivation fiber: why the claim exists, where its language came from, and what conceptual pressure it preserves.

A mature claim is a glued section across those fibers.
Drift is a failure of gluing: a graph marks a theorem proved but the settlement fiber is missing, prose explains a beautiful idea with no claim-site, generated docs expose a declaration absent from the graph and teaching surface, or provenance preserves pressure that has not been promoted into a claim-site.

Profiles select which fibers must exist and commute.
A reference profile needs settlement and interface.
A teaching profile needs settlement, exposition, examples, and sequencing.
A frontier profile needs incidence, explicit unsettled status, and provenance.
A publication profile needs settlement, exposition, dependency audit, interface, provenance, and stable identifiers.

Maturity: Research-grade as an architecture note; Built+green only for the checked carriers and tests that compute fiber coverage and drift.

## Mechanical substrate

These are rote wins and should be treated as Built+green candidates when implemented and tested:

- Lean toolchain pin carrier: `lean-toolchain`, `lakefile`, locked dependency metadata.
- Build gates: full `lake build`, targeted module build, docs build when Verso or generated docs are present.
- Build-oracle carrier: exit code, stdout, stderr, warnings, sorry warnings, structured Lean errors.
- Sorry/admit audit: explicit frontier declarations, not ambient failure.
- Axiom audit: scripted `#print axioms` equivalent for important public theorems.
- Import-spine audit: module ownership, dependency direction, forbidden imports, stale theorem names.
- Theorem naming audit: stable public handles, no duplicate or ambiguous public names.

These are not conceptually strange.
They are the proof-library analog of package manifests, exports, bins, and dependency graphs.

## Interactive proof environment

These are the next mechanical layer:

- LSP observations: diagnostics, goal view, hover, go-to-definition.
- Native machine-to-machine Lean boundary: proof-state inspection, candidate transition materialization, Lean-kernel execution, and trace capture as ICK carriers/actions; Pantograph and LeanDojo are comparators, not dependencies.
- Proof-state extraction: goals, local context, target type, metavariables, imports, open namespaces.
- Tactic execution API: run tactic, inspect resulting goals, capture errors, branch and revert state.
- Error taxonomy: missing lemma, wrong rewrite, typeclass issue, import issue, bad statement, unsolved goal.

This layer turns the library from a static corpus into an environment an agent can operate over.

## Retrieval and topology

These belong mostly to organizing plus computing:

- Premise retrieval index: theorem names, statements, docstrings, namespaces, imports, examples.
- Dependency graph: module imports, declaration-to-declaration usage, theorem dependency closure.
- Example and proof-neighborhood retrieval: similar solved proofs, local patterns, nearby declarations.
- Corpus export: machine-readable declarations, proof states, traces, module metadata.
- Documentation extraction: theorem inventory, dependency maps, proof status pages.

The useful shape is not "one search box."
It is a topology: local module, import closure, theorem spine, dependency neighborhood, and solved-example neighborhood.

## Agent loop

These are agentic but still kernel-gated:

- Proof trace database: before-state, action, after-state, error or success, dependencies used.
- Search controller: best-first search, beam search, MCTS, backtracking, timeout control.
- Tactic suggestion layer: model-generated next-step proposals.
- Premise selection layer: retrieve likely lemmas for a goal.
- Local automation library: project-specific tactics, normalizers, simp sets, rewrite bundles.
- Proof minimization and cleanup: shrink generated scripts into maintainable Lean.
- Agent memory: persistent record of successful proof patterns and failed attempts.

Nothing in this layer upgrades a theorem.
It only manufactures candidates for Lean to accept or reject.

## Evaluation and governance

These are the operational feedback surfaces:

- Generated theorem and example harnesses: finite tables, examples, certificates.
- Benchmark suite: held-out theorem tasks, sorry-filling tasks, regression proofs.
- Evaluation metrics: success rate, proof length, search steps, wall time, dependency count.
- CI integration: builds, audits, benchmarks, trace extraction, proof-status pages.
- Refactor support: update imports, theorem names, docs, and downstream proofs coherently.

The key governance point is that benchmark success is not a theorem.
It is an engineering metric for the proofing system.

## Dreaming influence

Dreaming belongs here only as Research-grade guidance.

It can help by preserving candidate neighborhoods, strange analogies, repeated failure residues, and non-obvious premise clusters.
It can propose probes: "try this local normal form," "look near this import closure," "split the target this way," "compare with this solved proof pattern."

It must not certify anything.
A dream can be valuable because it prevents frontier hints from being forgotten, not because it closes the proof.
The mechanical gate remains:

1. observe a real Lean proof state;
2. retrieve premises and examples;
3. propose tactics or decompositions;
4. run Lean;
5. record the result;
6. minimize accepted scripts;
7. update traces and agendas.

## Implementation posture

Do the boring mechanical work first.

The first durable target is an ICK-visible Lean proofing loop: admit the library, compute proof obligations, inspect a proof state, propose a small tactic set, run Lean, classify errors, record traces, and feed the next obligation back into organizing.

The stranger work should be written down as notes and carriers, not smuggled into the trusted story.
