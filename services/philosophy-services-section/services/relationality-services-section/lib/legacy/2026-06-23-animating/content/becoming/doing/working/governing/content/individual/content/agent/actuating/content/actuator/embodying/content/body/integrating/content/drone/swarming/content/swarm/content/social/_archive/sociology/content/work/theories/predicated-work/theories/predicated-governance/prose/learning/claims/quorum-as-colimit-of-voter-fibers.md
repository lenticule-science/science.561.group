---
type: theorem
class: colimit-instantiation
status: draft
symbol: "Q_\\theta = \\mathrm{colim}_{F \\in \\mathcal{F}_\\theta} v|_F"
depends-on: [consensus-closure, jural-relation, authority, polity, deontic-modality, normative-system]
realizes: [predication-settling-category-completeness, bilattice-network-sheaf-consensus, network-sheaf-consensus-on-agent-graphs, equality-via-equalizer]
---

# Quorum formation as colimit of voter fibers

A quorum-decision procedure — the substrate-algebraic content of *"the body has decided P at threshold $\theta$"* — is a **colimit in the [predication settling category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling-category.md)** taken over the diagram of voter fibers that satisfy the threshold.
The dual structure — "the body has unanimously certified P" — is an **equalizer** in the same category, refining the colimit by the [equality-via-equalizer](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/equality-via-equalizer.md) machinery.

This identifies three distinct quorum-mode structures with three distinct categorical limits/colimits, and lets the [consensus-closure](../objects/consensus-closure.md) object inherit the cohomological-signature theory of [bilattice-network-sheaf-consensus](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) wholesale: the obstructions to quorum-formation are exactly the $H^1$ generators of the voter-network sheaf.

The substantive claim is that **threshold-quorum, supermajority, and unanimity are not parametric variants of one mechanism but three distinct categorical constructions** — a colimit, a weighted colimit (conjectural; see (b)), and an equalizer respectively — with operationally distinct properties.

## Setup: voters, fibers, threshold

A **voter set** is an entity-subset $V \subseteq E_{\mathrm{op}}$ of [polity](../objects/polity.md) members eligible to participate in a particular decision.
A **proposition** is a predication cell pattern $P$ — typically a single cell $\langle a, p, b\rangle$ at threshold-relevant value, but in general any cell-system the body can collectively assert.

For each voter $v \in V$, the **voter fiber** $\mathcal{F}_v$ is the predication-fiber stalk over $v$ — the [predication-fiber-algebra](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) restricted to cells in which $v$ is the subject or object.
A **voter assignment** at vote-stage $\tau$ is an element $f_v(\tau) \in \mathcal{F}_v$ recording $v$'s position on $P$ — typically valued in the four-bilattice $\mathbf{FOUR}$, where $\mathbf{t}$ = aye, $\mathbf{f}$ = nay, $\bot$ = abstain, $\top$ = conflicted (per [bilattice-two-orders-duality](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-two-orders-duality.md)).

A **threshold** $\theta \in [0, 1]$ is a real-valued quorum specification.
The **threshold-eligible subdiagram** $\mathcal{F}_\theta$ is the subdiagram of voter-fiber inclusions $\mathcal{F}_v \hookrightarrow \mathcal{F}_V$ for those $v$ whose assignment satisfies the polarity required by $P$ — typically the aye-voters when $P$ is asserted positively.
The **quorum-formation diagram** is $\mathcal{F}_\theta$ as a diagram in the [predication settling category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling-category.md).

## Statement

**Theorem (quorum-formation as colimit/equalizer).** *Let $V$ be a voter set, $P$ a proposition, $\theta \in [0, 1]$ a threshold, and let $v^{\mathrm{vote}}$ be the [polity](../objects/polity.md)'s voting settling — the predication settling on the voter set's deontic profile.*

(a) **(Threshold-quorum as colimit.)** *The threshold-quorum decision $Q_\theta(P) := \text{"$P$ is asserted at threshold $\theta$"}$ presents as the colimit* $$Q_\theta(P) = \mathrm{colim}_{F \in \mathcal{F}_\theta} v^{\mathrm{vote}}|_F$$ *in the predication settling category, when $|\mathcal{F}_\theta| / |V| \geq \theta$.
The colimit exists by [predication-settling-category-completeness](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-settling-category-completeness.md), which establishes that the predication settling category has all small colimits.
The cohomological signature of $Q_\theta(P)$ is computed from the [bilattice-network-sheaf-consensus](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) machinery applied to the threshold-eligible voter-network subgraph.*

