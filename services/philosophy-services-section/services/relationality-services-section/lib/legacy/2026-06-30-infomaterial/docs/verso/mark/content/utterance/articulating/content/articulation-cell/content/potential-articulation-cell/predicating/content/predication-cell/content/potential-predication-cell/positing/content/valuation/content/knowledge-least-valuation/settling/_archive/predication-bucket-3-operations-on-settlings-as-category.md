---
kind: question
status: open
explores: [spatiotemporal-knowledge-presheaf, settling-morphism, settling-moduli-stack-theorem, knowledge-presheaf-category]
---

# Operations on settlings as a category

Settlings form a category (with [settling-morphisms](../morphisms/settling-morphism.md) as 1-cells). The corpus has classified settlings up to MLD-equivalence and organised them into a moduli stack, but barely worked *in the category of settlings* as a category — i.e., done categorical operations on settlings.

## Open

1. **Tensor product**. Given settlings $v_1, v_2$, is there a natural $v_1 \otimes v_2$ — a "joint settling" combining their content? The framework's closed-monoidal structure on Q-enriched sheaves (from [q-enriched-sheaf-closed-monoidal-structure](../theorems/q-enriched-sheaf-closed-monoidal-structure.md)) suggests tensor of *associated sheaves* exists, but at the *settling* level (rather than sheaf level) a tensor would need a categorical definition.

2. **Direct sum / coproduct**. Disjoint union of two settlings, perhaps over a common base. What's the resulting closure ordinal? Likely the max of the two; but the cohomological invariant of a coproduct should be the direct sum.

3. **Pullback / fibered product**. Given settling-morphisms $v_1 \to w \leftarrow v_2$, is there a natural $v_1 \times_w v_2$? This would let us compose constraints — settlings that satisfy both ${v_1}$'s and $v_2$'s closure dynamics.

4. **Internal Hom**. If the category of settlings is closed monoidal, there's an internal Hom $[v_1, v_2]$. What does this represent? "Settling-morphism-encoding settling"? "Settling that classifies how $v_1$ maps to $v_2$"?

5. **Limits and colimits in the category**. Filtered colimits exist (the corpus's direct-limit constructions). Equalisers? Coequalisers? Are these computable from the cohomological invariants of the input settlings?

6. **Functorial operations**. Each closure-rule-system gives an "associated settling functor" from increment sequences to settlings. This is a functor between categories. What's its structure? When is it cartesian? Cocartesian?

The corpus has been *computing in* the category of settlings (computing cl-inv, classifying up to MLD) but hasn't *worked with* the category-as-category. There's probably a substantial body of categorical content here that isn't worked out.
