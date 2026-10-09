---
type: theorem
status: proved
depends-on: [q-fuzzy-equivalence, quantale-enriched-sheaf, quantale-enriched-cosheaf, q-enriched-cohomology, lopez2024]
---

# Q-enriched Curry equivalence: fuzzy 2-cell case

The fuzzy generalization of the [strict-adjunction 2-cell case](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-cell.md). Removes the restrictive condition that sheaf restrictions preserve all colimits (including bottom), at the cost of replacing strict equivalence with [q-fuzzy equivalence](../objects/q-fuzzy-equivalence.md). The result holds for *any* Q-enriched cellular sheaf on the 2-vertex 1-edge graph, with quantale-graded error determined by the fuzziness of the restriction adjunctions.

## Setup

Let $G$ be the graph with vertices $\{a, b\}$ and edge $e$ with $\partial e = \{a, b\}$. Fix a Q-enriched cellular sheaf $F$ with stalks $F(a), F(b), F(e) \in \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ and restrictions $f_a, f_b$.

By [@lopez2024] (the fuzzy adjoint theorem), every Q-functor between complete weighted lattices admits a **fuzzy right adjoint**: there exist $f_a^* : F(e) \to F(a)$ and $f_b^* : F(e) \to F(b)$ with

$$f_a \dashv_{q_a} f_a^*, \qquad f_b \dashv_{q_b} f_b^*$$

for some $q_a, q_b \in \mathsf{Q}$ (the quantale-graded fuzziness of each adjunction). The fuzziness $q_a, q_b$ depends on the specific sheaf — for sheaves whose restrictions preserve all colimits (the [strict case](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-cell.md)), $q_a = q_b = 1$; for sheaves whose restrictions are not strict left adjoints, $q_a, q_b \prec 1$.

Set $q := q_a \cdot q_b \in \mathsf{Q}$ (the quantale product).

Define the fuzzy cosheaf $\check{F}$:

- Stalks: $\check{F}(\sigma) := F(\sigma)$ for $\sigma \in \{a, b, e\}$.
- Extensions: $\check{f}_a := f_a^*$ and $\check{f}_b := f_b^*$ (the fuzzy right adjoints).

## The theorem

**Theorem (fuzzy 2-cell Q-enriched Curry equivalence).** There is a $q$-fuzzy equivalence

$$H^0(F) \;\simeq_q\; H_0(\check{F})$$

between the Q-enriched cohomology of the sheaf $F$ and the Q-enriched homology of the fuzzy cosheaf $\check{F}$, with quantale-graded error $q = q_a \cdot q_b$.

When $q_a = q_b = 1$ (strict-adjunction case), this reduces to the [strict 2-cell theorem](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-cell.md): a strict Q-Cat equivalence.

## Proof

We construct forward and inverse Q-functors $\Phi : H^0(F) \to H_0(\check{F})$ and $\Psi : H_0(\check{F}) \to H^0(F)$ and verify the round-trip compositions are $q$-fuzzy-equivalent to identity.

**Recall.** $H^0(F) = \mathrm{Eq}(\delta_a, \delta_b)$ where $\delta_a, \delta_b : F(a) \times F(b) \rightrightarrows F(e)$ are $\delta_a(x, y) = f_a(x)$ and $\delta_b(x, y) = f_b(y)$. So elements are pairs $(x, y)$ with $f_a(x) = f_b(y)$ in $F(e)$.

$H_0(\check{F}) = \mathrm{Coeq}(\partial_a, \partial_b)$ where $\partial_a, \partial_b : F(e) \rightrightarrows F(a) \sqcup F(b)$ are $\partial_a(z) = \iota_a(f_a^*(z))$ and $\partial_b(z) = \iota_b(f_b^*(z))$. So elements are equivalence classes in $F(a) \sqcup F(b)$ under the relation $\iota_a(f_a^*(z)) \sim \iota_b(f_b^*(z))$ for all $z \in F(e)$.

### Forward map $\Phi$

Given $(x, y) \in H^0(F)$ with $f_a(x) = f_b(y) =: z$, define

$$\Phi(x, y) := [\iota_a(x)] = [\iota_b(y)]$$

— the equivalence class in $H_0(\check{F})$.

Why these classes are equal: by the fuzzy adjunction $f_a \dashv_{q_a} f_a^*$, we have

$$\mathrm{hom}_{F(a)}(x, f_a^*(z)) \succeq q_a \cdot \mathrm{hom}_{F(e)}(f_a(x), z) = q_a \cdot \mathrm{hom}_{F(e)}(z, z) \succeq q_a \cdot 1 = q_a.$$

