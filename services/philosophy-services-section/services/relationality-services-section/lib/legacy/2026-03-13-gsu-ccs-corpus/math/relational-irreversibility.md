---
id: relational-irreversibility
name: RelationalIrreversibility
description: "if step-fiber-aperiodicity holds, the relational dynamics are irreversible — no history's settled modal content is ever repeated along a step orbit, giving the arrow of time as an algebraic consequence."
---

### Corollary — Relational Irreversibility {#relational-irreversibility}

*Conditional on §step-fiber-aperiodicity.*

If the fiber algebras $H_t$ and $H_{s^n \star t}$ are non-isomorphic for all $t$,
$s$, $n > 0$, then the relational dynamics are **irreversible**: the settled modal
content $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ at any history
is never repeated at any later history in the same step orbit. Each application of a
step produces genuinely new modal content that no further step can reproduce.

#### The Arrow of Time {#relational-irreversibility-arrow}

Most physical frameworks either assume the arrow of time (via initial conditions or the
second law of thermodynamics) or attempt to derive it statistically (from entropy
increase in large systems). Both strategies are external to the dynamical laws
themselves.

Here the arrow of time would be algebraic and internal. The directed comonad $G_s$
(§directed-comonad) advances history by one step. If step-fiber-aperiodicity holds,
the counit $\epsilon : G_s \to \mathrm{Id}_R$ is genuinely irreversible: restriction
along $t \to s \star t$ maps a strictly richer fiber algebra to a strictly less rich
one, and no map in the opposite direction can be an isomorphism. The modal content
accumulated at $s \star t$ is not available at $t$ and cannot be recovered by any
further stepping. Stepping forward adds content; there is no stepping back.

The direction of time is therefore a consequence of the nuclei creating irreversible
distinctions at each step, not a boundary condition imposed from outside.

#### What This Does Not Claim {#relational-irreversibility-scope}

This corollary does not claim that the relational universe is thermodynamically
irreversible in the sense of increasing entropy. The claim is weaker and more
structural: the modal algebra at each history is strictly distinct from the algebra at
any history reachable from it by further steps. Whether this algebraic irreversibility
corresponds to thermodynamic entropy increase is the content of §spectral-thermodynamics
and §landauer-limit.

The corollary is also strictly conditional: the gap in §step-fiber-aperiodicity must be
closed — either by strengthening History Separation to object-faithfulness, or by the
depth-complexity-growth route — before this is a theorem rather than a conditional.
