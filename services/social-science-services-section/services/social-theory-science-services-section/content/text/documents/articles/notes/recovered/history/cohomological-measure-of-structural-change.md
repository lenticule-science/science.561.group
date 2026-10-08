---
type: question
status: open
explores: [social-settling, contestation-increment, late-liberal-social-base, symbolic-violence]
see-also: [regime-of-social-transformation]
---

# Can the $H^1$-class of the social settling measure structural change?

The [predication categories](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/) framework provides cohomological invariants of predication settlings — in particular, the $H^1$-class of the settling's [bitopological site](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/). For the [predicated-work](../work/theories/predicated-work/) theory, this invariant was raised as a diagnostic for progress in the aperiodic regime: since quiescence is not reachable in the aperiodic regime, the $H^1$-class movement may be the correct measure of whether work is advancing.

The same question arises, more urgently, in predicated sociology: for social formations in the aperiodic regime (including the [late-liberal social base](../objects/late-liberal-social-base.md)), progress toward structural transformation cannot be measured by quiescence (no $\top$ states remaining). The $H^1$-class is the candidate invariant for measuring that progress. But can it do the sociological work?

## The question

**Definition.** The $H^1$-class of the social settling $\mathcal{V}_{\mathrm{soc}}$ is (informally) the cohomology class of the bitopological site associated with the social settling's predication fiber structure, computed at the first cohomological degree. It captures the *global obstructions to local consistency*: the degree to which locally consistent-seeming social arrangements are globally inconsistent when their dependency structure is taken into account.

**Sociological interpretation.** Structural contradictions that are locally absorbed (via symbolic violence: each $\top$ cell is resolved locally by authority) may persist as global obstructions if the absorption events create a globally inconsistent pattern. Symbolically: the housing market is locally fine (each individual eviction is legally processed), each eviction legitimately resolved, and the legal settlements are individually consistent — but the global pattern (mass displacement, racially structured homelessness) is a $H^1$-class obstruction that no local resolution addresses.

**The question.** Is there a rigorous definition of the $H^1$-class for the social settling such that:

1. Movement in the $H^1$-class corresponds to genuine structural change (not merely local cell-value changes that leave the global obstruction pattern intact)?
2. The $H^1$-class is computable (or at least estimable) from observable social evidence — witnessing events, institutional records, platform data?
3. Different social formations (different social bases with different predicate categories) have $H^1$-classes that are comparable — so that one can say one formation is "more structurally contradicted" than another?

## Known partial results

From the predication-categories framework: the $H^1$-class of a predication settling over a bitopological site classifies the *d-frame-valued torsors* over the site — the global obstructions to extending local sections. This is mathematically precise for the abstract predication settling; the question is whether the sociological interpretation (structural contradiction as global obstruction) corresponds to the formal definition.

Specifically: does a social formation's structural contradiction (in the sociological sense) correspond to a non-trivial element of $H^1$ (in the formal sense)? Or does it correspond to something at $H^0$ (easily detectable local inconsistency) or $H^2$ (higher obstruction)?

## What resolution would require

A worked example: take a specific social formation with a known structural contradiction (e.g., the late-liberal housing crisis as described in cybernetic postliberalism) and construct its social settling explicitly enough to compute the $H^1$-class. If the $H^1$-class of the pre-crisis settling differs from the $H^1$-class of the post-movement settling (one in which contestation has produced genuine structural change), and if the difference is in the direction of reduced obstruction, then the $H^1$-class is a candidate diagnostic.

This requires:
1. An explicit construction of the social settling for the chosen example (a finite approximation of the aperiodic settling, bounded to a historical period).
2. Application of the [Priestley duality](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/) for bilattice-valued sites to compute the bitopological site.
3. Computation of $H^1$ using the [Anderson-Putnam cohomology](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/) tools already in the predication-categories toolkit.

This is a substantial formal project. The question is whether the payoff — a rigorous sociological diagnostic for structural transformation progress in aperiodic-regime social formations — justifies the construction cost.
