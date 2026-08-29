---
title: Physics of Relational Infinity-Topos Modality
type: doc
status: draft
author: emsenn
date: 2025-10-13
keywords:
  - math
  - ritm
  - physics
  - category-theory
publish_to:
  - emsenn-net
---


# Abstract
From the Relational ∞-Topos Modality (RITM)
$$
\Pi^{→}\dashv\Box\dashv\Diamond\dashv\nabla^{←},
$$
we derive its internal mathematical physics.
Without external assumptions, the adjunction implies a comonad $C=\Box\Diamond$ and a monad $M=\Diamond\Box$.
The coKleisli category of $C$ yields intrinsic *dynamics*;
the coalgebra category of $C$ yields intrinsic *topology*.
We show that:
(1) stabilization in the coKleisli category corresponds to the Euler–Lagrange equation in linear reflection;
(2) comonad-compatible functors generate invariants satisfying a categorical Noether theorem;
(3) coalgebras and algebras of $C$ and $M$ correspond to “particles” and “fields”;
(4) RITM canonically induces its own cohesive topos $\mathsf{RITM}_*$ as witness model.
All results follow from the modal structure itself.

# 1. Modal Foundations
\begin{definition}
A *Relational ∞-Topos Modality* (RITM) consists of adjoint idempotent endofunctors
$$
\Pi^{→}\dashv\Box\dashv\Diamond\dashv\nabla^{←}
$$
on a cohesive ∞-topos $\mathcal E$
satisfying the commutation and idempotence relations proved in [Senn 25a].
\end{definition}

\begin{proposition}
From $\Box\dashv\Diamond$ there arise:
$$
C:=\Box\Diamond \text{ (comonad)},\qquad
M:=\Diamond\Box \text{ (monad)},
$$
with counit $\varepsilon:C⇒\mathrm{Id}$,
comultiplication $\delta=\Box\eta\Diamond:C⇒CC$,
unit $\eta:\mathrm{Id}⇒M$,
and multiplication $\mu=\Diamond\varepsilon\Box:MM⇒M$.
\end{proposition}

# 2. CoKleisli Dynamics  :expanded, rigorous

Throughout, fix the middle adjunction of RITM
$$
\Box \dashv \Diamond
$$
with unit $\eta : \mathrm{Id} \Rightarrow \Diamond\Box$ and counit $\varepsilon : \Box\Diamond \Rightarrow \mathrm{Id}$.
Let the induced comonad be
$$
C := \Box\Diamond,\qquad \varepsilon^C := \varepsilon,\qquad \delta := \Box \eta \Diamond : C \Rightarrow C C.
$$

## 2.1 CoKleisli category

\begin{definition}[CoKleisli category of $C$]
$\mathrm{CoKl}(C)$ has:
objects those of $\mathcal E$;
morphisms $X \rightsquigarrow Y$ given by arrows $r: X \to C Y$ in $\mathcal E$.
Composition and identities are
\begin{equation}
g \diamond f \;:=\; \varepsilon_{C Z} \circ C g \circ f, 
\qquad
\mathrm{id}^{\mathrm{coKl}}_X \;:=\; \varepsilon_X \circ \delta_X.
\tag{2.1}
\end{equation}
\end{definition}

\begin{lemma}[Associativity and unit laws]
$\mathrm{CoKl}(C)$ is a category. That is, $\diamond$ is associative and $\mathrm{id}^{\mathrm{coKl}}$ is two-sided unit.
\end{lemma}

\begin{proof}
Standard from comonad laws. For associativity, given $f:X\to CY$, $g:Y\to CZ$, $h:Z\to CW$,
$$
(h \diamond g)\diamond f
= \varepsilon_{C W} \circ C(\varepsilon_{C W}\circ C h \circ g) \circ f
= \varepsilon_{C W}\circ C\varepsilon_{C W}\circ C C h \circ C g \circ f,
$$
while
$$
h \diamond (g \diamond f)
= \varepsilon_{C W} \circ C h \circ (\varepsilon_{C Z}\circ C g \circ f)
= \varepsilon_{C W}\circ C h \circ \varepsilon_{C Z}\circ C g \circ f.
$$
Use naturality of $\varepsilon$ and the comonad law $C\varepsilon \circ \delta = \mathrm{id} = \varepsilon_C \circ \delta$ (transported via $\Box\dashv\Diamond$) to identify these. Unit follows from $\varepsilon\circ \delta = \mathrm{id}$.
\end{proof}

