---
type: theorem
class: engineering-claim
status: proved
depends-on: [quorum-consensus, cluster-as-replica-cover, vote-as-section, consensus-as-h0-construction, settling-cohomology, settling-cohomology-vanishes-above-degree-1, four-regime-dichotomy]
see-also: [audit-via-cech-cocycle-evaluation, byzantine-cluster-as-finer-replica-cover]
---

# Coordination protocols only need to discharge $H^0$ and $H^1$

**Claim.** For every coordination problem on the platform — leader election, quorum consensus, distributed locking, sharding agreement — the cohomological obstructions a protocol must discharge are confined to degrees $0$ and $1$ of the [settling cohomology](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md) of the cluster's [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md). Specifically:

$$H^n(U, \mathcal{F}_U) \;=\; 0 \qquad \text{for all } n \geq 2$$

on the cluster's [replica cover](teaching/explanations/cluster-as-replica-cover.md) $\{U_i \to U\}_{i=1}^N$. Protocol design that anticipates higher-degree obstructions — that includes machinery to discharge $H^2$ classes or higher — is over-engineered relative to the substrate's actual cohomological dimension.

## Why this holds

The claim is the substrate-level reading of [settling-cohomology-vanishes-above-degree-1](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md). That theorem establishes vanishing in degrees $\geq 2$ under the hypothesis that the base poset $\mathcal{C}^{\mathrm{op}}$ has cohomological dimension $\leq 1$ — which holds in the explicit corpus instances built from the four [predicate generators](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) and in particular in every substrate the platform recognizes per [four-regime-dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md).

**Part 1: The substrate falls in the regime where the math hypothesis is satisfied.** The platform's substrates are constructed from the four predicate generators. Per the four-regime classification, the resulting predicate categories $\mathcal{C}$ have Alexandrov-finite or directed-poset shape; their opposite $\mathcal{C}^{\mathrm{op}}$ has cohomological dimension $\leq 1$. The hypothesis of the math theorem is automatic.

**Part 2: The cluster's cover inherits the bound.** The cluster's [replica cover](teaching/explanations/cluster-as-replica-cover.md) is a cover in the bitopological settling site, and $\mathcal{F}_U$ is its settling-associated sheaf. The vanishing $H^n(\mathbf{T}^*, \mathcal{F}_U) = 0$ for $n \geq 2$ from the math theorem restricts to $H^n(U, \mathcal{F}_U) = 0$ for $n \geq 2$ on any sub-cover, including the cluster's $N$-element cover.

**Part 3: $H^0$ is the section construction, $H^1$ is the obstruction.** Per [consensus-as-h0-construction](consensus-as-h0-construction.md), the protocol's decided value lives in $H^0$. Per the [Mayer–Vietoris sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), the obstruction to lifting a family of local sections to a global section lives in $H^1$ via the connecting homomorphism $\delta^0$. These two are the only cohomological structures the protocol's machinery needs to address.

## What "only $H^0$ and $H^1$" rules out

A protocol that anticipates $H^2$ obstructions would carry machinery for *gluing the obstructions themselves* — for example, distinguishing between "two pairs of replicas disagree, and their disagreements are themselves incompatible" and "two pairs of replicas disagree, but their disagreements share a common refinement." Per the bound, no such situation arises on the platform's substrates: every $H^1$ obstruction is locally resolvable, and every $H^2$ class that would record a non-trivial gluing of obstructions is structurally zero.

Concretely, this rules out:

- **Three-level meta-consensus.** A protocol that runs consensus on the consensus *about* consensus would be discharging $H^2$ obstructions; the bound says this is unnecessary.
- **Non-trivial higher coboundary tracking.** A quorum-record format that includes fields for "the consensus on which member's view of the consensus is canonical" is over-engineered.
- **Spectral-sequence machinery in audit.** An audit tool that runs a Leray-spectral-sequence calculation across multiple cover refinements is doing work the substrate's cohomology has already collapsed to zero.

## Engineering consequence

- **Protocol simplicity bound.** Coordination protocols on the platform should be designed to discharge $H^0$ (construct a section) and $H^1$ (refute or resolve obstructions); machinery beyond that is over-engineering.
- **Audit-tool simplicity bound.** Per [audit-via-cech-cocycle-evaluation](audit-via-cech-cocycle-evaluation.md), audit operations only need to compute degree-0 and degree-1 Čech cochains; higher cochains carry no information about whether the audited decision was valid.
- **Failure-mode taxonomy.** The substrate's coordination failure modes are exhaustively: failure to construct a section ($H^0$ empty), and failure to lift a local family ($H^1$ obstruction). There is no third taxonomic category corresponding to higher-degree failures.

## Limits

- **Off-platform substrates not guaranteed.** The bound assumes the four-regime classification. A hypothetical substrate outside the classification — a $\mathcal{C}$ with cohomological dimension $\geq 2$ — would not inherit the bound; protocols on such a substrate could in principle face $H^2$ obstructions. The platform currently has no such substrate; this is a "if the moduli machinery extends, the protocol theory must too" relationship, not a present concern.
- **The bound is structural, not operational.** The bound says higher-degree obstructions *do not exist*, not that protocols handle $H^0$ and $H^1$ *cheaply*. Discharging $H^1$ for a large cluster can still be expensive; the bound rules out *additional* expense from higher-degree machinery.

## Position

This is the engineering-side reading of the math theorem [settling-cohomology-vanishes-above-degree-1](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md). It identifies the cohomological dimension as the structural constraint that justifies the platform's protocol-simplicity discipline.
