---
kind: question
status: open
explores: [settling-moduli-stack-theorem, realizability-program, predication-hyperdoctrine, closure-2-monad, parameter-base-category, predication-fibration, four-regime-dichotomy]
---

# A meta-classifier: moduli of moduli stacks

The [settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md) gives a 2-stack classifying settlings up to MLD-equivalence — the apex of the moduli cone, sitting at level 6 of the [CHL apex tower](../narratives/chl-apex-recursion.md). The [realizability program](../narratives/realizability-program.md) characterizes which classes within the moduli are realized — level 7.

Open: **carry the recursion one level up — a moduli of moduli stacks**. Each closure-rule structure determines a settling moduli stack; the *space of closure-rule structures* itself has natural equivalence relations (closure-rule isomorphism, MLD-style structural equivalence on rules); the resulting **meta-moduli stack $\mathcal{M}^{\mathrm{meta}}$** classifies *closure-rule structures up to equivalence*, with each represented by its associated settling-moduli stack.

This is the corpus's analog of moving from "models of a theory" to "theories themselves" in mathematical logic — the Lindenbaum-Tarski move at the moduli level.

## What the meta-classifier would be

Concretely:

- **Objects of $\mathcal{M}^{\mathrm{meta}}$**: closure-rule structures $(\mathcal{C}, R)$ where $\mathcal{C}$ is a [predicate category](../objects/predicate-category.md) and $R$ is a system of closure rules over $\mathcal{C}$.
- **Morphisms**: structure-preserving maps between closure-rule structures, modulo the corpus's existing notions of equivalence (predicate-category morphisms, closure-rule preservation under base-change).
- **Apex (= $\mathcal{M}^{\mathrm{meta}}$ itself)**: the universal classifier for closure-rule structures; each closure-rule structure $(\mathcal{C}, R)$ is classified by a point in $\mathcal{M}^{\mathrm{meta}}$, and the classifying data at that point is the closure rule's *settling-moduli stack*.

The construction would parallel the existing moduli construction one level up: where the settling moduli classifies SETTLINGS (variations of valuations under a fixed closure rule), the meta-moduli classifies CLOSURE RULES (variations of dynamical structure underlying the settling).

## Why this is structurally substantive

Three concrete reasons:

**1. The apex tower extends naturally.** The CHL recursion's apex tower currently terminates at realizability. A meta-classifier would extend the tower by one level. **Whether the recursion terminates here or continues further is the [stabilization question](chl-recursion-meta-stabilization.md);** but at minimum, this question is about the *next* level of the recursion, which is well-defined regardless of stabilization.

**2. The four-regime classification has a meta-level.** Closure rules themselves come in four regime-types (rules whose settlings are strict, Scott-continuous, transfinite-bounded, aperiodic). The meta-moduli would have a *regime stratification at the closure-rule level*, paralleling the existing regime stratification at the settling level. **Whether the meta-regime stratification matches the per-settling regime structure**, or refines it via meta-level structural complexity, is non-trivial.

**3. Realizability lifts.** The [realizability program](../narratives/realizability-program.md) characterizes which cohomology classes are realized by some closure rule — i.e., which points of the moduli stack are "in the image" of the realizability map. The meta-realizability question asks: which *moduli stacks* are realized by some closure-rule structure on some predicate category? The answer characterizes the meta-classifier's **realized substack** — the meta-realizability subspace.

## Sub-questions

1. **Define the meta-moduli precisely.** Closure-rule structures form a category; verify it has enough categorical structure (limits, colimits, equivalences) to admit a moduli stack. The corpus's [parameter base category](../objects/parameter-base-category.md) is a starting point — it parameterizes closure-rule structures, but as a base for the existing moduli, not as objects of a meta-moduli.

2. **Classify the meta-moduli's stratification.** The meta-stratification by regime types: meta-strict (closure rules whose settlings are all strict), meta-Scott-continuous, meta-transfinite-bounded, meta-aperiodic. Whether each meta-regime has its own characterization analogous to the settling-level four-regime dichotomy is open.

3. **Connection to representation theory of $\mathcal{C}$.** The corpus's [representation-theory question](representation-theory-skh.md) asks what a predication hyperdoctrine is a representation of. A meta-classifier would address the dual question: what does a closure-rule structure represent? Possibly a "dynamics-augmented hyperdoctrine" with representations including the settling endofunctor.

4. **The meta-moduli's deformation theory.** [Deformations of closure rules](deformation-theory-of-skhs.md) — perturbations of the rule structure — give first-order tangent vectors to the meta-moduli. Whether the meta-moduli is locally smooth, what its tangent complex looks like, and how it relates to the settling-moduli's tangent complex is open. The corpus's [vanishing-above-degree-1 theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md) gives unobstructed deformations at the settling level; whether the meta-level inherits this is non-trivial.

## What's at the meta-apex

The apex of the meta-moduli cone — call it $\mathcal{M}^{\mathrm{meta}}$ itself — is the universal classifier for closure-rule structures. Its content is essentially:

- A *space* of closure-rule structures, with topology / categorical structure encoding equivalence.
- A *stratification* by meta-regime type.
- A *realizability substack* characterizing which closure rules give rise to realized cohomology classes.
- A *deformation tangent complex* characterizing perturbations.

If the [CHL recursion stabilizes](chl-recursion-meta-stabilization.md) at this level, $\mathcal{M}^{\mathrm{meta}}$ is the corpus's terminal classifier — the universal object encoding everything the chapter chain produces. If it doesn't stabilize, $\mathcal{M}^{\mathrm{meta}}$ is one more level, with further levels above.

## Connection to existing literature

The Lindenbaum-Tarski move from "models of theories" to "theories themselves" is the closest established analog. In algebraic geometry, the moduli of moduli ("moduli stacks of moduli stacks") shows up in derived algebraic geometry as part of the higher-categorical iteration. The corpus's setting — bilattice values + closure dynamics — would give a specific instance of meta-classification with the corpus's distinctive bilattice flavor.

The (∞, 1)-categorical extension ([higher-categorical-direction narrative](../narratives/higher-categorical-direction.md)) provides the natural setting for meta-classifiers and their iterated towers. A serious development of $\mathcal{M}^{\mathrm{meta}}$ would likely use higher-categorical machinery.

## Position in the program

Most concrete of the three CHL-recursion questions ([meta-stabilization](chl-recursion-meta-stabilization.md), [catalog-of-fixed-points](catalog-of-chl-fixed-points.md), and this). Where stabilization is the deepest question and the catalog is corpus-internal, this question proposes a *new construction* — defining a specific level above realizability and developing its content.

Concrete entry point: take a small parameter base category $\mathcal{C}$ (the trivial / single-predicate one used in the strict-regime worked examples), classify all closure-rule structures on it up to natural equivalence, and verify the resulting "moduli of closure rules" is a coherent categorical object. The simplest version is essentially the (small) space of $\Pi_1$-schemata over $\mathcal{C}$, ordered by entailment — already mathematically tractable and would establish the meta-moduli construction's feasibility.

A serious payoff: with $\mathcal{M}^{\mathrm{meta}}$ in place, the corpus would have its **entire chapter chain compactified into a single classifying object** — a structurally complete description of "what spatiotemporal knowledge presheaves are" at the highest level the framework supports.