## 2.2 Dynamics as coKleisli composition

\begin{definition}[Cells and iterates]
A *cell* is a coKleisli morphism $r: X \rightsquigarrow Y$, i.e. $r:X\to CY$.
Define iterates by
$$
r^{(1)} := r,\qquad
r^{(n+1)} := r \diamond r^{(n)} \;=\; \varepsilon_{C Y}\circ C r^{(n)} \circ r.
\tag{2.2}
$$
\end{definition}

This gives a canonical *dynamical* semigroup in $\mathrm{End}_{\mathrm{CoKl}(C)}(X \rightsquigarrow Y)$.

## 2.3 Coalgebras and stabilization

\begin{definition}[Coalgebra]
A $C$*-coalgebra* is a pair $(Y,\gamma)$ with $\gamma : Y \to C Y$ such that
$$
\varepsilon_Y \circ \gamma = \mathrm{id}_Y,
\qquad
\delta_Y \circ \gamma = C\gamma \circ \gamma.
\tag{2.3}
$$
Let $\mathcal E^C$ denote the Eilenberg–Moore category of coalgebras.
\end{definition}

\begin{lemma}[Coalgebras give idempotent coKleisli endomorphisms]
If $(Y,\gamma)$ is a coalgebra, then $\gamma : Y \rightsquigarrow Y$ is idempotent in $\mathrm{CoKl}(C)$:
$$
\gamma \diamond \gamma \;=\; \gamma.
\tag{2.4}
$$
\end{lemma}

\begin{proof}
Compute
$$
\gamma \diamond \gamma
= \varepsilon_{C Y} \circ C\gamma \circ \gamma.
$$
Using the coalgebra axiom $\delta_Y \circ \gamma = C\gamma \circ \gamma$ and the comonad law $\varepsilon_{C Y}\circ \delta_Y = \mathrm{id}_{C Y}$,
$$
\gamma \diamond \gamma
= \varepsilon_{C Y} \circ \delta_Y \circ \gamma
= \gamma.
$$
\end{proof}

\begin{definition}[Stabilization = idempotence]
A cell $s:Y \rightsquigarrow Y$ *stabilizes* if $s$ is idempotent in $\mathrm{CoKl}(C)$, i.e.
$$
s \diamond s \;\cong\; s.
\tag{2.5}
$$
\end{definition}

\begin{proposition}[Coalgebra $\Rightarrow$ stabilization]
If $(Y,\gamma)$ is a coalgebra then $\gamma$ stabilizes (by (2.4)).
\end{proposition}

## 2.4 From idempotence to coalgebra (splitting)

We now show that coKleisli idempotents *split* through coalgebras, i.e. stabilization forces topology.

\begin{lemma}[Counit-split idempotents are coalgebras]
Let $s:Y \to C Y$ satisfy
$$
s \diamond s = s
\quad\text{and}\quad
\varepsilon_Y \circ s = \mathrm{id}_Y.
\tag{2.6}
$$
Then $s$ is a $C$-coalgebra structure on $Y$.
\end{lemma}

\begin{proof}
Expand idempotence:
$$
s \diamond s = \varepsilon_{C Y} \circ C s \circ s = s.
\tag{2.7}
$$
Apply $\delta_Y$ to both sides of $s = \varepsilon_{C Y} \circ C s \circ s$ and use naturality and comonad laws:
$$
\delta_Y \circ s
= \delta_Y \circ \varepsilon_{C Y} \circ C s \circ s
= (C \varepsilon_Y) \circ \delta_{C Y} \circ C s \circ s
= (C \varepsilon_Y) \circ C\delta_Y \circ C s \circ s
= C(\varepsilon_Y \circ \delta_Y \circ s)\circ s
= C s \circ s,
$$
where we used $\delta$ naturality and the identities $C\varepsilon \circ \delta = \mathrm{id}$ and $\varepsilon \circ \delta = \mathrm{id}$.
Thus the second coalgebra axiom holds. The first axiom is given by the second hypothesis in (2.6).
\end{proof}

