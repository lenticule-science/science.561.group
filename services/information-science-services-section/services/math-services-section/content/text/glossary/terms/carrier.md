---
id: carrier
description: "A Carrier is a G_s-coalgebra in R = Sh(T,J): a sheaf X equipped with stepping maps γ_t : X(t) → X(s★t) satisfying counit and coassociativity. It is the forward pole of the Passage duality, the dual object to the fiber doctrine H in the Chu pairing."
grounding: relational-machine
minimum-math: relational-universe-directed-step-comonad-shift-functor-sequential-composition
params:
  sheaf: relational-universe
  stepping-map: relational-universe-comonad-coalgebra-structure-map-counit-coassociativity
output: relational-universe-morphism
ast:
  coalgebra-structure:
    - sheaf:
        - relational-universe
    - stepping-map:
        - relational-universe-comonad-coalgebra-structure-map-counit-coassociativity
        - relational-universe-directed-step-comonad-shift-functor-sequential-composition
date-created: 2026-03-18
date-modified: 2026-03-20

---

# Carrier

This entry uses **Carrier** for the specified $G_s$-coalgebra. It does not use the ordinary universal-algebra sense of *carrier set*, which is the underlying set on which an algebra's operations are defined.

## What it is

A **Carrier** is a G_s-coalgebra in $R = \mathbf{Sh}(T, J)$: a sheaf $X \in R$ equipped with a family of **stepping maps**

$$\gamma_t : X(t) \to X(s \star t), \quad \text{natural in } t,$$

where $G_s$ is the directed step comonad $G_s(F)(t) = F(s \star t)$ on $R$. The stepping maps are the components of a coalgebra structure map $\gamma : X \to G_s(X)$.

Two laws must hold (Eilenberg–Moore 1965; Mac Lane *CWM* §VI):

**Counit law.** $\varepsilon_t \circ \gamma_t = \mathrm{id}_{X(t)}$, where $\varepsilon_t : X(s \star t) \to X(t)$ is the restriction map $X(i_t)$ along the prefix inclusion $i_t : t \hookrightarrow s \star t$. Stepping forward one step then restricting back is the identity. The stepping map is a section of the counit — occupancy is faithful.

**Coassociativity.** $\delta_{X,t} \circ \gamma_t = G_s(\gamma)_t \circ \gamma_t$, i.e., $\gamma_{s \star t} \circ \gamma_t = \nu_X(t)$ where $\nu_X : G_s(X) \to G_s(G_s(X))$ is the comultiplication. Two sequential applications of $\gamma$ cohere with the comonad's own comultiplication. Sequential service composes without ambiguity.

