---
type: definition
class: poset
symbol: "W"
depends-on: [inconsistency-sheaf, paraconsistent-equality, four-bilattice, knowledge-order]
see-also: [bigraded-settling-cohomology, settling-monotonicity, closure-2-monad-lax-idempotence]
name: Repair-resolution poset
description: A repair-resolution poset $W = (\{\textsf{open}, \textsf{proposed}, \textsf{resolved}, \textsf{archived}\}, \leW)$ is the four-element forward-only poset of states a $\top$-cell witness in the inconsistency sheaf may occupy as it…
---

# Repair-resolution poset

A **repair-resolution poset** $W = (\{\textsf{open}, \textsf{proposed}, \textsf{resolved}, \textsf{archived}\}, \le_W)$ is the four-element forward-only poset of states a $\top$-cell witness in the [inconsistency sheaf](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) may occupy as it traverses its repair lifecycle. The poset is the math-side carrier of the substrate's monotone, append-only repair-tracking discipline.

## Order relation

As a *poset*, $W$ is the chain

$$
\textsf{open} \;\le_W\; \textsf{proposed} \;\le_W\; \textsf{resolved} \;\le_W\; \textsf{archived}
$$

— the relation $\textsf{open} \le_W \textsf{resolved}$ holds by transitivity. The poset $W$ alone is therefore the standard four-element total order, and any structural claim depending only on the ordering of states (forward-only state assignment, archival-as-maximum, monotonicity of $\rho$) is a claim about $W$.

The substrate's resolution discipline distinguishes *which path* a witness took to reach $\textsf{resolved}$ — the chain through $\textsf{proposed}$ vs. an **acknowledgement shortcut** that bypasses $\textsf{proposed}$ entirely. Path information is not poset structure; it is recorded by a *transition refinement* $W^{\flat}$, defined below. Theorems whose conclusion depends on which path was taken depend on $W^{\flat}$, not on $W$.

The transition diagram of $W^{\flat}$:

$$
\begin{array}{ccc}
\textsf{open} & \longrightarrow & \textsf{proposed} \\
\downarrow & & \downarrow \\
\textsf{resolved} & = & \textsf{resolved} \\
& & \downarrow \\
& & \textsf{archived}
\end{array}
$$

$W^{\flat}$ is the small category whose objects are the four states and whose arrows are the *recorded transitions* (not the order relation): the through-$\textsf{proposed}$ arrow $\textsf{open} \to \textsf{proposed} \to \textsf{resolved}$ and the acknowledgement arrow $\textsf{open} \to \textsf{resolved}$ are distinct morphisms with the same domain and codomain. Each transition arrow carries a **kind** label $\kappa \in \{\textsf{affirm}, \textsf{retract}, \textsf{acknowledge}\}$:

- The chain through $\textsf{proposed}$ carries $\kappa \in \{\textsf{affirm}, \textsf{retract}\}$ — the resolution arose from a candidate cell whose σ/Δ closure cleared the contradiction.
- The acknowledgement arrow carries $\kappa = \textsf{acknowledge}$ — the resolution is a recorded recognition without a closure-clearing cell.

Formally: $W$ is the underlying poset of $W^{\flat}$ (forgetting which morphism realised each $\le_W$); $W^{\flat}$ is the disjoint union of the affirm/retract chain and the acknowledge chain, glued at the objects $\textsf{resolved}$ and $\textsf{archived}$. A *resolution-trajectory* of a witness is a morphism in $W^{\flat}$, not just an inequality in $W$.

## Structural properties

**Forward-only.** The order $\le_W$ is irreflexive on transitions: the substrate's repair-tracking never reduces $\le_W$. A state assignment $\rho : \mathrm{Wit} \to W$ on the $\top$-cell witness set evolves only along $\le_W$.

**Pointed at $\textsf{open}$.** $\textsf{open}$ is the unique minimum; every witness begins at $\textsf{open}$ when emitted at $\top$-cell creation.

**Bounded above by $\textsf{archived}$.** $\textsf{archived}$ is the unique maximum; transitions terminate there. Archiving is well-defined only on witnesses already at $\textsf{resolved}$ — the substrate refuses $\textsf{open} \to \textsf{archived}$ and $\textsf{proposed} \to \textsf{archived}$.

**Acknowledgement as path-shortcut in $W^{\flat}$.** In the underlying poset $W$, the inequality $\textsf{open} \le_W \textsf{resolved}$ holds whether or not a witness traversed $\textsf{proposed}$, so the poset $W$ is silent on which arrow was taken. The acknowledgement arrow lives in $W^{\flat}$: it provides a non-composite morphism $\textsf{open} \to \textsf{resolved}$ that bypasses $\textsf{proposed}$. This is the math content of "acknowledgement is a recognition shortcut, not a confirmation of σ/Δ-closure" — the recognition shortcut is a distinct *transition*, not a distinct *order-relation*.

