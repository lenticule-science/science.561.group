---
type: concept
class: involution
status: draft
symbol: "-"
depends-on: [operations-settling, witness-as-increment, conflation, four-bilattice, knowledge-order, truth-order, jung-rivieccio-duality]
realizes: [audit, evidentiary-stance]
---

# Audit conflation

The same [operations settling](../objects/operations-settling.md) supports two evidentiary readings: a *charitable* reading in which an unwitnessed cell rests at $\bot$ (uncertain, not yet decided) and a *skeptical* reading in which the same unwitnessed cell is treated as $\top$ (contested, repair-required: the absence of any witness is itself a defect to be addressed). These are not separate substrates. They are the two values of an involutive operation on the operations valuation — the [conflation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/conflation.md) operation $-$ on the bilattice $\mathbf{FOUR}$ — applied uniformly. Adopting one or the other audit lens is a substrate-internal involution; it is not a re-recording of evidence and does not require a new event log.

## The two audit lenses

Let $v^{\mathrm{op}}$ be a settled operations valuation. Define the *audit-conflated valuation* $v^{\mathrm{op},-}$ cellwise by

$$v^{\mathrm{op},-}(\phi) \;=\; -\,v^{\mathrm{op}}(\phi)$$

with $-$ the [conflation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/conflation.md) on $\mathbf{FOUR}$: $-\bot = \top$, $-\top = \bot$, $-\mathbf t = \mathbf t$, $-\mathbf f = \mathbf f$.

The two readings differ exactly on the *unwitnessed* cells:

| Cell value $v^{\mathrm{op}}(\phi)$ | Charitable reading | Skeptical reading $v^{\mathrm{op},-}(\phi)$ |
|---|---|---|
| $\bot$ (no witness) | $\bot$ — uncertain, not decided | $\top$ — counted as repair-required |
| $\mathbf t$ (positive witness) | $\mathbf t$ | $\mathbf t$ |
| $\mathbf f$ (negative witness) | $\mathbf f$ | $\mathbf f$ |
| $\top$ (contradicted) | $\top$ — repair-required | $\bot$ — written off as unrecoverable |

The witnessed cells ($\mathbf t$, $\mathbf f$) are conflation-fixed: positive and negative evidence read identically under both lenses. The unwitnessed and contradicted cells ($\bot$, $\top$) swap roles. Under skeptical conflation, *silence becomes contradiction* — a cell with no witness is treated as a $\top$-cell demanding repair — and *contradiction becomes silence* — a contradicted cell is treated as a non-event written off rather than repaired. The skeptical lens *raises the burden of proof* for unwitnessed cells while *lowering the urgency* of already-contradicted ones; the charitable lens does the opposite.

## Why this is an involution, not a re-classification

By the [conflation morphism](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/conflation.md):

- $-$ is **antitone in the knowledge order** $\leq_k$: increasing evidence under one lens corresponds to decreasing evidence under the other (a charitable $\bot \to \mathbf t$ accretion is a skeptical $\top \to \mathbf t$ resolution-of-contestation);
- $-$ is **monotone in the truth order** $\leq_t$: the truth direction is preserved (charitable-true cells are skeptical-true cells; charitable-false cells are skeptical-false cells);
- $-$ fixes $\mathbf t, \mathbf f$ and swaps $\bot, \top$;
- $-$ is involutive: $-\,- v = v$. Auditing a skeptical reading skeptically returns the charitable reading.

The involution gives a $\mathbb Z/2$-action on $\mathbf{FOUR}$ distinct from the [internal $\mathbb Z/2$ gauge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/internal-z2-gauge.md) of negation: the negation gauge fixes $\bot, \top$ and swaps $\mathbf t, \mathbf f$, whereas the conflation involution fixes $\mathbf t, \mathbf f$ and swaps $\bot, \top$. The two involutions commute (when both are present, $\sim\,- = -\,\sim$ per the [conflation morphism](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/conflation.md)) and together generate the symmetry group $\mathbb Z/2 \times \mathbb Z/2$ of $\mathbf{FOUR}$. Audit-conflation is the *evidentiary-stance* axis of that symmetry; negation is the *truth-stance* axis.

The two lenses are therefore not independent valuations to be reconciled. They are mathematically the same data under the involution. The substrate does not need to *commit* to a lens; it carries one valuation, and any audit can be performed in either reading by applying $-$ on the read side.

