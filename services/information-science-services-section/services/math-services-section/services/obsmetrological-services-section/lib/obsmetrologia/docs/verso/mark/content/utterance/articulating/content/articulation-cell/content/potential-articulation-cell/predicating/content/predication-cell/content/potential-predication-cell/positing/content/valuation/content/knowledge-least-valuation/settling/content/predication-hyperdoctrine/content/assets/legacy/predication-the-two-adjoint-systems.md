---
type: narrative
status: current
discusses:
  - predication-hyperdoctrine
  - truth-order
  - knowledge-order
  - classical-equality
  - paraconsistent-equality
  - bigraded-settling-cohomology
  - truth-knowledge-cohomology-long-exact-sequence
  - bigraded-common-knowledge
  - modal-necessity-operator
  - negation
see-also:
  - state-of-the-theory
  - the-stack-of-roles
  - equality-derived-not-postulated
  - bigraded-cohomology-opener
  - bigraded-common-knowledge-position
  - hyperdoctrine-layer-opener
---

# The two adjoint systems

The chapter has acquired, over the course of its development, a substantial number of constructions that come in *pairs*: two equalities, two quantifiers, two K-axioms, two cohomologies linked by a long exact sequence, two modal calculi. The structural pairing is established for all of these — the truth-side and knowledge-side adjoint triples both exist as primitive structure on the predication hyperdoctrine — but the rigor of individual constructions varies across the chapter (e.g., the two-equalities and two-cohomologies stories are at proved-theorem level; the bigraded common-knowledge story is at sketch level; full Beck–Chevalley parity for both axes is open in places). The frame this narrative offers is meant to organize what is there, including what is still drafted. Each pair has been documented in the topic where it appeared — equality in [equality-derived-not-postulated](equality-derived-not-postulated.md), cohomology in [bigraded-cohomology-opener](bigraded-cohomology-opener.md), common knowledge in [bigraded-common-knowledge-position](bigraded-common-knowledge-position.md). What none of those narratives says, because each is local to its topic, is that *all of these pairs come from one structural source*: the [predication hyperdoctrine](../../objects/predication-hyperdoctrine.md) carries two parallel adjoint systems instead of one, and almost every Lawvere-style construction performed in the framework lifts to a pair indexed by which adjoint system was used.

This narrative names the structural source and traces the lift through the constructions it generates. The point is not to add new mathematics — every pair below is already in the corpus — but to make visible that there is *one* commitment underneath, so a reader sees the bigraded constructions as instances of a single pattern rather than as a sequence of independent extensions.

## The two systems

The bilattice value structure carries two orders: the [truth order](../../teaching/explanations/truth-order.md) $\leq_t$ ("what is the case") and the [knowledge order](../../teaching/explanations/knowledge-order.md) $\leq_k$ ("what is taken to be the case"). Their independence — neither refines the other — is the structural fact that makes the framework a bilattice rather than a single lattice.

When the bilattice is lifted into a hyperdoctrine, *each order generates its own adjoint triple* on every reindexing morphism:

- The truth-order adjoint triple $\exists^t \dashv f^* \dashv \forall^t$ — left and right adjoints to $\leq_t$-monotone reindexing along a predicate-category morphism $f$.
- The knowledge-order adjoint triple $\exists^k \dashv f^* \dashv \forall^k$ — left and right adjoints to $\leq_k$-monotone reindexing along the same $f$.

The reindexing $f^*$ is shared between the two systems (it is monotone in both orders), but the existential and universal adjoints are computed in different orders and produce different results. Both systems satisfy [Frobenius reciprocity](../../theorems/frobenius-for-knowledge-and-truth-meets.md) for their corresponding meets, and both satisfy [Beck–Chevalley](../../theorems/beck-chevalley-commutation-on-predication-bilattices.md) for the corresponding pullback squares. Both support [comprehension](../../objects/predication-hyperdoctrine.md) — the truth-side via the $\leq_t$-terminal $\mathbf t$, the knowledge-side via the $\leq_k$-terminal $\top$. They share an underlying fibration; they diverge in *which order's adjunction* is being applied at each construction.

This is the chapter's structural commitment that distinguishes its hyperdoctrinal apparatus from Lawvere–Seely hyperdoctrines and from triposes. A Lawvere–Seely hyperdoctrine has *one* adjoint system; a tripos has *one* preorder structure on its fibers. The predication hyperdoctrine has two of each, parallel and independent. See [not-a-tripos](not-a-tripos.md) for the precise divergences.

## What the two systems generate

Almost every Lawvere-style construction in the chapter, performed honestly, comes out twice — once per adjoint system. The pattern is consistent enough that it is worth naming the cases together.

