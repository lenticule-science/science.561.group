---

name: decidability-colimit
description: "Decidability of the Colimit — every sentence in the internal language of the hyperverse has its truth value determined at some finite tower level."
---

### Conjecture — Decidability of the Colimit {#decidability-colimit}

*The hyperverse $\mathcal{H}$ is an infinite structure, but its internal logic is decided
at finite depth. Every proposition — no matter how high-order — has a finite-level
witness that determines its truth value.*

---

#### Setup — Decidability at the Ground Level {#decidability-ground}

At the ground level, decidability of truth comes from the finiteness of the fiber algebras.
The fiber doctrine (§fiber-doctrine) specifies that each $H_t$ is a **finite**
Heyting algebra. Finite Heyting algebras have decidable logic: given any formula $\phi$ in
the fiber language FiberNuclearLanguage and any history $t$, the truth value of $\phi$ in $H_t$
is computable by finite evaluation.

The depth filtration (§depth-filtration) organizes this decidability. The moduli space
$\mathcal{M}_n$ of depth-$n$ nucleus families is a finite set. Every proposition whose truth
depends on data at histories of depth $\leq n$ is settled by $\mathcal{M}_n$: a finite search
suffices to determine its truth value. Depth provides a measure of the "reach" of a proposition.

What the ground level does not automatically supply: propositions that quantify over all
histories (universally quantified statements about the whole universe $R$) may require the full
infinite site $(T, J)$, not just $T^{(n)}$ for a finite $n$. Such propositions are not
automatically reducible to finite depth.

---

#### The Hyperverse Version — Setting Up the Question {#decidability-question}

The hyperverse $\mathcal{H} = \varinjlim_n R^{(n)}$ (§hyperverse-tower) is the colimit of
the tower $R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow \cdots$. A proposition in the
internal language HyperversalNuclearLanguage can quantify over:

- Histories in $T_\mathcal{H}$ — the meta-history category, which is the colimit of the $T^{(n)}$ (= $\mathbf{RU}^{(n)}$)
- Internal universes in $\mathbf{RU}_\mathcal{H}$ — which by §hyperverse-fixed-point is $\varinjlim_n \mathbf{RU}^{(n)}$
- Morphisms between those universes, and their higher-order properties

All of these are infinite. The question is whether any specific proposition in HyperversalNuclearLanguage,
despite ranging over this infinite domain, has its truth value determined by finitely much
data — data already present in $R^{(n)}$ for some finite $n$.

---

#### Two Levels of the Conjecture {#decidability-two-levels}

The conjecture has a weak and a strong form, corresponding to two distinct claims.

##### Claim A — Finite Section Witnessing {#decidability-claim-a}

**Claim A.** Every global section of every sheaf $\mathcal{F}$ in $\mathcal{H}$ appears at
some finite level: for every $s \in \Gamma(\mathcal{F})$, there exist $n \geq 0$ and a sheaf
$\mathcal{F}^{(n)}$ in $R^{(n)}$ and a section $s^{(n)} \in \Gamma(\mathcal{F}^{(n)})$
such that $s$ is the image of $s^{(n)}$ under the inclusion $\iota_n: R^{(n)} \hookrightarrow \mathcal{H}$.

This claim is near-theorem from the colimit structure. Since $\mathcal{H} = \varinjlim_n R^{(n)}$,
the global sections functor commutes with the colimit in the sense that
$$
\Gamma(\mathcal{F}) \;\cong\; \varinjlim_n \Gamma(\iota_n^* \mathcal{F}).
$$
Any element of the colimit appears in some term of the diagram — so any global section of
$\mathcal{F}$ in $\mathcal{H}$ appears as a section of $\iota_n^*\mathcal{F}$ for some $n$.

**Status of Claim A.** Conditional on the colimit commuting with global sections in the
appropriate 2-categorical sense. This requires the Beck–Chevalley conditions of §beck-chevalley-tower
and appropriate coherence for the interchange of limits and colimits. Given those conditions,
Claim A follows from standard filtered colimit arguments.

##### Claim B — Finite Formula Witnessing {#decidability-claim-b}

**Claim B.** For every sentence $\phi$ in the internal language HyperversalNuclearLanguage
— including sentences that quantify over internal universes or their higher-order properties —
there exists a finite depth $n$ such that the truth value of $\phi$ in $\mathcal{H}$ is
the same as the truth value of the corresponding sentence in $R^{(n)}$:
$$
\mathcal{H} \models \phi \;\;\Longleftrightarrow\;\; R^{(n)} \models \phi.
$$