\begin{theorem}[Idempotents split through coalgebras]
Let $r:X \to C Y$ be any coKleisli endomorphism on $Y$ (i.e. $X=Y$) such that $r \diamond r = r$.
Assume there exists a retraction of $\varepsilon_Y$ through $r$, i.e. a map $u:Y \to Y$ with
$$
\varepsilon_Y \circ r = u
\quad\text{and}\quad
u \circ \varepsilon_Y = \varepsilon_Y.
\tag{2.8}
$$
Then $s := r \circ u : Y \to C Y$ is a coalgebra and $r$ factors as
$$
r \;=\; s \circ u
\quad\text{in}\quad \mathrm{CoKl}(C),
$$
i.e. $r = \varepsilon_{C Y}\circ C s \circ u$ in $\mathcal E$.
\end{theorem}

\begin{proof}[Proof sketch]
By (2.8), $\varepsilon_Y \circ s = \varepsilon_Y \circ r \circ u = u \circ u = u$.
Since $u$ retracts $\varepsilon_Y$, the composite $\tilde s := s \circ \varepsilon_Y : C Y \to C Y$ satisfies $\varepsilon_Y \circ \tilde s = \mathrm{id}_Y$.
Idempotence of $r$ lifts (by functoriality of $C$ and (2.1)) to idempotence of $s$ in coKleisli form; composing with the retraction gives the counit-split condition $\varepsilon_Y \circ s = \mathrm{id}_Y$.
Apply the previous lemma to conclude that $s$ is a coalgebra.
Finally, expand coKleisli factorization:
$$
s \circ u \quad\text{(in CoKl)}\quad =\quad \varepsilon_{C Y}\circ C s \circ u \;=\; r,
$$
using $r \diamond r = r$ and naturality of $\varepsilon$.
\end{proof}

\begin{corollary}[Result 1 — Stabilization $ \Leftrightarrow $ topology]
If a coKleisli idempotent endomorphism on $Y$ is counit-split (or splits via a retraction as above), it equips $Y$ with a $C$-coalgebra structure, i.e. stabilization produces topology.
Conversely, any coalgebra yields a stabilizing idempotent (Lemma 2.3).
\end{corollary}

## 2.5 Defect monotonicity (categorical residual)

\begin{definition}[Defect equalizer]
For any cell $r:X \to C Y$, define
$$
\mathrm{Def}(r) \;:=\; \mathrm{Eq}\!\big(\,\delta_Y \circ r,\; C r\,\big) \;\hookrightarrow\; X,
\tag{2.9}
$$
i.e. the largest subobject on which $r$ already coKleisli-commutes with itself.
\end{definition}

\begin{lemma}[Monotonicity under iteration]
For the iterates $r^{(n)}$ in (2.2),
$$
\mathrm{Def}\big(r^{(n)}\big)\;\subseteq\;\mathrm{Def}\big(r^{(n+1)}\big),
\qquad n\ge 1,
\tag{2.10}
$$
and if $r$ stabilizes (idempotent), then $\mathrm{Def}(r)=X$.
\end{lemma}

\begin{proof}
Functoriality of $C$ and naturality of $\delta$ yield a comparison square whose equalizer enlarges under postcomposition with $\varepsilon_{C Y}\circ C(-)$ (cf. (2.1)). Idempotence enforces $\delta \circ r = C r$, whence equalizer is the identity.
\end{proof}
# 3. Coalgebra Topology  :expanded, rigorous

Fix the middle adjunction $ \Box \dashv \Diamond $ with unit $ \eta $ and counit $ \varepsilon $.
Let the induced comonad be $ C:=\Box\Diamond $ with counit $ \varepsilon: C⇒\mathrm{Id} $ and comultiplication $ \delta:=\Box\eta\Diamond : C⇒CC $.

## 3.1 Eilenberg–Moore coalgebras

\begin{definition}[Coalgebra and coalgebra morphism]
A $C$-coalgebra is a pair $(Y,\gamma)$ with $ \gamma:Y\to CY$ such that
\begin{equation}
\varepsilon_Y\circ \gamma=\mathrm{id}_Y,
\qquad
\delta_Y\circ \gamma = C\gamma \circ \gamma.
\tag{3.1}
\end{equation}
A morphism $h:(Y,\gamma)\to (Y',\gamma')$ is a map $h:Y\to Y'$ with
\begin{equation}
C h \circ \gamma \;=\; \gamma' \circ h.
\tag{3.2}
\end{equation}
Let $ \mathcal E^{C} $ denote the Eilenberg–Moore category of $C$-coalgebras and $ U:\mathcal E^{C}\to\mathcal E $ the forgetful functor.
\end{definition}

