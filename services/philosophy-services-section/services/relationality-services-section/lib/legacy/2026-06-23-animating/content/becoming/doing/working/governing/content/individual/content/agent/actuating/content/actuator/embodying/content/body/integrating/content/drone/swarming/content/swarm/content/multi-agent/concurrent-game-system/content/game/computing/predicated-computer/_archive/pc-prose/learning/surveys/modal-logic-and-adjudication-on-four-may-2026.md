---
description: Survey of the modal-logic and adjudication side of predication categories — the world set, the bilattice accessibility relation, the twist modal translation $\nu$ into classical bimodal logic, the role of adjudication that the bilattice + settling realizes, and the Belnap-partition reading of the four FOUR-values as illocutionary force classes.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the modal-logic side of predication categories and the adjudication role that the bilattice and settling jointly realize, as they stand in the library at `theories/.../predication-categories/`. It covers the world set $W$ and the bilattice accessibility relation $R : W \times W \to \mathbf{L}^\bowtie$; the twist modal translation $\nu$ into classical bimodal logic over the positive and negative components of $R$; the concept of adjudication as the role of holding inconsistent, partial, and temporally accumulated information on a single structure; and the Belnap partition of the four $\mathbf{FOUR}$-values into illocutionary force classes (abstaining, asserting, denying, contesting) closed under cellwise $\vee_k$-merge. It defers the deontic-hyperdoctrine extension (named in the library as an open structural question) and the bigraded common-knowledge theorem (a forthcoming result) to those records.

## Content

### The world set $W$ and the bilattice accessibility relation $R$

The world set is a set $W$ over which the modal structure on a predication settling is indexed. The world set may be the settling bound itself — $W = \lambda$, taking settling ordinals as worlds — or a separate index set chosen for the modal application. The world-as-ordinal choice gives a canonical modal structure on every settling: $\Box \phi = \forall \tau < \lambda.\,(\phi \text{ at stage } \tau)$.

The bilattice accessibility relation is a four-valued relation between worlds — a function

$$R : W \times W \to \mathbf{L}^\bowtie$$

