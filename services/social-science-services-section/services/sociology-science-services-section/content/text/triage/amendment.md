---
id: amendment
description: "An Amendment is a morphism (C, J) → (C', J') between charters — a pair (μ, ν) of a scope adjustment μ and a policy revision ν — that transforms one constituted community's governing policies into another while preserving the community's identity. The defining structure: an amendment changes what the charter says without dissolving and reconstituting the community; the community persists through the amendment. Formally a site morphism — a functor on the underlying blueprint category that is continuous with respect to both Grothendieck topologies."
defines: Amendment
related: Charter, Institution, NormativeSystem, Authority, Contract, Delegation
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  source-charter: charter
  scope-adjustment: relational-universe-morphism
  policy-revision: normative-system
output: charter
ast:
  site-morphism:
    - source-charter:
        - scope-adjustment
    - policy-revision:
        - source-charter
        - scope-adjustment
---

# Amendment

## Formal definition

An **Amendment** is a morphism $\mathcal{A} : \mathcal{C}_1 \to \mathcal{C}_2$ between charters:

$$\mathcal{A} = (\mu : S_1 \to S_2,\; \nu : N_1 \to N_2,\; \alpha : A_1 \to A_2)$$

where:
- $\mathcal{C}_1 = (G_1, N_1, S_1, A_1)$ is the **source charter** — the existing constituted community $G_1$, governing policies $N_1$, scope $S_1$, authorizing act $A_1$
- $\mathcal{C}_2 = (G_2, N_2, S_2, A_2)$ is the **amended charter** — the charter after modification
- $\mu : S_1 \to S_2$ is the **scope adjustment** — a morphism between the scopes; it may expand, contract, or laterally shift the charter's operative domain
- $\nu : N_1 \to N_2$ is the **policy revision** — a morphism in the category of normative systems; it adds, removes, or modifies the governing policies
- $\alpha : A_1 \to A_2$ is the **authority chain** — the authorizing act that makes the amendment valid; an amendment requires its own authorization, derived from the amending authority

**Three invariants.** $\mathcal{A}$ is an amendment iff:

1. **Community identity preservation**: $G_2 = G_1$ — the community being governed is the same community; an amendment does not dissolve and reconstitute the community. If the community changes, the act is not an amendment but a **novation** (dissolution and fresh constitution). The community's persistence through amendment is the formal definition of what makes a governance structure amendable rather than merely replaceable.

2. **Continuity condition**: the scope adjustment $\mu$ is **continuous** with respect to the Grothendieck topologies $J_1$ and $J_2$ — covering families in $J_1$ map to covering families in $J_2$. In the site-morphism sense ([Relational Universe Morphism](../math/relational-universe-morphism.md)): $\mu$ is a functor on the blueprint categories that preserves coverage. An amendment that disrupts covering families — that changes what counts as a valid operational completion — is a scope revision, not merely a policy change.

3. **Authorization chain**: $\alpha : A_1 \to A_2$ derives $A_2$ from $A_1$ — the amending authority is derived from the charter's own authority structure. A charter amendment not authorized by the charter's own amendment procedure is void: the community has not recognized it. This is Hart's rule of change ([Norm](./norm.md)): secondary rules authorize the modification of primary rules; the amendment is valid only if performed via an authorized rule of change.

## Conservative vs. non-conservative amendment

An amendment $\mathcal{A} : \mathcal{C}_1 \to \mathcal{C}_2$ is:

**Conservative**: $N_2$ proves no new claims in the language of $N_1$ — $N_2 \vdash \phi$ implies $N_1 \vdash \phi$ for all $\phi \in L(N_1)$. A conservative amendment adds vocabulary or clarifies procedure without changing what obligations exist in the original normative language. The community retains all its prior commitments; the amendment only extends or clarifies without altering.

**Non-conservative**: there exists $\phi \in L(N_1)$ with $N_2 \vdash \phi$ and $N_1 \not\vdash \phi$. A non-conservative amendment changes what is obligatory in the original language — it creates new obligations or removes existing ones. Examples: adding a new duty to the charter's officer structure; removing a prior requirement; changing a permission to a prohibition.

The conservative/non-conservative distinction corresponds to the [Extends](extends.md) spec's theory-extension structure: a conservative amendment is a conservative extension of the normative system (no new theorems in the original language); a non-conservative amendment is a proper extension (new theorems emerge).

## The site-morphism reading

A charter is formally a site $(\mathcal{B}, J)$ — a blueprint category $\mathcal{B}$ equipped with a Grothendieck topology $J$ ([Charter](./charter.md)). A morphism of charters is a **site morphism** $(\mu, \nu) : (\mathcal{B}_1, J_1) \to (\mathcal{B}_2, J_2)$: a functor $\mu : \mathcal{B}_1 \to \mathcal{B}_2$ that is continuous ($J_1$-covering families map to $J_2$-covering families) and a natural transformation $\nu$ on the corresponding policy sheaves.

In the [Relational Universe Morphism](../math/relational-universe-morphism.md) sense: an amendment is a morphism of relational universes restricted to the governance layer — a history category morphism $\mu$ (scope adjustment) plus a natural isomorphism $\nu : H_1 \xrightarrow{\sim} \mu^* H_2$ of policy presheaves (the policy revision, pulling the amended policies back along $\mu$).

