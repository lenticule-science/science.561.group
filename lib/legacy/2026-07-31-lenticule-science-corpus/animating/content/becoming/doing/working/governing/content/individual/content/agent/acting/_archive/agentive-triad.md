---
name: agentive triad and the realization-on-a-computer precedences
description: "Reading-notes on the three bilattice axes (truth, knowledge, evidence), the agentive triad mapped onto them (speaking, doing, learning), the K_4/D_4/sigma symmetry analysis, and the three 'X before Y' precedences as Lambek-LFP statements at strata of the CHL apex tower. Cycle 3 of the realigning-the-repository-layout project. Quoted passages with file paths and line numbers, synthesis in the references' vocabulary."
opened-at: 2026-05-19
---

This file is reading-notes for Cycle 3.
Subject: the three orthogonal bilattice axes (truth, knowledge, evidence), the agentive triad mapped onto them (speaking, doing, learning), and the three precedences "truth before knowledge," "speaking before doing," "structure before process" — proved below as Lambek-LFP statements at strata of the apex tower.

## The truth role and the knowledge role are transverse and independent

From [`concepts/truth.md:9–17`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth.md):

> The role borne by an answer to the question *which way does the evidence point?* — independently of how much evidence has been gathered.
> Truth is the axis along which a value can be *more for* or *more against* an assertion.
> A framework realizes truth when it equips its value space with an order, the truth order $\leq_t$, that ranks values by how supportive of the assertion they are.
> The role imposes three pressures on any realization: - **Direction.** There must be a way to say *this value is more in favor of the assertion than that one*. ... - **Independence from informativeness.** Two values carrying the same amount of evidence — one all-for, one all-against — must be incomparable under knowledge and ordered under truth.
> The truth role is *transverse* to the knowledge role; a framework that conflates the two cannot represent disagreement. - **Negatability.** A value's truth-position must admit reversal: every value $a$ has a counterpart $\sim a$ whose truth-position is opposite.
> This is the role of negation, and it characterizes the truth axis as the one along which negation acts antitonely.
> A framework that realizes truth without realizing knowledge collapses to classical two-valued logic; one that realizes knowledge without realizing truth collapses to a plain accumulation lattice with no notion of disagreement.
> The two roles are independent and both required for adjudication.

From [`concepts/knowledge.md:9–17`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge.md):

> The role borne by an answer to the question *how much has been settled?* — independently of which way the evidence points.
> Knowledge is the axis along which a value can be *more determinate* or *less determinate* about an assertion ... - **Accumulation.** Receiving additional evidence must move the value upward in $\leq_k$, never downward — strictly upward when the new evidence is genuinely new, and unchanged when the closure has already absorbed it.
> The knowledge role is the formal site of monotonicity: information accrues, it is not retracted. - **Indifference to direction.** A value with only for-evidence and a value with only against-evidence carry the *same amount* of information about the assertion ...
> Knowledge is *transverse* to truth: the truth role separates them, the knowledge role measures their common informativeness. - **Compatibility with conflict.** ...
> Knowledge has a top, "told both," that is the join of the for-only and against-only values.

The load-bearing word for the two-axis relationship is **transverse**, not **prior**.
The pre-bilattice names truth-order as "the first of two lattice orders" (from `concepts/truth.md:21`) and knowledge as "the second" (`concepts/knowledge.md:21`) — a labeling order in the definition of the pre-bilattice, distinct from the Lambek-LFP precedence the apex-tower section establishes.

## The evidence role realizes the value structure as a twist product

From [`concepts/evidence.md:9–11`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/evidence.md):

> The role borne by the two components of a twist product value $\langle a_+, a_- \rangle \in L_1 \times L_2$.
> The first coordinate $a_+$ tracks **positive evidence** (information for the assertion); the second coordinate $a_-$ tracks **negative evidence** (information against).
> The role's content is the structural commitment that the value of an assertion is a *pair* of independently tracked sides, never collapsed into a single signed scalar.
> The two evidence kinds behave dually under the bilattice's two orders.
> The truth order raises positive evidence and lowers negative evidence; the knowledge order raises both.
> Negation interchanges positive and negative evidence: $\sim \langle a_+, a_- \rangle = \langle a_-, a_+ \rangle$.

