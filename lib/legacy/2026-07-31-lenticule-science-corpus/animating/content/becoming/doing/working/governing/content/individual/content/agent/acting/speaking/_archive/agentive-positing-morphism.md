---
type: morphism
class: operator
symbol: "\\mathrm{posit}^a_{(\\phi,\\, q)}"
status: draft
depends-on: [positing-morphism, multi-observer-system, predication-settling, knowledge-order, entity-set]
see-also: [assertive-positing-morphism, denial-positing-morphism, contestation-positing-morphism, bilattice-network-sheaf-consensus]
---

# Agentive positing morphism

The **agentive positing morphism** is a positing morphism attributed to a specific observer $a \in O$ in a [multi-observer system](../objects/multi-observer-system.md).
It is a triple $(a, \phi, q)$ — an observer, a [predication cell](teaching/explanations/predication-cell.md) $\phi \in \Phi$, and a datum $q \in \mathbf{L}^\bowtie$ — producing the atomic [positing morphism](positing-morphism.md) $\mathrm{posit}^a_{(\phi, q)} := \mathrm{posit}_{(\phi, q)}$ acting on observer $a$'s individual settling $v^a$ within the system.

$$\mathrm{posit}^a_{(\phi,\, q)} : v^a \longmapsto v^a \vee_k \delta_{\phi,\, q}$$

The agentive attribution is the additional datum: which observer performed the positing act.
This is not present in the base [positing morphism](positing-morphism.md), which is defined on a single settling without an observer index.

## The assert/claim classification (derived property)

An agentive positing morphism $\mathrm{posit}^a_{(\phi, q)}$ is classified by its relation to the merged settling $\bar{v}$:

- An **assertion** by $a$ if the globally-merged settling $\bar{v} = \bigvee_k^{b \in O} v^b$ satisfies $\bar{v}(\phi) = v^a(\phi)$ after the posit — i.e., no other observer has placed a conflicting posit, so the individual value agrees with the merge.
- A **claim** by $a$ if $\bar{v}(\phi) \neq v^a(\phi)$ after the posit — the merge diverges from $a$'s individual value, typically $\bar{v}(\phi) = \top$ because another observer $b$ has posited an incompatible datum at $\phi$.

This is a **relational** property of the morphism, not intrinsic to $(a, \phi, q)$ alone; it depends on the global state of the multi-observer system.

## Morphisms in the multi-observer settling system

The multi-observer settling system has individual settlings $\{v^a\}_{a \in O}$ and a merged settling $\bar{v}$.
An agentive positing morphism acts on the individual settling:

$$\mathrm{posit}^a_{(\phi,\, q)} : (v^a, \bar{v}) \longmapsto (v^a \vee_k \delta_{\phi, q},\; \bar{v} \vee_k \delta_{\phi, q}).$$

The merged settling is updated simultaneously (since $\bar{v} = \bigvee_k v^b$ and $v^a$ contributes to $\bar{v}$).
The agentive morphism therefore acts on the entire multi-observer system, not just on $a$'s individual settling.

## Attribution and the speech-act layer

The agentive positing morphism is the mathematical substrate for speech-act attribution: saying "agent $a$ asserted $(s, p, o)$ at value $q$" is precisely the claim that $\mathrm{posit}^a_{(\phi, q)}$ was applied to $v^a$ at some stage $\tau$ of the settling.

The four speech-act classes (asserting, denying, contesting, abstaining) from the [Belnap speech-act partition theorem](../theorems/belnap-speech-act-partition.md) apply to agentive positing morphisms in the same way as to unattributed ones: the class is determined by the truth-order class of the datum $q$.

## Assertion time (open)

The [johnston2014](references/johnston2014.md) tritemporal model adds an **assertion time** interval $[\tau_0, \tau_1) \subseteq \lambda$ to a positing morphism, tracking the period during which the agent holds the posit in force.
The extension to temporally-bounded positing morphisms with an assertion-time interval $[\tau_0, \tau_1) \subseteq \lambda$ is established by the [temporally-bounded positing theorem](../theorems/temporally-bounded-positing.md): retraction at $\tau_1$ is modeled as a denial positing morphism, escalating the cell to $\top$.

## Connection to [adjudication](teaching/explanations/adjudication.md)

[Adjudication](teaching/explanations/adjudication.md) is the role of producing an epistemic state at every cell from accumulating, possibly conflicting, possibly partial sources.
The agentive positing morphism is the producing side: each agent contributes evidence via agentive positing morphisms, and adjudication is the $\vee_k$-merge that combines all contributions into the global settled state.
The [bilattice network sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) guarantees that individual agentive positing morphisms converge — under $\vee_k$-merge — to a shared limit state.
