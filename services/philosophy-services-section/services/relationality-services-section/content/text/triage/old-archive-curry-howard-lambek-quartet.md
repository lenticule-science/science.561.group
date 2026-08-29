---

name: curry-howard-lambek-quartet
description: "The Curry-Howard-Lambek-Scott fourfold (types / propositions / objects / domains) is the fiber nuclear quartet — the four CHL columns are the four positions of (H_t, Fix(σ_t), Fix(Δ_t), H_t*)."
---

### Conjecture — Curry-Howard-Lambek Quartet {#curry-howard-lambek-quartet}

**Background.** The Curry-Howard correspondence (1934/1958/1969) identifies types
(type theory) with propositions (logic) and terms with proofs. Lambek extended this
to cartesian closed categories; Scott's domain theory adds a fourth column:

| Type theory | Logic | Category theory | Domain theory |
|-------------|-------|-----------------|---------------|
| Type | Proposition | Object | Domain |
| Term | Proof | Morphism | Element |
| Function type | Implication | Exponential | Function space |
| Reduction | Normalization | Composition | Approximation |

#### The Conjecture {#chl-quartet-conjecture}

**Conjecture:** The four CHL columns are the fiber nuclear quartet
(§fiber-nuclear-quartet) at each history $t$:

$$
\bigl(\,H_t,\;\;\mathrm{Fix}(\sigma_t),\;\;\mathrm{Fix}(\Delta_t),\;\;H_t^*\,\bigr)
$$

| CHL column | Fiber nuclear quartet position | Identification |
|-----------|-------------------------------|----------------|
| Type theory ($H_t$) | Free carrier fiber | Raw algebraic data; no stability enforced |
| Logic ($\mathrm{Fix}(\sigma_t)$) | Saturation-stable sub-algebra | Propositions already closed under the $\sigma_t$ modality |
| Category theory ($\mathrm{Fix}(\Delta_t)$) | Transfer-stable sub-algebra | Morphism data closed under the $\Delta_t$ transfer |
| Domain theory ($H_t^*$) | Fixed fiber | Doubly-stable elements; the termination locus of all reduction |

The CHL reduction step (type theory → normal form) corresponds to the joint projection
$\pi_t = \sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)), which
sends any element of $H_t$ to its least doubly-stable bound in $H_t^*$.

Domain-theoretic approximation (Scott's DCPO order) corresponds to the order structure
on $H_t$: approximating an element from below corresponds to the prefix order on
histories, and the least fixed point of reduction is the joint projection $\pi_t(a)$.

#### What Would Need To Be Proved {#chl-quartet-requirements}

1. **FiberNuclearLanguage is not simply typed.** The classical CHL correspondence is proved for
   simply-typed lambda calculus and intuitionistic propositional logic. FiberNuclearLanguage has two
   KZ modal operators ($\sigma_t$, $\Delta_t$). Verifying that the classical CHL
   isomorphisms hold at the simply-typed fragment of FiberNuclearLanguage, and extending them to
   the modal layer, requires a proof.

2. **Logic = $\mathrm{Fix}(\sigma_t)$.** The identification of the "propositions /
   proofs" column with $\mathrm{Fix}(\sigma_t)$ — the saturation-stable sub-algebra —
   needs justification: $\sigma_t$-stable elements are those that are "already proved"
   in the modal sense, but the precise statement that this sub-algebra is the carrier
   of FiberNuclearLanguage proofs requires connecting the Kripke-Joyal semantics of FiberNuclearLanguage to the
   $\sigma_t$-fixed-point condition.

3. **Category theory = $\mathrm{Fix}(\Delta_t)$.** The transfer-stable sub-algebra
   corresponds to the "objects/morphisms" column only if $\Delta_t$ is the operator
   that enforces categorical coherence conditions. This requires showing that
   $\Delta_t$-stability coincides with the condition for representing morphisms of
   $\mathrm{Sh}(T,J)$ at the fiber level.

**Status.** Conjecture. All three requirements are open.
