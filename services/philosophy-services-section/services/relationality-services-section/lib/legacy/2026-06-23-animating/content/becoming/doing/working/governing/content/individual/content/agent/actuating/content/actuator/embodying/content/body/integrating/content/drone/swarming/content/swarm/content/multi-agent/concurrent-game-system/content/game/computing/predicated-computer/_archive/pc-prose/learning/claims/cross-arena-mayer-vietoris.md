---
name: cross-arena Mayer-Vietoris
description: For arenas in CGS connected by parallel composition, the Mayer-Vietoris long exact sequence decomposes the federated cohomology into constituent, overlap-kernel, and federation-only (cokernel) content; disagreement-pairs on the overlap live in ker(δ) and contribute no federation-level H¹.
status: draft
---

# Cross-arena disagreement lives in ker(δ); federation content lives in coker(diff)

**Claim.** For arenas $A, B$ in $\mathbf{CGS}$ with parallel composition $A \| B$ and overlap $A \cap B$ (entity-mobility via nominal-set name-passing with $\mathrm{FSym}(\mathbb{A})$-equivariance), the Mayer-Vietoris long exact sequence
$$\cdots \to H^n(\mathcal{F}^{A \cup B}) \xrightarrow{\mathrm{res}} H^n(\mathcal{F}^A) \oplus H^n(\mathcal{F}^B) \xrightarrow{\mathrm{diff}} H^n(\mathcal{F}^{A \cap B}) \xrightarrow{\delta} H^{n+1}(\mathcal{F}^{A \cup B}) \to \cdots$$
decomposes the federated cohomology into three classes of content:

1. *Constituent-image content* — phenomena visible at a single constituent alone (image of the restriction map).
2. *Overlap-kernel content* — phenomena that lift consistently from constituents to the federation (kernel of the difference map).
3. *Federation-only content* — phenomena unrepresentable as a pair of constituent positions (cokernel of the difference map, equivalent to the image of the connecting homomorphism $\delta$ in degree $n+1$).

With $H^{\geq 2} = 0$ on the platform (per [`coordination-cohomologically-bounded-by-h1`](../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/distributed-coordination-platform/theorems/coordination-cohomologically-bounded-by-h1.md)), all federation cohomology content lives in $H^0$ and $H^1$.

The load-bearing structural fact: *disagreement-pairs $(\alpha_A, \alpha_B)$ with $\iota_{AB}^*\alpha_A \neq \iota_{AB}^*\alpha_B$ on the overlap live in $\mathrm{Im}(\mathrm{diff}) = \ker(\delta)$.* By Mayer-Vietoris exactness, they produce no federation-level $H^1$ class. Federation-level cohomological content lives in $\mathrm{coker}(\mathrm{diff})$: overlap-content that *no pair* of constituent positions can collectively express.

## Significance

Federations of polities — in any governance regime — tolerate large amounts of inter-polity disagreement structurally. Disagreement is recorded as substrate content (via the bilattice's $\top$ value when both sides assert), made visible to both constituents and to the federation, and adjudicated *within each constituent by its own machinery*. The federation-level apparatus is invoked only when the structural content requires it — that is, when overlap-content arises that cannot be expressed by any constituent position individually.

How each governance regime *metabolizes* this distinction is regime-specific:

- *Kyriarchical regime:* the federation-level apparatus is the cross-polity dispatch certifiability gate that consults $\mathrm{Im}(\delta)$ in the safety-critical $K_4$-sectors and refuses dispatch when those vanish (see [`kyriarchical-agentics-may-2026`](../surveys/kyriarchical-agentics-may-2026.md), §7).
- *Kin-relational regime:* the federation-level apparatus is the omníčhiye council that gathers across constituent tiyóšpaye to address the cokernel content — overlap-matters no tiyóšpaye can settle alone (see [`tiyospaye-is-agentic-drone-swarm-may-2026`](../surveys/tiyospaye-is-agentic-drone-swarm-may-2026.md), §3.6).
- The underlying structural fact — that disagreement lives in $\ker(\delta)$ and federation content in $\mathrm{coker}(\mathrm{diff})$ — is the same.

## Position

Specialization of the predicated-governance theorem [`federation-cohomology-as-mayer-vietoris`](../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-work/governance/theorems/federation-cohomology-as-mayer-vietoris.md) to the agentic-drone-swarm framework's parallel-composition setting, with the platform-level $H^{\geq 2}=0$ bound supplied by `coordination-cohomologically-bounded-by-h1`. Surfaced in the FAdRS-swarms survey, §7.3; promoted here to standalone claim as a governance-regime-agnostic structural fact.
