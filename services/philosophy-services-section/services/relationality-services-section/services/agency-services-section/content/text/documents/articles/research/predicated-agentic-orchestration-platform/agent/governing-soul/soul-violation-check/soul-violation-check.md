---
type: morphism
class: composed-operator
realizes: [governing-soul]
depends-on: [governing-soul, scope, modal-necessity-operator, modal-possibility-operator, predication-fiber-algebra]
see-also: [governance-decision, escalation, governance-as-modal-restriction]
title: Soul-violation check
description: The operator that, given a proposed substrate action, checks whether the action would violate the cited scope's governing soul.
---

# Soul-violation check

The operator that, given a proposed substrate action, checks whether the action would violate the cited scope's [governing soul](../governing-soul.md).
Per [governance-as-modal-restriction](../../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), soul-violation-check is structurally the substrate-side modal-validity check $\Box_R(\text{action-allowed}) \neq \mathbf{f}$ at the action's world: the action is admissible if and only if the modal evaluation of the soul-checking predicates at the action's world produces a non-falsifying value.

## Signature

`soul-violation-check(proposed-action, scope) → (admissible | violation-record, witness)`

Inputs:

- **`proposed-action`** — reference to a substrate action whose admissibility is being checked.
- **`scope`** — reference to the [scope](../../../scope/scope.md) the action affects.

Outputs:

- **`admissible`** — the action does not violate the soul; the action may proceed (subject to other admissibility checks).
- **`violation-record`** — a substrate event declaring the action violates the soul: which soul predication is contradicted, what about the action's effect contradicts it, the recorded violation severity.
- **`witness`** — the check's witness records the proposed action, the soul predications consulted, the verdict, and any cited closure rules.

## Operational semantics

The check proceeds in three steps:

1. *Read soul predications.* Read the scope's [governing soul](../governing-soul.md) entity and any predications the soul cites as load-bearing constraints.
  The soul predications collectively define the bilattice accessibility relation $R_{\text{soul}}$ at the action's world.
2. *Evaluate.* Apply the modal-necessity operator $\Box_{R_{\text{soul}}}$ to the proposed action's effect.
  Each soul predication has a closure rule that, when the rule's premise matches the proposed action's effect, marks the action as violating.
  If any rule matches at the action's world, $\Box_{R_{\text{soul}}}(\text{action-allowed}) = \mathbf{f}$ (or $\top$ for contested-violation cases).
3. *Verdict.* If the modal evaluation yields a non-falsifying bilattice value at the action's world, the action is admissible.
  If the value is $\mathbf{f}$ (clear violation) or $\top$ (contested), the action is a violation; the violation record cites which soul predications were contradicted, with severity per the soul predication's declared severity.

## Engineering invariants

- **Soul predications must be substrate-checkable.** A soul predication that cannot be turned into a closure rule that the substrate's operators can evaluate is, in practical terms, unenforced.
  The substrate's discipline requires that soul predications are operationalizable; ones that are not are recorded as aspirational but not enforced.
- **Witness records the consulted soul.** Every check's witness cites the soul version (canonical hash of the soul entity at the time of the check).
  Two checks of the same action against different soul versions can produce different verdicts; the substrate's audit can replay either per [settlement-determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md).
- **Severity-aware.** A violation may be recorded as recoverable (the action is still admitted but with a recorded warning), elevated (the action is paused pending resolution), or hard (the action is blocked outright).
  Severity is part of the soul predication's declaration.
- **Modal-coherent.** Per [governance-as-modal-restriction](../../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), the verdict is consistent with the modal evaluation.
  Two checks at the same world produce the same verdict.

## Failure modes

- **Ambiguous match.** A soul predication's closure rule matches with low confidence; the substrate's [repair](../../teaching/explanations/repair.md) discipline determines whether to escalate to human review or accept the recorded uncertainty.
- **Soul predication unevaluable.** A soul predication whose checking rule errors during evaluation produces a verdict-error; the action's admissibility is undecided pending substrate maintenance.

## Position in the platform

The soul-violation check is what makes the [governing soul](../governing-soul.md) operative rather than aspirational.
A scope with a soul whose checks are not run is a scope whose soul is wishful documentation; a scope whose [governance-decision](../../../governance/governance-decision/governance-decision.md) and other admissibility-deciding operators consult soul-violation-check is a scope whose soul shapes its actual behavior — structurally the substrate-side enforcement of modal-restriction governance.

The check runs alongside [governance-decision](../../../governance/governance-decision/governance-decision.md): even a governance-affirmative outcome cannot admit a soul-violating action.
The soul has veto authority over governance; the substrate's audit shows when soul-violation prevented an action that governance would have admitted.
