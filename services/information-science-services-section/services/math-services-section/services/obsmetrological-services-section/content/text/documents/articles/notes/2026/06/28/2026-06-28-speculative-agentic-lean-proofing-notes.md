---
title: Speculative agentic Lean proofing notes
date-created: 2026-06-28
description: They are not proof claims, not Built+green capability claims, and not obligations to add dependencies to lean/lakefile.toml.
---
# Speculative agentic Lean proofing notes

Date: 2026-06-28

## Boundary

These notes are Research-grade.

They are not proof claims, not Built+green capability claims, and not obligations to add dependencies to `lean/lakefile.toml`.
The trusted path remains:

1. admit the Lean library through computing;
2. inventory obligations through organizing;
3. observe or synthesize proof states;
4. propose small moves;
5. run Lean;
6. record the result;
7. count only kernel-accepted proofs as proved.

## Native machine-to-machine Lean transition boundary

Pantograph and LeanDojo are useful comparators, not architecture dependencies.
The ICK target is native: proof states, proof-transition requests, proof-transition results, build oracles, and traces are ordinary carrier/action objects owned by the computing and organizing surfaces.

The useful boundary is:

- open a theorem;
- read goals, local context, metavariables, imports, and open namespaces;
- materialize one candidate transition as Lean code;
- run Lean through the project toolchain;
- return before-state, action, after-state, errors, and branch identity;
- revert or branch without corrupting the library.

Any external system should be treated only as a benchmark for whether the native ICK/RelMath boundary can beat or beat-match the expected capability.
It should not be wired in as a dependency or used to justify a sidecar ontology.

## Neural premise retrieval

Neural retrieval may help rank premise neighborhoods, especially when string tokens and import locality are too weak.
It should enter as a proposal source only.

The carrier should record the query proof state, retrieved declarations, retrieval method, score, and model/version if any.
The next mechanical gate is still a Lean tactic attempt using those premises.

## Search controllers

Best-first search, beam search, and MCTS are useful controller shapes for tactic exploration.
The first local implementation should be a bounded trace format, not an ambitious prover:

- state id;
- parent state id;
- tactic;
- score;
- timeout budget;
- result category;
- resulting goals or error.

The controller can be Research-grade while the trace carrier is Built+green.

## Sheaf-Laplacian guidance

Sheaf-Laplacian proof guidance is an attractive metaphor and possibly a real retrieval model, but it is not standard Lean proofing infrastructure.

Use it to name a question:

> Does a heterogeneous proof neighborhood have low consistency energy relative to a goal?

Do not use it to certify that a lemma is relevant or a theorem is true.
If implemented later, it should compete against simpler baselines: token retrieval, import-neighborhood retrieval, solved-proof retrieval, and Lean-error repair loops.

## Proof minimization

Generated scripts should be minimized after Lean accepts them.
This is not speculative as an engineering need, but the exact algorithm can wait.

Useful future work:

- delete redundant tactic lines;
- prefer stable lemma names over brittle generated terms;
- replace long `simp only` lists with local simp lemmas when appropriate;
- preserve readability over shortest byte length;
- rerun Lean after every shrink.

Proof minimization is allowed to be automated, but acceptance remains kernel-gated.
