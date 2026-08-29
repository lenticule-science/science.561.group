---
type: question
status: open
explores: [closure-rule, locality]
---

# Are there closure rules whose unbounded match-radius is essential?

The corpus's substrate locality property requires every closure rule to have a finite, declared match-radius. This is what makes the [wavefront](teaching/explanations/wavefront.md) tractable. The question is whether some engineering goals require closure rules whose match-radius cannot be bounded — and if so, what alternative discipline accommodates them.

Concrete cases worth investigating:

- **Transitive closure of a relation.** A closure rule that asserts $a \mathrel{R^*} b$ when there is some path of $R$-related entities from $a$ to $b$ is naturally unbounded; the path length is not fixed at design time. Common engineering workarounds: declare a maximum path length in the closure rule (truncating the transitive closure); represent $R^*$ as a separate, externally-computed view rather than a closure rule. Are these workarounds always sufficient?
- **Reachability in cyclic structures.** Similar to transitive closure but with cycles. The closure ordinal can be $\omega$ even when each step is bounded.
- **Aggregate predicates.** A closure rule that produces "this entity has more than 100 incident predications" must in principle inspect the entity's full predication-fiber, which is bounded by the entity's fiber width but not by a constant. Is fiber width an admissible match-radius parameter?

Each case suggests a distinct alternative: bounded-truncation discipline, view-precomputation discipline, fiber-width-bounded match-radius. Whether any single discipline suffices for all of these (or whether the corpus needs multiple disciplines) is open.
