---
type: theorem
class: engineering-claim
status: proved
depends-on: [closure-2-monad, closure-2-monad-lax-idempotence, predication-fiber-algebra, four-regime-dichotomy, independence-implies-confluence]
see-also: [four-position-substrate-entity-classification, dispatch, respond]
---

# A substrate query's natural result is a closure orbit, not a single fixed point (voidmath F7 as substrate predication)

**Claim.** Let $v_0$ be a substrate fiber to which a query $q$ is being applied — for instance, $v_0$ is an entity's current fiber and $q$ is a message admitted via [`respond`](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/morphisms/respond.md). Define the **closure orbit** of $(v_0, q)$ to be the set of fibers reachable from $v_0 \vee_k q$ by *any* admissible sequence of [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) firings:

$$\mathrm{orbit}(v_0, q) \;:=\; \{ v : v_0 \vee_k q \;\to^*\; v, \; v \text{ is a closure-fixed-point} \}.$$

Then in general $|\mathrm{orbit}(v_0, q)| > 1$ — multiple incomparable settled forms are reachable — and the substrate's faithful query result is the orbit, not a single representative.

The single-fixed-point reading recovers as a special case: when independence is declared per [independence-implies-confluence](independence-implies-confluence.md), the orbit collapses to a singleton and the substrate may return its unique element. When confluence is *not* established, returning a single representative discards the substrate's actual content.

## Why this holds

**Multiple fixed points are admissible.** Per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), the closure 2-monad is genuinely lax-idempotent in the transfinite-bounded and aperiodic regimes; the diamond 2-cells are non-trivial, and different rule-application orders can produce non-equal closure-fixed-points reachable from the same starting fiber. The orbit is the set of these, indexed by application-order equivalence classes.

**Confluence is the singleton case.** Per [independence-implies-confluence](independence-implies-confluence.md), when the substrate's port declares two messages independent, their joint closure equals the closure of either order — the orbit collapses. More generally, in the strict regime ($\kappa < \omega$) the closure operator is strict-idempotent and the orbit is always a singleton; the engineering question becomes one of *when* the substrate has already paid the cost to detect independence.

**The orbit is itself substrate content.** Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), the closure operator is a definable function on valuations; the orbit is the set of its reachable fixed points from a given start. A substrate that maintains the closure operator's definition can compute the orbit from $(v_0, q)$ by exhaustive exploration of admissible firings (or by a cone-residuation calculation when one is available).

## Engineering consequence

- **Query semantics is cone-valued by default.** A substrate that returns a single representative for $(v_0, q)$ is making one of two claims: (a) the closure has been certified confluent for the relevant rule subsystem, so the orbit is a singleton; or (b) the substrate is choosing one orbit member by an undeclared selection rule and discarding the others. Case (b) is non-conformant — the substrate's content includes the alternatives.

- **Cone returns are the natural shape for `respond`.** A [`respond`](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/morphisms/respond.md) call's faithful output is the closure orbit of the message-extended entity fiber; rendering this for a consumer means rendering the orbit (typically as a list of alternatives, or as the orbit's join in the knowledge order if a consensus value is appropriate). [`dispatch`](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/morphisms/dispatch.md)'s ranking discipline is the consumer-side handling of a cone-valued response per candidate.

- **Independence declarations are cost-amortization.** A port that declares many independence pairs lets the substrate skip the orbit-enumeration and return the unique fixed point. The engineering decision is whether the independence-declaration cost (substrate content expressing which messages commute) is paid up-front or whether the orbit-exploration cost is paid per query. The two costs are duals: more independence declarations, smaller per-query orbit; fewer declarations, larger per-query orbit.

- **Non-confluence is content, not failure.** A query that returns a multi-element orbit has not failed; it has reported the substrate's actual structure. Treating multi-element orbits as errors discards the substrate's most informative feature in the higher regimes — the genuine 2-dimensionality of the closure 2-monad.

## Position

This theorem grounds voidmath's *F7 bypass cones* as the natural query-result shape under the closure 2-monad. The voidmath claim "the natural query object is a cone, not a point" becomes: the closure orbit is the substrate's faithful answer; singleton results require independence-justified collapse; multi-element results report genuine non-confluence rather than a substrate failure.

The theorem composes with [four-position-substrate-entity-classification](four-position-substrate-entity-classification.md): an entity classified as *unsettled* may have a non-trivial orbit ahead of it (the set of settled forms it could become); a *settled* entity is the singleton orbit at its current fiber. The taxonomy and the orbit are dual views of the same closure dynamics — the taxonomy classifies the current fiber, the orbit characterizes what the current fiber could become.

The theorem's engineering consequence for FARS is that the substrate's consumer-facing API SHALL distinguish singleton-result responses from multi-result responses, and shall not silently project a multi-result response to one of its members. This is the substrate-realization of "queries return cones, not points."