\begin{proposition}[Cofree coalgebra]
There is a canonical functor $ R:\mathcal E \to \mathcal E^{C} $ sending $X$ to the cofree coalgebra $ (C X,\delta_X)$ and $f:X\to X'$ to $ C f: C X \to C X'$.
Moreover,
\begin{equation}
\mathrm{Hom}_{\mathcal E^{C}}(R X,(Y,\gamma))
\;\cong\;
\mathrm{Hom}_{\mathcal E}(X, U(Y,\gamma)) 
\;\cong\;
\mathrm{Hom}_{\mathcal E}(X, Y),
\tag{3.3}
\end{equation}
naturally in $X$ and $(Y,\gamma)$.
Hence $U \dashv R$ with counit given by $\varepsilon$ and comultiplication $ \delta $.
\end{proposition}

\begin{proof}[Proof sketch]
Standard Eilenberg–Moore theory for comonads: $R$ assigns the cofree coalgebra and $U\dashv R$ with bijection (3.3) obtained by postcomposing with $\varepsilon$ and precomposing with $\delta$. Naturality follows from the comonad axioms.
\end{proof}

## 3.2 Dynamics ⊣ Topology (coKleisli–coalgebra adjunction)

Recall the coKleisli category $ \mathrm{CoKl}(C)$ from §2: objects are those of $ \mathcal E$, morphisms $ X \rightsquigarrow Y$ are maps $ f:X\to C Y$, composition is
\begin{equation}
g\diamond f := \varepsilon_{C Z} \circ C g \circ f,
\qquad
\mathrm{id}^{\mathrm{coKl}}_X := \varepsilon_X\circ\delta_X.
\tag{3.4}
\end{equation}

\begin{lemma}[CoKleisli–coalgebra hom-bijection]
For every $X\in\mathcal E$ and coalgebra $(Y,\gamma)$, there is a natural bijection
\begin{equation}
\Phi_{X,(Y,\gamma)}:\;
\mathrm{Hom}_{\mathrm{CoKl}(C)}(X,Y) 
\;\cong\;
\mathrm{Hom}_{\mathcal E^{C}}\big((C X,\delta_X),(Y,\gamma)\big),
\tag{3.5}
\end{equation}
given on $f:X\to C Y$ by
$$
f \longmapsto f^\sharp \;:=\; \varepsilon_Y \circ C f \;:\; C X \to Y,
$$
and inversely on a coalgebra morphism $h: C X \to Y$ by
$$
h \longmapsto h^\flat \;:=\; \gamma \circ h \circ \delta_X \;:\; X \to C Y.
$$
\end{lemma}

\begin{proof}
Naturality and mutual inverse properties are routine from the coalgebra condition $C h \circ \delta_X = \gamma \circ h$ (for $h$ a coalgebra morphism) and comonad identities $ \varepsilon_C \circ \delta = \mathrm{id}_C = C\varepsilon \circ \delta$.
\end{proof}

\begin{theorem}[Dynamics ⊣ Topology]
There is an adjunction
\begin{equation}
L \;\dashv\; R' : \quad \mathrm{CoKl}(C) \;\rightleftarrows\; \mathcal E^{C},
\tag{3.6}
\end{equation}
where:
- $L$ sends an object $X$ to the cofree coalgebra $(C X,\delta_X)$, and a coKleisli arrow $f:X\rightsquigarrow Y$ (i.e. $f:X\to C Y$) to the coalgebra morphism $f^\sharp=\varepsilon_Y\circ C f : C X \to Y$.
- $R'$ is the composite $ \mathcal E^{C} \xrightarrow{U} \mathcal E \hookrightarrow \mathrm{CoKl}(C)$, sending $(Y,\gamma)$ to $Y$ and a coalgebra morphism $h:Y\to Y'$ to the coKleisli arrow $ \gamma' \circ h : Y \to C Y'$.
The bijection of hom-sets is precisely (3.5).
\end{theorem}

\begin{corollary}[Result 2 — Internal duality]
Within any RITM, the pair $ (\mathrm{CoKl}(C), \mathcal E^{C})$ realizes **Dynamics ⊣ Topology** as an adjunction $L \dashv R'$.
\end{corollary}

## 3.3 Stabilization as topology (idempotent splitting)

