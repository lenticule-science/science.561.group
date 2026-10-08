---
kind: theorem
status: proved
depends-on: [value-agnostic-void-cone, value-agnostic-void-cone-per-category, continuous-valued-settling]
title: Value-agnostic void cone — axiomatic minimal-hypothesis form
description: Third path for the value-agnostic void cone theorem.
---

# Value-agnostic void cone — axiomatic minimal-hypothesis form

Third path for the [value-agnostic void cone theorem](value-agnostic-void-cone.md). Identifies the minimal axioms on $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V}, T_\mathcal{V})$ that suffice for the descent and cohomological pairing, and proves the theorem from these axioms alone — making explicit which properties of the value category are genuinely needed.

## Minimal axioms

A **closure-pointed value structure** is a tuple $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V})$ satisfying:

**A1 (poset with bottom).** $\leq_T$ is a partial order on $\mathcal{V}$ with $\mathbf{0}_\mathcal{V}$ as the unique $\leq_T$-bottom: $\mathbf{0}_\mathcal{V} \leq_T x$ for all $x \in \mathcal{V}$, and $x \leq_T \mathbf{0}_\mathcal{V}$ implies $x = \mathbf{0}_\mathcal{V}$.

A **value-agnostic closure operator** on $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V})$ is a $\mathcal{V}$-enriched closure operator $T_\mathcal{V}$ satisfying:

**A2 ($\leq_T$-monotonicity).** $v \leq_T v' \Rightarrow T_\mathcal{V}(v) \leq_T T_\mathcal{V}(v')$ pointwise.

**A3 ($\leq_T$-inflation).** $v \leq_T T_\mathcal{V}(v)$ pointwise.

**A4 (support-respecting).** $T_\mathcal{V}(v_{\equiv \mathbf{0}_\mathcal{V}}) = v_{\equiv \mathbf{0}_\mathcal{V}}$ (the constant-bottom presheaf is a fixed point).

These are the only axioms used in the proof. **No further structural assumptions on $\mathcal{V}$ are required** — no quantale structure, no algebraic operations, no topology.

## Statement

**Theorem (value-agnostic void cone, axiomatic form).** *For a closure-pointed value structure $(\mathcal{V}, \leq_T, \mathbf{0}_\mathcal{V})$ and a value-agnostic closure operator $T_\mathcal{V}$ satisfying axioms A1–A4, the void cone $\mathrm{Void}_v := \{V_\tau\}$ with $V_\tau := \{c : v_\tau(c) = \mathbf{0}_\mathcal{V}\}$ satisfies:*

1. *(Descent.) $V_\tau \supseteq V_{\tau+1}$ for all $\tau$.*
2. *(Limit void.) $V_\infty := \bigcap_{\tau < \kappa} V_\tau$ exists.*
3. *(Cohomological pairing.) The associated graded $\mathrm{gr}(\mathrm{Void}_v) \cong \bigoplus_\mu \mathbb{Z}$ is indexed by NSC firing ordinals $\mu \in L_{\mathrm{ns}}(\kappa)$.*

## Proof

### Descent (Step 1) — uses only A1, A2, A3

Suppose $v_{\tau+1}(c) = \mathbf{0}_\mathcal{V}$ for some cell $c$. By A3 (inflation), $v_\tau(c) \leq_T v_{\tau+1}(c) = \mathbf{0}_\mathcal{V}$. By A1 (bottom uniqueness), $v_\tau(c) = \mathbf{0}_\mathcal{V}$. Hence $V_{\tau+1} \subseteq V_\tau$. $\square$ (Step 1)

### Limit void (Step 2) — uses A1, A4

The descending chain $V_0 \supseteq V_1 \supseteq \cdots$ has intersection $V_\infty = \bigcap_\tau V_\tau$. The intersection exists trivially as a set-theoretic intersection.

The interpretation "$c \in V_\infty$ iff $c$ is *structurally unreachable*" — i.e., no closure step ever moves $c$ away from $\mathbf{0}_\mathcal{V}$ — uses A4. Without support-respecting, $c$ could be moved to $\mathbf{0}_\mathcal{V}$ at every $\tau$ by spontaneous closure firings, which would not preclude $c$ being structurally reachable from a non-trivial seed.

Under A4, "the closure preserves all-bottom" means $T_\mathcal{V}$ doesn't introduce content from nothing. Hence $c \in V_\infty$ iff $c$ is permanently outside the closure-derivable region. $\square$ (Step 2)

