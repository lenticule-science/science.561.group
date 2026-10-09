---
type: concept
class: discipline
depends-on: [wavefront, settling-as-computation]
see-also: [closure-rule, repair, witness]
---

# Fuel bound

The discipline that every closure-rule-application sequence carries an explicit, finite resource budget — the *fuel* — and aborts with a recorded witness when the budget is exhausted before quiescence is reached. Fuel is not a host-runtime timeout; it is a substrate-level invariant: an operator's specification declares its fuel, and an operator that exceeds the declared fuel returns a specific divergence error without modifying the stored state.

Fuel is the engineering defense against closure-rule systems whose orbits do not converge in any finite number of steps. Some rule systems, on some inputs, require unbounded iteration; a predicated computer cannot run such systems to quiescence. The fuel bound declares how many steps the substrate WILL run, and the operator's contract is to report divergence at that point in the witness rather than silently continue.

Three properties of the fuel discipline:

- **Declared, not inferred.** The fuel is a parameter of the operator, declared in the input bundle. A default may be specified, but the default itself is part of the operator specification — a substrate entity, per [self-representation](self-representation.md) — not an arbitrary host choice.
- **Per-layer, not per-application.** A wavefront's fuel decrements once per breadth-first layer of closure-rule applications, not once per individual application. The layer is the operational unit of the iterated closure; per-application accounting would mismeasure the work the substrate is doing.
- **Witness-recorded on exhaustion.** When fuel is exhausted, the [witness](witness.md) records the consumed fuel and the last canonical hash reached. An auditor can replay the operator with the same fuel bound and verify that the same hash sequence was reached before exhaustion. The exhaustion is not a silent failure; it is a documented one.

A predicated computer's commitment to fuel discipline is the commitment that its closure operations are *guaranteed to halt* — either at quiescence (the rule system's natural fixed point) or at fuel exhaustion (a recorded divergence). Either outcome is admissible; neither is a substrate failure. What is not admissible is a closure operation that runs unboundedly without either reaching quiescence or recording divergence.

The discipline is what makes promised-convergence guarantees engineering-checkable: a particular predicated computer running a particular closure-rule system can declare a fuel bound that suffices for its expected workload, and any input that would exceed the bound is flagged at the substrate level rather than discovered through resource exhaustion at the host.