Claim B is strictly stronger than Claim A. A sentence $\phi$ may quantify over all internal
universes $\mathbf{U} \in \mathbf{RU}_\mathcal{H}$; a global section argument shows that
any specific section is witnessed at some level, but the quantification itself ranges over an
infinite set. The claim is that truth of $\phi$ in $\mathcal{H}$ is nevertheless settled at
a finite $n$ — that the additional universes appearing at levels $> n$ do not change the
truth value.

This is the genuinely conjectural part.

---

#### The Conjecture Proper {#decidability-conjecture}

**Conjecture (Decidability of the Colimit).** For every sentence $\phi$ in HyperversalNuclearLanguage,
there exists $n \geq 0$ such that $\mathcal{H} \models \phi$ if and only if $R^{(n)} \models \phi$.
Equivalently: the internal logic of $\mathcal{H}$ is a **filtered colimit** of the internal
logics of the $R^{(n)}$:
$$
\mathrm{Th}(\mathcal{H}) \;=\; \bigcup_n \mathrm{Th}(R^{(n)}),
$$
where $\mathrm{Th}(X)$ denotes the set of sentences true in $X$ under the geometric inclusion.

**Corollary (Decidability).** If the conjecture holds and each $R^{(n)}$ has decidable
internal logic, then $\mathcal{H}$ has decidable internal logic: to check $\mathcal{H} \models \phi$,
find the finite $n$ witnessing $\phi$ (which exists by the conjecture) and evaluate $\phi$
in $R^{(n)}$ (decidable by the finiteness of fiber algebras at each level).

---

#### The Argument — Why Finite Witnessing Should Hold {#decidability-argument}

The support comes from two directions: the finiteness structure of the tower and the
fixed-point characterization of $\mathcal{H}$.

**Finiteness at each level.** At each level $n$, the moduli space $\mathcal{M}^{(n)}$
of nucleus families in $R^{(n)}$ is finite (the hyperversal analog of §depth-filtration).
This means $R^{(n)}$ has finitely many "types of relational structure" — any specific
proposition is determined by a finite search through $\mathcal{M}^{(n)}$.

**Finite generation of the tower.** Each $R^{(n+1)}$ is the result of applying $U_\mathcal{H}$
to $R^{(n)}$ (§hyperverse-tower). The closure operator $U_\mathcal{H}$ applies the nuclear quartet
construction once. This adds new propositions — the propositions *about* level-$n$ universes
— but does so in a finitely generated way: each new proposition at level $n+1$ is generated
from finitely many level-$n$ data points by the closure rules.

**The colimit argument for quantifiers.** Consider a sentence $\forall \mathbf{U}.\, \phi(\mathbf{U})$
quantifying over all internal universes. In $\mathcal{H}$, this quantifies over
$\mathbf{RU}_\mathcal{H} = \varinjlim_n \mathbf{RU}^{(n)}$. Any specific universe
$\mathbf{U} \in \mathbf{RU}_\mathcal{H}$ appears at some finite level $n(\mathbf{U})$.
The conjecture asserts that to decide $\forall \mathbf{U}.\, \phi(\mathbf{U})$, it suffices
to check a finite initial segment of the tower: there exists $N$ such that
$\forall \mathbf{U} \in \mathbf{RU}^{(N)}.\, \phi(\mathbf{U})$ determines the hyperversal
truth. This holds when $\phi$ is "monotone" in the tower — if $\phi(\mathbf{U})$ is settled
at level $n$, no future universe at level $> n$ can unsettle it.

Monotonicity is where the conjecture is most vulnerable. At the ground level, the forward
nucleus $\Delta_t$ provides a monotone "shadow" property: a proposition settled at depth $n$
is settled for all extensions (§shadow-of-the-future). At the hyperverse level,
the same mechanism should apply one level up: a proposition settled at hyperverse depth $n$
(= the proposition is true in $R^{(n)}$) should remain true in $R^{(n+k)}$ for all $k$.

---

#### Connection to Initiality {#decidability-initiality}

The Initiality Theorem (§hyperverse-initiality) provides a canonical map $\mathcal{H} \to
\mathbf{V}$ into any hyperverse model $\mathbf{V}$. If $\mathbf{V} = R^{(n)}$ (treated as a
hyperverse model by ignoring the higher structure), the initiality map sends propositions of
$\mathcal{H}$ to propositions of $R^{(n)}$.

Decidability is the converse direction: every proposition TRUE in $\mathcal{H}$ is already
true in some $R^{(n)}$. This would follow from the initiality map being a **conservative**
extension: $\mathcal{H}$ proves nothing that cannot be confirmed at a finite level. Initiality
gives existence of the maps; the conjecture is that truth is preserved in the finite direction.

