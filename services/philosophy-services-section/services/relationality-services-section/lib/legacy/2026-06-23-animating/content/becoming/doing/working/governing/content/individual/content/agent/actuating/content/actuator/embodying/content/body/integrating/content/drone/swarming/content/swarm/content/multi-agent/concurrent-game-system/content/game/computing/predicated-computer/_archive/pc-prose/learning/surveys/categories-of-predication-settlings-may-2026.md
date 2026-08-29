---
description: Survey of the three categories that organize predication settlings — the preorder category $\mathbf{PS}$ of settlings under the cellwise $\leq_k$-order, the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ over a predicate category and settling bound, and the settling cobordism category $\mathrm{Cob}_{\mathrm{settling}}$ of boundary predication systems and settling cobordisms.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the three categorical structures that organize predication settlings as they stand in the library at `theories/.../predication-categories/code/structures/`. It covers the predication settling category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ as the preorder category with $\leq_k$-pointwise-stepwise morphisms; the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ as the ambient 2-category for the lax-idempotent 2-adjunction $\mathbb{M} \dashv \mathbb{N}$; and the settling cobordism category $\mathrm{Cob}_{\mathrm{settling}}$ of boundary predication systems and settling cobordisms — Atiyah's $\mathrm{Cob}_n$ analog for predication categories. It defers the moduli quotient (settling fiber groupoid, visible quotient, MLD-equivalence) to the moduli survey, and the cohomology TQFT functor on $\mathrm{Cob}_{\mathrm{settling}}$ to the cohomology survey.

## Content

### The predication settling category $\mathbf{PS}$

The predication settling category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has as objects the predication settlings over fixed parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and as morphisms the predication-settling preorder morphisms. Hom-sets are singletons or empty, determined by the pointwise knowledge order: a morphism $v \to v'$ exists iff $v \leq_k v'$ pointwise and stepwise. $\mathbf{PS}$ is the preorder category.

The preorder morphisms of $\mathbf{PS}$ are strictly weaker than the settling-morphisms of the 2-category of settlings: settling-morphisms carry an ordinal shift, demand state equality, and require settling-endofunctor commutation; the settling-morphisms are the 1-cells of the 2-category whose biequivalences coincide with mutually-locally-derivable (MLD) equivalence — the moduli-quotient relation. $\mathbf{PS}$ is the right setting for stating $\leq_k$-completeness (the predication-settling-category-completeness theorem) and the closure-as-monad presentation; it is not the right setting for moduli classification, which lives in the 2-category.

### The temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$

The temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ over a predicate category $\mathcal{C}$ and a settling bound $\lambda$ has:

- **0-cells:** pairs $(\tau, X)$ with $\tau < \lambda$ an ordinal and $X \in \mathbf{Cat}/\mathcal{C}$.
- **1-cells:** morphisms $(\sigma, X) \to (\tau, Y)$ for $\sigma \leq \tau$ are $\mathbf{Cat}/\mathcal{C}$-morphisms $\mathbb{M}^\beta \mathbb{N}^\alpha X \to Y$ for some decomposition $\tau - \sigma = \alpha + \beta$.
- **2-cells:** $\mathbf{Cat}/\mathcal{C}$-2-cells, plus the canonical coherence 2-cells of the 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ (unit, counit, multiplication, comultiplication) and the lax-idempotent or colax-idempotent coherence 2-cells.

The 1-cells encode "advance the settling by $\alpha + \beta$ ordinal steps" — $\alpha$ applications of the Emmenegger fibration 2-comonad $\mathbb{N}$ followed by $\beta$ applications of the Gray-Street fibration 2-monad $\mathbb{M}$. The 2-cells encode the lax coherence of both 2-monads.

**Strict-idempotent collapse.** When $\mathbb{M}$ and $\mathbb{N}$ are strict-idempotent (the strict regime), the 2-cells in $\mathbf{T}(\mathcal{C}, \lambda)$ are identities and $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to the settling bound $\lambda$ as a 1-category. The linear settling of the original predication settling is recovered exactly in this regime.

