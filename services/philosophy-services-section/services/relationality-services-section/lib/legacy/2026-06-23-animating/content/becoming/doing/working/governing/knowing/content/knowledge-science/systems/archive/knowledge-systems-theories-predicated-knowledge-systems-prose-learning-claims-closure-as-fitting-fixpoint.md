---
type: theorem
status: sketch
depends-on: [closure-rule-system, predication-settling, knowledge-order, knowledge-fiber-algebra]
see-also:
  - assertion-monotonicity
  - federation-as-bilattice-colimit
  - epistemic-closure
  - ../../../../../../linguistics/theories/semiotics/theorems/unlimited-semiosis-as-fixpoint.md
---

# Closure-driven settling is Fitting's bilattice fixpoint (sketch)

**Claim** (sketch). The substrate's [closure-driven settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) of a scope $S$ under its closure-rule system $\mathcal{S}_S$ is *exactly* the least fixpoint of Fitting's (1991) bilattice immediate-consequence operator $T_{\mathcal{S}_S}$ on the scope's fiber algebra, in the knowledge order $\leq_k$.

## Setup

Fix a predicated knowledge system $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ and a scope $S \in \Sigma$. The scope's [knowledge fiber algebra](../objects/knowledge-fiber-algebra.md) is the bilattice $\prod_{(s,p,o) \in \Phi_S} \mathbf{L}^\bowtie$ where $\Phi_S$ is the set of cells admitted in $S$.

Each closure rule $r \in \mathcal{S}_S$ has the shape
$$r: \;\big[\mathrm{cells}\big] \,\Rightarrow\, \mathrm{cell}_r$$
together with a value-mapping $\nu_r: (\mathbf{L}^\bowtie)^{|\mathrm{premises}|} \to \mathbf{L}^\bowtie$ that computes the conclusion-cell's value from the premise-cells' values. We require $\nu_r$ to be *bilattice-monotone in $\leq_k$* — the substrate's [closure-rule-language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) discipline.

The **immediate-consequence operator** $T_{\mathcal{S}_S}: K^S \to K^S$ on the scope's fiber algebra is defined by
$$T_{\mathcal{S}_S}(v) := v \;\vee_k\; \bigvee_{r \in \mathcal{S}_S} \delta_r(v)$$
where $\delta_r(v)$ is the bilattice element that places $\nu_r(v|_{\mathrm{premises}_r})$ at $\mathrm{cell}_r$ and $\bot$ everywhere else.

## Statement

**Theorem (sketch).** Let $v_S^0$ be the scope's initial state (the fiber algebra arising from the asserted-cells before any closure firing). Then:

1. **(Monotonicity)** $T_{\mathcal{S}_S}$ is monotone in $\leq_k$.
2. **(Continuity)** When every $\nu_r$ is Scott-continuous in $\leq_k$, $T_{\mathcal{S}_S}$ is Scott-continuous in $\leq_k$.
3. **(Fixpoint)** The substrate's settling
$$\mathrm{settle}_{\mathcal{S}_S}(v_S^0) := \bigsqcup_{n < \omega} T_{\mathcal{S}_S}^n(v_S^0)$$
is the least fixpoint $\mathrm{lfp}_{\leq_k}(T_{\mathcal{S}_S}, v_S^0)$ when the regime is Scott-continuous.
4. **(Transfinite extension)** When the regime is transfinite-bounded at countable ordinal $\kappa$, the settling is the transfinite iterate $T_{\mathcal{S}_S}^\kappa(v_S^0)$ taking $\sup$ at limit ordinals.

## Argument

**(1) Monotonicity of $T_{\mathcal{S}_S}$.** Each $\nu_r$ is bilattice-monotone by hypothesis; hence $\delta_r$ is monotone in $\leq_k$ (it composes a monotone value-update with a fixed cell-projection). The pointwise join of monotone functions is monotone, and adding $v$ to the join (the $v \vee_k$ in the definition) is monotone. The composition is monotone.

**(2) Continuity.** A directed family $D \subseteq K^S$ has $\sup_{\leq_k} D = \bigvee_k D$. Each $\nu_r$ is Scott-continuous, so $\nu_r(\sup D|_{\mathrm{premises}_r}) = \sup \nu_r(D|_{\mathrm{premises}_r})$. The pointwise join $\bigvee_r \delta_r$ commutes with $\sup$ for the same reason. Hence $T_{\mathcal{S}_S}(\sup D) = \sup T_{\mathcal{S}_S}(D)$.

**(3) Least fixpoint.** By Kleene's theorem applied to the bilattice's $\leq_k$-complete lattice structure (Belnap 1977 establishes $\mathbf{FOUR}$ is a $\leq_k$-complete lattice; Fitting 1991 extends this to product bilattices) and (1)–(2), the iterated sequence $\{T_{\mathcal{S}_S}^n(v_S^0)\}_{n < \omega}$ is monotone and converges in $\leq_k$ to the least fixpoint above $v_S^0$. The substrate's settling-up-to-quiescence is exactly this iteration; the substrate's settled state is the limit.

**(4) Transfinite extension.** When some $\nu_r$ is monotone but not Scott-continuous (the regime is transfinite-bounded), the iteration must continue past $\omega$ and take supremum at every limit ordinal. By Kleene's theorem extended to monotone-but-not-continuous operators on chain-complete posets (which the bilattice's $\leq_k$ is), the iteration converges at some ordinal $\kappa < \omega_1$ — the regime's *closure ordinal*. The substrate's settling is the value at $\kappa$.

## Relation to Fitting (1991) and Belnap (1977)

Fitting (1991) generalised the Datalog-style $T_P$ operator from the two-valued lattice to the four-valued bilattice $\mathbf{FOUR}$, showing that the bilattice fixpoint computes Belnap-style four-valued consequences (including $\bot$ for unknowns and $\top$ for contestations) deterministically under a monotone rule discipline. This theorem is the substrate-level statement that the predicated knowledge system's closure-driven settling *is* Fitting's construction, with the bilattice generalised to $\mathbf{L}^\bowtie$ for arbitrary residuated lattice $\mathbf{L}$ (per Busaniche-Cignoli 2014) and the per-fiber treatment generalised by the substrate's predication-fibration.

## Status: sketch

`status: sketch` because:

- The Scott-continuity of the per-rule value-mappings $\nu_r$ is asserted as a discipline rather than verified for a representative rule-set. The standard rule-shapes (Datalog implication, RDFS subsumption, simple OWL axiom) are all Scott-continuous; non-Datalog rule-shapes (general monotone modal operators, transfinite quantifications) require per-shape verification.
- The transfinite-bounded case (4) is sketched as following from extended Kleene; the precise closure-ordinal characterisation per regime requires more careful case analysis.
- The aperiodic-regime case is not covered by the theorem as stated; whether the aperiodic regime admits a Fitting-style fixpoint under suitably extended ordinals is an open question worth its own theorem.