## Operational use

Three concrete deployments of the conflation involution:

1. **Default-charitable, audit-skeptical.** The standing operations settling is read charitably ($v^{\mathrm{op}}$): unwitnessed cells are $\bot$, and dispatch and capability inference proceed on whatever positive evidence has accumulated. Periodic audit reads $v^{\mathrm{op},-}$: unwitnessed cells become $\top$-cells demanding repair, surfacing every required-but-not-witnessed capability, every expected-but-not-completed task, every promised-but-not-delivered cell. The audit produces a list of cells the charitable reading silently passed over; resolving them produces witnesses that move the cells to $\mathbf t$ or $\mathbf f$, after which both lenses agree.

2. **Adversarial review.** A reviewer who applies $-$ to a peer's operations settling reads the same cells with the burden of proof reversed: every cell on which the peer is silent is, for the reviewer, a contestation-to-be-resolved rather than a not-yet-decided. The peer's charitable reading and the reviewer's skeptical reading are involution-equivalent — neither has more or less information than the other; they differ only in which side bears the cost of $\bot$ cells.

3. **Charter-tier escalation.** Per [normative-operational-layering](./normative-operational-layering.md), some charter-tier rules apply only to *witnessed-positive* cells (e.g., guidelines that govern recorded behavior); others demand *affirmative evidence* on cells where silence should not pass (e.g., high-stakes-action authorization). The latter class is exactly the rules that fire *under skeptical conflation* — they treat $\bot$ as $\top$ and demand the corresponding repair. Encoding both classes via a single rule format applied in the appropriate lens yields uniform charter machinery: every charter rule is a closure rule on $v^{\mathrm{op}}$ in some reading.

## Witnesses are involution-fixed; closure rules generally are not

Witnesses transform trivially under conflation: a $\mathbf t$-witness is still a $\mathbf t$-witness, a $\mathbf f$-witness still $\mathbf f$. The [witness-as-increment](../morphisms/witness-as-increment.md) correspondence is therefore conflation-invariant — the same event log produces the same increment sequence under either reading.

Closure rules, however, are *not* generally equivariant under $-$. A rule whose antecedent fires on $\bot$-cells (e.g., "if the capability cell is unwitnessed at dispatch time, block the dispatch") fires on a different cell-set under the skeptical lens (where those cells are $\top$, not $\bot$). The rule's *operational meaning* — block-when-unwitnessed — is preserved across the involution, but its *cell-pattern antecedent* must be conflation-translated: the rule's charitable form has antecedent on $\bot$-cells; its skeptical form has the same antecedent on $\top$-cells. A rule system $\mathcal S_{\mathrm{op}}$ that is closed under conflation is one whose every rule has both forms with conflation translating between them; this is a structural property of the rule system, not the substrate.

The standing convention in the predicated-work program is to author rules in their charitable form and apply $-$ on read for skeptical audits. The conflation-translation of the rule set is computable from the rule set alone, by [Jung–Rivieccio duality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md) on the $L_+ \leftrightarrow L_-$ swap.

## What this concept replaces

Without a substrate-internal involution carrying the charitable / skeptical distinction, the two stances tend to be carried as either (a) two parallel substrates requiring synchronization, or (b) out-of-band annotations on cells, sitting outside the substrate algebra. Both options break audit-replayability and break the [witness-as-increment](../morphisms/witness-as-increment.md) correspondence. The conflation involution collapses the distinction into a substrate-internal $\mathbb Z/2$-action that the audit machinery applies on the read side — the substrate carries one valuation, the audit chooses a reading, the involution structure guarantees the two are mutually recoverable.

## Relation to inconsistency-sheaf and adjudication

The [truth-knowledge LES](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) on the charitable settling tracks $\top$-cells (contradicted witnesses) as the inconsistency sheaf $\mathcal F^{(\top)}$. Under the skeptical conflation $v^{\mathrm{op},-}$, the same sheaf-construction reads the *unwitnessed* cells of the charitable settling: $\mathcal F^{(\top)}(v^{\mathrm{op},-})$ is the $\bot$-shadow of $\mathcal F^{(\top)}(v^{\mathrm{op}})$. Adjudication therefore has a dual reading: charitable adjudication resolves witnessed contradictions; skeptical adjudication resolves unwitnessed-but-required cells. Both are repair operations; they target dual sub-sheaves of the same substrate.
