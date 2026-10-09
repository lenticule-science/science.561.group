---
type: concept
status: stable
class: algebraic-structure
symbol: "(Z(\\mathcal{B}), \\eta, \\mu, \\epsilon, \\Delta)"
depends-on: [settling-cobordism-category, settling-tensor-product, settling-internal-hom, settling-associated-sheaf, klein-four-gauge-bundle, equivariant-cohomology-decomposition]
see-also: [tqft-structure, settling-cobordism-category, verdier-duality-for-settlings, jung-rivieccio-duality]
---

# Settling Frobenius structure

The cohomology of any boundary predication system $\mathcal{B}$ in the [settling cobordism category](../objects/settling-cobordism-category.md) carries a canonical **Frobenius algebra structure** — a unit, multiplication, counit, and comultiplication, satisfying the Frobenius axioms — induced by the special cobordisms (disk, pair-of-pants, their duals).
This is the algebraic structure underlying the corpus's [TQFT](references/tqft-structure.md).

## Frobenius algebra background

A **Frobenius algebra** over a commutative ring $R$ is a tuple $(A, \eta, \mu, \epsilon, \Delta)$ where:

- $A$ is an $R$-module.
- $\eta : R \to A$ is the **unit** (giving $A$ an associative algebra structure with multiplication $\mu : A \otimes A \to A$).
- $\epsilon : A \to R$ is the **counit** (giving $A$ a coassociative coalgebra structure with comultiplication $\Delta : A \to A \otimes A$).
- The **Frobenius compatibility** holds: $(\mathrm{id} \otimes \mu) \circ (\Delta \otimes \mathrm{id}) = \Delta \circ \mu = (\mu \otimes \mathrm{id}) \circ (\mathrm{id} \otimes \Delta)$.

A **commutative Frobenius algebra** additionally has $\mu \circ \sigma = \mu$ (where $\sigma$ is the swap).
Commutative Frobenius algebras over $R$ are equivalent to 2D TQFTs valued in $\mathrm{Mod}_R$ (Abrams' theorem [@abrams1996]).

## The settling Frobenius structure

For a boundary predication system $\mathcal{B}$, define $Z(\mathcal{B}) := H^\bullet(\mathcal{F}_{v_\mathcal{B}})$ — the cohomology of the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) at the boundary valuation.
The Frobenius operations come from the special cobordisms in [settling-cobordism-category](../objects/settling-cobordism-category.md).

### Unit $\eta$: from the disk cobordism

The disk cobordism $D : \emptyset \to \mathcal{B}$ — a settling that starts from the empty boundary and produces $\mathcal{B}$ at closure — induces: $$\eta_\mathcal{B} \;:=\; H^\bullet(D) \;:\; Z(\emptyset) = \mathbb{Z} \;\longrightarrow\; Z(\mathcal{B}).$$

Concretely: $\eta_\mathcal{B}(1) \in H^0(\mathcal{F}_{v_\mathcal{B}})$ is the class of the "uniform" section — the cohomology class arising from the all-$\bot$ initial state's evolution to $v_\mathcal{B}$.
This is the unit of the algebra structure on $Z(\mathcal{B})$.

### Multiplication $\mu$: from the pair-of-pants cobordism

The pair-of-pants cobordism $P : \mathcal{B} \otimes \mathcal{B} \to \mathcal{B}$ — taking two disjoint copies of $\mathcal{B}$ as input and producing one $\mathcal{B}$ as output — induces: $$\mu_\mathcal{B} \;:=\; H^\bullet(P) \;:\; Z(\mathcal{B}) \otimes Z(\mathcal{B}) \;\longrightarrow\; Z(\mathcal{B}).$$

The bulk of the pair-of-pants is a settling that runs the closure dynamics on a cell-system $\mathcal{C}_P$ connecting two copies of $\mathcal{C}_\mathcal{B}$ to a single output copy.
The closure operator's *settling tensor product* (per the existing theorem) gives the multiplication law: $\mu_\mathcal{B}(a \otimes b) = $ "the cohomology class of the joint settling of $a$ and $b$ on the merged cell-system."

### Counit $\epsilon$: from the dual disk

The dual disk cobordism $D^\vee : \mathcal{B} \to \emptyset$ — the time-reversed disk — induces: $$\epsilon_\mathcal{B} \;:=\; H^\bullet(D^\vee) \;:\; Z(\mathcal{B}) \;\longrightarrow\; Z(\emptyset) = \mathbb{Z}.$$

Via [Verdier duality for settlings](../theorems/verdier-duality-for-settlings.md), the dual disk corresponds to the Verdier-dual of the disk's settling: instead of building up $v_\mathcal{B}$ from $\bot$, it "tears down" $v_\mathcal{B}$ to $\bot$ via the dual closure dynamics.
The induced map sends a cohomology class to its *integral* over $\mathcal{B}$ — a single integer.

For a closure-active boundary $v_\mathcal{B}$, $\epsilon_\mathcal{B}$ is the trace pairing $\mathrm{tr} : H^\bullet(\mathcal{F}_{v_\mathcal{B}}) \to \mathbb{Z}$.

### Comultiplication $\Delta$: from the dual pair-of-pants

