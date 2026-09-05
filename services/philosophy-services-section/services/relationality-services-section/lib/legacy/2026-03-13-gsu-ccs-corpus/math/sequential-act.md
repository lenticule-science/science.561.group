---
id: sequential-act
name: SequentialAct
description: "Sequential Act"
---

### Definition — Sequential Act {#sequential-act}

A **sequential act** on a relational universe $R$ relative to a history category $T$
is a family
$$
\{G_s\}_{s \in \mathrm{atoms}(T)}
$$
where each $G_s$ is a **comonad** $(G_s, \varepsilon_s, \nu_s)$ on $R$,
satisfying:

1. **Shift formula.** On objects: $G_s(F)(t) := F(s \star t)$ for all
   $t \in \mathrm{Ob}(T)$.

2. **Counit.** The counit $\varepsilon_s : G_s \to \mathrm{Id}_R$ is given at $F$
   and $t$ by the restriction map
   $$
   \varepsilon_{s,F}(t) \;:=\; F(i_{s,t}) \;:\; F(s \star t) \longrightarrow F(t),
   $$
   where $i_{s,t} : t \to s \star t$ is the prefix inclusion. This "forgets" the
   leading step $s$.

3. **Lax idempotence (KZ property).** Because $T$ is a thin category, there is a
   unique 2-cell in any diagram of comonad maps, so the KZ coherence condition
   $G_s \varepsilon_s \cong \nu_s$ is automatic. The comonad is lax-idempotent.

4. **Independence commutativity.** For atoms $s, s'$ with $s \star s' = s' \star s$
   in $T$, there is a natural isomorphism
   $$
   G_s \circ G_{s'} \;\cong\; G_{s'} \circ G_s,
   $$
   witnessing that sequential extension by commuting steps commutes.

#### Process Carriers {#sequential-act-coalgebras}

A **process carrier** for $G_s$ is a $G_s$-coalgebra: a sheaf $X \in R$
with a natural transformation $\gamma : X \to G_s(X)$, i.e., a family of maps
$$
\gamma_t : X(t) \longrightarrow X(s \star t)
$$
satisfying the counit law ($\varepsilon_X \circ \gamma = \mathrm{id}_X$) and
coassociativity ($G_s(\gamma) \circ \gamma = \nu_X \circ \gamma$).

Interpretation: $\gamma_t$ is a **forward step** — given the state of the process
at history $t$, produce its state at the extended history $s \star t$. The counit
law says stepping forward then restricting back is the identity (the step is
conservative). Coassociativity says two steps compose coherently.

#### The CoKleisli Category {#sequential-act-cokleisli}

The **CoKleisli category** $\mathrm{coKl}(G_s)$ has the same objects as $R$ and
hom-sets $\mathrm{coKl}(G_s)(X, Y) := \mathrm{Hom}_R(G_s X, Y)$. A morphism
$f : X \to_{\mathrm{coKl}} Y$ is an $s$-mediated transition: a sheaf map
$G_s(X) \to Y$, which at each history $t$ reads the state of $X$ at $s \star t$
and produces a state of $Y$ at $t$.

Composition uses the comultiplication: $g \circ f := g \circ G_s(f) \circ \nu_X$.
This is the categorical home of **sequential process composition**: one $s$-step
followed by another.

#### Remark — Sequential Acts as Time Steps {#remark-sequential-time}

Each comonad $G_s$ is a single-step time evolution operator. The counit
$\varepsilon_s$ is the "forget the future" operation (restriction from the extended
history to the shorter one). A process carrier is a sheaf that knows how to
**propagate itself forward** one step at a time. The full sequential dynamics is
the interaction of all $\{G_s\}_{s \in \mathrm{atoms}(T)}$ — every possible
one-step extension — and their compositions via CoKleisli.

The lax-idempotence (KZ) property means: extending by $s$ twice is the same as
extending by $s$ once and then applying the comultiplication $\nu_s$ — there is no
"information gain" from double-stepping beyond what single-stepping already encodes.
This is the categorical expression of the prefix order being a partial order (not a
preorder with non-trivial 2-cells).
