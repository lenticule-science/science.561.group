---
type: morphism
class: claim-transfer
status: draft
symbol: "\\alpha"
depends-on: [jural-relation, predicate-converse]
realizes: [hohfeldian-assignment]
aliases:
  - Assignment
---

# Assignment

The Hohfeldian operation that transfers a *claim* from one holder to another while leaving the correlative duty unchanged. Per the library's [hohfeldian-assignment term](../../../../../../../../../../../../content/text/glossary/terms/hohfeldian-assignment.md), an assignment is a triple $\mathcal{A} = (Q, C, B)$ with assignor $Q$, assigned claim $C$, assignee $B$, and an assignment act $\alpha$ that moves $C$'s section from $Q$'s authority domain to $B$'s.

## Definition

Given a [jural-relation](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md) $R^C$ of `kind: claim` held by $Q$ — $\langle R^C, \texttt{potential-holder}, Q\rangle = \mathbf{t}$, $\langle R^C, \texttt{passive-party}, P\rangle = \mathbf{t}$ (the obligor), $\langle R^C, \texttt{scope-action}, X\rangle = \mathbf{t}$ — an assignment $\alpha$ to assignee $B$ produces a new jural relation $R^{C'}$ with:

- $\langle R^{C'}, \texttt{kind}, \texttt{claim}\rangle = \mathbf{t}$
- $\langle R^{C'}, \texttt{potential-holder}, B\rangle = \mathbf{t}$
- $\langle R^{C'}, \texttt{passive-party}, P\rangle = \mathbf{t}$ — same obligor
- $\langle R^{C'}, \texttt{scope-action}, X\rangle = \mathbf{t}$ — same scope
- $\langle R^{C'}, \texttt{derived-from}, R^C\rangle = \mathbf{t}$ — explicit linkage to the source

The effective holder changes under the admitted assignment and its notice
conditions; the historical source relation and assignment witness remain.
This is not a knowledge-monotone update from t through ⊤ to f of one unscoped
cell. In FOUR's knowledge order, t ≤ₖ ⊤, but ⊤ is not ≤ₖ f: deleting the positive
coordinate would lose evidence. State the scope/time/version of the holder
claim, or provide a separate revision operation with its laws and history
retention. The old text explicitly invokes a separate witness-justified repair; it does
not supply that repair’s definition or preservation law here. Recover that
contract before implementing the effective-state change.
The effective-state projection must show Q before the admitted transfer and B
after its applicable conditions, without falsifying that Q historically held
it. This is a mathematical representation requirement, not a new assignment
or notice policy.

## Three substrate-algebraic invariants

The library's three invariants for a valid assignment render as closure-rule conditions:

**Assignability.** $C$ must be assignable: not personal to $Q$, not made non-assignable by the governing normative system. The admitting rule must determine these blocking conditions under the
applicable normative system N and its default/completeness and conflict policy.
The former test “blocking cell ≠ t” is not equivalent to absence of positive
blocking evidence: ⊤ differs from t but contains its positive coordinate.
Unknown (⊥), negative-only (f) and contradictory (⊤) evidence must be kept
distinct. The governing system supplies which states admit assignment; this
term does not silently choose a new institutional conflict policy. A failed
assignability condition produces a failure-witness, not an assignment.

**Obligor's duty preserved.** The correlative duty of $P$ (the obligor) remains. Per [correlate-of](correlate-of.md), the duty is the predicate-converse of the claim. Since both $R^C$ and $R^{C'}$ have the same $P$ in the passive-party slot, the converse $R^{D}$ on $P$ — $\langle R^D, \texttt{kind}, \texttt{duty}\rangle$, $\langle R^D, \texttt{potential-holder}, P\rangle$ — has its `passive-party` cell update from $Q$ to $B$ (the obligation now runs to $B$) but the duty itself persists.

**Notice of assignment.** Effectiveness against $P$ requires $P$'s notice of $\alpha$. As a substrate condition: $\langle P, \texttt{notified-of}, \alpha\rangle = \mathbf{t}$ must settle for the duty's `passive-party` to be authoritatively updated. Before notice, $P$ may discharge to $Q$ (the original holder); after notice, $P$ must discharge to $B$.

## Composition with delegation

Assignment is structurally distinct from [delegation](delegation.md):

- **Assignment** transfers a *claim* (right). $Q$ no longer has $C$ after $\alpha$.
- **Delegation** transfers a *power* (authority to act on behalf). $Q$ retains accountability after delegating; $B$ acts on $Q$'s behalf.

The work vocabulary's distinction lives in the cell-level structure: assignment ends Q’s effective holding under the applicable transfer conditions while retaining its historical cell, whereas delegation creates a derived grant and retains the principal’s accountability. Sub-delegation (delegatus non potest delegare) and partial assignment have parallel structural treatments via predicate-specialization on the scope-action cell.

## Notice as a witness

The notice condition makes assignment a *two-stage* operation: stage 1 is the assignor-side increment moving the claim; stage 2 is the obligor-notice increment. The full assignment effect requires both stages settled. This is parallel to the [installation](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) two-stage structure (recognition then induction), but with a different second axis: notice rather than forward-stability.
