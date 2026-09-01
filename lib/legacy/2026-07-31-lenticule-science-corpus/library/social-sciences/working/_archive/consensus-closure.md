---
type: definition
class: closure-condition
status: draft
depends-on: [normative-system, jural-relation, polity, settling-calm-corollary, truth-knowledge-cohomology-long-exact-sequence]
realizes: [consensus, haudenosaunee-grand-council]
---

# Consensus closure

The mathematical realization of *consensus governance* — the closure-rule structure by which a collective decision settles only when all relevant participants' positions align affirmatively, rather than by majority vote, expert decision, or sovereign command. Drawn from the Haudenosaunee Confederacy's Grand Council per the [indigenous-governance-traditions survey](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/texts/indigenous-governance-traditions-survey.md), with structurally analogous patterns in Anishinaabe council deliberation, Ubuntu restorative deliberation, and ayllu collective decision-making.

## Data

A consensus closure on a decision-cell $\phi$ within a [polity](polity.md) $\mathcal{P}$ with populace $\mathrm{Pop}_\mathcal{P}$ is a closure rule of the form:

$$\bigwedge_{a \in \mathrm{Pop}_\mathcal{P}} \langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t} \;\Longrightarrow\; \langle \phi, \texttt{settled-by-consensus}, \mathcal{P}\rangle = \mathbf{t}$$

The decision $\phi$ settles only when *every* participant's individual alignment cell is at $\mathbf{t}$. A single non-aligning cell ($\mathbf{f}$ or $\bot$) blocks the consensus settlement.

## Key structural properties

**Universal quantification, not majority aggregation.** The antecedent is a universal $\bigwedge$, not a counting predicate (cf. [capacity-as-substrate-property question](../questions/capacity-as-substrate-property.md)). Substrate-algebraically, this means consensus governance does *not* require cardinality reasoning — it requires only the bilattice's $\wedge_t$ operation across the populace's alignment cells. Every participant's stance is read; the meet of all stances is the consensus value.

**Silence is not consent.** A populace member with $\langle a, \texttt{aligns-with}, \phi\rangle = \bot$ blocks consensus. This is structurally distinct from a majority vote where non-voters acquiesce. Substrate-algebraically: $\bot \wedge_t \mathbf{t} = \bot$ — the meet of unsettled with affirmative is unsettled, not affirmative.

**Dissent registers explicitly.** A member with $\langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{f}$ also blocks consensus. The substrate distinguishes *active dissent* ($\mathbf{f}$) from *unsettled position* ($\bot$); both block consensus but for structurally different reasons. Active dissent typically requires further deliberation; unsettled position may be resolved by additional evidence or time.

**No resolution by escalation.** A consensus rule has no fallback to a smaller authority that can decide for the rest. The substrate-algebraic content: the rule's consequent fires only on the universal antecedent. A community committed to consensus governance does *not* have a backup closure rule that fires consensus-equivalent settlements when consensus fails.

## Comparison with majority-rule closure

A majority-rule closure rule on the same decision-cell:

$$\#\{a \in \mathrm{Pop}_\mathcal{P} : \langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t}\} > \tfrac{|\mathrm{Pop}_\mathcal{P}|}{2} \;\Longrightarrow\; \langle \phi, \texttt{settled-by-majority}, \mathcal{P}\rangle = \mathbf{t}$$

Substrate-algebraic differences:

| | Consensus | Majority |
|---|---|---|
| Antecedent operation | $\wedge_t$ over all cells | Cardinality count, $> n/2$ threshold |
| Closure-rule fragment | $\Pi_1$ (bare universal) | $\Pi_1$ + cardinality predicate |
| Decidability | Polynomial in $|\mathrm{Pop}|$ | Polynomial in $|\mathrm{Pop}|$ but requires counting |
| Sensitivity to non-participation | Blocks settlement | Treats as non-vote |
| Substrate-recordable distinction between dissent and silence | Yes (different cell values) | Lost (both count as non-affirmative) |

The library's [capacity-as-substrate-property question](../questions/capacity-as-substrate-property.md) flags that cardinality reasoning is non-native to bilattice algebra. Consensus closure is therefore *more* substrate-algebraically natural than majority-rule closure: it uses only the bilattice's primitive $\wedge_t$ operation. Majority requires additional scaffolding.

This is a substrate-algebraic argument that has nothing to do with whether consensus or majority is *normatively* better. It's a structural observation: one fits the substrate's primitive operations directly; the other requires extension.

## CALM and distributed consensus monitoring

By the [predication-settling CALM corollary](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md), any $\leq_k$-monotone query on the operations settling is coordination-free: it can be answered at any replica without cross-replica communication.

The "has consensus settled?" query — $v(\langle \phi, \texttt{settled-by-consensus}, \mathcal{P}\rangle) \geq_k \mathbf{t}$ — is $\leq_k$-monotone: the consensus-settlement cell can only advance upward in $\leq_k$ once it fires (by settling-monotonicity). Any distributed replica that observes the consensus cell at $\mathbf{t}$ can answer "yes, consensus reached" without coordination. The consensus settlement, once achieved, is read locally.

However, the "is consensus still pending?" query — "has any populace member failed to align?" — is **not** $\leq_k$-monotone. Checking that *all* alignment cells are $\mathbf{t}$ (the universal antecedent) requires reading *all* cells in $\{a \in \mathrm{Pop}_\mathcal{P}\}$, and the *absence* of a $\mathbf{t}$ on any one cell is a non-monotone fact (it could be resolved by a future increment). Determining that consensus is blocked, or computing which members have not yet aligned, requires either full-replica coordination or a designated aggregator with access to all alignment cells.

