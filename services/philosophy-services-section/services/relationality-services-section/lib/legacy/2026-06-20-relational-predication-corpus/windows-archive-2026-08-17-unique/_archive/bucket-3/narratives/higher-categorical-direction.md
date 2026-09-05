---
kind: narrative
status: current
discusses: [temporal-2-category, closure-2-monad, settling-moduli-stack-theorem, q-enriched-cohomology, verdier-duality-bitopological-site, q-enriched-sheaf-direct-inverse-image, skh-deformation-ext-classification]
---

# Higher-categorical (∞, 1)-direction

The corpus's structural backbone is 2-categorical: the [temporal 2-category](../objects/temporal-2-category.md), the [closure 2-monad](../morphisms/closure-2-monad.md) with its lax-idempotence, the [settling moduli stack](../theorems/settling-moduli-stack-theorem.md) over the parameter base. A natural research direction — surfaced as an open question ([higher-categorical extensions](../questions/higher-categorical-extensions.md)) — is to lift the 2-categorical structure to $(\infty, 1)$-categorical (specifically, quasicategorical or simplicial-set-based) settings. This narrative maps which corpus pieces have natural $(\infty, 1)$-lifts, what such lifts would buy, and what the prerequisites are.

The direction is **not strictly required** for the corpus's downstream theorems — the 2-categorical setting suffices for the cellular extension plan, the Verdier duality, the six-functor formalism (at draft level), and the deformation theory (at draft level). But several open questions become more naturally formulated in $(\infty, 1)$-terms, and an $(\infty, 1)$-refinement would supply structural payoff in concrete ways.

## What's currently 2-categorical

The corpus's principal 2-categorical / lax-idempotent structure:

- **The closure 2-monad.** A 2-monad on the temporal 2-category, lax-idempotent (KZ), with multiplication and unit satisfying coherent 2-cell laws. Lax-idempotence ensures coherent strictification, but the 2-categorical machinery treats some natural higher-coherence as up-to-strictification.
- **The temporal 2-category.** A 2-category with strict horizontal composition and lax 2-cells representing settling-stage advancement. The morphisms model settling-morphisms; the 2-cells model their natural transformations.
- **The settling moduli stack.** A 2-stack over the [parameter base category](../objects/parameter-base-category.md), with 1-stacky data (objects up to morphisms) plus 2-cell coherence. Strictified up to 2-categorical equivalence.
- **The realizability program's coinductive machinery.** [Hermida–Jacobs fibered coinduction](../theorems/fibered-coinduction.md) plus [Bonchi et al.](../references/bonchi-et-al2014.md) coinduction-up-to-closure are 2-categorical bisimulation arguments; the underlying coalgebraic structure is 2-categorical.

Each of these has a natural $(\infty, 1)$-analogue using simplicial sets or quasicategories — the standard machinery of higher categorical algebra ([@lurie2009], [@lurie-ha]).

## What an $(\infty, 1)$-lift would buy

Three concrete payoffs:

### 1. Coherent strictification eliminated

The 2-categorical machinery handles higher coherence by appealing to strictification — a strict 2-monad is equivalent to a lax-idempotent 2-monad up to canonical 2-cells. In the $(\infty, 1)$-setting, *all* coherence is treated infinitely up; no strictification is needed. This is cleaner mathematically but requires investing in the higher-categorical machinery.

For specific results in the corpus: the [closure 2-monad's lax-idempotence theorem](../theorems/closure-2-monad-lax-idempotence.md) has a 2-categorical proof requiring careful tracking of 2-cells. The $(\infty, 1)$-analogue would be that the closure operator is an idempotent functor in the appropriate $\infty$-category — a single statement replacing the chain of 2-cell coherences.

### 2. Derived-functor machinery becomes natural

The corpus's [six-functor formalism](../theorems/q-enriched-sheaf-direct-inverse-image.md) is stated at the level of ordinary functors with adjunctions in the 2-categorical sense. The standard six-functor framework ([@kashiwara-schapira2006]) operates on derived categories, which are most naturally formulated as $(\infty, 1)$-categories (stable $\infty$-categories in [@lurie-ha]'s framework).

The $(\infty, 1)$-lift of the corpus's Verdier duality and six-functor package would automatically give:

- **Stable $\infty$-categorical sheaves** with derived functors as $\infty$-functors.
- **The $t$-structure** on the derived $\infty$-category, with the sheaf cohomology recoverable from the $t$-structure's heart.
- **Natural derived enhancements** for each functor in the six-functor package.

This is structurally cleaner than the corpus's current sheaf-cohomology / cosheaf-homology pairing, where the derived structure is implicit.

### 3. Deformation theory in the derived sense

The corpus's [deformation theory](../theorems/skh-deformation-ext-classification.md) gives Ext-classification for first-order deformations. The $(\infty, 1)$-analogue would give *derived deformations* — the full tangent complex (not just $\mathrm{Ext}^1$) classifying deformations to all orders simultaneously, with obstructions as part of the same complex rather than a separate $\mathrm{Ext}^2$.

