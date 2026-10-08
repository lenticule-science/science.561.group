---
name: PR Box
aliases: [Popescu-Rohrlich box, Popescu–Rohrlich box]
date-created: 2026-09-03
references:
  popescu1994:
    authors: ["Sandu Popescu", "Daniel Rohrlich"]
    title: "Quantum Nonlocality as an Axiom"
    publication: "Foundations of Physics"
    year: 1994
---

The **PR box** (Popescu & Rohrlich 1994) is a hypothetical bipartite device: two
separated parties each supply one binary input ($x, y \in \{0,1\}$) and receive one
binary output ($a, b \in \{0,1\}$), with outcomes constrained by

$$a \oplus b = x \wedge y$$

(equivalently $a \oplus b = xy$), and the marginal on each side uniform and independent
of the other side's input — so the device obeys the **no-signalling** principle (neither
party can use it to send information to the other) while producing perfect correlation
between the parties' outputs stronger than any quantum-mechanical device can achieve.
Popescu and Rohrlich introduced it to show that no-signalling alone does not pick out
quantum correlations: the PR box saturates the algebraic maximum of the CHSH
non-locality inequality, strictly exceeding the quantum (Tsirelson) bound, while
remaining consistent with relativistic causality. No physical realization of a PR box is
known; it is a extremal reference point, not a physical prediction.

## In Obsmetrologia

`Obsmetrologia.QuantumContextuality.MeasurementScenario` proves `prBox_no_global`: the
PR box's empirical model has no global section — it is *strongly* contextual, the top
rung of the possibilistic contextuality hierarchy (see [contextuality](./contextuality.md)).
`QuantumContextuality.CohomologicalContextuality` re-proves this cohomologically:
`prTarget_not_coboundary` shows the PR box's target has nonzero cycle sum around its
context graph's 4-cycle `0-2-1-3-0`, hence is not a
coboundary; `prBox_hasGlobalSection_iff` (axiom profile `(none)`) states the
global-section criterion for the PR box specifically, agreeing with
`prBox_no_global_cohomological`'s independent cohomological route. The module also
computes the PR exchange rate directly: `pr_top_h1_exchange` proves every realizing
family's knowledge-join merge holds at least one designated cell, the witness family
attains exactly one, and the PR context graph's cover nerve has $H^1$ rank exactly $1$.

## See also

- [Contextuality](./contextuality.md) — the general phenomenon the PR box is the
  paradigm strongly-contextual instance of