In the stratified freeness pattern (§hyperverse-initiality, Corollary — Stratified Freeness):
at each level, the free object is the minimal model — it contains exactly the content forced
by the axioms and nothing more. At the hyperverse level, $\mathcal{H}$ is the initial object
of the category of hyperverse models. Being initial means $\mathcal{H}$ is minimal: it does
not contain extra propositions not forced by the colimit construction. The decidability conjecture
is the computational content of this minimality: the "nothing extra" is witnessed at finite depth.

---

#### Connection to Modal Collapse {#decidability-modal-collapse}

Modal Collapse (§modal-collapse) asserts that $\mathcal{H}$ is Boolean: every
fiber algebra $H_\mathbf{U}^\mathcal{H}$ satisfies excluded middle $a \vee \neg a = \top$.
Boolean Heyting algebras have decidable logic (evaluating any sentence requires only checking
finitely many truth values, since the logic is two-valued at each fiber).

If Modal Collapse holds, the internal logic of $\mathcal{H}$ is classical and two-valued.
Combined with the finite section witnessing of Claim A, a classical truth-value at any
position is determined by the section value at that position — which is witnessed at a finite
level. This gives a conditional proof of Claim B:

$$
\text{Modal Collapse} \;+\; \text{Claim A} \;\Longrightarrow\; \text{Claim B} \;\text{(classical case)}.
$$

Without Modal Collapse, the internal logic of $\mathcal{H}$ is intuitionistic. In the
intuitionistic case, a proof of $\phi$ is not just a truth value but a construction, and
showing that the construction can be bounded to a finite level is a stronger claim requiring
the monotonicity argument above.

---

#### Remark — Finite Depth as Compactness {#decidability-compactness}

The Decidability conjecture is the hyperversal analog of the compactness theorem in classical
first-order logic: a sentence is true in the colimit iff it is true in a finite sub-structure
of the tower. At the ground level, this is the observation that the depth filtration provides
compactness for propositions about finite histories. At the hyperverse level, the tower levels
$R^{(n)}$ play the role of finite sub-structures, and the colimit $\mathcal{H}$ plays the
role of the full structure.

The precise analog of the compactness theorem would be:
$$
\mathcal{H} \models \phi \;\;\Longleftrightarrow\;\; \exists n.\; R^{(n)} \models \phi.
$$
This is exactly Claim B. The classical compactness theorem holds because the ultrafilter lemma
gives a finite satisfaction in a term of the diagram. In the constructive/intuitionistic setting,
the analog requires explicit finite witnesses — which is what the conjecture provides.

---

#### What the Conjecture Requires {#decidability-requires}

**(a) Finiteness of hyperverse moduli** (expected from the tower construction): each
$\mathcal{M}^{(n)}$, the moduli space of nucleus families in $R^{(n)}$, is finite. This
is the hyperversal analog of §depth-filtration, where each $\mathcal{M}_n$ is finite.

**(b) Monotonicity of truth across levels**: if $\phi$ is true in $R^{(n)}$, it remains
true in $R^{(n+k)}$ for all $k \geq 0$. This is the hyperversal analog of the shadow
property (§shadow-of-the-future): truths settled at depth $n$ are not unset by
later extensions. The formal statement would be that the inclusions $R^{(n)} \hookrightarrow
R^{(n+1)}$ are conservative geometric morphisms for the relevant class of formulas.

**(c) Bounded quantifier depth**: universal quantification over $\mathbf{RU}_\mathcal{H}$
can be bounded to a finite initial segment $\mathbf{RU}^{(N)}$ without changing truth values.
This is the content of the conjecture that is not implied by (a) and (b) alone; it requires
that the tower does not introduce "new counterexamples" at arbitrarily high levels to
universally quantified sentences that were true at all finite levels.

**(d) Modal Collapse (conditional)**: if Modal Collapse holds, (c) follows from (a) and (b)
in the classical case. Without Modal Collapse, (c) requires a separate constructive argument.

**Status.** Stub. The ground-level compactness (finiteness of $\mathcal{M}_n$) is established.
Claim A (finite section witnessing) is near-theorem, conditional on BC coherence of the tower.
The full conjecture (Claim B) is the non-trivial part: it requires showing that universal
quantifiers ranging over $\mathbf{RU}_\mathcal{H}$ are witnessed at finite tower depth. This
is the hyperversal analog of the monotonicity of $\Delta$ at the ground level.