**The KZ-lax-idempotent diamond.** The lax-idempotent 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$ carries a square of canonical 2-cells at each iteration level — unit $\eta : 1 \Rightarrow \mathbb{M}$, counit $\epsilon : \mathbb{N} \Rightarrow 1$, multiplication $\mu : \mathbb{M}^2 \Rightarrow \mathbb{M}$, comultiplication $\delta : \mathbb{N} \Rightarrow \mathbb{N}^2$. Adjoint-triangle equalities witnessed by invertible 2-cells make the square a diamond. In the lax-idempotent case the 2-cells carry additional Kelly–Lack coherence.

### The settling cobordism category $\mathrm{Cob}_{\mathrm{settling}}$

The settling cobordism category is the symmetric monoidal category whose objects are boundary predication systems and whose morphisms are settling cobordisms between such boundaries. It is the predication-categories analog of Atiyah's $\mathrm{Cob}_n$, with predication settlings playing the role of $n$-dimensional cobordisms.

**Objects.** A boundary predication system is a triple $\mathcal{B} = (B, \mathcal{C}_B, v_B)$ with $B$ a finite set of boundary cells (a finite subcategory from the underlying predicate category $\mathcal{C}$), $\mathcal{C}_B \subseteq \mathcal{C}$ the full subcategory generated by $B$, and $v_B : B \to \mathbf{FOUR}$ a boundary valuation. The boundary valuation must be closure-stable — applying the closure operator to $v_B$ yields $v_B$ unchanged; boundary configurations are already settled.

The empty boundary $\emptyset$ has $B = \emptyset$, $\mathcal{C}_\emptyset = \emptyset$, and the unique empty valuation; it is the monoidal unit.

**Morphisms.** A settling cobordism $S : \mathcal{B}_{\mathrm{in}} \to \mathcal{B}_{\mathrm{out}}$ consists of a bulk cell-system $\mathcal{C}_S \supseteq \mathcal{C}_{\mathrm{in}} \cup \mathcal{C}_{\mathrm{out}}$ (the bulk extends both boundaries); a settling trajectory $v : \kappa_S \to \mathrm{Val}(\mathcal{C}_S)$ on $\mathcal{C}_S$; and boundary compatibility $v_0|_{B_{\mathrm{in}}} = v_{\mathrm{in}}$ and $v_{\kappa_S}|_{B_{\mathrm{out}}} = v_{\mathrm{out}}$. Two cobordisms are equivalent if they have isomorphic settling trajectories — same closure ordinal, same intermediate values, modulo cell-system isomorphism rel boundary.

The identity cobordism $\mathrm{id}_\mathcal{B} : \mathcal{B} \to \mathcal{B}$ is the trivial settling on $\mathcal{C}_B$ with trajectory constant at $v_B$ (justified because $v_B$ is closure-stable).

**Composition.** $S_2 \circ S_1$ is the glued settling: identify the out-boundary of $S_1$ with the in-boundary of $S_2$, take bulk cell-system $\mathcal{C}_{S_1} \cup_{\mathcal{C}_1} \mathcal{C}_{S_2}$, and concatenate the trajectories (run $S_1$ until it closes at $v_{B_1}$, then start $S_2$ from $v_{B_1}$). The closure ordinal of the composition is $\kappa_{S_1} + \kappa_{S_2}$ (ordinal sum). Composition is associative because ordinal sum is associative.

**Symmetric monoidal structure.** The monoidal product on objects is disjoint union of boundary systems,

$$\mathcal{B}_1 \otimes \mathcal{B}_2 := (B_1 \sqcup B_2,\, \mathcal{C}_{B_1} \sqcup \mathcal{C}_{B_2},\, v_{B_1} \sqcup v_{B_2}).$$

On morphisms, $S_1 \otimes S_2$ is the disjoint union of settling trajectories — running in parallel on disjoint cell-systems, with independent closure ordinals. The monoidal unit is $\emptyset$. The symmetry $\sigma_{\mathcal{B}_1, \mathcal{B}_2} : \mathcal{B}_1 \otimes \mathcal{B}_2 \xrightarrow{\sim} \mathcal{B}_2 \otimes \mathcal{B}_1$ is the swap of the two disjoint summands.