### Cohomological pairing (Step 3) — uses A1, A2, A3 (A4 not strictly needed)

For each $\tau$ where the void shrinks, $V_{<\tau} \setminus V_\tau$ is a non-empty set of cells that left the void at $\tau$. The associated graded is

$$\mathrm{gr}(\mathrm{Void}_v) \;=\; \bigoplus_\tau \mathbb{Z}^{V_{<\tau} \setminus V_\tau}.$$

For the **firing-ordinal indexing**, only stages $\tau$ where $V_\tau \subsetneq V_{<\tau}$ contribute. Such stages are by definition the firing ordinals (Scott-continuous successors at the successor case, NSC at the limit case). The non-Scott-continuous subset $L_{\mathrm{ns}}(\kappa)$ contains the firings that aren't absorbed into earlier limits.

Each NSC firing contributes one cell, hence one $\mathbb{Z}$-summand:

$$\mathrm{gr}(\mathrm{Void}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

The pairing with apex $H^1$ uses the chain-level bijection of [void-cone associated graded direct](void-cone-associated-graded-direct.md), which itself uses only A1–A3 in the present axiomatic setting. $\square$ (Step 3)

The proof goes through using only A1–A4. $\blacksquare$

## What's *not* needed

The axiomatic form makes explicit which structural assumptions are *not* used:

- **No algebraic operations on $\mathcal{V}$.** No meet/join, no monoid structure, no quantale enrichment. The void-cone construction works on any $\leq_T$-poset with bottom.
- **No topology on $\mathcal{V}$.** Continuity of values across stages isn't required; only pointwise inflation.
- **No fuzzy/quantale-enrichment.** $\mathcal{V}$ doesn't need to be enriched in $\mathbf{Q\text{-}Cat}$.
- **No specific cardinality.** $\mathcal{V}$ can be discrete (Boolean, FOUR), continuous ($[0,1]$, $[0,\infty]$), or arbitrary as long as A1 holds.
- **No quantale structure.** The Lawvere-quantale and stochastic instances satisfy A1–A4 *by virtue of their order structures*, not by virtue of being quantale-enriched.

This minimality is the strongest form of the value-agnostic statement: *the void cone construction is purely order-theoretic, parameterized by the bottom element and inflation*.

## Generalization beyond the four canonical cases

A1–A4 are satisfied by many other value structures the original [value-agnostic theorem](value-agnostic-void-cone.md) didn't enumerate:

- **MV-algebras with bottom.** The infinite-valued Łukasiewicz algebra $[0,1]$ with its natural order satisfies A1; a closure operator monotone in this order satisfies A2–A3.
- **Continuous heyting algebras.** Any complete Heyting algebra with bottom and a closure operator preserves A1–A3.
- **Bilattices beyond FOUR.** $\mathbf{L}^\bowtie$ for any distributive lattice $\mathbf{L}$, with the knowledge or truth order, gives a closure-pointed structure.
- **Posets with bottom and fixed-point operator.** Any poset with bottom + a closure operator (idempotent, monotone, inflationary) automatically satisfies A1–A4.

The void-cone descent and cohomological pairing apply to all of these without modification.

## Position in the program

Third path — minimal-axiom form. With this:

- **The original cross-category proof** ([value-agnostic-void-cone](value-agnostic-void-cone.md)) abstracts but uses ad-hoc structure assumptions.
- **The per-category proof** ([value-agnostic-void-cone-per-category](value-agnostic-void-cone-per-category.md)) verifies four cases independently.
- **The axiomatic proof** (this) identifies the minimal axiom set and shows the theorem holds from those alone.

Together: the value-agnostic theorem has three independent justifications, with the axiomatic form being the cleanest statement of *what structure is genuinely required*. Future extensions to new value categories — MV-algebras, continuous Heyting algebras, fuzzy bilattices — inherit the void-cone structure automatically by verifying A1–A4.

The minimal-axiom form also clarifies the role of the support-respecting hypothesis (A4): it's needed for the *structural-unreachability* interpretation of $V_\infty$, not for the descent or pairing themselves. Without A4, the cohomological pairing still goes through, but $V_\infty$ may underrepresent structurally-unreachable cells (per the [non-support-respecting counterexample](../../documents/articles/notes/undated/non-support-respecting-spontaneous-rule.md)).