The dual pair-of-pants $P^\vee : \mathcal{B} \to \mathcal{B} \otimes \mathcal{B}$ — taking one $\mathcal{B}$ and producing two — induces: $$\Delta_\mathcal{B} \;:=\; H^\bullet(P^\vee) \;:\; Z(\mathcal{B}) \;\longrightarrow\; Z(\mathcal{B}) \otimes Z(\mathcal{B}).$$

This "splits" a single-boundary settling into two disjoint copies.
Via the Verdier dual to the pair-of-pants, $\Delta$ is the Verdier-adjoint of $\mu$ relative to the trace pairing.

## Verifying the Frobenius axioms

### Associativity of $\mu$

The pair-of-pants composed two ways — $(\mathcal{B} \otimes \mathcal{B}) \otimes \mathcal{B} \to \mathcal{B} \otimes \mathcal{B} \to \mathcal{B}$ vs. $\mathcal{B} \otimes (\mathcal{B} \otimes \mathcal{B}) \to \mathcal{B} \otimes \mathcal{B} \to \mathcal{B}$ — gives the same settling cobordism (up to homotopy of cobordisms, which the cohomology functor identifies).
Hence $\mu \circ (\mu \otimes \mathrm{id}) = \mu \circ (\mathrm{id} \otimes \mu)$.

### Coassociativity of $\Delta$

By Verdier duality of the associativity diagram for $\mu$.

### Unit and counit laws

The disk-then-pair-of-pants composition $\mathcal{B} = \emptyset \otimes \mathcal{B} \xrightarrow{D \otimes \mathrm{id}} \mathcal{B} \otimes \mathcal{B} \xrightarrow{P} \mathcal{B}$ is the identity cobordism on $\mathcal{B}$ (since the disk produces the unit of the multiplication, and multiplying by the unit is the identity).
Hence $\mu \circ (\eta \otimes \mathrm{id}) = \mathrm{id}$.

### Frobenius compatibility

The pair-of-pants composed with the dual pair-of-pants — $\mathcal{B} \otimes \mathcal{B} \to \mathcal{B} \to \mathcal{B} \otimes \mathcal{B}$ via $\Delta \circ \mu$ — equals the "S-shaped" cobordism $(\mathrm{id} \otimes \mu) \circ (\Delta \otimes \mathrm{id})$ at the cobordism level.
This is the topological manifestation of the Frobenius compatibility, transferred to the settling-cobordism setting.

### Commutativity of $\mu$

The swap symmetry of the cobordism category: $P \circ \sigma = P$ on $\mathcal{B} \otimes \mathcal{B}$, since the pair-of-pants is symmetric in its two input boundaries (the cell-systems are merged uniformly).
Hence $\mu \circ \sigma = \mu$, giving commutativity.
So $Z(\mathcal{B})$ is a *commutative* Frobenius algebra.

## Refinement by Klein-four gauge sector

By [equivariant cohomology decomposition](../theorems/equivariant-cohomology-decomposition.md), $Z(\mathcal{B}) = H^\bullet(\mathcal{F}_{v_\mathcal{B}})$ decomposes into four isotypic sectors $Z(\mathcal{B}) = Z^\mathrm{id}_\mathcal{B} \oplus Z^{\chi_\sim}_\mathcal{B} \oplus Z^{\chi_-}_\mathcal{B} \oplus Z^{\chi_{\sim\circ-}}_\mathcal{B}$.

The Frobenius structure respects this decomposition: - The unit $\eta$ lands in the trivial sector $Z^\mathrm{id}$ (the "uniform" disk cobordism is $K_4$-invariant). - The multiplication $\mu$ is *graded*: $\mu(Z^{\chi_1} \otimes Z^{\chi_2}) \subseteq Z^{\chi_1 \cdot \chi_2}$ (using the abelian group structure on $\widehat{K_4}$). - The counit $\epsilon$ vanishes on all non-trivial sectors and is the standard trace on $Z^\mathrm{id}$. - The comultiplication $\Delta$ sends $Z^\chi$ to $\bigoplus_{\chi_1 \cdot \chi_2 = \chi} Z^{\chi_1} \otimes Z^{\chi_2}$.

This gives $Z(\mathcal{B})$ the structure of a **$\widehat{K_4}$-graded commutative Frobenius algebra** — the corpus's refinement of the classical Frobenius structure by gauge sector.

## Position in predication categories

The settling Frobenius structure is the algebraic projection of the corpus's geometric content.
Each boundary $\mathcal{B}$ carries a commutative Frobenius algebra; each settling cobordism $S : \mathcal{B}_1 \to \mathcal{B}_2$ induces an algebra homomorphism $Z(S) : Z(\mathcal{B}_1) \to Z(\mathcal{B}_2)$ that respects the Frobenius operations.

This makes the settling functor $Z : \mathrm{Cob}_\mathrm{settling} \to \mathrm{FrobAlg}_\mathbb{Z}$ a *Frobenius-algebra-valued cobordism functor* — exactly Atiyah's TQFT structure, refined by the $K_4$ gauge grading.
The full statement is the [TQFT structure theorem](references/tqft-structure.md).
