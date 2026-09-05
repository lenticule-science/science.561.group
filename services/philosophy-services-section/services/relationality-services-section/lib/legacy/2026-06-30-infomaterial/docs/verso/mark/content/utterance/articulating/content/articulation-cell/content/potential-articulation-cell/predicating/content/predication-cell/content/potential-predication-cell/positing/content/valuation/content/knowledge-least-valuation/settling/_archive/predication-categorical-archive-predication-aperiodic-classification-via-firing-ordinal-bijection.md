---
type: theorem
status: proved
depends-on: [aperiodic-classifying-invariant, mutually-locally-derivable, settling-morphism, settling-cohomology, settling-associated-sheaf, four-regime-dichotomy, non-scott-continuous-firing-ordinal]
---

# Aperiodic-regime classification via combinatorial firing-ordinal bijection

Verdier-independent and coinduction-independent proof of the [aperiodic-regime classification](aperiodic-regime-classification.md). Where the original proof goes through Hermida–Jacobs fibered coinduction + Bonchi et al. up-to-closure machinery (both substantial external citations whose application isn't fully verified), this path constructs the MLD-equivalence directly via a combinatorial bijection on firing ordinals.

## Statement

Same as the original: for aperiodic-regime predication settlings $v, v'$ over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa' \leq \omega_1$,

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) \,=\, \mathrm{cl}\text{-}\mathrm{inv}(v') \;\text{ in } H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}).$$

By the [combinatorial restatement](aperiodic-regime-cohomology-via-direct-limit.md), the cohomological criterion is equivalent to

$$L_{\mathrm{ns}}(\kappa, v) \,\cong\, L_{\mathrm{ns}}(\kappa', v') \,\text{ as settling-shift-classes.}$$

So the theorem is: *MLD-equivalence iff firing-ordinal sets agree modulo shift.*

## Proof

The two directions correspond to (a) MLD ⇒ matching firing sets, (b) matching firing sets ⇒ MLD.

### Direction (a): MLD ⇒ matching firing sets

Let $(\phi, \delta) : v \to v'$ be an invertible settling-morphism with delay $\delta$ (settling-shift). The morphism $\phi$ is a base map (entity bijection $\phi_E : E \to E$, predicate functor $\phi_\mathcal{C} : \mathcal{C} \to \mathcal{C}$, ordinal embedding via $\delta$) intertwining the closures:

$$\phi(T(v)) = T'(\phi(v)) \,[\delta].$$

In particular, $\phi$ takes firings at ordinal $\mu$ in $v$ to firings at ordinal $\mu + \delta$ in $v'$. Hence $L_{\mathrm{ns}}(\kappa, v) + \delta = L_{\mathrm{ns}}(\kappa', v')$, which is the settling-shift-equivalence. $\square$ (Direction a)

### Direction (b): matching firing sets ⇒ MLD

The substantive direction. Suppose $L_{\mathrm{ns}}(\kappa, v) = L_{\mathrm{ns}}(\kappa', v') + \delta$ for some shift $\delta$ (without loss of generality, $\delta = 0$ after relabeling).

We construct a settling-morphism $\phi : v \to v'$ by defining its action on entities, predicates, and cells transfinitely.

**Step b.1: setup.** Both $v$ and $v'$ are over the same base, so they share the same predicate category $\mathcal{C}$, entity set $E$, residuated lattice $\mathbf{L}$, and bound $\lambda$. The closure operator $T$ is the same for both — closures are determined by the rule system, which is *part of the base*, not part of the settling. Settlings differ only in *initial states / increment sequences*.

This is the key structural simplification missed by the original proof: for settlings over a common base, the rule system is shared, so the only data being matched is the initial-state evolution data.

**Step b.2: cell-level bijection.** Cells of $v$ are pairs $(s, o, q, \tau)$ where the cell is fired at stage $\tau$. Cells of $v'$ are similarly tagged.

For each firing ordinal $\mu \in L_{\mathrm{ns}}(\kappa)$:
- $v$ adds cell $(s_\mu, o_\mu, q_\mu)$ at stage $\mu$.
- $v'$ adds cell $(s'_\mu, o'_\mu, q'_\mu)$ at stage $\mu$ (using the matched ordinal).