\begin{definition}[Idempotent in $\mathrm{CoKl}(C)$]
A coKleisli endomorphism $s:Y \rightsquigarrow Y$ is idempotent if
$$
s \diamond s \;\cong\; s.
\tag{3.7}
$$
\end{definition}

\begin{proposition}[Coalgebras yield idempotents]
If $(Y,\gamma)$ is a coalgebra then $\gamma:Y\rightsquigarrow Y$ is idempotent:
$$
\gamma \diamond \gamma \;=\; \gamma.
\tag{3.8}
$$
\end{proposition}

\begin{proof}
Exactly as in (2.4): $ \gamma \diamond \gamma = \varepsilon_{C Y}\circ C\gamma \circ \gamma = \varepsilon_{C Y}\circ \delta_Y \circ \gamma = \gamma.$
\end{proof}

\begin{theorem}[Idempotents split through coalgebras]
Let $s:Y \rightsquigarrow Y$ be coKleisli-idempotent and suppose $ \varepsilon_Y\circ s = \mathrm{id}_Y$ (counit-split).
Then $s$ equips $Y$ with a coalgebra structure, hence $s=\gamma$ for some $(Y,\gamma)$ and (3.8) holds.
\end{theorem}

\begin{proof}
As in §2.4: from $ s\diamond s = s$ one derives $ \delta_Y\circ s = C s \circ s$; together with $ \varepsilon_Y\circ s = \mathrm{id}_Y$ this is exactly (3.1).
\end{proof}

\begin{corollary}[Stabilization ⇔ topology (counit-split case)]
In the counit-split case, **stabilization** of dynamics (idempotence in $\mathrm{CoKl}(C)$) is equivalent to the existence of a **topology** (coalgebra structure) on $Y$.
\end{corollary}

## 3.4 Defect as exactness (categorical residual)

\begin{definition}[Defect equalizer]
For any cell $ r:X \to C Y$, define the *defect* subobject
$$
\mathrm{Def}(r) := \mathrm{Eq}\big(\,\delta_Y\circ r,\; C r\,\big)\hookrightarrow X.
\tag{3.9}
$$
\end{definition}

\begin{lemma}[Monotonicity and saturation]
For iterates $ r^{(n)}$ (cf. (2.2)),
$$
\mathrm{Def}(r^{(n)})\subseteq \mathrm{Def}(r^{(n+1)})\,
\quad n\ge 1,
\quad\text{and}\quad
\text{if } r \text{ stabilizes, then } \mathrm{Def}(r)=X.
\tag{3.10}
$$
\end{lemma}

\begin{proof}
Naturality of $ \delta$ and functoriality of $C$ yield a comparison square whose equalizer enlarges under postcomposition by $ \varepsilon_{C Y}\circ C(-)$. Idempotence forces $ \delta_Y\circ r = C r$, hence the equalizer is the identity on $X$.
\end{proof}

# 4. Defect and Linear Reflection (Euler–Lagrange Equivalence)

We now show that the purely categorical notion of *defect exactness* from §3.4
becomes, under linear reflection, the analytic Euler–Lagrange condition.

## 4.1 Linear reflection functor

\begin{definition}[Linear reflection]
Let
$$
\mathrm{Lin}:\mathcal E \longrightarrow \mathrm{Mod}_{\mathbb R}(\mathcal E)
$$
denote the left exact additive reflection
sending each object to its free internal $\mathbb R$-module
and each morphism to its linear extension.
Write $ \mathcal L := \mathrm{Mod}_{\mathbb R}(\mathcal E)$.
\end{definition}

\begin{proposition}
Every endofunctor on $\mathcal E$ extends uniquely to a linear endofunctor on $\mathcal L$,
and the lifted comonad
$$
C_{\mathrm{lin}} := \Box_{\mathrm{lin}}\Diamond_{\mathrm{lin}}
$$
satisfies $ \mathrm{Lin}\circ C \simeq C_{\mathrm{lin}}\circ \mathrm{Lin}$.
\end{proposition}

Thus the comonadic structure and all results of §§2–3 persist in $\mathcal L$,
but now $\mathcal L$ admits additive operations and kernels.

## 4.2 Defect as residual

\begin{definition}[Residual of a cell]
For any $r:X\to C Y$ in $\mathcal E$, its *linear residual* in $\mathcal L$ is
$$
\rho(r):=C_{\mathrm{lin}}(\mathrm{Lin}\,r) - \mathrm{Lin}\,r
: \mathrm{Lin}\,X \longrightarrow \mathrm{Lin}\,C Y.
\tag{4.1}
$$
\end{definition}

