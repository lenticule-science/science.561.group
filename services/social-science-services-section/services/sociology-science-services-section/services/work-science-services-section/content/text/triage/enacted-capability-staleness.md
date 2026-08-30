---
type: concept
class: capability-temporal-property
depends-on: [capability-fiber-bundle, witness-as-increment, operations-settling, dispatch-readiness]
see-also: [capability-matching, capability-availability-from-existential, quantale-enriched-dispatch-for-work]
---

# Enacted capability staleness

**Enacted capability staleness** is the state of a capability fiber that was witnessed as present at time $\tau_1$ but has not been demonstrated since, and is therefore of uncertain reliability at time $\tau_2 \gg \tau_1$. It formalizes Orlikowski's account of *capability as enacted in practice* — not as a static asset but as a recurrent accomplishment — within the settling substrate.

## The settling-monotonicity problem

The [capability-fiber-bundle](../objects/capability-fiber-bundle.md) records capability possession as a cell $\langle A, \texttt{has-capability}, C\rangle = \mathbf{t}$ when sufficient witnessing evidence has accumulated. By settling monotonicity, this cell cannot retract to $\bot$ — the evidence of past capability is permanent. But Orlikowski's account implies that a capability unexercised for long enough is genuinely unreliable: the agent *had* the capability but may no longer *have* it in the operational sense.

Enacted capability staleness is not a retraction of the past capability cell. It is the installation of a new staleness cell that the authority-gate conditions on, leaving the original capability cell intact as a historical record.

## Definition

Let $A$ be an agent, $C$ a capability, and $\lambda_C$ a staleness bound — the maximum interval between demonstrations before $C$ is considered stale for $A$. The staleness cell is:

$$\langle A, \texttt{capability-stale}, C\rangle = \mathbf{t}$$

installed by a charter closure rule of the form: if $\langle A, \texttt{has-capability}, C\rangle = \mathbf{t}$ at $\tau_1$ and no execution event $E$ by $A$ demonstrating $C$ (i.e., $\langle E, \texttt{demonstrates-capability}, C\rangle = \mathbf{t}$) exists in the interval $[\tau_1, \tau_1 + \lambda_C]$, then $\langle A, \texttt{capability-stale}, C\rangle = \mathbf{t}$ at $\tau_1 + \lambda_C$.

A staleness cell is cleared (or superseded) by a fresh demonstration: a new execution event $E'$ by $A$ demonstrating $C$ at $\tau' > \tau_1 + \lambda_C$ installs a *refreshed-capability* cell $\langle A, \texttt{capability-refreshed}, C, \tau'\rangle = \mathbf{t}$, which the dispatch morphism's authority-gate conditions on.

## Authority-gate modification

The [dispatch](../morphisms/dispatch.md) morphism's readiness condition is modified: agent $A$ is dispatchable for tasks requiring capability $C$ iff $\langle A, \texttt{has-capability}, C\rangle = \mathbf{t}$ AND ($\langle A, \texttt{capability-stale}, C\rangle \neq \mathbf{t}$ OR $\langle A, \texttt{capability-refreshed}, C, \tau'\rangle = \mathbf{t}$ for some $\tau'$ after the staleness onset). The original capability cell is necessary but not sufficient; the absence of a staleness cell (or presence of a refresh cell) is additionally required.

## Connection to Indigenous knowledge transmission

The staleness concept finds its most theoretically developed analog in Indigenous knowledge transmission traditions, where the idea that knowledge must be actively practiced to remain alive is foundational — not merely a practical observation but a structurally important commitment. A ceremony not performed, a language not spoken, an ecological practice not enacted loses something that cannot be restored by documentation alone; it must be re-enacted.

The substrate's staleness concept captures part of this: the capability cell (historical record of past enactment) remains, but its operational force requires ongoing demonstration. However, the substrate does not yet capture the stronger claim some traditions make: that capability-without-enactment is not merely stale but constitutively absent — the knowledge *is* the performance, not a property that persists between performances. See the library question [indigenous-knowledge-transmission-as-enacted-capability](../../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/questions/indigenous-knowledge-transmission-as-enacted-capability.md) for whether this stronger claim requires a different substrate representation.

## The staleness bound $\lambda_C$

The staleness bound is capability-specific and governance-pattern-dependent. Some capabilities stale quickly (first-aid skills require recent practice); others stale slowly (language abilities). The bound $\lambda_C$ is a charter parameter, not a substrate constant. In a restorative-accountability polity, the staleness bound for conflict-resolution capabilities might be very short (regular practice required); in a consensus-governance polity, the staleness bound for deliberative capabilities might be longer (elder knowledge is honored as durable).
