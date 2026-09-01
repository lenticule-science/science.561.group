---
type: question
class: bridge
status: open
explores: [settling-cohomology, crdt-convergence-via-mayer-vietoris, cohomological-calm, bitopological-settling-site, paired-priestley-space, settling-merge-semilattice]
---

# Unified distributed-systems cohomology

The [CRDT Mayer–Vietoris reformulation](../theorems/crdt-convergence-via-mayer-vietoris.md) and the [@felber-et-al2025] task-sheaf framework give two complementary cohomological views of distributed systems. Open: identify the structural relationship between them. The full unification (one framework subsuming both) is one possible answer; equally plausible answers are partial unifications (a shared abstraction over a narrower scope) or a *no-unification* result identifying why the two settings are structurally distinct.

The question decomposes into three sub-questions, each of which is independently open and has its own progress-frontier.

## Sub-question 1: Identify the right enriching category

The settling-cohomology side values sheaves in $\mathbf{Ab}$ (currently) or in [paired Priestley spaces](../objects/paired-priestley-space.md) / d-frames / distributive bilattices ([bilattice-valued sheaves question](bilattice-valued-sheaves.md)). The task-sheaf side values sheaves in simplicial sets or in pointed sets (depending on which task-solvability framework). Are these enriching categories special cases of a common structure?

Candidate: d-frames cover both — the bitopological structure on the settling site dualizes to d-frames; simplicial sets are presheaves on the simplex category, which can be d-frame-valued under the right specialization. But the bilattice content on the settling side has no simplicial-set analogue, so the unification (if it exists) loses content in one direction.

This sub-question is the most concrete and is the natural starting point: settle whether d-frames (or Chu spaces, or something more abstract) is a common host before attempting to merge sites and cohomologies.

**Status: partially settled affirmatively** (per [Felber task sheaf — d-frame translation question](felber-task-sheaf-d-frame-translation.md), Pass 1). Felber et al's task-sheaf stalks are *frames* (powersets of output sets), with restrictions being $\vee$-preserving frame morphisms; the lift to $\mathbf{Ab}$ via $\mathbb Z[-]$ is a technical move for cohomology computation, not a structural feature. Both sides therefore share $\mathbf{Frm}_\vee$ as a common value category. The d-frame extension of Felber's task sheaves (Pass 2 of that question) is structurally available and refines Felber's classical setting by distinguishing $\mathbf t, \mathbf f, \top, \bot$ output-evaluations — the corpus's bilattice content has a natural counterpart on the task side. **Remaining open**: the proof of the d-frame analog of Felber's Theorem 20 (constructed but not yet proved); whether the shared frame-valuedness extends to a full structural correspondence on the cohomology side.

## Sub-question 2: Does cohomological CALM generalize?

[Cohomological CALM](../theorems/cohomological-calm.md) on the settling side characterizes CALM-compatibility as $\delta^0$-vanishing — Mayer–Vietoris obstruction vanishing. The natural conjecture: task solvability also corresponds to obstruction vanishing in some Mayer–Vietoris sequence on the task-sheaf side, and a unified statement would be "obstruction-vanishing in a unified Mayer–Vietoris sequence ⇔ both CALM-compatibility (settling side) and task solvability (task side) hold."

This is a *narrower* unification than full framework-merging — it asks whether the two cohomological characterizations have a common Mayer–Vietoris structure, not whether the full cohomology theories merge. May succeed even if Sub-question 1 fails.

## Sub-question 3: Mixed-system frameworks

Distributed systems that *combine* state-evolution (CRDT-style) with discrete tasks (Herlihy-style) are common in practice: a system replicates bilattice-valued knowledge AND coordinates discrete decisions. Open: is there a cohomology theory of *mixed* systems that handles both kinds of obstruction simultaneously?

Concrete candidate: a *bilattice-valued task sheaf* whose sections are bilattice-valued at each protocol vertex. The cohomology would track both the state-evolution obstructions (settling-cohomology-style) and task-solvability obstructions (task-sheaf-style) in a single bigraded invariant.

This is the most ambitious sub-question and depends on Sub-questions 1 and 2 being substantively answered.

## Why a *no-unification* result is also a plausible answer

The settling-cohomology side classifies *transfinite* state-evolution patterns; the task-sheaf side classifies *finite-protocol* solvability. The structural mismatch is genuine: transfinite cohomology (on $\omega_1$-scale aperiodic settlings) and finite-protocol cohomology (on simplicial complexes of bounded dimension) live in different scales of mathematical infrastructure.

A reasonable outcome of the question is: "the two frameworks share the Mayer–Vietoris structure (Sub-question 2) but no common enriching category (Sub-question 1)" — a partial unification answering only the obstruction-vanishing question. This would be informative even if not the maximalist unification originally hoped for.

## Position in predication categories

This question is the most cross-program of the open questions — it asks for a synthesis with literature outside predication categories' main commitments. It's also the most speculative; predication categories' framework was developed for bilattice-valued knowledge specifically, and the structural specialization may not generalize cleanly. Treat the three sub-questions as independent advanceable frontiers; the synthesis is downstream of all three.