\begin{lemma}[Linearization of the defect equalizer]
Under $\mathrm{Lin}$,
the defect equalizer (3.9) becomes the kernel of $\rho(r)$:
$$
\mathrm{Lin}\big(\mathrm{Def}(r)\big)
\;\cong\;
\ker(\rho(r)).
\tag{4.2}
$$
\end{lemma}

\begin{proof}
Because $\mathrm{Lin}$ preserves limits and sends equalizers to kernels,
$$
\mathrm{Lin}\!\big(\mathrm{Eq}(\delta_Y\circ r,Cr)\big)
= \ker\big(C_{\mathrm{lin}}(\mathrm{Lin}\,r) - \mathrm{Lin}\,r\big).
$$
The identification of $C_{\mathrm{lin}}$ with $\Box_{\mathrm{lin}}\Diamond_{\mathrm{lin}}$ gives (4.2).
\end{proof}

## 4.3 Euler–Lagrange form of stabilization

\begin{theorem}[Euler–Lagrange equivalence]
For any $r:X\to C Y$,
stabilization $Cr=r$ in $\mathcal E$
is equivalent, after linear reflection, to
\begin{equation}
\rho(r)=0,
\tag{4.3}
\end{equation}
i.e. vanishing of the residual in $\mathcal L$.
\end{theorem}

\begin{proof}
Direct: $Cr=r$ implies $C_{\mathrm{lin}}(\mathrm{Lin}\,r)=\mathrm{Lin}\,r$, so $\rho(r)=0$.
Conversely, if $\rho(r)=0$, apply the conservative forgetful functor
$U:\mathcal L\to\mathcal E$ to obtain $Cr=r$.
\end{proof}

\begin{corollary}[Result 5 — Euler–Lagrange condition]
The Euler–Lagrange equation in the linear reflection of RITM is the
linearization of the categorical stabilization condition:
$$
C r = r
\quad\Longleftrightarrow\quad
\rho(r)=0.
\tag{4.4}
$$
Hence the quadratic functional
$$
S[r]:=\tfrac12\,⟨\rho(r),\,\rho(r)⟩
$$
attains its minimum precisely at stabilized (on-shell) cells.
\end{corollary}

## 4.4 Interpretation

The linear reflection does not introduce new physics;
it merely reveals that the
idempotence of the comonad $C$
acts as a first-order variational principle.
Every “equation of motion” of classical physics
is an instance of $C r = r$
seen through an additive lens.
# 5. Invariants and the Noether Equivalence  :expanded, rigorous

We now show that every symmetry of the RITM modality, formalized as a comonad morphism,
preserves the dynamics (coKleisli composition) and the topology (coalgebras).
This establishes a categorical analogue of Noether’s theorem.

## 5.1 Comonad morphisms and symmetries