The amendment is **valid** (a genuine morphism, not just any transformation) when both the continuity condition (invariant 2) and the authorization chain (invariant 3) hold. An invalid amendment fails to constitute a morphism in the site category — it is not recognized as a legitimate governance act.

## Amendment vs. novation

| Dimension | Amendment | Novation |
|---|---|---|
| Community identity | Preserved ($G_1 = G_2$) | Dissolved and reconstituted ($G_1 \neq G_2$) |
| Charter continuity | The charter persists through change | A new charter replaces the old one |
| Prior obligations | Carried forward (minus explicit changes) | Extinguished (must be re-established in new charter) |
| Authorization | Derived from existing charter's amendment rules | New authorization from a constituting act |
| Math type | Morphism in the category of charters | New object in the category of charters |

## Open questions

- Whether every charter morphism $\mathcal{C}_1 \to \mathcal{C}_2$ decomposes into a composition of elementary amendments — whether the category of charters has a generating set of elementary morphisms (scope extension, scope contraction, duty addition, duty removal, authority delegation) such that every amendment is a finite composition of these.
- Whether conservative extensions of charters ([Extends](extends.md)) correspond to the charter morphisms that are fully faithful on the policy sheaf — i.e., injective on obligations — and whether non-conservative amendments correspond to morphisms that are only faithful (injective) but not full (may not cover all new obligations).
- Whether there is a notion of **charter equivalence** — two charters that are mutual amendments of each other (each extends the other conservatively) — and whether this corresponds to Morita equivalence of the corresponding sites.

## Consolidated material from amendment-2026-03-20.md

---

title: "Amendment"
description: "An Amendment is a morphism (C, J) → (C', J') between charters — a pair (μ, ν) of a scope adjustment μ and a policy revision ν — that transforms one constituted community's governing policies into another while preserving the community's identity. The defining structure: an amendment changes what the charter says without dissolving and reconstituting the community; the community persists through the amendment. Formally a site morphism — a functor on the underlying blueprint category that is continuous with respect to both Grothendieck topologies."
defines: Amendment
related: Charter, Institution, NormativeSystem, Authority, Contract, Delegation
date-created: 2026-03-20
---

2. **Continuity condition**: the scope adjustment $\mu$ is **continuous** with respect to the Grothendieck topologies $J_1$ and $J_2$ — covering families in $J_1$ map to covering families in $J_2$. In the site-morphism sense ([Relational Universe Morphism](../../humanities/theories/math/relational-universe-morphism.md)): $\mu$ is a functor on the blueprint categories that preserves coverage. An amendment that disrupts covering families — that changes what counts as a valid operational completion — is a scope revision, not merely a policy change.

3. **Authorization chain**: $\alpha : A_1 \to A_2$ derives $A_2$ from $A_1$ — the amending authority is derived from the charter's own authority structure. A charter amendment not authorized by the charter's own amendment procedure is void: the community has not recognized it. This is Hart's rule of change ([Norm](./norm.md)): secondary rules authorize the modification of primary rules; the amendment is valid only if performed via an authorized rule of change.

The conservative/non-conservative distinction corresponds to the [Extends](../../../../../../../engineering/theories/tech/terms/extends.md) spec's theory-extension structure: a conservative amendment is a conservative extension of the normative system (no new theorems in the original language); a non-conservative amendment is a proper extension (new theorems emerge).

A charter is formally a site $(\mathcal{B}, J)$ — a blueprint category $\mathcal{B}$ equipped with a Grothendieck topology $J$ ([Charter](./charter.md)). A morphism of charters is a **site morphism** $(\mu, \nu) : (\mathcal{B}_1, J_1) \to (\mathcal{B}_2, J_2)$: a functor $\mu : \mathcal{B}_1 \to \mathcal{B}_2$ that is continuous ($J_1$-covering families map to $J_2$-covering families) and a natural transformation $\nu$ on the corresponding policy sheaves.

In the [Relational Universe Morphism](../../humanities/theories/math/relational-universe-morphism.md) sense: an amendment is a morphism of relational universes restricted to the governance layer — a history category morphism $\mu$ (scope adjustment) plus a natural isomorphism $\nu : H_1 \xrightarrow{\sim} \mu^* H_2$ of policy presheaves (the policy revision, pulling the amended policies back along $\mu$).

- Whether every charter morphism $\mathcal{C}_1 \to \mathcal{C}_2$ decomposes into a composition of elementary amendments — whether the category of charters has a generating set of elementary morphisms (scope extension, scope contraction, duty addition, duty removal, authority delegation) such that every amendment is a finite composition of these.
- Whether conservative extensions of charters ([Extends](../../../../../../../engineering/theories/tech/terms/extends.md)) correspond to the charter morphisms that are fully faithful on the policy sheaf — i.e., injective on obligations — and whether non-conservative amendments correspond to morphisms that are only faithful (injective) but not full (may not cover all new obligations).
- Whether there is a notion of **charter equivalence** — two charters that are mutual amendments of each other (each extends the other conservatively) — and whether this corresponds to Morita equivalence of the corresponding sites.