The carrier is the **forward pole** of the Passage duality: restriction maps $H(f) : H_{t'} \to H_t$ go backward along histories; stepping maps $\gamma_t : X(t) \to X(s \star t)$ go forward. These are the two directions a structure over $T$ can face (Uustalu & Vene 2005; Orchard 2012).

## The category of Carriers

The category of $G_s$-coalgebras, $G_s$-**Coalg** (the co-Eilenberg–Moore category, Eilenberg–Moore 1965), has:

- **Objects**: Carriers $(X, \gamma)$ as above
- **Morphisms**: sheaf maps $f : X \to Y$ commuting with stepping — $G_s(f) \circ \gamma_X = \gamma_Y \circ f$. A morphism is a simulation: it sends each state of $X$ to a state of $Y$ in a way that respects how both advance under $s$.
- **Cofree Carrier** over $X$: the object $(G_s(X), \delta_X)$, where $\delta_X : G_s(X) \to G_s(G_s(X))$ is the comultiplication. Universal property: every Carrier $(Y, \gamma_Y)$ with a sheaf map $f : Y \to X$ factors uniquely through the cofree Carrier via $\bar{f} = G_s(f) \circ \gamma_Y$ (proof: requires comonad laws and naturality of $\delta$; stated as a claim in cofree coalgebra).
- **CoKleisli category** $\mathrm{coKl}(G_s)$: same objects as $R$; morphisms $F \to G$ are sheaf maps $G_s(F) \to G$ (reading $F$ one step ahead, producing $G$ now); composition $g \circ_{\mathrm{coKl}} f = g \circ G_s(f) \circ \delta_F$; identity on $F$ is the counit $\varepsilon_F : G_s(F) \to F$. This is the free category of $s$-mediated transitions — every $s$-mediated process factors through it.

| Math object | Role |
|---|---|
| $(X, \gamma)$ — $G_s$-coalgebra | Carrier (this spec) |
| Sheaf $X \in R$ | State space: what the Carrier holds at each history |
| Stepping maps $\gamma_t : X(t) \to X(s \star t)$ | Forward transition: how state advances when step $s$ is received |
| Restriction maps $H(f) : H_{t'} \to H_t$ | Backward: Passage dual of the stepping maps |
| Cofree Carrier $(G_s(X), \delta_X)$ | Canonical one-step-ahead Carrier over $X$; universal target for Carriers observing $X$ |
| CoKleisli category $\mathrm{coKl}(G_s)$ | Free category of $s$-mediated transitions |
| Terminal Carrier $\nu G_s$ | Universe of all behavioral trajectories under iterated $s$-stepping; see below |

## Terminal Carrier and behavioral equivalence

By **Adamek's theorem** (Adamek 1974; Aczel–Mendler 1989): if $G_s$ preserves limits of $\omega^{\mathrm{op}}$-chains in $R$ (equivalently: the limit of $\cdots \to G_s^2(\mathbf{1}) \to G_s(\mathbf{1}) \to \mathbf{1}$ exists and is preserved by $G_s$), then the **terminal $G_s$-coalgebra** $\nu G_s$ exists in $R$. By Lambek's lemma it satisfies $G_s(\nu G_s) \cong \nu G_s$ — it is a fixed point of $G_s$. Semantically: $\nu G_s$ is the sheaf of all infinite behavioral trajectories under iterated $s$-stepping.

**Behavioral equivalence** (Rutten 2000 *TCS* 249:3–80): every Carrier $(X, \gamma)$ has a unique coalgebra morphism $\mathrm{beh}_X : X \to \nu G_s$ — the **behavior map** — sending each state $x \in X(t)$ to its infinite behavioral trajectory. Two states $x \in X(t)$ and $y \in Y(t)$ are **behaviorally equivalent** iff $\mathrm{beh}_X(x) = \mathrm{beh}_Y(y)$ in the terminal Carrier.

**Bisimulation** (Rutten 2000; Joyal–Nielsen–Winskel 1996 *Info. & Computation* 127:164–185): a bisimulation between Carriers $(X, \gamma_X)$ and $(Y, \gamma_Y)$ is a third Carrier $(R, \gamma_R)$ with coalgebra morphisms $R \to X$ and $R \to Y$ — a span in $G_s$-Coalg. States $x$ and $y$ are bisimilar iff there is such a span containing the pair $(x, y)$. **Bisimilarity = behavioral equivalence** when $G_s$ weakly preserves pullbacks internally in $R$ (Rutten 2000, Theorem 4.4). In $\mathbf{Sh}(T,J)$: a bisimulation must hold locally (over a covering sieve in $J$) and glue globally, by the sheaf condition.

The three levels of Carrier identity, coarsest to finest:

| Level | Formal condition |
|---|---|
| **Behavioral equivalence** | Same image in $\nu G_s$: same infinite trajectory under all iterated steppings |
| **Coalgebra isomorphism** | Sheaf isomorphism $f : X \xrightarrow{\sim} Y$ commuting with stepping — isomorphic as objects of $G_s$-Coalg |
| **Strict identity** | Literally the same coalgebra: same sheaf $X$ and same stepping maps $\gamma$ |

Isomorphic Carriers are behaviorally equivalent; behaviorally equivalent Carriers need not be isomorphic (they may have different state spaces with the same behavioral image). For deterministic Carriers — where each state has a unique successor — bisimilarity and isomorphism coincide when $\nu G_s$ separates states (each trajectory names a unique state up to iso).

## The Chu duality: Carrier and doctrine

A Carrier $X$ and the fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ stand in duality. At each history $t$, the fiber Heyting algebra $H_t$ is the **observation side** (propositions that can be evaluated at $t$) and $X(t)$ is the **state side** (concrete states that propositions evaluate against). The natural pairing is:

$$r_t : H_t \times X(t) \to \Omega_t$$

assigning to each proposition $a \in H_t$ and state $x \in X(t)$ the truth value of $a$ at $x$. Together $(H, r, X)$ is a **Chu space** in $\mathbf{Sh}(T, J)$ (Pratt 1999; Barr 1991 *MSCS* 1(2):159–178): a sheaf-valued triple with the pairing $r$ playing the role of the evaluation map.

The Passage duality is the dynamic expression of this Chu pairing: restriction maps on $H$ go backward (observation flows backward along histories); stepping maps on $X$ go forward (state advances along histories). The counit law $\varepsilon_t \circ \gamma_t = \mathrm{id}$ is the convergence condition — carrying state forward then restricting observation back returns to the original, maintaining the pairing across the step.

In the **RelationalMachine**: the DataStore carries the fiber doctrine $H$ (the observation side); the Carrier $X$ is instantiated as the entity files of a locale (the state side). The stepping maps $\gamma_t$ are enacted by the improvement skill advancing the locale from history $t$ to $s \star t$.

## Open questions

- **Terminal Carrier existence**: Whether $\nu G_s$ exists in $\mathbf{Sh}(T, J)$ depends on $G_s$ preserving $\omega^{\mathrm{op}}$-limits internally. $G_s(F)(t) = F(s \star t)$ is a base-change functor along the action of $s$ on $T$; whether base change preserves the relevant limit chains in a Grothendieck topos over a non-trivial site $(T, J)$ is not yet derived. The existence of a behavioral universe $\nu G_s$ for each atom $s \in \Sigma$ is required for behavioral equivalence to be well-defined, and is an open condition on the site.

- **Interaction of coKleisli categories across independent atoms**: The free sequential act file notes that the relationship between $\mathrm{coKl}(G_s)$ and $\mathrm{coKl}(G_{s'})$ for independent atoms $s \perp s'$ is unresolved. The commutativity condition $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ on the nucleus side has an analog here: whether $G_s \circ G_{s'} \cong G_{s'} \circ G_s$ as functors (and hence as comonads) when $s \perp s'$ is the Carrier-level form of the same question. A double-coKleisli structure or tensor product of coKleisli categories may be the correct answer, but neither is formally derived.

- **Chu *-autonomy and the nuclei**: Whether the Chu triple $(H, r, X)$ in $\mathbf{Sh}(T, J)$ generates a *-autonomous structure in the sense of Barr (1991) is not yet derived. The *-autonomous structure would give a dualizing object for the monoidal category of Carriers, making the duality between observation and state into a formal categorical involution. Whether the saturation nucleus $\sigma_t$ and transfer nucleus $\Delta_t$ arise as the counit and comultiplication of a comonad induced by the Chu pairing — connecting the doctrinal and coalgebraic layers into a single structure — is a central open question.
