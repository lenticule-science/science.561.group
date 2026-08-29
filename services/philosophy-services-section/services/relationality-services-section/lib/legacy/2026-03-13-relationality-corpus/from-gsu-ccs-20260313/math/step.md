---

name: step
description: "A step is a primitive relational operation — an element of the step set Σ, the irreducible unit from which histories are built and by which the history category T is generated."

defines: Step
---

### Definition — The Step {#step}

A **step** is a primitive relational operation: an element of a finite set $\Sigma$,
the **step set**, whose elements generate every history in the history category $T$.

Steps are the atomic building blocks of relational history. A step cannot be further
decomposed; every history is a finite product of steps (§history). The step set $\Sigma$
is finite — this is the content of the Axiom of Histories (§history) and the prerequisite
for local finiteness of the history category (§history-depth, §aperiodicity).

#### What a Step Is Not {#step-not}

A step is not a history. The history $\mathrm{gen}(s) \in T$ corresponding to step
$s \in \Sigma$ is the **atom** (§history) — the one-step history — and is an element
of the history category, not of the step set. The distinction matters: $\Sigma$ is
the presentation data; $T$ is the mathematical object being presented. The map
$\mathrm{gen} : \Sigma \to T$ sends each step to its corresponding atom; it is
injective in any history system (§history-monoid).

A step is not an act. Acts on the relational universe $R$ are the comonads $\{G_s\}$
(§sequential-act) and the monoidal structure $\circledast$ (§concurrent-act). The
comonad $G_s$ is INDEXED by the step $s$ — each step determines a sequential act —
but the step itself is not the comonad.

A step is not a commutation. Whether two steps $s, s' \in \Sigma$ commute is
determined by the commutation relation $I$ (§commutation). Commutation is a quality
predicated of step pairs; it is not constitutive of any single step.

#### The Step Set {#step-set}

The finite set $\Sigma$ of all steps is the **step set** of the history category.
Viewed from three perspectives:
- **Below**: $\Sigma$ is a finite set of primitive symbols — the irreducible vocabulary.
- **Same level**: $\Sigma$ is the generating set of the history system $(T, \star, e)$,
  equipped with the commutation relation $I \subseteq \Sigma \times \Sigma$.
- **Above** (from $T$): $\Sigma$ presents $T$ — every history is a finite product of
  atoms $\mathrm{gen}(s)$ for $s \in \Sigma$. From $R$: $\Sigma$ indexes the family
  of sequential comonads $\{G_s\}_{s \in \Sigma}$ acting on $R$.

The step set $\Sigma$ with commutation relation $I$ is the **presentation** of the
history category $T$: the canonical free history system over $(\Sigma, I)$ is the
history monoid $\mathbb{M}(\Sigma, I)$ (§history-monoid). Any other history system
over $(\Sigma, I)$ receives a unique morphism from $\mathbb{M}(\Sigma, I)$
(§history-universality).

#### The Commutation Quality of a Step {#step-commutation}

Whether $s \perp s'$ is determined by the commutation relation $I$ (§commutation).
Commutation is symmetric and irreflexive: $s \not\perp s$
for every $s \in \Sigma$. Its effect on the history category is the diamond: when
$s \perp s'$, the atoms satisfy $\mathrm{gen}(s) \star \mathrm{gen}(s') =
\mathrm{gen}(s') \star \mathrm{gen}(s)$ in $T$, so extending a history by $s$ then
$s'$ produces the same history as extending by $s'$ then $s$.

#### The Sequential Act of a Step {#step-act}

Each step $s \in \Sigma$ determines a **sequential comonad** on the relational universe
$R$: $G_s$ defined by $G_s(F)(t) := F(\mathrm{gen}(s) \star t)$
(§sequential-act). $G_s$ shifts every sheaf one position forward in the $s$-direction. The counit
$\varepsilon_s : G_s \to \mathrm{Id}_R$ forgets the leading step.

When $s \perp s'$, the comonads commute: $G_s \circ G_{s'} \cong G_{s'} \circ G_s$
(§sequential-act). The commutation quality of the step propagates to the act level.