**Duality.** The dual of a boundary $\mathcal{B} = (B, \mathcal{C}_B, v_B)$ is $\mathcal{B}^\vee := (B,\, \mathcal{C}_B^{\mathrm{op}},\, \sim v_B)$ — opposite category on the same cell set, with the bilattice-negated valuation ($\sim \mathbf{t} = \mathbf{f}$, $\sim \mathbf{f} = \mathbf{t}$, $\sim \bot = \bot$, $\sim \top = \top$). A cobordism $S$ has dual $S^\vee : \mathcal{B}_{\mathrm{out}}^\vee \to \mathcal{B}_{\mathrm{in}}^\vee$ obtained by reversing the settling trajectory via the Verdier-dual settling, then negating values. This is the corpus's orientation reversal for cobordisms.

**Distinguished cobordisms.**

- The *disk cobordism* $D_v : \emptyset \to \mathcal{B}$ is a settling whose in-boundary is empty — a settling starting from "no information" (empty cell-system or all-$\bot$ valuation) and producing $v_B$ at closure. The predication-categories analog of a filled-in disk with boundary $\mathcal{B}$.
- The *pair-of-pants cobordism* $P : \mathcal{B}_1 \otimes \mathcal{B}_2 \to \mathcal{B}_3$ takes two disjoint input boundaries and produces a single output boundary: a settling starting from $v_{B_1} \sqcup v_{B_2}$, running closure dynamics on a bulk cell-system $\mathcal{C}_P$ connecting the two boundary subcategories, and closing to $v_{B_3}$. The pair-of-pants is the multiplication cobordism that gives the algebraic structure on the cohomology (the settling-Frobenius-structure).
- The *closed cobordism* $\Sigma : \emptyset \to \emptyset$ is a self-contained settling. Its TQFT invariant is the partition function — a number in $\mathbb{Z}$ or some ground ring characterizing the closed settling globally.

The cohomology functor $Z = H^\bullet(\mathcal{F}_{(-)}) : \mathrm{Cob}_{\mathrm{settling}} \to \mathrm{Mod}_\mathbb{Z}$ is the predication-categories TQFT functor (TQFT structure theorem), satisfying Atiyah's axioms with the Frobenius structure from `settling-frobenius-structure`. The pair-of-pants and disk cobordisms give the multiplication and unit; their duals give comultiplication and counit; Frobenius compatibility comes from the topological move identifying pair-of-pants + dual pair-of-pants with an "S-shape" cobordism.

The cobordism category opens the higher-categorical direction: settlings have "settlings between settlings" (deformations of the trajectory), which is the structure of a 2-cobordism category. The $(\infty, n)$-categorical refinement of $\mathrm{Cob}_{\mathrm{settling}}$ is named in the library as open work.

## Synthesis-flags

The description of the cohomology functor as a TQFT (cohomology $Z : \mathrm{Cob}_{\mathrm{settling}} \to \mathrm{Mod}_\mathbb{Z}$) reproduces the library's `settling-cobordism-category.md`. The Frobenius compatibility argument via the "S-shape" cobordism identity was not directly read from `settling-frobenius-structure.md` this session; the survey records it as named in source but not verified at the structure-file level.

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/settling-cobordism-category.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/predication-settling-category.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/temporal-2-category.md`

Cross-referenced theorems named in source material (not directly read this session):

- The TQFT structure theorem for $Z = H^\bullet(\mathcal{F}_{(-)}) : \mathrm{Cob}_{\mathrm{settling}} \to \mathrm{Mod}_\mathbb{Z}$.
- The settling-Frobenius-structure result.
- Verdier duality for settlings.
- Gray-Street fibration 2-monad and Emmenegger fibration 2-comonad theorems (defining $\mathbb{M}, \mathbb{N}$).
- Predication-settling-category-completeness and initial-terminal-objects theorems.
