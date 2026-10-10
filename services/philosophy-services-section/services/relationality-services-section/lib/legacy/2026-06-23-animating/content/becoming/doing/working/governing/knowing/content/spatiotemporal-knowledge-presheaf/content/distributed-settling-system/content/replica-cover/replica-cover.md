---
type: concept
class: cover-pattern
depends-on: [bitopological-settling-site, distributed-settling-system, paired-priestley-space]
---

# Replica cover

A two-element pairwise-Stone cover on the [bitopological settling site](../objects/bitopological-settling-site.md) corresponding to two replicas in a [distributed settling system](../objects/distributed-settling-system.md).

Fix $(q, \tau, U) \in \mathbf{T}^*_{\mathrm{site}}$ with $U = U_1 \cup U_2$ a union of two pairwise-Stone clopens.
The pair

$$\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in \{1, 2\}}$$

is a **replica cover** of $(q, \tau, U)$.
Its Čech nerve is the simplicial object $U_1 \sqcup U_2 \leftleftarrows U_1 \cap U_2$, truncated at simplicial degree 1 since two-element covers contribute only $U_1, U_2, U_1 \cap U_2$.

## Why "replica"

Under [Jung–Rivieccio duality](../theorems/jung-rivieccio-duality.md), a settling state $v_i$ on the primal side corresponds to a clopen up-set $U_i = \phi(v_i)$ on the [paired Priestley dual](../objects/paired-priestley-space.md) — and the [knowledge order](teaching/explanations/knowledge-order.md) merge $v_1 \vee_k v_2$ corresponds to the union $U_1 \cup U_2$.
Each $U_i$ is therefore the spectral image of a *replica*, a single distributed node's accumulated evidence; the replica cover assembles the two replicas as a cover of their merge.

Local sections of a sheaf on $(q, \tau, U_i)$ represent replica $i$'s view of the data; gluing two such sections to a section on $(q, \tau, U)$ is the cohomological face of the [CRDT convergence](../theorems/crdt-convergence.md) merge, formalized through the [replica Mayer–Vietoris sequence](../theorems/replica-mayer-vietoris.md).