So $x \succeq_{q_a} f_a^*(z)$ in $F(a)$ (i.e., $\mathrm{hom}_{F(a)}(x, f_a^*(z)) \succeq q_a$). By the analogous calculation for $b$: $y \succeq_{q_b} f_b^*(z)$.

In the coequalizer $H_0(\check{F})$, the relation $\iota_a(f_a^*(z)) \sim \iota_b(f_b^*(z))$ is identified to a single class. The elements $x \in F(a)$ and $y \in F(b)$ are within $q_a, q_b$ of $f_a^*(z), f_b^*(z)$ respectively — so $[\iota_a(x)]$ and $[\iota_b(y)]$ are both within $q := q_a \cdot q_b$ of the common class $[\iota_a(f_a^*(z))] = [\iota_b(f_b^*(z))]$.

Hence $[\iota_a(x)] \succeq_{q} [\iota_b(y)]$ in $H_0(\check{F})$ — they're $q$-fuzzy-equal. The forward map $\Phi$ is well-defined up to $q$-fuzzy equivalence.

### Inverse map $\Psi$

Given an equivalence class $[c] \in H_0(\check{F})$ for $c \in F(a) \sqcup F(b)$, we need to produce a (fuzzy) global section in $H^0(F)$.

Without loss of generality, $c = \iota_a(x)$ for some $x \in F(a)$ (the $\iota_b$ case is symmetric). Set $z := f_a(x) \in F(e)$. By the fuzzy adjunction $f_b \dashv_{q_b} f_b^*$, the element $f_b^*(z) \in F(b)$ satisfies

$$\mathrm{hom}_{F(e)}(f_b(f_b^*(z)), z) \succeq q_b$$

(the counit of the fuzzy adjunction).

Define $\Psi([c]) := (x, f_b^*(z))$ where $z = f_a(x)$.

By construction, $f_a(x) = z$. The fuzzy adjunction gives $f_b(f_b^*(z)) \succeq_{q_b} z$. So $f_b(f_b^*(z))$ is $q_b$-close to $z = f_a(x)$ in $F(e)$.

The pair $(x, f_b^*(z))$ is a $q_b$-fuzzy element of $H^0(F)$: it satisfies the equalizer condition $f_a(x) = f_b(f_b^*(z))$ up to $q_b$-error.

### Round-trip compositions

$\Phi \circ \Psi$: starts with $[c]$, gets back $[\iota_a(x)] = [c]$ (since the forward map sends $(x, y)$ to $[\iota_a(x)]$). The round-trip is identity-up-to-$q$-fuzzy-equality.

$\Psi \circ \Phi$: starts with $(x, y)$ in $H^0(F)$ with $f_a(x) = f_b(y) = z$. $\Phi$ sends to $[\iota_a(x)]$. $\Psi$ sends back to $(x, f_b^*(z))$. The round-trip changes $y$ to $f_b^*(z)$ — these are within $q_b$ of each other since $y$ satisfies $f_b(y) = z$ and the unit $\eta_b: y \to f_b^*(f_b(y)) = f_b^*(z)$ has $q_b$-graded inversibility.

So $\Psi \circ \Phi(x, y) = (x, f_b^*(z))$ is $q_b$-fuzzy-equal to $(x, y)$. The round-trip is $q_b$-fuzzy-identity, which is bounded below by $q$ (since $q = q_a \cdot q_b \preceq q_b$).

Combining: both round-trips are $q$-fuzzy-equivalent to identity. By definition, $\Phi$ and $\Psi$ form a [q-fuzzy equivalence](../objects/q-fuzzy-equivalence.md). $\square$

## When does fuzziness collapse?

For $q = 1$ (i.e., $q_a = q_b = 1$, strict adjunctions), the fuzzy equivalence is a strict equivalence, recovering the strict 2-cell theorem.

For $q \prec 1$, the fuzziness is genuine — the equivalence holds only up to quantale-graded error $q$. In the boolean quantale ($\mathsf{Q} = \{0, 1\}$), this means $q = 0$ degenerates to "no equivalence." In richer quantales (Lawvere $[0, \infty]$, MV-algebras, frames), $q \prec 1$ is a genuine intermediate state — equivalence with measurable error.

## Open work identified

- **Higher-cell extension.** Likely tractable by induction on cell dimension, using the same forward/inverse map pattern.
- **Composability of fuzziness in higher cells.** Whether the multiplicative composition of fuzziness gives a useful global error bound, or whether the error grows uncontrollably for large complexes.
- **The Q-coproduct in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.** Used in $C_0 \check{F} = F(a) \sqcup F(b)$; the precise structure of the coproduct (what the equivalence classes look like) needs careful tracking, especially for non-discrete Q.