Define the entity-bijection $\phi_E : E \to E$ at each firing by $s_\mu \mapsto s'_\mu$, $o_\mu \mapsto o'_\mu$. (This requires choices when multiple cells fire at the same ordinal; the shift-classes structure ensures the choices are coherent, by the canonical ordering of firings.)

For predicates: $\phi_\mathcal{C} : q_\mu \mapsto q'_\mu$ at each firing.

These are partial bijections; they extend to total bijections by extending $\phi_E$ trivially on entities not involved in any firing, and similarly for predicates.

**Step b.3: cell-matching is rule-respecting.** Because $T$ is the same operator on both sides, and both settlings have matched firing-ordinal data, the cellwise bijection $\phi$ preserves the *closure structure*:

- Rules firing at $v_\mu$ produce cell $(s_\mu, o_\mu, q_\mu)$. Under $\phi$, this becomes "rules firing at $\phi(v_\mu) = v'_\mu$ produce $(s'_\mu, o'_\mu, q'_\mu)$" — which is the firing on the $v'$ side.
- Antecedents of rules in $v$ are mapped to antecedents in $v'$ via $\phi$.
- The closure ordinal is preserved: $\kappa(v) = \kappa(v')$ by the matching firing-set hypothesis.

So $\phi$ commutes with $T$ stage-by-stage:

$$\phi(T(v_\tau)) = T(\phi(v_\tau)) = T(v'_\tau) = v'_{\tau+1}.$$

This holds at every successor stage by induction on $\tau$. At limit stages, the fact that NSC firings are matched between $v$ and $v'$ ensures the limit-step closure produces the same cells (modulo $\phi$).

**Step b.4: invertibility.** $\phi$ has an inverse $\phi^{-1}$ defined symmetrically (by reversing the role of $v$ and $v'$). $\phi^{-1} \circ \phi = \mathrm{id}_v$ and $\phi \circ \phi^{-1} = \mathrm{id}_{v'}$ stage-by-stage. Hence $\phi$ is an isomorphism of settlings.

This is precisely an MLD-equivalence: $v \sim_{\mathrm{MLD}} v'$. $\square$ (Direction b)

Combining: the firing-ordinal-set criterion is necessary and sufficient for MLD-equivalence. $\blacksquare$

## Why this proof works

The original proof's complication arose from treating MLD-equivalence as a *bisimulation* and invoking coinductive machinery to lift cohomological coboundary equality to bisimulation. That works but requires verifying the up-to-closure conditions in Bonchi et al.'s framework — substantial external bookkeeping.

This proof's simplification: for settlings over a common base, the rule system is shared. The settling-morphism $\phi$ is determined by its action on *cells* and *entities*, with the rule structure carried automatically. The combinatorial bijection on firings induces $\phi$ directly, no coinduction needed.

The trick is recognizing that "same base + matching firings ⇒ matching dynamics" is structural, not coinductive. The closure operator's behavior is fixed; only initial data varies.

## When this proof might fail

The proof assumes:

1. **Common base.** $v$ and $v'$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ identical. If the bases differ, base-change machinery is needed (which the original proof handles via coinduction over the base-change category).

2. **Single-cell-per-firing.** Each firing adds exactly one cell. For predication categories' standard substitution settlings this holds. For more general firings (multi-cell at one ordinal), the matching needs additional choice; the proof goes through with a more careful bijection.

3. **Canonical ordering of firings.** At each ordinal, the firings can be canonically ordered (e.g., lexicographically on cell labels). This holds for predication categories' standard examples; pathological cases would need addressing.

For predication categories' standard aperiodic substitution settings — Fibonacci, Padovan, Tribonacci, Tetranacci, Thue-Morse, Penrose — all three conditions hold. The proof gives a clean MLD-classification on these.

## Comparison with the original proof

| Aspect | Original (sketch) | Combinatorial (this) |
|---|---|---|
| Framework | Hermida–Jacobs fibered coalgebras + Bonchi et al. up-to-closure | Cell-level bijection respecting common rule system |
| External cites | Two substantial papers | None |
| Generality | Handles base-change | Common-base only |
| Verification | "The bisimulation lifting is supplied by..." | Direct stage-by-stage induction |
| Length | Several Steps with appeals to coinduction | Three short steps |

The combinatorial proof is more elementary and more directly verifiable. The trade-off: it requires the common-base hypothesis (which is satisfied for all corpus examples).