In particular: the corpus's [vanishing-above-degree-1 theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md) gives unobstructed classical deformations. The $(\infty, 1)$-version would assert that the *derived* tangent complex is concentrated in degree 1 — a stronger statement about the structure of the moduli stack at each point.

## Which corpus pieces have natural $(\infty, 1)$-lifts

A map of how each corpus piece fits into the $(\infty, 1)$-direction:

**Already $(\infty, 1)$-natural:**

- **Q-enriched cohomology** ([Q-enriched cohomology](../objects/q-enriched-cohomology.md)). The $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$-valued cochain complex generalizes naturally to a simplicial / chain-complex enhancement giving a *derived* Q-enriched cohomology. Stubbe 2005 already considers Q-enriched simplicial structures.
- **Cellular sheaf cohomology** ([CW-complex Curry theorem](../theorems/q-enriched-curry-cw-complex.md)). Curry's framework ([@curry2014]) has been lifted to derived ∞-categories in subsequent literature — the corpus's Q-enriched extension inherits this potential.
- **Direct-limit constructions** ([transfinite-CW theorem](../theorems/q-enriched-curry-transfinite-cw.md), [aperiodic-regime cohomology via direct limit](../theorems/aperiodic-regime-cohomology-via-direct-limit.md)). Filtered colimits in $(\infty, 1)$-categories are standard ([@lurie2009] §5.3).

**Naturally lift but require careful work:**

- **Closure 2-monad** ([closure-2-monad](../morphisms/closure-2-monad.md)). The lax-idempotent property has a clean $(\infty, 1)$-analogue: *idempotent ∞-functor* in the $(\infty, 1)$-sense. The corpus's "closure preserved under bisimulation" arguments would be replaced by ∞-functoriality assertions, simpler in form.
- **Settling moduli stack** ([settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md)). The 2-stack lifts to an $\infty$-stack (in the sense of [@lurie2009]), with all the strict-vs-lax 2-cell coherence handled automatically. This is the most substantial lift and would supply the geometric setting for derived deformation theory.
- **Predication hyperdoctrine** ([predication-hyperdoctrine](../objects/predication-hyperdoctrine.md)). The 2-categorical structure (with quantifier adjoints, Beck-Chevalley) lifts to ∞-categorical doctrines — a less-developed but plausible direction.

**Resist easy lifting:**

- **Bilattice negation gauge** ([internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md)). The value-category swap is a strict involution; it doesn't naturally have higher-categorical structure beyond the involution. The d-frame Verdier composition's "two dualities composing" structure is essentially 2-categorical because the value-category side is strict-involutive.
- **Boolean d-frame stalks.** The corpus's typical setting has Boolean d-frames; their $(\infty, 1)$-version would be ∞-Boolean-algebras, which are essentially the classical Boolean algebras (no higher coherence). The richer $(\infty, 1)$-structure shows up only with non-Boolean enrichment (Lawvere quantale, MV-algebras, etc.).

## Prerequisites for an $(\infty, 1)$-refinement

The substantial preparatory work, before the corpus's structures can be lifted:

1. **A theory of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$-valued $\infty$-sheaves on a Grothendieck site.** This generalizes both Q-enriched sheaves (Stubbe-style) and ∞-sheaves (Lurie-style). Some literature exists on enriched $\infty$-sheaves but the specific Q-enriched / Grothendieck-site combination is open.

2. **An $\infty$-categorical lift of the closure 2-monad.** Concretely: define an ∞-monad on the $\infty$-categorical version of the temporal 2-category, prove ∞-idempotence, verify the corpus's existing closure-related theorems lift.

3. **An $\infty$-stack version of the settling moduli stack.** Built on (1) and (2), produces a derived moduli space with formal completions giving the derived deformation theory.

4. **An $\infty$-categorical six-functor formalism on Q-enriched ∞-sheaves.** The natural extension of the corpus's draft-level six-functor work to the derived setting. Substantial — comparable in scope to the underlying six-functor question itself.

These are deep prerequisites; each is a research project in its own right. The $(\infty, 1)$-direction is therefore best understood as a *long-term refinement* rather than something the corpus pursues immediately.

## What the corpus needs for its current goals

Importantly: the corpus's *current* goals — establishing the moduli classification, the Verdier duality, the strong-MLD refinement, the deformation theory at draft level — are *all* achievable in the 2-categorical setting. The $(\infty, 1)$-direction is a *refinement* that would yield structurally cleaner statements and additional content (derived deformations, derived cohomology) but is not required to close the corpus's existing open questions.

The right strategic move for the corpus: complete the 2-categorical work first; engage the $(\infty, 1)$-direction as a downstream refinement once the 2-categorical results are stable.

