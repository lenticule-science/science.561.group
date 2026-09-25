---
type: morphism
class: retrospective-settling
status: draft
symbol: "\\varrho"
depends-on: [jural-relation, installation, witness-as-increment]
realizes: [hohfeldian-ratification]
aliases:
  - Ratification
---

# Ratification

The Hohfeldian operation by which an authorizing office *retrospectively settles* an act performed without prior authorization. Per the library's [hohfeldian-ratification term](../../../../../../governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-ratification.md), a ratification is a triple $\mathcal{Q} = (O, a, \varrho)$ — an authorizing office $O$, an unauthorized act $a$, and a ratification declaration $\varrho$ that retrospectively assigns $a$ to the substrate's settled-as-authorized state.

## Definition

Given:

- An office $O$ that holds the [jural-relation](../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md) of `power` over the action-domain $D(a)$ — $\langle R^P, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R^P, \texttt{potential-holder}, O\rangle = \mathbf{t}$, $\langle R^P, \texttt{scope-action}, D(a)\rangle = \mathbf{t}$.
- An act $a$ performed at stage $\tau_a$ by an agent $p$ within $D(a)$ but without $O$'s prior authorization. The act produced a witness increment $u_{\tau_a}$ that settled cells related to $a$, but the *authorization cell* $\langle a, \texttt{authorized-by}, O\rangle$ remained at $\bot$ at $\tau_a$.
- A ratification declaration $\varrho$ — a speech act by $O$'s incumbent at stage $\tau^* > \tau_a$.

The ratification produces an increment at $\tau^*$ asserting:

- $\langle a, \texttt{authorized-by}, O\rangle = \mathbf{t}$ — the missing authorization cell now settles to $\mathbf{t}$.
- $\langle a, \texttt{ratified-at}, \tau^*\rangle = \mathbf{t}$ — explicit record of the ratification stage.
- $\langle a, \texttt{ratification-declaration}, \varrho\rangle = \mathbf{t}$ — references the declaration entity.

## The retrospective effect

Ratification's distinctive property is its *retrospective* reach: after $\tau^*$, the substrate treats $a$ as having been authorized *from* $\tau_a$, not from $\tau^*$. Substrate-algebraically, this is a *historical-status reassignment* rather than a backward edit:

- The increment cells from $\tau_a$ are unchanged (by [settling-monotonicity](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) they cannot be).
- A new cell at $\tau^*$, $\langle a, \texttt{retroactively-authorized-from}, \tau_a\rangle = \mathbf{t}$, records the institutional fiction that the system treats $a$'s authorization as having held since $\tau_a$.
- Closure rules consulting $a$'s authorization status at any $\tau \geq \tau^*$ read the ratification cell and produce *as-if-authorized* outputs; rules consulting status strictly before $\tau^*$ continue to read $\bot$.

The substrate maintains both readings simultaneously: the *factual* history (act unauthorized at $\tau_a$) and the *normative* history (act treated as authorized from $\tau_a$ after $\tau^*$). The audit log can reconstruct either.

## Four substrate invariants

Per the library's four invariants for a valid ratification:

**Authority to ratify.** The office $O$ must hold the power to authorize acts of $a$'s type. As substrate condition: the closure rule that admits a ratification increment requires $R^P$ exist with $\langle R^P, \texttt{scope-action}, D(a)\rangle = \mathbf{t}$. An attempted ratification by an office lacking the power produces a failure-witness, not a ratification.

**Full knowledge.** $\varrho$ must be made with full knowledge of $a$'s material facts. As substrate condition: $\varrho$'s admissibility requires $\langle \varrho, \texttt{informed-by-cells}, F_a\rangle = \mathbf{t}$ where $F_a$ is the set of $a$'s material-fact cells. If $F_a$ contains cells at $\bot$ when $\varrho$ is issued, the ratification is *voidable* — a subsequent witness asserting one of those cells at $\mathbf{f}$ admits a closure rule that drives the ratification's authorization cell to $\top$, requiring repair.

**Whole act ratification.** Ratification covers $a$ entirely; no partial ratification. As substrate condition: the closure rule treats $a$ as an indivisible cell-pattern. A purported ratification of a sub-pattern produces a failure-witness; what's wanted is treated as a *new act* (a modification of $a$), not a partial ratification.

**No intervening prejudice.** If between $\tau_a$ and $\tau^*$ a third party $D$ acquired rights via cells whose values depend on $a$'s authorization status being $\bot$, those cells take precedence: the closure rule that admits the ratification increment checks for *third-party-prejudice* cells $\langle D, \texttt{vested-right-from}, \tau\rangle$ for $\tau_a \leq \tau \leq \tau^*$, and the ratification's retrospective reach is *bounded* by such intervening cells. The ratification's retrospective effect does not reach back through them.

## Composition with installation

Ratification is closely related to [installation](../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md): both are speech acts by an authorized office that settle predicates over an act/incumbency. The distinction is *temporal direction*: installation drives a recognition predicate forward from $\tau_a$ (the moment of installation); ratification drives an authorization predicate retrospectively to $\tau_a$ (a prior moment).

This is why ratification has the additional fourth invariant (no third-party prejudice) that installation does not need: installation's effect is forward, so it cannot disturb cells settled before its issue. Ratification's retrospective effect must explicitly avoid disturbing intervening cells.

## Composition with assignment and novation

Ratification of an unauthorized assignment-attempt by an agent $p$ to a beneficiary $B$ (where $p$ lacked the power to assign) is a common case. The ratification by the proper authority $O$ retrospectively settles the assignment's authorization, after which the [assignment](./assignment.md) morphism's downstream effects (claim transfer, notice-binding) are treated as having been admissible from $\tau_a$. Without ratification, the unauthorized assignment-attempt would have produced only a failure-witness, leaving the claim with $p$'s unsanctioned attempt recorded but not effectuated.
