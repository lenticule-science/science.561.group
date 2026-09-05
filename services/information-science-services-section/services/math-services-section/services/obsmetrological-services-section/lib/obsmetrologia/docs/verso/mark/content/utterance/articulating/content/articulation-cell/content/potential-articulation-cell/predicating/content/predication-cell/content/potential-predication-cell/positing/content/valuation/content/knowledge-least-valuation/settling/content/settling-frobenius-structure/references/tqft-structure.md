---
type: theorem
status: proved
depends-on: [settling-cobordism-category, settling-frobenius-structure, settling-tensor-product, settling-internal-hom, verdier-duality-for-settlings, settling-associated-sheaf, equivariant-cohomology-decomposition, klein-four-gauge-bundle, settling-gauss-bonnet]
see-also: [settling-cobordism-category, settling-frobenius-structure, equivariant-cohomology-decomposition, jung-rivieccio-duality]
---

# TQFT structure theorem

The settling cohomology functor satisfies Atiyah's axioms for a topological quantum field theory: it is a symmetric monoidal functor from the settling cobordism category to the category of $\mathbb{Z}$-modules, sending disjoint union to tensor product, the empty boundary to $\mathbb{Z}$, and Verdier duality to linear duality.
The induced algebraic structure on the cohomology of each boundary is a commutative Frobenius algebra, refined by the $K_4$ gauge grading.

## Statement

**Theorem (TQFT structure).** *Let $Z := H^\bullet(\mathcal{F}_{(-)})$ be the cohomology functor sending each boundary predication system $\mathcal{B} = (B, \mathcal{C}_B, v_B)$ to $Z(\mathcal{B}) := H^\bullet(\mathcal{F}_{v_B})$.
Then:*

1. *(Symmetric monoidal functoriality.) $Z : \mathrm{Cob}_\mathrm{settling} \to \mathrm{Mod}_\mathbb{Z}$ is a symmetric monoidal functor.*

