---
morphism: chu-constructing
from: monoidal-category
generates: chu-space
---

# chu-constructing

Generates [chu-space](content/chu-space/chu-space.md) from [`monoidal-category`](../../monoidal-category.md): the Chu construction `Chu(V, k)` equips a (closed) monoidal category with a dualizing object, producing a **\*-autonomous category** — the categorical structure underlying linear logic (tensor ⊗ / linear implication ⊸). A Chu space `(A, r, X)` is an object of it: states A, attributes X, evaluation `r : A × X → L`, generalizing a formal context. Per Jakl 2025, `Chu(H, 0)` over a Heyting algebra is exactly the **twist construction** producing the corpus's bilattice (⊗ = fusion, ⊸ = twist-implication), so this node is also the categorical face of algebra's twist-product/bilattice.