This asymmetry is structurally significant:
- **Settlement monitoring is coordination-free.** Any replica can detect achieved consensus instantly.
- **Blockage analysis requires coordination.** Determining *who* is blocking consensus, or whether consensus is achievable, requires aggregating non-monotone information.

The practical implication for distributed polity operations: a consensus-governed community can decentralize the *confirmation* of reached consensus (coordination-free reads), but must centralize (or coordinate) the *deliberation management* process (tracking alignment states across all participants). The substrate-algebraic analysis makes this tradeoff precise.

## Disputed alignment and the truth-knowledge long exact sequence

When a populace member submits conflicting alignment evidence — e.g., simultaneously asserting $\langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t}$ and submitting a retraction that forces $\langle a, \texttt{aligns-with}, \phi\rangle \geq_k \mathbf{f}$ — the cell reaches $\top$: both positive and negative evidence are present.

The [truth-knowledge long exact sequence](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) gives the cohomological account:

$$\cdots \to H^{n-1}(\mathcal{F}^{(\top)}_{\mathrm{align}}) \xrightarrow{\partial} H^n_t(\mathcal{F}^{(t)}_{\mathrm{align}}) \to H^n_k(\mathcal{F}^{(k)}_{\mathrm{align}}) \to H^n(\mathcal{F}^{(\top)}_{\mathrm{align}}) \xrightarrow{\partial} \cdots$$

For a *non-disputed* deliberation (all alignment cells at $\mathbf{t}$ or $\bot$, none at $\top$), $\mathcal{F}^{(\top)}_{\mathrm{align}} = 0$ and $H^n_t \cong H^n_k$. Truth-order and knowledge-order cohomologies of the alignment sheaf coincide: there is no gap between "what is positively aligned" and "what is settled as knowledge."

For a *disputed* deliberation, $\mathcal{F}^{(\top)}_{\mathrm{align}} \neq 0$ and the LES separates $H^n_t$ and $H^n_k$. The inconsistency sheaf $\mathcal{F}^{(\top)}_{\mathrm{align}}$ tracks the disputed alignment cells. $H^0(\mathcal{F}^{(\top)}_{\mathrm{align}})$ is a free abelian group on the persistently disputed alignment cells — a structural count of the participants in irresolvable alignment conflict.

Disputed alignment is structurally different from active dissent ($\mathbf{f}$): dissent is coherent and blocks consensus cleanly; disputed alignment ($\top$) indicates a *breach of deliberative coherence* — the participant's expressed position is internally contradicted. Clan-mother intervention or other governance-repair mechanisms address this differently from ordinary deliberation.

## The seventh-generation extension

The Haudenosaunee's seventh-generation principle adds a temporal axis to the alignment cell. Each member's alignment cell is replaced by a *seven-generation-projected* alignment:

$$\langle a, \texttt{aligns-with-projected}, (\phi, \tau + 7\,\mathrm{gen})\rangle = \mathbf{t}$$

— member $a$ aligns with $\phi$ projected forward seven generations. The closure rule reads these projected cells, not present-only cells.

Substrate-algebraically, the projection is a closure rule that reads $\phi$'s projected effects under all seven-generations-forward closure-rule firings — a [transfinite-bounded](../../theorems/regime-of-recurrent-practice.md) aggregation, since seven generations spans non-Scott-continuous content. This places consensus-with-seventh-generation in the *transfinite-bounded regime* (per [regime-of-recurrent-practice](../../theorems/regime-of-recurrent-practice.md)), with non-trivial $H^1$ — the cumulative cohomological invariant of seven-generation deliberation.

This is significant: a working community committed to seven-generation consensus operates in a *higher regime* than a community committed to present-only consensus. The substrate-algebraic structure carries the temporal commitment.

## When consensus blocks indefinitely

Consensus governance has a known failure mode: a single dissenter can block decision indefinitely. Substrate-algebraically, this corresponds to closure-rule firing that never reaches its antecedent — the consensus cell remains at $\bot$ across all stages within the settling bound.

The Haudenosaunee tradition handles this through structural mechanisms not reducible to overrule:

- *Deliberation continues.* The blocked decision returns to the council in subsequent meetings; the closure rule fires again at each cycle, with potentially-updated alignment cells.
- *Clan-mother removal.* Per the survey: clan mothers can remove a chief who fails to uphold responsibilities. This is *not* an overrule of consensus; it is a separate closure rule operating on the chief's [incumbency](incumbent.md) cells. A removed chief is replaced by a successor; consensus deliberation resumes with new participants.
- *Issue setting-aside.* Some decisions are deferred when consensus is unreachable. Substrate-algebraically: the decision-cell stays at $\bot$ permanently; alternative decision-cells may settle in its place.

Each of these is a substrate-algebraic move *outside* the consensus closure rule, not an erosion of it. The substrate maintains the consensus rule's strict requirement; alternative paths use different rules that don't violate consensus's structural commitment.

## Why this matters cohomologically

A community whose closure-rule subsystem $\mathcal{S}_{\mathcal{P}}$ contains consensus-closure rules has a structurally different settling pattern than one with majority-rule closures. Even when the same decisions are reached, the *path* to settlement differs:

- Consensus paths: longer, with more $\bot$-stages per decision; settlement via cumulative alignment.
- Majority paths: shorter, with sharper transitions between $\bot$ and settled-state; settlement via threshold-crossing.

Per the [aperiodic-regime classification](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-classification.md), settlings whose firing-ordinal patterns differ carry different $H^1$-classes. Consensus and majority governance have *cohomologically distinguishable* substrates. Two polities running structurally-same institutions but with different decision-rule traditions inhabit different $H^1$-classes — the math discriminates them.

This is the substrate-algebraic content of the survey's "different governance traditions are not interchangeable": the math shows they produce different cohomological invariants. The choice of decision-rule tradition is a structural choice with substrate-algebraic consequences.
