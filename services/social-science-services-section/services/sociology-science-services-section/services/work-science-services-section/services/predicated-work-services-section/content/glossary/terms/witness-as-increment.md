---
type: morphism
class: correspondence
status: draft
depends-on: [operations-settling, increment-sequence]
realizes: [witness, observation, event-log]
---

# Witness as increment

The correspondence between the operational *witnesses* of a working community and the *increment sequence* of the [operations settling](../objects/operations-settling.md).

A witness, in the engineering vocabulary of [the predicated-computing theory](../../../../../../../../../../engineering-services-section/services/computer-services-section/services/computer-systems-services-section/services/semiotic-computer-system-services-section/content/text/glossary/concepts/witness.md), is a substrate-recorded entry attesting that an event happened — an agent invoked a skill, a task was completed, a capability was asserted, a charter rule fired. Witnesses accumulate in the [event log](../../../../../../../../../../engineering-services-section/services/computer-services-section/services/computer-systems-services-section/services/semiotic-computer-system-services-section/content/text/glossary/terms/event-log.md), which is the chronological sequence of all witnesses recorded.

The math's [increment](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) at stage $\tau$, written $u_\tau$, is the new evidence introduced at that stage — a [predication valuation](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) representing the cells whose values the substrate is asserting at $\tau$.

The correspondence:

$$\text{witness } w \text{ at stage } \tau \;\;\longleftrightarrow\;\; \text{increment cell } u_\tau(\phi_w) = v_w$$

where $\phi_w$ is the predication cell the witness attests, and $v_w \in \mathbf{FOUR}$ is the value the witness asserts.

## Witness kinds and their increments

Each witness kind in the engineering vocabulary is a specific shape of increment:

- **Completion witness** — agent $A$ claims task $T$ is complete. Increment cell: $\langle T, \texttt{completed-by}, A\rangle$ at $\mathbf{t}$.
- **Failure witness** — task $T$ failed, recorded by $A$. Increment cell: $\langle T, \texttt{failed-by}, A\rangle$ at $\mathbf{t}$, plus a $\mathbf{f}$-value increment on the task's goal cells (settling them to negative evidence).
- **Enrollment witness** — agent $A$ has joined office $O$. Increment cell: $\langle A, \texttt{member-of}, O\rangle$ at $\mathbf{t}$. The capability-propagation closure rule then fires at the next closure step.
- **Observation witness** — agent $A$ records observation $X$ about scope $\sigma$. Increment cell: $\langle X, \texttt{observed-by}, A\rangle$ at $\mathbf{t}$, plus the substantive content cells of the observation.
- **Charter-violation witness** — a charter rule fired and detected a violation pattern. Increment cell: $\langle \texttt{violation-record}, \texttt{detected-by}, \texttt{rule}\rangle$ at $\mathbf{t}$.

## Determinism and replayability

Because $v^{\mathrm{op}}_{\tau+1}$ is determined by $v^{\mathrm{op}}_\tau$, $u_\tau$, and $\mathcal{S}_{\mathrm{op}}$ via [closure-drivenness](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md), the operations settling can be reconstructed at any stage from the initial state plus the witness/increment sequence. This is what makes the [event log audit-replayable](../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/provenance.md): the log alone, plus the closure-rule system, regenerates the operational state at every past moment.

## What the correspondence forbids

The correspondence is not bidirectional in shape: every witness corresponds to an increment cell, but not every increment cell needs a witness. Closure-rule consequents are *derived* values, not witnesses — they are what the closure operator produces from the prior state plus the witness-driven increments. The witness/increment correspondence is between *external evidence* and the increment sequence; the *internal* propagation of that evidence under closure is a separate concern.

This forbids a class of operational pathology: closure rules cannot synthesize witnesses. An agent's claim to have completed a task must be a witness — an increment cell at a specific stage, signed by the agent — not a derived value the closure rules conjured. The settling-monotonicity property guarantees that derived values cannot retract witnesses; the witness/increment correspondence guarantees that witnesses cannot be substituted by derivations.