(b) **(Supermajority — weighted-colimit conjecture.)** *A supermajority decision at threshold $\theta > 1/2$, when voters have non-uniform authority weight $w : V \to \mathbb{Q}_{\geq 0}$, is **conjecturally** presentable as a weighted colimit in an enriched analog of the predication settling category, with the threshold condition becoming $\sum_{v \in \mathcal{F}_\theta} w(v) / \sum_{v \in V} w(v) \geq \theta$.
The cited [predication-settling-category-completeness](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-settling-category-completeness.md) establishes ordinary (conical) small colimits only; the weighted-colimit framing presupposes an enrichment over $\mathbb{Q}_{\geq 0}$-modules or a [q-enriched-sheaf-tensor](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-enriched-sheaf-tensor.md)-style structure that the corpus develops separately for the q-enriched (quantale-enriched) setting.
Whether the operational supermajority semantics aligns with that enriched setting — rather than being captured by an ordinary colimit on a multi-counted index category — is the subject of part (b)'s conjectural status.
The operational fact remains: supermajority with non-uniform weights is **not** the simple-colimit construction of (a) at threshold $\theta$, regardless of whether the weighted-colimit framing is the right substrate-algebraic refinement.*

(c) **(Unanimity as equalizer.)** *A unanimity decision $U(P) := \text{"$P$ is unanimously asserted"}$ presents as the equalizer* $$U(P) = \mathrm{eq}\Big(\prod_{v \in V} \mathcal{F}_v \rightrightarrows \prod_{v \in V} \mathcal{F}_v\Big)$$ *of the assignment morphism $a : \prod_v \mathcal{F}_v \to \prod_v \mathcal{F}_v$ (with $a(\mathbf{f})_v = f_v(P)$) and the constant-$\mathbf{t}$ morphism.
This is a categorical equalizer in the sense of the universal cone, available wherever the predication settling category has finite limits (per [predication-settling-category-completeness](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-settling-category-completeness.md)); the unanimity sub-settling is by construction the largest sub-settling on which every voter's assignment equals $\mathbf{t}$.
The cited [equality-via-equalizer](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/equality-via-equalizer.md) result — which identifies *predicate-equality* with an equalizer of identity-vs-converse on the diagonal — is structurally analogous (both are equality-as-equalizer constructions) but is not the same equalizer; the voter-product equalizer here is its own construction, justified directly by the predication-settling category's finite-limit completeness.*

(d) **(Distinct universal properties.)** *The colimit of (a) and the equalizer of (c) have distinct universal properties — co-cone vs. cone — and are *not* the same construction with different parameters.
In particular, unanimity is not the $\theta = 1$ specialization of the threshold colimit; the equalizer and the colimit are categorically different objects whose underlying voter assignments happen to coincide in degenerate cases.
The conjectural weighted-colimit framing of (b), if it lifts to the predication-settling setting per the open enrichment, would supply a third universal property (enriched co-cone) — but the operational distinction "supermajority with non-uniform weights ≠ uniform-threshold colimit at $\theta$" is established without (b)'s full categorical content.*

## Sketch

**(a)** The voter-fiber inclusions $\iota_v : \mathcal{F}_v \hookrightarrow \mathcal{F}_V$ form a small diagram in the [predication settling category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling-category.md).
The threshold-eligible subdiagram $\mathcal{F}_\theta$ inherits the diagram structure.
By [predication-settling-category-completeness](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-settling-category-completeness.md), the colimit $\mathrm{colim}_{F \in \mathcal{F}_\theta} v^{\mathrm{vote}}|_F$ exists and is the *least* settling that contains $v^{\mathrm{vote}}|_F$ for every $F \in \mathcal{F}_\theta$ — substrate-algebraically, the cell-system $\bigsqcup_{F \in \mathcal{F}_\theta} F$ closed under the polity's closure rules.
The threshold condition $|\mathcal{F}_\theta| / |V| \geq \theta$ is a hypothesis on which voters are in the diagram, not a feature of the colimit construction itself.

The cohomological signature of $Q_\theta(P)$ is computed by treating the voter-network as a graph (vertices = voters in $\mathcal{F}_\theta$, edges = pairwise alignment cells), forming the bilattice-network sheaf per [agent-team-as-bilattice-network-sheaf](../../../theorems/agent-team-as-bilattice-network-sheaf.md), and applying [bilattice-network-sheaf-consensus](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).
The $H^0$ of this network sheaf is the consensus content; the $H^1$ records obstructions — the substrate-algebraic content of *"the body could not reach quorum despite enough votes."* $\square$ (Sketch (a))