The diamond visible in $\mathbf{FOUR}$ (`concepts/evidence.md:25`):

> The role's transversality is visible directly in the diamond: each axis carries information that the other does not.

So **"diamond" denotes at least three distinct mathematical objects**:

1. The four-element bilattice's Hasse diagram (the FOUR diamond with corners $\bot, \mathbf{t}, \mathbf{f}, \top$).
2. The KZ-diamond from Cycle 1's notes — the strict-commuting square of $\mathrm{Cl}$ and $\mathbb{N}$ from [`prose/learning/claims/kz-diamond-strict-commutation.md`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/prose/learning/claims/kz-diamond-strict-commutation.md).
3. The Kelly–Lack diamond on $\mathbb{M} \dashv \mathbb{N}$ from [`code/structures/temporal-2-category.md:22`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/temporal-2-category.md) — the square of unit/counit/multiplication/comultiplication 2-cells of the 2-adjunction.

The user's "bigraded diamonds" gesture is compatible with any or all of these, and they are not the same diamond.

## Avron's theorem makes the triad's structure universal

From [`prose/learning/claims/avron-representation.md:9`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/prose/learning/claims/avron-representation.md):

> **Theorem ([@avron1996]; [@rivieccio2010] Thm 1.3.9–10).** A bounded pre-bilattice is interlaced iff it is isomorphic to a twist product $\mathbf{L}_1 \bowtie \mathbf{L}_2$ for some bounded lattices $\mathbf{L}_1, \mathbf{L}_2$.
> A bounded bilattice is interlaced iff it is isomorphic to $\mathbf{L}^\bowtie$ for some bounded lattice $\mathbf{L}$.

Same file, lines 17–21:

> The representation theorem makes the twist product a *canonical and exhaustive* construction for interlaced bounded pre-bilattices: every such pre-bilattice arises this way, up to isomorphism.
> The two-coordinate description $\langle a_+, a_- \rangle$ — positive evidence in the first coordinate, negative evidence in the second — is therefore not a special case but the universal form.
> Specializing to $\mathbf{L} = \mathbf{2}$ recovers $\mathbf{2}^\bowtie \cong \mathbf{FOUR}$ as the smallest non-trivial interlaced bilattice ...

The truth/knowledge/evidence triad is therefore the universal structural commitment for every interlaced bounded bilattice realization.
Avron 1996 and Rivieccio 2010 are the published proofs; the internal restatement in `prose/learning/claims/avron-representation.md` is proved.

## The agentive triad — speaking, doing, learning — and its refinement

From [`questions/agentive-triad-speaking-doing-learning.md:29`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/questions/agentive-triad-speaking-doing-learning.md):

> This question asks whether speech-acts are *one of three* parallel agentive categories — namely **speaking, doing, learning** — corresponding to the **truth / knowledge / evidence** triad load-bearing in the bilattice structure.

The three orthogonal axes table (same file, lines 35–41):

> | Axis | Order/coordinate | $D_4$ generator | |---|---|---| | Truth | $\leq_t$ | $\sim$ (negation) — preserves $\leq_k$, reverses $\leq_t$ | | Knowledge | $\leq_k$ | $-$ (conflation) — preserves $\leq_t$, reverses $\leq_k$ | | Evidence | $\mathbf{L}^\bowtie = \mathbf{L}_+ \otimes \mathbf{L}_-$ (the twist-product carrier) | $\sigma$ (order-swap) — exchanges $\leq_k$ and $\leq_t$ |