**Kind-labelling preserves resolution-membership but not resolution-content.** At the object $\textsf{resolved}$ in $W^{\flat}$, the kinds $\kappa = \textsf{affirm}$, $\kappa = \textsf{retract}$, and $\kappa = \textsf{acknowledge}$ all label arrows whose codomain is $\textsf{resolved}$, but only the $\textsf{affirm}$ and $\textsf{retract}$ arrows guarantee that the underlying $\top$-cell has been bilattice-cleared (its valuation has moved to a non-$\top$ value at a later step ordinal under closure). The $\textsf{acknowledge}$ arrow promises only the recorded recognition, so the underlying $\top$-cell may persist with valuation $\top$ in the inconsistency sheaf.

## Action on the inconsistency sheaf

Let $\rho_\tau : \mathrm{Wit}_\tau \to W$ be the resolution-state assignment at step ordinal $\tau$, with $\mathrm{Wit}_\tau$ the set of $\top$-cell witnesses emitted by stage $\tau$. Then:

- **$H^0$ of the open fragment.** The pre-image $\rho_\tau^{-1}(\{\textsf{open}, \textsf{proposed}\}) \subseteq \mathrm{Wit}_\tau$ counts witnesses whose $\top$-cell has not yet been resolved by any means; this is the substrate's "live contradictions" count contributing to $H^0$ of [bigraded settling cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) at the row $m=1$.
- **The $\textsf{acknowledge}$-resolved subfragment is cohomologically distinguished.** The pre-image $\rho_\tau^{-1}(\{\textsf{resolved}\}) \cap \kappa^{-1}(\{\textsf{acknowledge}\})$ is *not* a coboundary contributor — its $\top$-cells remain in $\mathcal{F}_U^{(\top)}$. The $\textsf{affirm}/\textsf{retract}$-resolved subfragment, by contrast, witnesses the existence of a later cell whose merge cleared the $\top$-valuation, and thereby contributes a coboundary to the $H^1$ generator at the firing ordinal of the contradiction.
- **The $\textsf{archived}$-fragment is filtered out by the default cohomology query.** Archiving is an audit-retention discipline, not a cohomological operation; the sheaf cohomology is computed on the unarchived fragment unless the audit configuration explicitly requests historical inclusion.

## Composition with the witness fibration

For a $\top$-cell witness $w$ recorded at step ordinal $\tau_w$, the assignment $\rho_\tau(w)$ is non-decreasing in $\tau$ (forward-only) and is non-decreasing in the natural projection from $W$ to its underlying chain $\textsf{open} < \textsf{proposed} < \textsf{resolved} < \textsf{archived}$ (treating the acknowledgement shortcut as a refinement). A re-occurrence of the same contradiction at a later $\tau' > \tau_w$ creates a *new* witness $w' \in \mathrm{Wit}_{\tau'}$ with its own independent $\rho$-trajectory; the original $w$'s state under $\rho$ is not affected, and its $H^1$-class is determined by $\tau_w$ rather than by any subsequent re-occurrence.

This is the math reading of "the new witness's lifecycle is independent of the old": the resolution-poset assignment is per-witness, the witness-set is monotone-growing in $\tau$, and the per-witness $\rho$-trajectory is forward-only in $\le_W$.

## Position

$W$ is the bookkeeping object that records *what kind of progress has been made on each $\top$-cell* in a way the inconsistency-sheaf cohomology can consume. The math definition is the smallest poset that:

1. Distinguishes "candidate proposed but not yet confirmed" from "confirmed by σ/Δ closure" — required by the substrate's σ/Δ-pass discipline that confirms a repair only by observing absence of fresh $\top$-cells.
2. Distinguishes "cleared by a later cell" from "acknowledged by recognition" — required by the cohomological distinction between contradictions whose $\top$-cell has been moved off and contradictions whose $\top$-cell persists with a recorded acknowledgement.
3. Admits archiving as a forward-only audit-retention transition that filters the default cohomology view.

Engineering-side, $W$ (with kind-labels recovering the $W^{\flat}$ structure) surfaces in the substrate as the [inconsistency-sheaf-record](../../documents/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/inconsistency-sheaf-record.md) `repair-resolutions` field; cohomological consequences (which depend on $W^{\flat}$ — specifically on which kind-labelled arrow into $\textsf{resolved}$ a witness took) are recorded in [acknowledged-resolution-preserves-top-cell-membership](../../documents/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/acknowledged-resolution-preserves-top-cell-membership.md).
