---
type: concept
class: pattern
status: draft
depends-on: [right-residuation-operator, residuated-restriction-as-authority-gate, jural-relation]
realizes: [authority]
---

# Authority gate

A recurring substrate pattern: an incoming payload's contribution to a target cell is *gated* by a fixed authority element via the [right-residuation operator](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) $\mathrm{R}_a(x) = a \Rightarrow x$ on $\mathbf{FOUR}$:

$$\text{landed-payload} \;:=\; \text{authority}(s, p, o) \;\Rightarrow\; \text{candidate-payload}(s, p, o).$$

The four authority profiles ($\bot, \mathbf{t}, \mathbf{f}, \top$) and their action on each payload value are fixed by the table in the [residuated-restriction-as-authority-gate theorem](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md).
Every governance morphism that asks "does this actor have the standing to do this?" before admitting an increment is an instance of this pattern; the authority element is the actor's relevant [jural relation](../objects/jural-relation.md) value.

## Where the pattern appears

- **[Delegation](../morphisms/delegation.md)** — the principal $Q$'s power-cell value over the action $X$ gates the candidate-payload that would create the derived grant $R^B$.
  Sub-scope $G \subsetneq X$ is exactly the residuation profile in which the principal's *affirming* authority transparently passes a properly-restricted payload but converts an over-scoped payload to $\bot$ (no derivation occurs).
  Made precise in [delegation-as-authority-residuation](../theorems/delegation-as-authority-residuation.md).
- **[Dispatch](../../../morphisms/dispatch.md)** — the dispatcher's power-cell over `assign-T` gates the assignment payload.
  The capability-match valuation $\delta(A, T)$ is the *first* of three gates; the authority residuation is the *second*.
- **[Installation](../morphisms/installation.md)** — the installer's power-cell over `install-into-O` gates the recognition-predicate increment.
  An infelicitous attempt is exactly the residuation producing $\bot$ on the candidate payload.
- **[Revocation](../morphisms/revocation.md)** — the revocation-power cell gates the retraction payload.
  A constrained-irrevocable delegation is one where $\langle R^{\mathrm{revoke}}, \texttt{active}, \cdot\rangle = \mathbf{f}$; row 3 of the residuation table is *uniformly permissive*, which is the structural source of the engineering rule that constrained-irrevocability must be encoded *outside* the residuation gate (e.g. as a closure-rule block) rather than as a $\mathbf{f}$-valued authority element.
- **[Charter rules](../theorems/charter-as-closure-system.md)** — the rule-tier hierarchy gates which fragment a candidate consequent may use.
  Charter-as-authority is the structural-level instance: the charter's constitutive power gates *which closure rules* may fire at all.

## What the concept rules out

Substrate disciplines that say "silent authority is permissive" or "denying authority blocks payloads" are reading the residuation table wrong.
The theorem's four rows are *structurally distinct*: silent authority ($\bot$) is permissive on three of four payloads but converts $\mathbf{f}$-payloads to $\bot$; denying authority ($\mathbf{f}$) is *uniformly permissive* (the ex-falso row); paraconsistent authority ($\top$) collapses positive and silent payloads to silence.
Any governance specification that uses an authority gate must read the table for the authority profile it intends, not the intuition of the word "permission."

The concept is the substrate-algebraic content of the work-vocabulary commitment that authority is *evidence-shaped* rather than rule-shaped: an authority is a $\mathbf{FOUR}$-valued cell in the operations settling, not a switch.
Permission, denial, silence, and contestation are the four authority states, and each acts differently on each candidate payload.

## Position

This concept is the unifying frame for the otherwise-scattered authority checks that appear under `## Felicity conditions`, `## Sub-delegation bound`, capacity-and-authority remarks in dispatch, and the charter's tier hierarchy.
Naming the pattern lets later morphisms cite the concept rather than restating the residuation gating each time.