**(b)** Conjectural.
The intended construction is the standard weighted-colimit of enriched category theory: given a weight functor $W : \mathcal{F}_\theta \to \mathbb{Q}_{\geq 0}$, the $W$-weighted colimit is the universal cocone whose cocone-component for each $v$ has multiplicity $W(v)$.
The application to the predication-settling category requires either (i) an enrichment of the category over $\mathbb{Q}_{\geq 0}$-modules (the corpus has not established this) or (ii) reduction to an ordinary colimit over a multi-counted index category — replacing each weighted vertex by $w(v)$ copies (this gives an ordinary colimit per (a) and works only when weights are non-negative integers).
Neither reduction is verified for the substrate-algebraic structure of authority-weighted voting; (b) is left as a conjecture pending an enrichment-or-multi-counting argument that aligns with the polity's authority profile.
The operational distinction from (a) — that supermajority with non-uniform weights does not coincide with any uniform-threshold colimit — is established without (b)'s full categorical refinement. $\square$ (Sketch (b))

**(c)** Unanimity is the equalizer of the assignment-morphism $a : \prod_v \mathcal{F}_v \to \prod_v \mathcal{F}_v$ defined by $(a(\mathbf{f}))_v = f_v(P)$ and the constant-$\mathbf{t}$ morphism $c_\mathbf{t} : \prod_v \mathcal{F}_v \to \prod_v \mathcal{F}_v$ defined by $(c_\mathbf{t}(\mathbf{f}))_v = \mathbf{t}$.
The equalizer exists by [predication-settling-category-completeness](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-settling-category-completeness.md) (finite limits in the predication settling category), and is by the universal property of the equalizer the largest sub-settling on which $a$ and $c_\mathbf{t}$ agree — exactly the sub-settling on which every voter's assignment is $\mathbf{t}$.
The cone universal property records that any sub-settling on which all voters assert $P$ factors through the unanimity equalizer; this is the substrate-algebraic content of *"unanimity is the strongest possible certification."* The cited [equality-via-equalizer](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/equality-via-equalizer.md) result is the corpus's nearest formal analog (equality-as-equalizer in the predicate-structural setting) but is invoked here as a structural parallel rather than a direct lemma. $\square$ (Sketch (c))

**(d)** The two established universal properties are:

- (a) **Co-cone**: $Q_\theta(P)$ receives a morphism $\iota_v : \mathcal{F}_v \to Q_\theta(P)$ for each $v \in \mathcal{F}_\theta$, and is universal among such co-cones.
- (c) **Cone**: $U(P)$ admits a morphism $U(P) \to \prod_v \mathcal{F}_v$ that equalizes the two parallel projections, universal among cones equalizing them.

These are categorically distinct: co-cones (gluings) and cones (projections) live on opposite sides of the diagram. *Conjecturally* (per (b)), if the weighted-colimit lift to the predication-settling setting exists, it would supply a third universal property — an **enriched co-cone** under which $Q^w_\theta(P)$ receives a weighted morphism with multiplicity $w(v)$ for each $v$.
Pending the open enrichment-or-multi-counting argument, the third structure is not formally established here. $\square$ (Sketch (d))

## Operational consequences

### Quorum-formation obstructions are voter-network $H^1$ generators

The cohomological-signature reading is the operational payoff.
By [bilattice-network-sheaf-consensus](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), consensus on a voter network is obstructed exactly by $H^1$ generators of the network sheaf.
Applied to the quorum-formation colimit:

- An $H^1$ generator on $\mathcal{F}_\theta$'s voter-network corresponds to a **cycle of disagreeing voters that cannot be resolved by adding more aye-voters from outside the cycle**.
  Operationally: the body has the votes for quorum but is internally inconsistent on which version of $P$ is being asserted.
  The colimit fails to be reduced even though the threshold count is met.
- $H^0$ of the network sheaf is the **consensus content** — the cells on which the threshold-eligible voters genuinely agree.
  Quorum is *substantive* (not just nominal) iff $H^0(\mathcal{F}_\theta\text{-net}) \models P$.
- The transition from "nominal quorum" (threshold met) to "substantive quorum" ($P$ in $H^0$) is an *unfolding of the colimit* — a typical operational instance of the [closure-driven-coordination](../../teaching/explanations/closure-driven-coordination.md) pattern in the consensus context.

### Supermajority is weight-amplifying, not threshold-shifting

The (conjectural) weighted-colimit reading of (b), if it holds, would clarify a frequent practitioner confusion: a 2/3 supermajority is *not* the same as a threshold-quorum at $\theta = 2/3$ when authority is non-uniformly distributed.
A weighted colimit (in the sense of enriched category theory) would assign proportional multiplicity to each voter; a polity in which one voter has weight 10 and nine voters have weight 1 reaches a 2/3 supermajority with the weighty voter alone (10/19 < 2/3) plus three light voters (13/19 > 2/3) — categorically distinct from any unweighted threshold count.
Even without (b)'s full categorical refinement, the substrate-algebraic content stands: polities that present supermajority as "threshold $\theta = 2/3$" are conflating two operationally distinct constructions, whether or not the formal name for the second is "weighted colimit."

### Unanimity has cone-universality, not co-cone-universality

