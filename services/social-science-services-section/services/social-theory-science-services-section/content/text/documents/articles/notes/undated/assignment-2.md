---
type: morphism
class: claim-transfer
status: draft
symbol: "\\alpha"
depends-on: [jural-relation, predicate-converse]
realizes: [hohfeldian-assignment]
title: Assignment
description: The Hohfeldian operation that transfers a claim from one holder to another while leaving the correlative duty unchanged.
---

# Assignment

The Hohfeldian operation that transfers a *claim* from one holder to another while leaving the correlative duty unchanged. Per the library's [hohfeldian-assignment term](../../../../../../../../content/text/glossary/terms/hohfeldian-assignment.md), an assignment is a triple $\mathcal{A} = (Q, C, B)$ with assignor $Q$, assigned claim $C$, assignee $B$, and an assignment act $\alpha$ that moves $C$'s section from $Q$'s authority domain to $B$'s.

## Definition

Given a [jural-relation](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md) $R^C$ of `kind: claim` held by $Q$ — $\langle R^C, \texttt{potential-holder}, Q\rangle = \mathbf{t}$, $\langle R^C, \texttt{passive-party}, P\rangle = \mathbf{t}$ (the obligor), $\langle R^C, \texttt{scope-action}, X\rangle = \mathbf{t}$ — an assignment $\alpha$ to assignee $B$ produces a new jural relation $R^{C'}$ with:

- $\langle R^{C'}, \texttt{kind}, \texttt{claim}\rangle = \mathbf{t}$
- $\langle R^{C'}, \texttt{potential-holder}, B\rangle = \mathbf{t}$
- $\langle R^{C'}, \texttt{passive-party}, P\rangle = \mathbf{t}$ — same obligor
- $\langle R^{C'}, \texttt{scope-action}, X\rangle = \mathbf{t}$ — same scope
- $\langle R^{C'}, \texttt{derived-from}, R^C\rangle = \mathbf{t}$ — explicit linkage to the source

and simultaneously drives $\langle R^C, \texttt{potential-holder}, Q\rangle$ from $\mathbf{t}$ toward $\mathbf{f}$ — $Q$ no longer holds the claim. (Implementation note: by [settling-monotonicity](../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the cell moves to $\top$ rather than to $\mathbf{f}$ outright; the substrate's repair operation that resolves $\top$ to $\mathbf{f}$ fires under the assignment-witness-justified condition.)

## Three substrate-algebraic invariants

The library's three invariants for a valid assignment render as closure-rule conditions:

**Assignability.** $C$ must be assignable: not personal to $Q$, not made non-assignable by the governing normative system. As a substrate condition: a closure rule fires the assignment increment only when $\langle R^C, \texttt{personal-to-holder}, Q\rangle \neq \mathbf{t}$ and $\langle R^C, \texttt{non-assignable-in}, N\rangle \neq \mathbf{t}$ for the governing normative system $N$. Failure produces a failure-witness, not an assignment.

**Obligor's duty preserved.** The correlative duty of $P$ (the obligor) remains. Per [correlate-of](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/services/predicated-governance-services-section/content/glossary/terms/correlate-of.md), the duty is the predicate-converse of the claim. Since both $R^C$ and $R^{C'}$ have the same $P$ in the passive-party slot, the converse $R^{D}$ on $P$ — $\langle R^D, \texttt{kind}, \texttt{duty}\rangle$, $\langle R^D, \texttt{potential-holder}, P\rangle$ — has its `passive-party` cell update from $Q$ to $B$ (the obligation now runs to $B$) but the duty itself persists.

**Notice of assignment.** Effectiveness against $P$ requires $P$'s notice of $\alpha$. As a substrate condition: $\langle P, \texttt{notified-of}, \alpha\rangle = \mathbf{t}$ must settle for the duty's `passive-party` to be authoritatively updated. Before notice, $P$ may discharge to $Q$ (the original holder); after notice, $P$ must discharge to $B$.

## Composition with delegation

Assignment is structurally distinct from [delegation](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/delegation.md):

- **Assignment** transfers a *claim* (right). $Q$ no longer has $C$ after $\alpha$.
- **Delegation** transfers a *power* (authority to act on behalf). $Q$ retains accountability after delegating; $B$ acts on $Q$'s behalf.

The work vocabulary's distinction lives in the cell-level structure: assignment removes the potential-holder cell on $R^C$ from $Q$, while delegation creates a new $R^B$ derived from $R^P$ without removing the source. Sub-delegation (delegatus non potest delegare) and partial assignment have parallel structural treatments via predicate-specialization on the scope-action cell.

## Notice as a witness

The notice condition makes assignment a *two-stage* operation: stage 1 is the assignor-side increment moving the claim; stage 2 is the obligor-notice increment. The full assignment effect requires both stages settled. This is parallel to the [installation](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) two-stage structure (recognition then induction), but with a different second axis: notice rather than forward-stability.