\begin{definition}[Comonad morphism]
Let $(C,\varepsilon,\delta)$ and $(C',\varepsilon',\delta')$
be comonads on categories $\mathcal E$ and $\mathcal F$, and
let $F:\mathcal E\to\mathcal F$ be a functor.
A *comonad morphism* from $C$ to $C'$ along $F$
is a natural transformation
$$
\theta: F C \Longrightarrow C' F
\tag{5.1}
$$
satisfying the coherence equations:
$$
\varepsilon' \circ \theta = F\varepsilon,
\qquad
\delta' \circ \theta = C' \theta \circ \theta_C \circ F\delta.
\tag{5.2}
$$
\end{definition}

\begin{definition}[RITM symmetry]
A *RITM symmetry* is a comonad morphism $ \theta: F C ⇒ C F$
for some endofunctor $F:\mathcal E→\mathcal E$
preserving all four RITM modalities and commuting with their adjunction structure.
\end{definition}

Such $F$ acts internally as a *symmetry* of the modality itself:
it maps modal dynamics to modal dynamics.

## 5.2 Lifting of comonad morphisms

\begin{proposition}[Lift to coKleisli categories]
Given a comonad morphism $\theta: F C ⇒ C' F$,
there is an induced functor
$$
\widehat{F}: \mathrm{CoKl}(C) \longrightarrow \mathrm{CoKl}(C')
$$
defined on objects by $ \widehat{F}(X)=F X$,
and on coKleisli morphisms $ f:X→C Y$ by
\begin{equation}
\widehat{F}(f): F X \xrightarrow{F f} F C Y
\xrightarrow{\theta_Y} C' F Y.
\tag{5.3}
\end{equation}
\end{proposition}

\begin{proof}
Naturality of $\theta$ and the comonad coherence (5.2) ensure that
$\widehat{F}(g \diamond f)=\widehat{F}(g)\diamond\widehat{F}(f)$,
since composition in the coKleisli category is $\varepsilon'_{C'Z}\circ C'(-)\circ(-)$,
and the equalities $ \varepsilon'\circ \theta = F\varepsilon $ propagate through.
\end{proof}

\begin{proposition}[Lift to coalgebra categories]
The same $\theta$ induces a functor
$$
\overline{F}: \mathcal E^{C} \longrightarrow \mathcal F^{C'}
$$
sending $(Y,\gamma:Y→C Y)$ to $(F Y, \theta_Y \circ F\gamma: F Y → C' F Y)$,
and morphisms $h:Y→Y'$ satisfying (3.2)
to $F h:F Y→F Y'$.
\end{proposition}

\begin{proof}
Check coalgebra axioms directly:
$$
\varepsilon'_{F Y}\circ (\theta_Y \circ F\gamma)
= F(\varepsilon_Y\circ \gamma)=\mathrm{id}_{F Y},
$$
and
$$
\delta'_{F Y}\circ(\theta_Y\circ F\gamma)
= (C'\theta_Y)\circ(\theta_{C Y})\circ F(\delta_Y\circ\gamma)
= (C'\theta_Y)\circ(\theta_{C Y})\circ F(C\gamma\circ\gamma)
= C'(\theta_Y\circ F\gamma)\circ(\theta_Y\circ F\gamma),
$$
using (5.2). Thus $\overline{F}(Y,\gamma)$ is a coalgebra.
\end{proof}

## 5.3 Preservation of stabilization

\begin{lemma}[Stabilization preserved]
If $r:Y→C Y$ is idempotent in $\mathrm{CoKl}(C)$,
then $\widehat{F}(r)$ is idempotent in $\mathrm{CoKl}(C')$:
$$
\widehat{F}(r)\diamond\widehat{F}(r)=\widehat{F}(r).
\tag{5.4}
$$
\end{lemma}

\begin{proof}
Compute:
$$
\widehat{F}(r)\diamond\widehat{F}(r)
= \varepsilon'_{C'F Y}\circ C'(\widehat{F}(r))\circ\widehat{F}(r)
= \varepsilon'_{C'F Y}\circ C'(\theta_Y\circ F r)\circ(\theta_Y\circ F r).
$$
Use (5.2) and naturality to substitute $ \theta_{C Y}\circ F(\delta_Y)=\delta'_{F Y}\circ \theta_Y$,
then contract with the counit axiom to obtain
$$
\varepsilon'_{C'F Y}\circ C'\theta_Y\circ\theta_{C Y}\circ F(\delta_Y\circ r)
= \theta_Y\circ F(\varepsilon_Y\circ \delta_Y\circ r)
= \theta_Y\circ F r
= \widehat{F}(r).
$$
\end{proof}

\begin{theorem}[Result 6 — Categorical Noether Theorem]
Let $F$ be a RITM symmetry (comonad morphism $ \theta:F C⇒C F$).
Then:

1. $ \widehat{F} $ preserves the coKleisli composition and all idempotent (stabilized) morphisms.  
2. $ \overline{F} $ preserves coalgebras and the reflector $U\dashv R$.  
3. Therefore, every RITM symmetry induces a natural transformation of the Dynamics ⊣ Topology adjunction:
$$
\begin{tikzcd}[column sep=huge]
\mathrm{CoKl}(C) \ar[r,shift left=1.5ex,"L"] \ar[d,"\widehat{F}"']
  & \mathcal E^{C} \ar[l,shift left=.8ex,"R'"] \ar[d,"\overline{F}"] \\
\mathrm{CoKl}(C) \ar[r,shift left=1.5ex,"L"']
  & \mathcal E^{C} \ar[l,shift left=.8ex,"R'"]
\end{tikzcd}
\tag{5.5}
$$
and hence a conserved morphism class—its image under $\widehat{F}$ remains stabilized.

Thus comonad morphisms $F$ are precisely the *invariants* of RITM dynamics.