## Engagement with adjacent literature

The $(\infty, 1)$-direction connects the corpus to several active research programs:

- **Higher topos theory** ([@lurie2009], [@lurie-ha]). The standard framework for $(\infty, 1)$-categorical sheaf theory and derived algebraic geometry. The corpus's Q-enriched setting requires extension beyond the standard $\mathbf{Top}$-valued / $\mathbf{Spectra}$-valued cases.
- **Derived bilattices.** Open work — the corpus's bilattice value category has no published $(\infty, 1)$-version. A "derived bilattice" or "$\infty$-bilattice" framework would be novel research, possibly worth pursuing on its own.
- **Higher categorical logic.** The corpus's hyperdoctrine layer connects to higher categorical interpretations of predicate logic; an ∞-doctrine framework exists in early form ([@joyal-fol]) and would naturally accommodate the corpus.
- **Derived deformation theory.** Standard in derived algebraic geometry ([@lurie-dag]); the corpus's deformation theory would lift naturally, with the unobstructed nature ($\mathrm{Ext}^2 = 0$) becoming an even stronger derived-vanishing statement.

Each connection is potential collaborator territory — the $(\infty, 1)$-direction is well-positioned for engagement with the broader derived-algebraic-geometry / higher-topos research community.

## RG-flow layer: the step-$n$ tower as an internal $\infty$-direction

A second higher-categorical direction has surfaced from within the corpus's own structure, prior to (and independent of) the external $(\infty, 1)$-lift sketched above. The [step-$n$ substitution-recurrence](../concepts/step-n-substitution-recurrence.md) framework supplies an internal *renormalization-group flow* on the meta-aperiodic stratum: the [step-shift morphism](../morphisms/step-shift-morphism.md) $\sigma_n^{n+1} : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$ produces an ascending tower

$$\mathscr{M}^{(2)} \xrightarrow{\sigma_2^3} \mathscr{M}^{(3)} \xrightarrow{\sigma_3^4} \mathscr{M}^{(4)} \xrightarrow{\sigma_4^5} \cdots$$

with colimit $\mathscr{M}^{(\infty)}$ — the [step-$n$ fixed-point object](../objects/step-n-fixed-point.md) and candidate RG fixed point.

This tower is *higher-categorical in the same sense* the corpus's other moduli stacks are: each $\mathscr{M}^{(n)}$ is a 2-stack, the $\sigma_n^{n+1}$ are 1-morphisms of 2-stacks, and the colimit is a 2-categorical filtered colimit. But the tower's structure makes it the natural setting for an $(\infty, 1)$-refinement that's *internal* to the corpus rather than imported wholesale from higher topos theory:

- **The step-shift's coherence.** $\sigma_n^{n+1} \circ \sigma_{n-1}^n$ should be naturally equivalent to $\sigma_{n-1}^{n+1}$ (a two-step shift). In the 2-categorical setting this is a 2-cell coherence; in an $(\infty, 1)$-setting it would be ambient coherence, simpler to state.
- **The colimit $\mathscr{M}^{(\infty)}$.** Filtered $\infty$-colimits are the cleanest way to express the RG fixed point. The 2-categorical version requires careful handling of strictification.
- **Critical exponents at the fixed point.** The corpus's [critical exponents theorem](../theorems/critical-exponents-at-step-n-fixed-point.md) describes the fixed point's structural data (Pisot accumulation, rank growth rate). In an $(\infty, 1)$-setting these would be derived invariants of the $\infty$-stack $\mathscr{M}^{(\infty)}$.

The RG-flow layer therefore *motivates* the $(\infty, 1)$-direction from inside the corpus: the natural setting for the step-$n$ tower's colimit is $\infty$-categorical, even before any external derived-algebraic-geometry concerns. A near-term upgrade — modest in scope compared to the full $(\infty, 1)$-lift — would express just the step-$n$ tower as a filtered diagram of $\infty$-stacks and recover its colimit there. See the [step-n correspondence narrative](step-n-correspondence.md) and [renormalization-group-flow narrative](renormalization-group-flow.md) for the framework's structural content.

## Position in the program

This is a **future-direction narrative**, not a current chapter. The corpus's near-term work stays 2-categorical; the $(\infty, 1)$-refinement is a long-term direction whose preparatory work spans multiple substantial research questions.

The narrative serves three purposes:

1. **Map the territory** for readers who notice the 2-categorical setting and ask about higher coherence.
2. **Identify lift-ready vs lift-resistant pieces** so future work can target the right structures first.
3. **Surface concrete prerequisites** so a serious $(\infty, 1)$-investment has clear entry points.

When the corpus's 2-categorical work matures — after the cellular extension plan, the six-functor formalism's per-axiom verifications, the strong-MLD examples, and the deformation theory's concrete instances — the $(\infty, 1)$-direction becomes the natural next research arc.
