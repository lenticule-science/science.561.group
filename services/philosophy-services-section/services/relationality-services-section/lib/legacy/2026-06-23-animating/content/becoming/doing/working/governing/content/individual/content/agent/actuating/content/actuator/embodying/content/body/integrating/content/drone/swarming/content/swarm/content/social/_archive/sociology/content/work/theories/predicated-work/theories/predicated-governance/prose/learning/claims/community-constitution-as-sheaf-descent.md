---
type: theorem
status: sketch
depends-on: [leitourgia, normative-system, d-frame-valued-sheaf-condition, recognition-as-bigraded-common-knowledge, operations-settling]
---

# The witnessing community is constituted by sheaf descent

The [leitourgia](../objects/leitourgia.md)'s witnessing community $C$ exists as a unified entity at settling stage $\tau$ if and only if the family of local witnessing observations produced by individual observers forms a compatible family in the d-frame-valued sheaf structure on the operations settling — that is, if and only if sheaf descent holds for the witnessing cover.

## Claim

Let $\{O_j\}_{j \in J}$ be a family of local observer entities, each producing witnessing increments $w_j$ about $\lambda$'s enactment of $\varphi$ on their local domain $U_j$ of the history site.
The witnessing community $C$ exists as a single unified entity at stage $\tau$ if and only if:

1. **Coverage:** $\{U_j\}_{j \in J}$ is a covering family for the relevant history site (in the Grothendieck topology on the operations settling's parameter base).
2. **Compatibility:** for each overlapping pair $U_j \cap U_k$, the restrictions $w_j|_{U_j \cap U_k} = w_k|_{U_j \cap U_k}$ — the local witnessing observations agree where their domains overlap.
3. **Uniqueness:** there is a unique global witnessing section $w \in \mathcal{F}(U)$ on the covering domain $U = \bigcup_j U_j$ whose restriction to each $U_j$ is $w_j$.

The compatibility + uniqueness condition is exactly the sheaf descent condition for the [d-frame-valued-sheaf](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/d-frame-valued-sheaf.md) on the operations settling.
The community $C$ is the entity indexed by this unique global section.

## Sketch

**Sheaf descent as community constitution.** The [d-frame-valued-sheaf-condition](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/d-frame-valued-sheaf-condition.md) theorem establishes that presheaf sections that agree on overlaps admit a unique global extension.
In the witnessing setting: each observer $O_j$ produces a local witnessing section on $U_j$.
The sections are predicational records: $\langle O_j, \texttt{witnessed}, \iota\rangle$ at $\mathbf{t}$ on the domain $U_j$.
The compatibility condition says these local records agree where the observers' domains overlap — an observer who was present in $U_j \cap U_k$ witnessed the same thing whether they are counted as $O_j$ or $O_k$.
The unique global section $w$ is the community's unified witnessing record.

**Without compatibility, there is no community.** If the local witnessing observations are incompatible on overlaps ($w_j|_{U_j \cap U_k} \neq w_k|_{U_j \cap U_k}$), there is no global section — the witnessing records disagree, and no unique community record exists.
There are local observers but no constituted community.
The [d-frame-valued sheaf condition's failure](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/d-frame-valued-sheaf-condition.md) is the formal analog of Austin's felicity condition B.
1: "the particular persons and circumstances in a given case must be appropriate for the invocation of the particular procedure invoked."
Incoherent witnessing = incompatible local sections = failed Austin B.
1 = no constituted community.

**Community exists at the moment of sheaf descent.** Before the covering family gathers, there are local observers in $U_j$ regions but no global record.
The community $C$ comes into existence at the moment the compatible family is complete enough to admit descent.
This is the formal content of the sociological claim that "ritualization constitutes the community rather than expressing it": the gathering of compatible witnesses *is* the constitution of the community.

## Corollary — community constitution is a cohomological condition

By the [settling-cohomology-vanishing-via-husainov-cech](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md) theorem, the sheaf cohomology on the parameter base vanishes when local sections extend globally.
The existence of the community $C$ is therefore equivalent to the vanishing of the first Čech cohomology class $\check{H}^1$ for the witnessing presheaf over the covering $\{U_j\}$.
A non-zero $\check{H}^1$ class indicates an incoherent witnessing cover — observers that cannot be unified into a single community record.
The community's existence is a $\check{H}^0$ (global sections) condition; its coherence failure is a $\check{H}^1$ obstruction.

## Corollary — the leitourgia community is not the audience

The witnessing community $C$ constituted by sheaf descent is *not* an audience that exists independently and is then addressed by the enactment.
The audience model presupposes that the community precedes the performance.
This theorem establishes the opposite: the community comes into existence at the moment the witnessing records descend to a global section.
Before the performance, there are potential observers; after the compatible witnessing family is complete, there is a community.
The leitourgia's community is constituted by its witnessing, not pre-constituted as its audience.

## Relation to bigraded common knowledge

The [recognition-as-bigraded-common-knowledge](theorems/recognition-as-bigraded-common-knowledge.md) theorem establishes that the office's recognition predicate is the bigraded common-knowledge condition.
The leitourgia's community-constitution condition is the precondition for that recognition: the community $C$ must exist (sheaf descent must hold) before the form-enactment predicate can settle as the community's accumulated recognition.
Community-constitution-as-sheaf-descent is thus the foundational precondition for leitourgia-discharge-as-bigraded-settlement.