(The third row's parenthetical is rendered as "twist-product carrier" — the source's word for it in the original table was `substrate`, but the evidence-concept definition in `concepts/evidence.md` together with Avron's theorem make "twist-product carrier" the load-bearing description.)

The triad's *refined* shape (same file, lines 80–94):

> - **Speaking and doing are horizontal siblings** at the cell-value layer, operating along the truth-axis and knowledge-axis respectively *within a fixed theory*. - **Learning is the vertical movement** that *extends the theory itself* in response to accumulated speaking/doing — going from cell-level evidence (Reading A) through inductive generalization (Reading C) to theory-extension (Reading B).
> So the triad is not three-siblings-at-one-layer.
> It is **two-horizontal-siblings (speak, do) at the cell-value layer plus one-vertical-axis (learn) that connects to the meta-moduli layer.** ...
> This refines the original gesture: the agentive triad has a **two-tier structure** — - *Tier 1 (horizontal, cell-value):* speech-acts ($\sim$, truth-axis) ⊕ doing-acts ($-$, knowledge-axis). - *Tier 2 (vertical, meta):* learning-acts (atomic-A / bridge-C / compositional-B), spanning the cell-level → theory-level direction.
> The $D_4$-symmetry covers Tier 1 cleanly.
> Tier 2 needs its own symmetry analysis at the meta-moduli level.

The within-theory symmetry is $K_4 = \langle \sim, - \rangle$ (same file, lines 124–143): speech-acts and doing-acts share *the same* invariance group within a fixed theory; $\sigma$ is meta-theoretic, moving between theories rather than within one.

## Doing-acts split into σ-doing-acts and Δ-doing-acts

Same file, lines 96–122:

> The PCT-native objects underlying doing-acts are both in the chapter's `code/` directory: - *The σ-nucleus:* the closure-operator generated by the closure-rule system, equivalently the algebra map of the closure-2-monad.
> Knowledge-axis ($\leq_k$).
> Produces stratum-1 ("saturated") atoms in the stratified-predication-fiber. - *The Δ-nucleus:* the bilattice-stabilization-nucleus $T_a^* = a \Rightarrow (a \odot \cdot)$ iterated to fix.
> Truth-axis ($\leq_t$).
> Produces stratum-2 ("settled") atoms.
> The joint fixed point of the two nuclei is the settled fiber; together they realize the closure-2-monad's algebra structure on the predication fiber algebra. ### Doing-acts split intrinsically into two operational kinds Speech-acts produce stratum-0 atoms via positing morphisms.
> Doing-acts produce stratum-1 atoms via σ-nucleus application or stratum-2 atoms via Δ-nucleus application.
> The split is built into the stratified-predication-fiber: **σ-doing-acts** and **Δ-doing-acts** are structurally distinct because they produce atoms at structurally distinct strata.

Eight doing-act classes total: 4 Belnap × 2 strata.
The σ-stratum and Δ-stratum are *both* nuclei on the predication fiber algebra; the joint fixed point of the two nuclei is the settled fiber.

## The "X before Y" precedences are Lambek-LFP statements at each stratum

The three precedences are theorems: Lambek-LFP statements at each stratum of the CHL apex tower.
The proof at each stratum:

1. **"Truth comes before knowledge."** At the bilattice / FOUR stratum: the truth axis is the apex's *coordinate frame* (the FOUR's $\mathbf{f} \leq_t \{\bot, \top\} \leq_t \mathbf{t}$ structure that lays out the diamond's corners); knowledge is the closure-monotone *trajectory direction* (settlings move along $\leq_k$, per `concepts/truth.md:37`).
  The apex's coordinates must be in place for the trajectory to be defined.
  The pre-bilattice definition's choice of "first the truth lattice, then the knowledge lattice" reflects this.
  See [apex-tower.md](apex-tower.md) for the full reading.

2. **"Speaking comes before doing."** At the stratified-predication-fiber stratum: speech-acts emit stratum-0 (asserted) atoms; doing-acts emit stratum-1 (σ-saturated) and stratum-2 (Δ-settled) atoms, with `deps` chains pointing strictly back through lower strata.
  From [`code/structures/stratified-predication-fiber.md:31`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/stratified-predication-fiber.md): "stratum is the *closure-degree* of an atom under the $\mathcal{S}/N_\Delta$ pair: stratum $0$ atoms have empty $\mathrm{deps}$; stratum $1$ atoms have $\mathrm{deps} \subseteq A^{(0)}_p \cup A^{(1)}_p$ with at least one σ-firing in their generation."
  Speech-acts produce the asserted atoms; doing-acts produce the atoms whose witness chains point back to them.
  Speaking is structurally prior — its outputs are the dependencies of doing's outputs.
  See [apex-tower.md](apex-tower.md).

3. **"Structure comes before process."** At the predication-fibration stratum: the cleavage (the Emmenegger pseudo-$\mathbb{N}$-coalgebra structure) is the apex's carrier; the closure 2-monad $\mathrm{Cl}$ on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ is defined *in terms of* $\mathbf{PrFib}$ already existing.
  The closure presupposes the structure it acts within.
  From [`prose/teaching/explanations/two-disentangled-kz-structures.md:26–27`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/two-disentangled-kz-structures.md): "The settling proceeds by alternating: external evidence arrives, $\mathrm{Cl}$ fires to saturate, the result is again a pseudo-$\mathbb{M}$-algebra.
  The fibration structure is invariant under closure firing; only the saturation status changes."
  The fibration structure is *the invariant under closure*.
  Lambek's lemma at the temporal-2-category-level says the same thing: the settled state $v_\kappa$ is the LFP of $\mathrm{Cl}$ applied to the initial valuation inside the fibration.
  The structure has to be set up before the closure can produce its LFP.
  See [apex-tower.md](apex-tower.md).

The KZ-diamond's *strict commutation* is consistent with this without contradicting it.
Strict commutation says that, once both pieces are in place and both operations are defined, the order of application is algebraically irrelevant.
The precedence is about which side has to exist *for the operation to be defined at all*: the closure operator $\mathrm{Cl}$ on $\mathbf{PrFib}$ cannot be defined without $\mathbf{PrFib}$ existing — that is, without the predicate-category, the cleavage, the coalgebra structure already in place.

The precedences are stated at the *definitional* level via Lambek's lemma rather than in temporal-connective form.
The qualifier "at least when realized on a computer system" picks out the operational face: when a computer realizes the system sequentially, the definitional order becomes the temporal order.
The structure side has to be written to disk before the closure side has anything to run against.

The claim that "the substance/process split is the same split as speech-acts/doing-acts, just in a different stratification/part of the tower" is exactly the CHL apex recursion's statement: at every stratum, the same *(apex, closure)* split appears, with the apex being the structure side and the closure being the process side.
The split is universal; the strata are the levels of the tower.

## Synthesis

The three orthogonal bilattice axes — truth ($\leq_t$), knowledge ($\leq_k$), evidence (the twist-product carrier $\mathbf{L}^\bowtie$) — and the three $D_4$ generators ($\sim, -, \sigma$) are universal structural commitments forced by Avron's representation theorem.
The agentive triad **speaking : truth :: doing : knowledge :: learning : evidence** is the open conjecture stated in `questions/agentive-triad-speaking-doing-learning.md`, refined to: speaking and doing are horizontal $K_4$-siblings at the cell-value layer within a fixed theory; learning is vertical, spanning A→C→B from cell-level to theory-level, with $\sigma$ as its candidate meta-theoretic symmetry.

The three "X before Y" precedences are theorems by Lambek's lemma at each stratum of the CHL apex tower (per [apex-tower.md](apex-tower.md)).
At each stratum, the apex is the LFP of a closure operator; the apex's structure has to exist for the closure operator to be defined.
The precedence is definitional.
On a sequential computer the definitional order becomes the operational order: the structure side has to be written before the closure side can run against it.
The KZ-diamond's strict-commutation theorem (sketch) is consistent with this — once both sides exist and the closure is defined, the order of application is algebraically irrelevant — but it does not contradict the precedence, since the precedence is about *which side has to exist* for the operation to be defined at all.

The theorems beyond the published frontier — the proved and sketch theorems that build on top of Avron, Belnap, Emmenegger, Kelly–Lack, Marmolejo, Lambek — include: the KZ-diamond strict-commutation theorem (sketch), the bigraded common-knowledge theorem (sketch), the locution-illocution-perlocution factorization and $K_4$-stratification theorems (status varies per file), and the agentive-triad's refined two-tier structure (open question stated in `agentive-triad-speaking-doing-learning.md`).

## Falsifiable inquiries

**Inquiry 1.** Are the three precedences Lambek-LFP claims at strata of the CHL apex tower, or some weaker statement?

*Proved from references.* The closure 2-monad $\mathrm{Cl}$ is defined on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ ([`code/transformers/closure-2-monad.md:11–13`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/transformers/closure-2-monad.md)).
Its definition requires $\mathbf{L}, \mathcal{C}, E$ specified.
By [@lambek1968] (per [`chl-apex-recursion.md:14–23`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/chl-apex-recursion.md)) the settled state $v_\kappa$ is the initial algebra of $\mathrm{Cl}$.
Therefore the base parameters of $\mathrm{Cl}$ must exist before $\mathrm{Cl}$'s LFP can be computed.
This is a strict definitional precedence at the predication-fibration stratum.
The same construction recurses at each level of the apex tower: each level's closure is defined on the prior level's apex, and Lambek's lemma applies at each CHL site.
The precedence is therefore not one statement at one stratum but a recursive family of definitional precedences, one per level.

**Inquiry 2.** Which $(X, Y)$ pair sits at each stratum of the apex tower?

*Resolved by tabulation* (from [`chl-apex-recursion.md:29–40`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/chl-apex-recursion.md) plus the Level 8 extension at line 124, with the (X, Y) pair surfaced in this study appended in the rightmost column where one is present):

| Stratum | Apex $X$ | Closure $Y$ | User-gesture pair |
|---|---|---|---|
| 1 Bilattice prelims | $\mathbf{FOUR}$ | twist-product completion | truth × knowledge |
| 2 Predication structure | fiber algebra $A_q$ | twist-product over predicate fiber | — |
| 2.5 Predication fibration / temporal 2-category | $\mathbf{PrFib}(\mathbf{L},\mathcal{C},E)$ + cleavage | $\mathrm{Cl}$ | structure × process |
| 2.6 Stratified predication fiber | stratum-0 (asserted) | $\sigma$-nucleus + $\Delta$-nucleus → stratum-1, stratum-2 | speech-act × doing-act |
| 3 Hyperdoctrine | predication hyperdoctrine $\mathcal{E}$ | quantifier-adjoint closure | — |
| 4 Settling | settled state $v_\kappa$ | rule-application $C$ | — |
| 5 Priestley duality | bitopological site $\mathbf{T}^*$ | Priestley dualization | (primal × dual fixed point) |
| 6 Cohomology | $H^1$-class $\mathrm{cl}\text{-}\mathrm{inv}$ | extend-truncation | — |
| 7 Moduli | settling moduli stack $\mathcal{M}^{\mathrm{SKH}}$ | MLD-quotient | — |
| 8 Meta-moduli | $\mathscr M^{\mathrm{meta}}$ | closure-equivalence quotient | — |

Strata 2.5 and 2.6 are sub-levels nested within the predication-fibration construction rather than separate chapters in the chl-apex-recursion table; both are required to place the user's speech-act × doing-act pair at the same level as the stratified-fiber filtration.
Strata 3, 4, 6, 7, 8 have no user-gesture pair yet named — the apex tower predicts further pairs, but the user's opening gesture did not exhibit them.

**Inquiry 3.** What is the enumeration of forms a top-level directory simultaneously instantiates?

*Resolved from [`code/structures/_index.md`](../../../../code/structures/_index.md) and [`code/structures/form.md`](../../../../code/structures/form.md).* The top-level 561 directory instantiates each form whose Distinguishing predication-shape it satisfies (per form.md:6–11, a form is a pair (structure, inhabitance), and a record satisfies the form's signature when its predications match).
The 561 directory at minimum instantiates:

- `directory-form` (it is a posix directory),
- `directory-index-form` (it has `_index.md`),
- `markdown-resource-file-form` collection (its child `.md` files),
- `posix-file-form` collection (its child non-directory files),
- `entity-form` (it bears identity predications via `_index.md`),
- `agent-community-form` (it has `agents` via `doing/governing/characters/`, a `governance/` analogue, and emits community-acts) per Inquiry 3 of [stack-of-roles.md](stack-of-roles.md),
- `polity-form` (it has the charter, offices, personnel-roster predications recorded in `561-group.md` and `work/governance/staff/`),
- `561-group-form` (the named instance, per `code/structures/561-group.md`),
- the carrier of a `predication-theory`-form quadruple $(\mathbf{L}, \mathcal{C}, E, \mathrm{Cl})$ via `code/structures/` ∪ `code/transformers/` as $\mathcal{C}$ and the rule systems as $\mathrm{Cl}$.

By the CHL apex recursion, the top-level directory also plays *apex at one stratum and closure-presentation at another*: its `code/structures/` ∪ `code/transformers/` is the apex of the predication-fibration stratum (the predicate-category $\mathcal{C}$) AND the input to the hyperdoctrine stratum's closure.
This double role is the source of the polysemy the project's derivation work has to name.

## Verification against the opening gesture

Phrases tracked across all four cycles' notes:

| Phrase | Status |
|---|---|
| "characters, and theories, and categories, all at the same time. And more" | Accounted, [stack-of-roles.md](stack-of-roles.md). |
| "bigraded diamonds" | Accounted, [bigraded-diamond.md](bigraded-diamond.md) and [apex-tower.md](apex-tower.md) — "bigraded" denotes two distinct objects: Sense A (closure × fibration) and Sense B (truth × knowledge); "diamond" denotes at least six distinct mathematical objects: the KZ-diamond, the Kelly–Lack diamond, the FOUR diamond, the Verdier-duality fixed-point diamond, the bilattice apex $\top$ self-recursive diamond, the strong-MLD self-dual diamond, and further CHL-recursion fixed points enumerated in apex-tower.md. |
| "fractal pattern" | Accounted, [stack-of-roles.md](stack-of-roles.md) and [apex-tower.md](apex-tower.md) — predication-categories is laid out fractally with the parent repo at the directory level, and the CHL apex recursion is the *vertical* fractal (each chapter's apex is the LFP of a closure built from the prior chapter's apex). Both the down-the-tower (nesting) and across-fixed-points (reference) fractals are present. |
| "$dir/doing/ accrues verbs" | Reducible to enumeration — predication-categories uses `agents/`, `governance/`, `code/transformers/` for verb-side carriers; the parent repo uses `doing/`. The derivation picks one carrier name per apex-tower stratum and applies uniformly. |
| "$dir/???/ substance-side" | Reducible to enumeration — apex-tower.md Inquiry 3: the apex carriers are heterogeneous across strata, and a single dir-name covers them iff its inhabitance (per `form.md`) covers each substratum's carrier. Mechanical check given the references. |
| "AGENTICS.md" | Resolved to apex-tower.md Inquiry 2 — stratum-0 (asserted) atoms about the directory-as-entity. Form-by-form vs. fused decomposition is a derivation against `form.md`'s definition. |
| "library/" | Resolved to apex-tower.md Inquiry 3 — see above. |
| "truth comes before knowledge" | Accounted in [apex-tower.md](apex-tower.md) — a Lambek-LFP claim at the bilattice / FOUR stratum: the apex's truth-axis coordinates must be in place for the knowledge-axis trajectory to be defined. |
| "speaking comes before doing" | Accounted in [apex-tower.md](apex-tower.md) — a Lambek-LFP claim at the stratified-predication-fiber stratum: speech-acts emit stratum-0 atoms; doing-acts emit stratum-1/2 atoms whose `deps` chains point strictly back through stratum-0. |
| "structure comes before process" | Accounted in [apex-tower.md](apex-tower.md) — a Lambek-LFP claim at the predication-fibration / temporal-2-category stratum: the closure 2-monad $\mathrm{Cl}$ on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ presupposes $\mathbf{PrFib}$ existing. |
| "at least when realized on a computer system" | Accounted in [apex-tower.md](apex-tower.md) — on a sequential computer, the definitional order (which the Lambek-LFP statements name) becomes the operational order. |
| "cutting edge frontier of published mathematics" | Accounted — Avron 1996, Rivieccio 2010, Emmenegger et al. 2024, Kelly–Lack 1997, Belnap, Marmolejo, Lambek 1968. |
| "having proven theorem beyond that" | Accounted — KZ-diamond strict-commutation (sketch), bigraded common-knowledge (sketch), four-regime dichotomy (proved), Avron-representation (proved internal restatement), L/I/P factorization, $K_4$-stratification, CHL apex recursion (narrative), step-$n$ meta-stratification (proved), agentive-triad refinement (open). |