**Two equalities.** The diagonal $\Sigma$-image construction, applied with $\exists^t$, gives [classical equality](../../objects/classical-equality.md) $=_E$: $\mathbf t$ on the diagonal, $\mathbf f$ off. Applied with $\exists^k$, it gives [paraconsistent equality](../../objects/paraconsistent-equality.md) $\Delta_E^k$: $\top$ on the diagonal, $\bot$ off. Both are derived; neither is postulated. See [equality-derived-not-postulated](equality-derived-not-postulated.md) for the construction and the contrast with the literature, where one or the other is typically postulated for lack of access to the parallel system.

**Two first-order theories.** The classical $T_t(\mathcal E)$ over the truth-side adjoints and the paraconsistent $T_k(\mathcal E)$ over the knowledge-side adjoints, both internal to the same hyperdoctrine, with explicit divergences (e.g., $\forall x, y. x = y \vee x \neq y$ derivable in $T_t$ but not in $T_k$). The two-internal-logics theorem makes this precise; both theories are first-class outputs of the hyperdoctrine, and applications choose between them by which order's semantics they want.

**Two K-axioms / two common-knowledge operators.** The corpus's natural $\mathbf K$-axiom for modal necessity comes out bigraded — one truth-side and one knowledge-side — and lifts to two parallel greatest-fixed-point operators $C^t \phi$ and $C^k \phi$ for common knowledge. On the benchmark fiber, these have different bottoms ($C^t p = (\mathbf f, \mathbf f, \mathbf f)$ uniformly, $C^k p = (\bot, \bot, \bot)$ uniformly), and they classify different settling outcomes. The bigraded common-knowledge construction is currently at sketch rigor (see the file's frontmatter), and its KZ-doctrine packaging is part of what is being worked out; the *structural* claim that the $\mathbf K$-axiom comes in two copies is what is established here. See [bigraded-common-knowledge-position](bigraded-common-knowledge-position.md) for the construction's positioning relative to Halpern–Moses, BEAK, and Bílková–Frittella–Kozhemiachenko.

**Two cohomologies.** [Settling cohomology](../../objects/settling-cohomology.md) admits a [bigraded refinement](../../objects/bigraded-settling-cohomology.md) that resolves truth-axis content and knowledge-axis content separately, with a [comparison long exact sequence](../../theorems/truth-knowledge-cohomology-long-exact-sequence.md) relating them. The single-grading theory is the diagonal of the two-grading theory; the bigrading is what makes the truth/knowledge decoupling visible at the cohomological level.

**Two modal calculi.** The fiberwise [modal necessity](../../morphisms/modal-necessity-operator.md) and [modal possibility](../../morphisms/modal-possibility-operator.md) operators come out bigraded on each fiber: a $\Box^t / \Diamond^t$ pair via the truth-side adjoints to a bilattice-accessibility relation, and a $\Box^k / \Diamond^k$ pair via the knowledge-side. The [twist-modal translation](../../objects/twist-modal-translation.md) records the corresponding propositional bigraded modal logic.

In every case the same recipe applies: a Lawvere construction parameterized by *which adjunction*, performed in the truth system, gives the truth-axis output; performed in the knowledge system, gives the knowledge-axis output. The lift is mechanical once the apparatus is in place; the work is in the apparatus.

## What couples and decouples the two systems

The two systems are not independent — they share a fibration, and several constructions reach across them. Tracking which constructions couple them and which keep them decoupled is one way to read the chapter's structural results.

- **Decoupled by default.** The two adjoint systems compute independently on a generic predication hyperdoctrine. Truth-side $\exists^t$ on a state need not commute with knowledge-side $\exists^k$ on the same state; they typically produce different outputs and ground different theorems.
- **Coupled by negation.** [Strong negation](../../teaching/explanations/negation.md) acts as a $\leq_t$-order-reversing involution that *fixes* the $\leq_k$ order pointwise — it swaps $\mathbf t \leftrightarrow \mathbf f$ but leaves $\bot$ and $\top$ alone. This is what makes the truth-side L.E.S. of cohomologies $\mathbb Z/2$-equivariant via the [internal $\mathbb Z/2$-gauge](../../teaching/explanations/internal-z2-gauge.md), while the knowledge-side cohomology carries no such equivariance. Negation is the canonical example of a structure visible on one axis only.
- **Coupled by comparison.** The [truth-knowledge cohomology long exact sequence](../../theorems/truth-knowledge-cohomology-long-exact-sequence.md) is the canonical place where the two cohomologies are linked: at each degree, classes on one axis push forward / pull back to classes on the other, and the connecting morphism measures the obstruction to lifting. This is the bigraded analog of the two-out-of-three pattern in classical homological algebra.
- **Coupled by Frobenius failure for fusion.** The [Frobenius-for-fusion-fails theorem](../../theorems/frobenius-for-fusion-fails.md) records that the residuated structure mixing the two orders does *not* satisfy Frobenius reciprocity, even though each order's meet does. This bounds how strongly the two systems can be coupled within the hyperdoctrine: full Frobenius parity across the two systems is structurally unavailable, and constructions that need it (mixed-axis quantifier scope) fall back to the [twist-product residuation](../../theorems/twist-product-residuation.md) where the issue is rephrased rather than removed.