from ordered pairs of worlds in $W$ to elements of the twist product $\mathbf{L}^\bowtie$ over a residuated lattice $\mathbf{L}$. The value $R(w, w') \in \mathbf{L}^\bowtie$ records the bilattice-valued accessibility from $w$ to $w'$. When $\mathbf{L} = \mathbf{2}$, $R$ takes values in $\mathbf{FOUR}$; restricting further to the consistent sub-algebra recovers a Boolean accessibility relation in the classical Kripke sense. Under the bilattice-accessibility reading, $\leq_k$-monotonicity of a predication settling corresponds to the modal-necessity operator $\Box \phi$ tracking what holds at every settling stage.

### The twist modal translation $\nu$

The twist modal translation routes every formula in the modal language over $\mathbf{L}^\bowtie$ into a pair of classical-bimodal-language formulas (Rivieccio et al. 2017, Proposition 5.20). For each formula $\phi$, assign a pair $\nu(\phi) = (\nu_1(\phi), \nu_2(\phi))$ where $\nu_1$ extracts the positive-evidence component and $\nu_2$ extracts the negative-evidence component. For modal formulas, the translation is recursive:

$$\nu_1(\Box \phi) := \Box_+ \nu_1(\phi) \wedge \Box_- \sim \nu_2(\phi),$$
$$\nu_2(\Box \phi) := \sim \Box_+ \sim \nu_2(\phi),$$

where $\Box_+$ and $\Box_-$ are two classical modal operators corresponding to the positive and negative components of the bilattice accessibility relation $R$. Non-modal cases follow the standard twist-product translation for $\mathbf{L}^\bowtie$.

Paraconsistent modal logic translates fully into a two-modality classical system. The classical normality axiom $\Box_R(\phi \to \psi) \to (\Box_R \phi \to \Box_R \psi)$ does *not* hold in general for the bilattice modal necessity operator $\Box_R$ on $\mathbf{FOUR}$ — the corpus has an explicit counterexample (single-world $W = \{w_0\}$, accessibility $R(w_0, w_0) = \bot$, with $\phi$ valued $\bot$ and $\psi$ valued $\mathbf{f}$). Non-normality is a feature of the *coupling* between $\Box_+$ and $\Box_-$, not of either operator alone.

The translation routes around the non-normality for decision-procedure purposes. Both local and global consequence relations of the four-valued modal logic on $\mathbf{FOUR}^\bowtie$ have the finite-model property and are therefore decidable; local consequence is in PSPACE, global consequence in EXPTIME. Both bounds follow from the corresponding classical-bimodal results (PSPACE-complete and EXPTIME-complete for the minimal normal bimodal logic, Halpern–Moses 1992 and Blackburn et al. 2001) via $\nu$'s polynomial size: the four-valued logic inherits classical bimodal complexity up to a polynomial factor.

### Adjudication as a role

Adjudication is the role of producing an epistemic state at every predication cell from accumulating, possibly conflicting, possibly partial sources of information. The role has three structural pressures that the apparatus must handle on a single coherent structure, not in isolation:

- **Inconsistency.** Distinct sources may assert contradictory facts about the same cell. The apparatus must represent contradiction directly without trivialization — without contradictory cells causing the inferential structure to collapse globally.
- **Partial information.** A cell may be uninformed — neither asserted nor refuted. The apparatus must distinguish *unknownness* from negation; absence of information is not denial.
- **Temporal accumulation and distribution.** Information arrives over time and from independent sources, in varying orders and possibly with duplication. The apparatus must produce a state depending on the *set* of information received, growing monotonically as more arrives, and converging to the same final state across knowledge replicas without per-update coordination.

The three pressures cannot be handled in isolation. A framework that handles only one or two trivializes the others — the classical-three-valued-paraconsistent foils document records which thinner frameworks fail which pressures.

**The bilattice realizes the value-space pressures.** On $\mathbf{FOUR}$, $\top$ holds contradiction as a state (told both for and against, without downstream trivialization) and $\bot$ holds unknownness as a state (told nothing, distinguished from $\mathbf{f}$ which is told false). The richer twist-product bilattices $\mathbf{L}^\bowtie$ extend this with finer-grained evidence on each side. The role of adjudication's value-space content is exactly the role of the bilattice: a single ordered structure carrying both axes, with negation acting transversely to knowledge.

**The settling realizes the temporal pressure.** The predication settling indexes a $\leq_k$-monotone family of valuations by a settling bound, with each step incorporating new evidence through the increment sequence joined under $\vee_k$ and closed under the closure operator. Across the settling, every cell's trajectory is $\leq_k$-monotone individually and the global state at each step is a coherent valuation.

**CRDT-convergence realizes the distributed pressure.** The cellwise $\vee_k$-merge on settlings is a join-semilattice operation, and independently-evolving replicas of a settling, when merged, converge to a common limit without consensus. The same algebraic content — the knowledge-order join — realizes both temporal accumulation across moments and distributed accumulation across observers; this single-operation answer to two pressures is the structural payoff of treating adjudication as one role.

Adjudication is distinguished from inference. Adjudication is the role of *holding* content — representing what is currently known, in conflict, unknown, or agreed across observers, in a form on which inference can then operate. The closure operator is the role of *deriving* new content from accumulated content. Closure and adjudication compose: closure runs inside each settling step, adjudication structure persists across steps. A framework that conflates the two — treating inference as the only operation on the value space — loses the distinction between *what has been settled* and *what can be derived from what has been settled*.

### The Belnap partition of FOUR into illocutionary force classes

The four Belnap values $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ partition the positing-datum space into four pairwise-disjoint exhaustive illocutionary force classes (Belnap speech-act partition theorem, sketch status in the library):

| Value | Class | Reading |
|---|---|---|
| $\bot$ | Abstaining | No illocutionary act; identity morphism |
| $\mathbf{t}$ | Asserting | Positive evidence only; claiming truth |
| $\mathbf{f}$ | Denying | Negative evidence only; claiming falsity |
| $\top$ | Contesting | Both sides present; paraconsistently held |

**Closure under same-class $\vee_k$.** Asserting $\vee_k$ Asserting = Asserting; Denying $\vee_k$ Denying = Denying; Contesting $\vee_k$ Anything = Contesting (absorbing); Abstaining $\vee_k$ Anything = the other class (identity). **Cross-class $\vee_k$:** Asserting $\vee_k$ Denying $= \mathbf{t} \vee_k \mathbf{f} = \top =$ Contesting. An asserter and a denier together produce a contested cell — the bilattice holds the contradiction without collapse.

**Klein-four action on classes.** Negation $\sim$ (swaps $\mathbf{t}, \mathbf{f}$, fixes $\bot, \top$) swaps Asserting $\leftrightarrow$ Denying; conflation $-$ (swaps $\bot, \top$, fixes $\mathbf{t}, \mathbf{f}$) swaps Abstaining $\leftrightarrow$ Contesting; the combined $\sim \circ -$ swaps both pairs. The two orbits $\{\text{Asserting, Denying}\}$ and $\{\text{Abstaining, Contesting}\}$ do not mix under the Klein-four action — the speech-act classification respects the bilattice's intrinsic symmetry.

The Belnap partition gives the speech-act reading mathematical content. The partition is not chosen for human-language matching; it falls out of the four values of $\mathbf{FOUR}$ plus the structural closure under $\vee_k$. Speech-act semantics is therefore *derived*, not postulated.

## Synthesis-flags

The "world-as-ordinal" reading $\Box \phi = \forall \tau < \lambda.\,(\phi \text{ at stage } \tau)$ is named in source as the canonical modal structure on a settling; the present survey records it as derived rather than postulated, mirroring source language. The decidability and complexity bounds on the four-valued modal logic are reported from named theorems (modal-FMP and complexity bounds) cited in source files but not directly read this session. The Belnap speech-act partition theorem is named as sketch status in source.

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/twist-modal-translation.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/world-set.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/bilattice-accessibility-relation.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/adjudication.md`

External citations named in the source material:

- Rivieccio et al. (2017), Proposition 5.20 — non-modal twist-product translation for $\mathbf{L}^\bowtie$.
- Halpern and Moses (1992) — PSPACE-complete and EXPTIME-complete bounds on the minimal normal bimodal logic.
- Blackburn, de Rijke, and Venema (2001) — same.
- Belnap (1977) — the four-valued paraconsistent logic.

Cross-referenced theorems named in source material (not directly read this session):

- The modal-FMP-and-complexity-bounds theorem.
- The Belnap speech-act partition theorem (sketch status).
- The classical-three-valued-paraconsistent-foils document.
- The CRDT-convergence theorem and the settling-merge-semilattice theorem (cited in `adjudication.md`).