The equalizer reading clarifies *why* unanimity is operationally distinct from "100% threshold-quorum."
The equalizer's cone-universality means: any sub-settling on which $P$ holds factors *into* the unanimity sub-settling — unanimity is a *projection* from the body to the sub-settling of agreed-upon cells, not a *gluing* of voter contributions.
This is why unanimity can produce a smaller cell-pattern than threshold-quorum even at $\theta = 1$: unanimity equalizes the voter assignments against $\mathbf{t}$ globally, while threshold-quorum at $\theta = 1$ glues all voter contributions and may produce a larger (potentially inconsistent) cell-pattern that the closure rules then partially reject.

In particular: a body where all voters say "yes" to slightly different versions of $P$ produces a 100%-threshold-quorum colimit containing all the variants (which closure may or may not consolidate to a single $P$), but produces an empty unanimity equalizer (because no single $P$ is asserted by all).
The two diverge precisely at the boundary of the polity's closure-rule discipline.

## Refining consensus-closure

The [consensus-closure](../objects/consensus-closure.md) object is the pattern-level abstraction this theorem refines.
Where consensus-closure asserts that the substrate's consensus mechanism is closure-rule-mediated, this theorem identifies the categorical *shape* of the closure construction — colimit (proved), weighted-colimit-style multiplicity-respecting glue (conjectural per (b)), or equalizer (proved) — corresponding to the threshold-mode chosen.
Polities with consensus-closure as their dominant decision pattern can now be classified by:

- **Colimit-pattern polities**: simple-majority, plurality, supermajority-without-weighting.
  The body's decision is a least-glue of voter contributions.
- **Weighted-multiplicity-pattern polities** *(conjecturally weighted colimit per (b))*: shareholder-vote, weighted-council, partner-vote-by-equity.
  The body's decision is a multiplicity-respecting glue; whether the formal substrate-algebraic name is "weighted colimit" or an ordinary colimit on a multi-counted index category remains open.
- **Equalizer-pattern polities**: consensus-as-unanimity polities (Quaker meetings, certain indigenous councils, jury-unanimity verdicts).
  The body's decision is a maximal-agreement projection.

Mixed-pattern polities — common in real institutions — are coproducts of these constructions, with each closure rule of the polity selecting which categorical operation applies to a given decision class.

## Where used

- [consensus-closure](../objects/consensus-closure.md) — supplies the pattern object this theorem refines into three distinct categorical constructions.
- [bilattice-network-sheaf-consensus](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) — supplies the cohomological-signature theory inherited by quorum-formation colimits.
- [agent-team-as-bilattice-network-sheaf](../../../theorems/agent-team-as-bilattice-network-sheaf.md) — the work-layer instantiation of the same network-sheaf machinery; quorum-formation in a working community uses this machinery on the team's voter-fiber subdiagram.
- [adjudication-modes-and-h1](../../../theorems/adjudication-modes-and-h1.md) — adjudication of contested votes corresponds to $H^1$-class resolution on the voter network; this theorem's $H^1$-as-quorum-obstruction reading is the consensus-mode specialization.
- [recognition-as-bigraded-common-knowledge](recognition-as-bigraded-common-knowledge.md) — recognition that a quorum has formed is itself a higher-order assertion, and the bigraded structure applies; downstream theorem.
- [restorative-accountability](../objects/restorative-accountability.md) — restorative-process consensus often uses the equalizer pattern (unanimity-on-resolution); the categorical distinction matters for understanding why restorative consensus is operationally distinct from simple-majority closure.

## Open downstream

- *Voter-fiber size variation.* The standard treatment assumes voter fibers $\mathcal{F}_v$ have uniform structure — one cell per voter.
  Real voting includes multi-cell positions (ranked-choice ballots, approval voting, multi-issue referenda) where each $\mathcal{F}_v$ has internal cell structure.
  The colimit construction generalizes, but the cohomological signature in the multi-cell case may include higher-order obstructions — an $H^2$ or higher generator class.
  Open whether ranked-choice voting's known pathologies (Arrow-class obstructions) align with $H^k$ generators for $k \geq 2$.
- *Threshold dynamics.* Real polities adjust thresholds during decision processes (escalation rules, time-decay, proxy-aggregation).
  Whether the colimit construction accommodates *dynamic* thresholds — $\theta = \theta(\tau)$ stage-dependent — and whether such dynamics correspond to a step-shift functor on the colimit diagram is open.
- *Quorum-failure as $H^1$-cohomology class.* The theorem identifies quorum obstructions with $H^1$ generators.
  Whether each of the operationally-recognized quorum-failure modes (insufficient turnout, sustained dissent, irreducible conflict) corresponds to a distinct $H^1$-class — and whether the corpus's [adjudication-modes-and-h1](../../../theorems/adjudication-modes-and-h1.md) classification carries over — deserves explicit articulation.