The decoupling is the more important fact. A frequent misreading of the framework is to treat the knowledge-side as a "refinement" of the truth-side — as if $\leq_k$-information were a more detailed version of $\leq_t$-truth. It is not; they are independent orders with independent adjunctions and produce structurally different outputs even on the same input. The bigraded constructions are *not* truth-side facts decorated with extra knowledge-side bookkeeping; they are genuine pairs.

## What is not bigraded

The pattern is consistent, but not universal. Some constructions in the chapter live on one axis only, and recognising which is part of reading the chapter accurately.

- **Strong negation, as just noted, is truth-axis only.** There is no knowledge-axis analog — no involution that swaps $\bot \leftrightarrow \top$ while fixing $\mathbf t$ and $\mathbf f$. The bilattice's paired structure is asymmetric in this respect, and the asymmetry is structural rather than incidental.
- **Settling monotonicity is knowledge-axis only.** A [predication settling](../../objects/predication-settling.md) is by construction $\leq_k$-monotone: knowledge accumulates and never retracts. There is no parallel settling-monotonicity in the truth axis (a settling can become $\leq_t$-incomparable to its earlier values, e.g., when a $\bot$-cell becomes a $\top$-cell after later evidence makes both polarities present). Temporal accumulation is intrinsically knowledge-side; this is part of why the corpus picks $\leq_k$-monotonicity as the settling's defining structural commitment.
- **Closure-2-monad lax-idempotence is fiberwise, not bigraded.** The [closure 2-monad](../../morphisms/closure-2-monad.md) is lax-idempotent in the Kelly–Lack sense as a single 2-monad; there is no parallel "truth-side closure" / "knowledge-side closure" decomposition. The closure machinery is one structure, even though its inputs (rule-firings) and its outputs (saturated states) live in the bigraded value structure.
- **CRDT merge is knowledge-axis only.** $\vee_k$-merge is the CRDT operation; $\vee_t$-merge is not a meaningful CRDT step (it would lose the paraconsistency-from-disagreement that the framework exists to capture). This is why the distributed-systems strand uses the knowledge-axis throughout.

These exceptions do not undercut the pattern; they refine it. The bigraded construction is the *default*, with the cases above being identifiable axis-asymmetries that have explicit structural reasons.

## How the bigraded pattern shapes incoming math

For reading new developments in the chapter, the bigraded pattern works as a fast diagnostic. When a new construction is introduced, the question "does this come out twice — once per adjoint system?" sorts the construction into its proper type:

- If the construction is generated from an adjunction (a $\Sigma$-image, a quantifier, a fixed-point operator, a derived functor), it should come out bigraded. Producing only one of the pair is usually a sign the construction has not been performed completely.
- If the construction is one-axis (negation, settling-monotonicity, CRDT merge, $\Phi^*$-pullback in the truth-axis-only direction), it should not be bigraded, and the asymmetry should have a stated structural reason.
- If the construction is bigraded and the two outputs are coupled (comparison sequence, Frobenius parity, etc.), the coupling itself is content and is usually a separate theorem.

This is also why the chapter's "common-knowledge" and "equality" constructions, when first ported in from outside literatures, often need to be redone: imported constructions typically use the *truth-side adjunction* (because that is the literature's default), miss the parallel *knowledge-side adjunction*, and consequently lose half of the chapter's distinctive content. The audit pattern recorded in [state-of-the-theory](state-of-the-theory.md)'s post-bigraded-common-knowledge update section identified this as one of the recurring failure modes for theory-internality.

## Where to read

For the equality construction in detail: [equality-derived-not-postulated](equality-derived-not-postulated.md). For the bigraded cohomology: [bigraded-cohomology-opener](bigraded-cohomology-opener.md) and the [comparison long exact sequence theorem](../../theorems/truth-knowledge-cohomology-long-exact-sequence.md). For common knowledge: [bigraded-common-knowledge-position](bigraded-common-knowledge-position.md). For the foundational hyperdoctrine apparatus that hosts both adjoint systems: [hyperdoctrine-layer-opener](hyperdoctrine-layer-opener.md) and the [two internal logics theorem](../../theorems/two-internal-logics.md). For where this pattern sits in the chapter's role/realization/invariant stratification: [the stack of roles](the-stack-of-roles.md), specifically the *two orders* discussion under truth and knowledge.
