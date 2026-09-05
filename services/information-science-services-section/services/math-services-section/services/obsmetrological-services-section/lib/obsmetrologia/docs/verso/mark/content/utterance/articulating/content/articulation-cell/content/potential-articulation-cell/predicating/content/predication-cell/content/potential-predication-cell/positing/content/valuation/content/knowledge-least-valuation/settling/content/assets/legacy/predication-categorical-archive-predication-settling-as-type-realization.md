---
type: question
class: bridge
status: open
explores: [closure-2-monad, predication-hyperdoctrine, predication-settling, settling-endofunctor, four-regime-dichotomy, non-scott-continuous-firing-ordinal, aperiodic-classifying-invariant, realizability-program]
---

# Settlings as model-theoretic type-realization processes

The hyperdoctrine layer is inherently model-theoretic — predicates as a signature, fiber algebras as interpretations. The closure operator's iteration is structurally **type-realization**: each non-Scott-continuous firing $\mu$ is a moment where a *new fact* gets realized about a cell — a fact not entailed by the prior settled stages. The settled state $v_\kappa$ is structurally the **completion of a partial model** — every cell that's reachable via closure has been realized.

This perspective is currently absent. The corpus's framework is consistent with a model-theoretic reading but doesn't engage the machinery: type spaces, forking, stability classes, saturation, categoricity. Open: develop the model-theoretic perspective explicitly.

## What "type-realization" means for the corpus

In model theory, a **type** over a parameter set $A$ in a model $M$ is a maximally consistent set of formulas with parameters from $A$. The **type space** $S_n(A)$ is a Stone space whose points are types. A **realization** of a type is an element of (an extension of) $M$ that satisfies all formulas in the type.

For predication categories' setting:

- **Parameters at stage $\sigma$**: the settled cells $\{(s, o, q) : v_\sigma(q)(s, o) \neq \bot\}$ — the facts already realized.
- **Types over the parameters at $\sigma$**: maximally-consistent extensions of the prior settled state via the closure rules. A type encodes "what could become true at the next stage given what's already true."
- **A NSC firing as type-realization**: when $\mu$ is a non-Scott-continuous firing ordinal, the closure-rule realizes a type at $\mu$ that was *not* realizable as a directed colimit of types at earlier stages. The firing IS the realization event.
- **The settled state $v_\kappa$**: the completed partial model where every type that can be realized has been realized.

This is not metaphor — predication categories' structure literally fits the model-theoretic apparatus when read this way.

## Sub-questions

1. **Define the type space precisely.** For a settling $v$ at stage $\sigma$, the type space $S_v(\sigma)$ is the Stone space of maximal consistent extensions of $v_\sigma$'s settled facts, allowing closure-rule consequences. Verify this matches predication categories' existing predication-fiber-algebra structure (which is essentially a Boolean / bilattice type space already).

2. **Characterize NSC firings as type-realization events.** Show: $\mu \in L_{\mathrm{ns}}(\kappa, v)$ iff there exists a type over $v_\sigma$ for $\sigma < \mu$ that is realized at $\mu$ but not at any earlier stage's directed colimit. This is the precise model-theoretic restatement of "non-Scott-continuous firing."

3. **Forking and dependency.** Two facts at NSC firings can be **independent** (not forking) or **dependent** (forking). The closure rule structure determines this: a firing $\mu_1$ forks over $\mu_2$ if the firing at $\mu_2$ uses content from $\mu_1$ as antecedent. Make this precise; characterize the *forking graph* of an aperiodic settling. Conjecture: the forking graph is a structural refinement of the firing-ordinal set $L_{\mathrm{ns}}$ that predication categories' existing classifying invariant collapses.

4. **Categoricity in the closure-rule setting.** A theory is **$\kappa$-categorical** if all its models of cardinality $\kappa$ are isomorphic. The corpus's strong-MLD classification is a kind of categoricity: closure rules whose settlings are all strong-MLD-equivalent are "categorical" in the corresponding sense. Identify which closure rules are $\kappa$-categorical for which $\kappa$, and connect to the realizability program.

## Connection to existing structure

The model-theoretic perspective connects:

- **The hyperdoctrine layer** ([predication-hyperdoctrine](../objects/predication-hyperdoctrine.md)) — already model-theoretic at the static level; this question lifts to the dynamic (closure-iterated) level.
- **The four regimes** — correspond to model-theoretic stability classes (see [companion question](four-regimes-as-stability-hierarchy.md)).
- **The realizability program** — model-theoretic realizability is a finer notion than predication categories' current realizability; it tracks which types are realized at which stages, not just which cohomology classes arise.
- **The Hermida-Jacobs coinductive machinery** ([fibered coinduction](../theorems/fibered-coinduction.md)) — model-theoretic equivalents are the back-and-forth construction in saturated models. The corpus's MLD-equivalence proof has a structural parallel to back-and-forth.

## Connection to existing literature

Standard model theory (Marker, Tent-Ziegler) provides the technical apparatus. Stability theory (Shelah's classification theory, Pillay's geometric stability) gives the four-regime correspondence. Bilattice-valued / many-valued model theory (Hájek, Cintula) is the closest established cousin — but typically uses fuzzy-valued logics rather than predication categories' bilattice setting with paraconsistent $\top$.

The corpus's contribution would be: developing the type-space machinery for the *bilattice-valued* setting, where types can be paraconsistent ($\top$) as well as truth-only or falsity-only. This is genuinely novel content — paraconsistent type spaces don't have a direct established analog.

## Position in predication categories

This is the master question of a model-theoretic framing direction. Two companion questions develop facets:

- [Four regimes as a stability hierarchy](four-regimes-as-stability-hierarchy.md) — the regime-stability correspondence.
- [Saturation in the aperiodic regime](saturation-in-aperiodic-regime.md) — the aperiodic limit as model-theoretic saturation.

Concrete entry point: the strict regime worked examples have explicit type spaces (a few cells, finitely many possible facts). Compute $S_v(\sigma)$ for the [strict-regime ⊤-firing example](../examples/strict-regime-top-firing-verdier-self-dual.md) at each stage. Verify the type-realization framing matches the existing closure-operator description on this small case.

The model-theoretic perspective gives a fresh language for what the corpus already does — but more importantly, it makes accessible the substantial established machinery of stability theory (forking, dimension, geometric structure of types) that hasn't been brought to bear on predication categories' setting yet.
