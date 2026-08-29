---
id: restriction-carrier-dyad
name: RestrictionCarrierDyad
description: "Phenomenon: The Restriction-Carrier Dyad — the contravariant-covariant duality between presheaf restriction maps H(f) : H_{t'} → H_t and process carrier maps γ_t : X(t) → X(s★t), unified by the directed comonad"
---

### Theorem — The Restriction–Carrier Dyad {#restriction-carrier-dyad}

The **restriction–carrier dyad** is the duality between the two directions that
a structure over the history category $T$ can face: backward along the prefix
order (restriction) and forward along it (carrier).

#### The Poles {#restriction-carrier-dyad-poles}

| Pole | Name | Direction | Map |
|------|------|-----------|-----|
| Backward | **Restriction** | From longer to shorter histories | $H(f) : H_{t'} \to H_t$ for $t \leq t'$ |
| Forward | **Carrier** | From shorter to longer histories | $\gamma_t : X(t) \to X(s \star t)$ |

**Restriction** is the contravariant direction of the presheaf. A morphism
$f : t \to t'$ (a prefix extension) induces a restriction map
$H(f) : H_{t'} \to H_t$ that forgets the additional steps. Information at
a longer history restricts to the shorter one.

**Carrier** is the covariant direction of a process. A process $X$ on $T$
has a structure map $\gamma_t : X(t) \to X(s \star t)$ that says what the
process produces at the next step $s$. The directed comonad $G_s$
(§directed-comonad) is the functor $G_s(F)(t) = F(s \star t)$ that shifts
a sheaf forward by one step.

These two directions are opposite in the prefix order: restriction contracts
(goes backward in history); carrier extends (goes forward in history).

#### The Convergence {#restriction-carrier-dyad-convergence}

A process is **coherent** when restriction and carrier are inverses in
the appropriate sense. The counit law of the directed comonad:

$$
\varepsilon_t \circ \gamma_t = \mathrm{id}_{X(t)}
$$

says that extending the history by $s$ and then restricting back recovers
the original state. This is the convergence condition: carrying one step
forward and then restricting back is the identity.

The full coalgebra structure of $G_s$ (the directed comonad axioms) is
the statement that this convergence is coherent with composition of steps.

#### Role in the Construction {#restriction-carrier-dyad-role}

The restriction–carrier dyad underlies the dynamics section. The profile
reconstruction theorem (§patch-reconstruction) and the free sequential
act (§free-sequential-act) both depend on the interplay between restricting
back and extending forward. The directed comonad is the canonical structure
that makes these two directions cohere.

At the hyperversal level, this dyad reappears at a higher type: restriction is
the restriction of universes along morphisms in $\mathbf{RU}$, and carrier is
the action of universe closure on a universe to produce the next one.