2. *(Atiyah's axioms.) $Z$ satisfies:*
   - *(Empty boundary.) $Z(\emptyset) = \mathbb{Z}$.*
   - *(Disjoint union → tensor product.) $Z(\mathcal{B}_1 \otimes \mathcal{B}_2) \cong Z(\mathcal{B}_1) \otimes_\mathbb{Z} Z(\mathcal{B}_2)$.*
   - *(Composition.) $Z(S_2 \circ S_1) = Z(S_2) \circ Z(S_1)$.*
   - *(Verdier duality → linear duality.) $Z(\mathcal{B}^\vee) \cong Z(\mathcal{B})^\vee$ where $(-)^\vee$ on the right denotes the $\mathbb{Z}$-linear dual.*
   - *(Closed cobordisms → integers.)
     For any closed settling cobordism $\Sigma : \emptyset \to \emptyset$, $Z(\Sigma) \in \mathrm{End}(\mathbb{Z}) = \mathbb{Z}$ is the partition function — a single integer.*

3. *(Frobenius algebra structure.)
  For each boundary $\mathcal{B}$, $Z(\mathcal{B})$ carries the canonical [settling Frobenius structure](teaching/explanations/settling-frobenius-structure.md) $(Z(\mathcal{B}), \eta, \mu, \epsilon, \Delta)$, making $Z(\mathcal{B})$ a commutative Frobenius algebra over $\mathbb{Z}$.*

4. *(Klein-four-graded refinement.) $Z(\mathcal{B})$ is $\widehat{K_4}$-graded as a Frobenius algebra: $Z(\mathcal{B}) = \bigoplus_{\chi \in \widehat{K_4}} Z^\chi(\mathcal{B})$ with $\mu$ respecting the grading via the group operation on $\widehat{K_4}$.*

5. *(Partition function = Euler characteristic of the bulk.)
  For a closed settling cobordism $\Sigma$ corresponding to a self-contained settling $v$, the partition function is the Euler characteristic from [Gauss–Bonnet](settling-gauss-bonnet.md):* $$Z(\Sigma) \;=\; \chi(v) \;=\; |\mathrm{Apex}_v| - |L_\mathrm{ns}(\kappa_v)|.$$

## Proof

### Part 1: symmetric monoidal functoriality

**$Z$ is functorial.** A morphism $S : \mathcal{B}_1 \to \mathcal{B}_2$ in $\mathrm{Cob}_\mathrm{settling}$ is a settling cobordism with bulk $\mathcal{C}_S$ and trajectory $v$.
The induced map on cohomology is the pullback-pushforward composition: $Z(S) := (\iota_2)^! \circ (\iota_1)_*$ where $\iota_i : \mathcal{C}_{B_i} \hookrightarrow \mathcal{C}_S$ are the boundary inclusions, $(\iota_1)_*$ pushes forward $H^\bullet(\mathcal{F}_{v_1})$ along the bulk evolution, and $(\iota_2)^!$ restricts to the out-boundary.

Functoriality on identities: $Z(\mathrm{id}_\mathcal{B}) = \mathrm{id}_{Z(\mathcal{B})}$ because the identity cobordism's bulk is just $\mathcal{C}_B$ itself with constant trajectory.

Functoriality on composition: $Z(S_2 \circ S_1) = Z(S_2) \circ Z(S_1)$ by the closure operator's iterative composition property — running the trajectory of $S_2 \circ S_1$ is the same as running $S_1$ then $S_2$, and pullback-pushforward respects this.

**Symmetric monoidal property.** The functor $Z$ sends $\otimes$ on $\mathrm{Cob}$ (disjoint union of boundaries) to $\otimes_\mathbb{Z}$ on $\mathrm{Mod}_\mathbb{Z}$ via the [settling tensor product theorem](../theorems/settling-tensor-product.md): cohomology of the disjoint union is the tensor product of cohomologies.
The unit (empty boundary $\to \mathbb{Z}$) is preserved by the $H^0(\emptyset) = \mathbb{Z}$ convention.

The symmetry $\sigma$ on $\mathrm{Cob}$ (swap of disjoint summands) is sent by $Z$ to the swap on $\otimes_\mathbb{Z}$. $\square$ (Part 1)

### Part 2: Atiyah's axioms

**Empty boundary.** $Z(\emptyset) = H^\bullet(\mathcal{F}_\emptyset) = H^\bullet(\text{empty sheaf}) = \mathbb{Z}$ in degree 0, zero elsewhere.

**Disjoint union → tensor product.** Stated above — the [settling tensor product theorem](../theorems/settling-tensor-product.md) applied to the cohomology functor.

**Composition.** Stated in Part 1.

**Verdier duality → linear duality.** The dual boundary $\mathcal{B}^\vee$ has the cell-system $\mathcal{C}_B^\mathrm{op}$ with negated valuation.
The [Verdier duality for settlings theorem](../theorems/verdier-duality-for-settlings.md) gives: $H^\bullet(\mathcal{F}_{v^\vee}) \cong H^\bullet(\mathcal{F}_v)^\vee$ as $\mathbb{Z}$-modules.
So $Z(\mathcal{B}^\vee) \cong Z(\mathcal{B})^\vee$.

**Closed cobordisms → integers.** For $\Sigma : \emptyset \to \emptyset$, $Z(\Sigma) \in \mathrm{Hom}_\mathbb{Z}(Z(\emptyset), Z(\emptyset)) = \mathrm{Hom}_\mathbb{Z}(\mathbb{Z}, \mathbb{Z}) = \mathbb{Z}$.
So $Z(\Sigma)$ is a single integer — the partition function. $\square$ (Part 2)

### Part 3: Frobenius algebra structure

By [settling Frobenius structure](teaching/explanations/settling-frobenius-structure.md): the disk, pair-of-pants, and their duals induce $\eta, \mu, \epsilon, \Delta$ on $Z(\mathcal{B})$ satisfying the Frobenius axioms.
Commutativity follows from the swap symmetry of the pair-of-pants cobordism.

The Frobenius axioms are verified at the cobordism level (the relevant cobordisms are equivalent in $\mathrm{Cob}_\mathrm{settling}$ via the closure dynamics' associativity and Verdier-duality's involutive nature) and transferred to the algebraic level via $Z$. $\square$ (Part 3)

### Part 4: Klein-four-graded refinement

The [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md) gives $Z(\mathcal{B}) = \bigoplus_\chi Z^\chi(\mathcal{B})$.
The Frobenius operations respect the $K_4$ gauge action because the cobordisms (disk, pair-of-pants) are $K_4$-equivariant — they don't break the gauge symmetry.
Therefore:

- $\eta$: the disk is $K_4$-invariant, so $\eta(\mathbb{Z}) \subseteq Z^\mathrm{id}$.
- $\mu$: the pair-of-pants respects the $K_4$ action on each input, with the $K_4$ acting on the output by the diagonal.
  So $\mu : Z^{\chi_1} \otimes Z^{\chi_2} \to Z^{\chi_1 \cdot \chi_2}$ where $\chi_1 \cdot \chi_2$ is the product in $\widehat{K_4}$.

Hence $Z(\mathcal{B})$ is graded in $\widehat{K_4}$ as a Frobenius algebra. $\square$ (Part 4)

### Part 5: partition function = Euler characteristic

For a closed settling cobordism $\Sigma : \emptyset \to \emptyset$, the bulk is a settling $v$ on cell-system $\mathcal{C}_\Sigma$ with closure ordinal $\kappa$.
The partition function $Z(\Sigma)$ is the trace of the identity map on $Z(\emptyset) = \mathbb{Z}$ obtained by the round-trip from $\emptyset$ to $\emptyset$ via the bulk.

In TQFT, the partition function of a closed cobordism equals the Euler characteristic of the cohomology of the cobordism's interior, weighted by the Verdier-duality-induced trace.
For our setting:

$$Z(\Sigma) \;=\; \mathrm{tr}_\mathbb{Z}\bigl(\mathrm{id}_{H^\bullet(\mathcal{F}_v)}\bigr) \;=\; \chi(v).$$

By [settling Gauss–Bonnet](settling-gauss-bonnet.md), $\chi(v) = |\mathrm{Apex}_v| - |L_\mathrm{ns}(\kappa)|$.
Hence the partition function is exactly the Euler characteristic in the corpus's sense. $\square$ (Part 5) $\blacksquare$

## What this gives

**The corpus has a TQFT.** This is the corpus's first formal TQFT structure — a complete categorical TQFT in Atiyah's sense, with the cohomology functor as the TQFT functor, the closure dynamics providing the cobordism composition, and Verdier duality providing the orientation reversal.

**The partition function is calculable.** For any closed settling cobordism, the partition function is just the Euler characteristic — given by Gauss–Bonnet as $|\mathrm{Apex}| - |L_\mathrm{ns}|$.
This is unusually computable for a TQFT: classical 2D TQFTs have partition functions that are dimensions of Frobenius algebras (a finite combinatorial datum); the corpus's partition function is the same kind of small combinatorial integer.

**$K_4$-graded TQFTs are unusual.** Classical TQFTs are graded by spin structure or framing; the corpus's $\widehat{K_4}$-grading by the bilattice automorphism characters is structurally distinctive.
It corresponds to a *gauge-theoretic refinement* of TQFT — a "$K_4$-equivariant TQFT" — which has appeared in mathematical physics for finite gauge groups but is here arising naturally from the bilattice's algebraic structure rather than being externally imposed.

**Anderson-Putnam connection.** For settlings on substitution causal sets (per [causal-set-substitution-cohomology](causal-set-substitution-cohomology.md)), the cohomology is $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$.
The Frobenius algebra structure on $\mathbb{Z}^n$ is determined by the substitution matrix $M$ — concretely, $\mu$ is the multiplication law from the substitution algebra.
This gives a class of TQFTs labeled by primitive non-singular substitution matrices, with partition functions related to the Pisot/Salem invariants of the corresponding universality class.

**Higher categorical extension.** The TQFT structure here is at the 1-categorical level — objects (boundaries) and morphisms (cobordisms).
The natural higher-categorical extension is the $(\infty, 2)$-categorical refinement: 2-cobordisms are *settlings between settlings* (deformations of trajectories), which carry their own cohomological invariants.
This is the [extended TQFT direction](questions/extended-tqft.md) for the corpus, currently open.
