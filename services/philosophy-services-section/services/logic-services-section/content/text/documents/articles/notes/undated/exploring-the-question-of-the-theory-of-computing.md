---
type: prose
class: research
status: draft
title: Exploring the question of the theory of computing
description: What is computation, formally?
---

# Exploring the question of the theory of computing

## The question

What is computation, formally? Not "what is a computer" or "what can computers do" — those are answered by Turing machines, the Church-Turing thesis, and a century of computer science. The question here is structural: in the sense of Curry-Howard-Lambek, where a mathematical theory is a category whose objects are types and whose morphisms are proofs (programs), what category is the theory of computing?

This is not a question about any particular programming language or computational model. It is the question of what mathematical object — what category, topos, or logical system — has the computable functions as its morphisms and computability as its internal logic.

The answer matters because it determines what "subtheory" means. Without a canonical mathematical structure for computing, the question of which disciplines (type theory, complexity theory, process calculi) are subtheories of computing reduces to organizational choice rather than mathematical fact. It also determines the correct truth algebra for computational predicates: whether Boolean logic suffices at the meta-level, or whether something richer is forced by the structure of computation itself.

## Three levels, one construction

The first observation is that the theory of computing is not a single structure but three nested levels of the same construction. Each adds internal logical power, and the choice of level is determined by which properties must be internal theorems rather than axioms.

**Level (a): Turing categories.** A Turing category (Cockett-Hofstra 2008) is a restriction category equipped with a Turing object $T$: for every partial map $f: A \rightharpoonup B$ there exists a code $\lceil f \rceil: 1 \to T$ with $\mathrm{eval} \circ (\lceil f \rceil \times \mathrm{id}_A) = f$. The category $\mathbf{Asm}(\mathcal{K}_1)$ of assemblies over Kleene's first algebra $\mathcal{K}_1 = (\omega, \cdot)$ is a Turing category with $\mathcal{K}_1$ as Turing object. At this level, Church-Turing is the structural axiom of universality — built into the definition, not proven. There is no internal logic, no internal first-order quantification over programs.

**Level (b): CCC with dominance.** Adding a partial-map classifier $\Sigma \hookrightarrow \Omega$ (a meet-semilattice of admissible subobjects, Rosolini 1986) gives a cartesian closed category with dominance. Modest sets (partitioned assemblies) over $\mathcal{K}_1$ form such a category; Scott domains are modest sets, which is why denotational semantics for typed languages lives at this level. But modest sets lack a subobject classifier and therefore lack internal predicate logic. Statements like "no algorithm decides halting" cannot be expressed internally — they live only in the external meta-language.

**Level (c): Realizability topos.** The exact completion $\mathbf{Eff} = \mathrm{ex}(\mathbf{Asm}(\mathcal{K}_1))$ (Carboni-Celia Magno 1982; Hyland 1982) adjoins quotients of all equivalence relations and produces a full elementary topos. Its subobject classifier $\Omega_{\mathbf{Eff}}$ is isomorphic to the internal Heyting algebra of r.e. propositions over $\mathcal{K}_1$. $\mathbf{Eff}$ has internal first-order quantification over programs, and Church-Turing is an internal theorem.

## Why level (c) is the minimum

Level (b) is sufficient for denotational semantics of specific typed calculi. Level (a) is sufficient for the computational infrastructure — the existence of universal machines. But neither can state, let alone prove, the characteristic theorems of computability theory.

The halting undecidability theorem requires three things internal to the theory: (i) a subobject classifier $\Omega$ so that $\mathrm{halt}: \mathbb{N} \times \mathbb{N} \to \Omega$ is a well-formed internal predicate; (ii) the exponential $\mathbb{N} \times \mathbb{N} \to \mathbf{2}$ as an internal object, so "all total Boolean functions" can be quantified over; (iii) Kleene's second recursion theorem as an internal theorem, so the fixed-point in the diagonal argument can be constructed inside the logic. Level (b) lacks (i). Level (a) lacks all three. $\mathbf{Eff}$ has all three: $\Omega_{\mathbf{Eff}}$ is the lattice of r.e. propositions; the Turing object provides universality and the recursion theorem; quantification over all programs is internal. The proof of halting undecidability runs internally in $\mathbf{Eff}$ as the diagonal argument: assume a total Boolean decider $d$ for $\mathrm{halt}$; construct by Kleene's second recursion theorem a program $c$ with $\phi_c(n) \downarrow \Leftrightarrow d(c, n) = 0$; derive $\mathrm{halt}(c, c) \Leftrightarrow \neg\mathrm{halt}(c,c)$, a contradiction.

Rice's theorem follows the same route: it requires quantifying over all behavioral predicates (functions $\mathbb{N} \to \mathbf{2}$ extensional with respect to computed functions), which is an internal first-order statement in $\mathbf{Eff}$'s language and unstatable at levels (a) or (b).

**The minimum level for the theory of computing is (c).** Level (b) is the correct level for typed programming language semantics; level (a) is the correct level for the computational infrastructure; but the theory whose internal logic encodes what is derivable about computation as such requires $\mathbf{Eff}$.

## The canonical base

The choice of $\mathcal{K}_1 = (\omega, \cdot)$ — Kleene application: $a \cdot b = \varphi_a(b)$ — is not arbitrary. Two properties make it canonical for discrete computation. *Minimality*: the total functions $\mathbb{N} \to \mathbb{N}$ realizable in $\mathcal{K}_1$ are exactly the partial recursive functions — no more. *Universality*: every Turing-complete PCA $A$ admits an applicative morphism $\mathcal{K}_1 \to A$, because any Turing-complete system can simulate Kleene application. These make $\mathcal{K}_1$ the initial Turing-complete PCA: every Turing-complete PCA is a $\mathcal{K}_1$-algebra. Under the Church-Turing thesis, $\mathcal{K}_1$ is not canonical by fiat but canonical because it is the unique (up to PCA isomorphism) minimal such structure.

Different PCAs yield different realizability toposes: $\mathcal{K}_2$ (Kleene's second algebra, continuous functions on Baire space) gives $RT(\mathcal{K}_2)$, the function-realizability topos for continuous computation. An applicative morphism $\mathcal{K}_1 \to \mathcal{K}_2$ exists (every partial recursive function is continuous on Baire space), inducing a geometric morphism $\mathbf{Eff} \to RT(\mathcal{K}_2)$ — but not the converse. Continuous computation is therefore a larger theory connected to $\mathbf{Eff}$ by a one-directional geometric morphism. The 2-category of realizability toposes is equivalent to the 2-category of ordered PCAs (Hofstra-van Oosten 2003): geometric morphisms between realizability toposes correspond exactly to ordered applicative morphisms. This makes $\mathbf{oPCA}$ the right meta-level for realizability-based paradigms — but only for those paradigms. Interactive and nominal computation lie outside $\mathbf{oPCA}$ entirely.

## Rice's theorem and the four-valued truth

Rice's theorem forces undecidability into any theory that includes behavioral predicates of programs. The external truth structure for computational predicates is therefore four-valued, not two-valued: *verified* ($\mathbf{t}$, the predicate has a realizer and its negation does not), *refuted* ($\mathbf{f}$, the negation has a realizer and the predicate does not), *undecidable* ($\bot$, forced by Rice for all non-trivial behavioral predicates — the predicate has no realizer and neither does its negation, in the double-negation sense), or *contradictory* ($\top$, logically impossible in a consistent theory). This is the bilattice $\mathbf{FOUR} \cong \mathbf{2} \times \mathbf{2}$.

Importantly, $\mathbf{FOUR}$ is not an external structure imposed on $\mathbf{Eff}$ from outside. It is internally derived. In $\mathbf{Eff}$, the double-negation map $j = \neg\neg$ is an internal endomorphism of $\Omega_{\mathbf{Eff}}$ — a Lawvere-Tierney nucleus. The $j$-sheaves form the classical subtopos, whose subobject classifier is $\mathbf{2}$ (Boolean). For any proposition $P$ in $\mathbf{Eff}$, the positive-realizability pair $\rho(P) = (\neg\neg P, \neg\neg\neg P) \in \mathbf{2} \times \mathbf{2}$ takes exactly the four values of $\mathbf{FOUR}$. The map $\rho: \Omega_{\mathbf{Eff}} \to \mathbf{FOUR}$ is the image of $\Omega_{\mathbf{Eff}}$ under the double-negation nucleus — an internal construction. $\mathbf{FOUR}$'s four-valued structure is a categorical consequence of $\mathbf{Eff}$'s double-negation topology, not a stipulation added from outside.

## The unification problem

$\mathbf{Eff}$ is canonical for discrete Turing-complete computation. But computation does not reduce to Turing computation.

*Continuous computation* lives in $RT(\mathcal{K}_2)$ — a sibling topos, not a subtheory. No applicative morphism $\mathcal{K}_2 \to \mathcal{K}_1$ exists (the fan functional, which computes uniform moduli of continuity on Cantor space, is $\mathcal{K}_2$-realizable but not recursive); accordingly no geometric morphism $RT(\mathcal{K}_2) \to \mathbf{Eff}$ exists.

*Interactive and distributed computation* — process calculi, concurrency, fresh name generation — is modeled in the nominal-sets topos $\mathbf{Sets}^{\mathbf{I}}$ (the Fraenkel-Mostowski topos for the category $\mathbf{I}$ of finite sets and injections) and in game-semantic categories (Hyland-Ong innocent strategies, Abramsky-Melliès strategies). Neither is a realizability topos. The nominal-sets topos carries a global action of the infinite symmetric group $S_\infty$ incompatible with the discrete application structure of any PCA. No ordered applicative morphism from any PCA into a PCA modeling $S_\infty$-actions exists; correspondingly no geometric morphism from $\mathbf{Sets}^{\mathbf{I}}$ into any realizability topos exists. Game-semantic categories have no Turing object and are not realizability categories.

The question of whether a unified mathematical framework exists for all computational paradigms — one that contains $\mathbf{Eff}$, game semantics, and nominal sets as objects with computational morphisms between them — was the central open problem.

## The *-autonomous world and the typed theory

The first partial resolution: the *typed* fragments of all three paradigms converge in a single $*$-autonomous framework.

**Realizability (typed fragment).** The Dialectica category $\mathbf{Dial}(\mathbf{Eff})$ (Hyland 2002) is a $*$-autonomous category. By the Girard decomposition, any CCC embeds into the Kleisli category of the $!$ comonad on an ambient $*$-autonomous category: $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$. The typed fragment of realizability-based computation lives in $\mathbf{Dial}(\mathbf{Eff})$.

**Game semantics.** Hyland-Ong game categories (innocent strategies, 1996) are cartesian closed and give a fully abstract model for PCF. Lifted to the Abramsky-Melliès framework, game categories are $*$-autonomous directly (Abramsky-Melliès 1999). The PCF full abstraction theorem establishes that the denotational functor $\llbracket - \rrbracket$ from the realizability-based operational semantics of PCF to the game-semantic model is fully faithful on observational equivalence classes — a tight morphism between the two paradigms.

**Session-typed concurrency.** The Caires-Pfenning correspondence (2010, "Session types as intuitionistic linear propositions"; Wadler 2012, "Propositions as sessions") establishes Curry-Howard for session types and classical linear logic: a session type $S$ on a channel corresponds to a CLL proposition, a session-typed process $P \vdash x: S$ corresponds to a proof, and channel communication corresponds to cut-elimination. Session-typed π-processes embed into the Kleisli category of $!$ on a $*$-autonomous model of CLL.

All three typed theories land in the $*$-autonomous world. The subtheory lattice of the typed theory of computing is the lattice of linear logic fragments: MLL $\subset$ MALL $\subset$ \{ILL, CLL\} $\subset$ LL, each a $*$-autonomous sub-theory of the ambient. This lattice is fully known, with all embeddings explicit.

But which $*$-autonomous category? Three paradigms, each with its own ambient — $\mathbf{Dial}(\mathbf{Eff})$, the Hyland-Ong game category, the CLL model for session types. Are these the same $*$-autonomous category or three separate siblings that happen to share linear logic structure?

## Concurrent games with symmetry as the unified ambient

The answer is $\mathbf{CGS}$ — concurrent games with symmetry (Rideau-Winskel 2011, "Concurrent strategies"; Castellan-Clairambault-Winskel 2014, "Symmetry in concurrent games"; 2017, "The parallel intensionally fully abstract games model of PCF").

$\mathbf{CGS}$ is a $*$-autonomous category whose objects are prime event structures $(E, \leq, \#)$ equipped with a symmetry groupoid $\tilde{E}$ — bijections on $E$ preserving the causal order $\leq$ and conflict relation $\#$. Morphisms from $A$ to $B$ are equivalence classes of concurrent strategies $\sigma: S \to A \| B$: maps of event structures into the parallel composition, satisfying receptivity (P must be able to respond to any O-move), innocence (P's response depends only on the current "view," not the full history), and symmetry-invariance (the strategy respects the symmetry groupoids of both arenas). The $*$-autonomous structure: $A^\perp$ reverses the Player/Opponent labeling of events; the monoidal product is parallel composition $A \| B$.

**Sequential game semantics** embeds as the full sub-$*$-autonomous-subcategory of *deterministic* concurrent strategies — those where at most one P-move is enabled after any history. The view-innocence condition for Hyland-Ong strategies is a finiteness condition that is preserved by the symmetry quotient. The Hyland-Ong category of innocent strategies is therefore exactly the symmetric-trivial, deterministic sub-$*$-autonomous-subcategory of $\mathbf{CGS}$.

**Nominal computation** enters through the symmetry apparatus without any additional structure being added. If the symmetry groupoid of an arena $A$ contains the finite permutations $\mathrm{FSym}(\mathbb{A})$ of a countably-infinite name set $\mathbb{A}$, strategy equivalence classes track which name-permutations the strategy treats as interchangeable — precisely the $\mathrm{FSym}(\mathbb{A})$-equivariance condition defining nominal sets (Gabbay-Pitts 1999). Abramsky, Ghica, Murawski, Ong, and Stark (2004, "Nominal games and full abstraction for the ν-calculus") established full abstraction for the ν-calculus — fresh-name allocation without name-passing — in this framework. The ν-calculus model sits inside $\mathbf{CGS}$ with $\mathrm{FSym}(\mathbb{A})$-symmetric arenas.

**Session-typed concurrency** embeds via the Caires-Pfenning correspondence directly into the $*$-autonomous structure of $\mathbf{CGS}$, as session-typed processes correspond to CLL proofs and $\mathbf{CGS}$ is $*$-autonomous.

Three paradigms, one ambient. The full-abstraction theorems for PCF (Hyland-Ong 1996) and the ν-calculus (AGMOS 2004) are tight morphisms from the realizability-based and nominal-set-based operational models, respectively, into $\mathbf{CGS}$. In framed-bicategory terms (Shulman 2008), $\mathbf{CGS}$ provides both the tight horizontal morphisms (the full-abstraction functors) and the loose morphisms (game strategies as computational simulations between paradigms).

## The Dialectica functor: resolving the typed/untyped split

The remaining question was whether $\mathbf{Eff}$ itself — not merely its typed fragment via $\mathbf{Dial}(\mathbf{Eff})$ — embeds into $\mathbf{CGS}$. This is the question of whether the typed and untyped theories are competing candidates for "the theory of computing" or two levels of the same structure.

The resolution: a $*$-autonomous functor $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ exists, and its Kleisli extension embeds $\mathbf{Eff}$ into $\mathbf{CGS}$.

The construction is direct and follows from recognizing the interaction structure that the Dialectica category encodes. In $\mathbf{Dial}(\mathbf{Eff})$, an object $(U, X, \alpha)$ has P-move type $U$ (the witness Player commits) and O-move type $X$ (the challenge Opponent provides), with computable acceptance condition $\alpha: U \times X \to \Omega_{\mathbf{Eff}}$. The crucial observation: the interaction is *concurrent*, not alternating. Player commits witness $u \in U$ and Opponent commits challenge $x \in X$ simultaneously, with no causal ordering between the two commitments. This is not the sequential Hyland-Ong interaction (where Opponent moves first and Player responds), but a genuinely concurrent one — and concurrent games with symmetry is precisely the framework for concurrent interaction.

The functor $F$ maps:

- *Objects*: $(U, X, \alpha) \mapsto$ the concurrent game arena in $\mathbf{CGS}$ with P-events $U$, O-events $X$, trivial causal order (all events concurrent — no event causally precedes another), conflict among distinct P-events ($u \# u'$ for $u \neq u'$: only one witness is committed per play), conflict among distinct O-events ($x \# x'$: only one challenge per play), no conflict between P and O events (any pair $(u, x)$ is a valid concurrent play), and trivial symmetry groupoid (no non-identity automorphisms: no names to permute).

- *Morphisms*: $(f, F): (U, X, \alpha) \to (V, Y, \beta)$ — where $f: U \to V$ and $F: U \times Y \to X$ satisfy $\alpha(u, F(u,y)) \leq \beta(f(u), y)$ — maps to the concurrent strategy in $\mathbf{CGS}$: given O commits challenge $y \in Y$ in the target arena, Player simultaneously commits $f(u) \in V$ as the target witness (derived from the source witness $u$) and simulates $F(u,y) \in X$ as the corresponding source-game O-challenge, closing the compound arena $A^\perp \| B$.

The $*$-autonomous structure is preserved by construction:
- $F(A \otimes B) = FA \| FB$: the Dialectica tensor $(U \times V, X^V \times Y^U, \gamma)$ — where the P-type is a product and the O-type encodes the "each-or-any" function-space of concurrent plays — is exactly the parallel composition of the two concurrent arenas.
- $F(A^\perp) = (FA)^\perp$: the Dialectica dual $(X, U, \alpha^{\mathrm{op}})$ swaps P and O types and transposes the acceptance condition, which is exactly the arena role-swap operation in $\mathbf{CGS}$.

The functor is fully faithful. $(f_1, F_1) \neq (f_2, F_2)$ as computable functions implies distinct concurrent strategies (each strategy uniquely determines the pair $(f, F)$ from its concurrent execution structure). Every concurrent computable strategy with trivial symmetry over a Dialectica arena arises from some $(f, F)$ — the image is a full sub-$*$-autonomous-subcategory.

The image of $F$ is the full sub-$*$-autonomous-subcategory of $\mathbf{CGS}$ of *concurrent computable games with trivial symmetry*: discrete, non-interactive, non-nominal computation where both Player and Opponent commit their moves concurrently. This fragment is distinct from the sequential Hyland-Ong sub-$*$-autonomous-subcategory. Neither contains the other. Both are genuine sub-$*$-autonomous-subcategories of $\mathbf{CGS}$.

The Kleisli extension: the $!$ comonad on $\mathbf{Dial}(\mathbf{Eff})$ (Hyland 2002) turns each arena $(U, X, \alpha)$ into the "repeatable" arena $!(U, X, \alpha)$, where Player chooses a computable function $f: X^* \to U$ responding to any finite sequence of O-challenges with a witness, and the compound game can proceed through multiple rounds. The Kleisli category $\mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$ is the CCC of computable higher-type functionals — equivalent to $\mathbf{Eff}$ as a model of intuitionistic higher-type arithmetic HAω (the Dialectica-realizability equivalence: both $\mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$ and $\mathbf{Eff}$ model the same computable mathematics). The functor $F$ extends to $F^!: \mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \to \mathcal{Kl}(!_{\mathbf{CGS}})$, embedding $\mathbf{Eff}$ into the Kleisli sub-CCC of $\mathbf{CGS}$'s concurrent computable fragment.

## The complete picture

The theory of computing is $\mathbf{CGS}$.

All deterministic computational paradigms with typed presentations embed into $\mathbf{CGS}$ as full sub-$*$-autonomous-subcategories or Kleisli sub-CCCs:

| Paradigm | Structure in $\mathbf{CGS}$ |
|---|---|
| Sequential typed computation (PCF, Hyland-Ong) | Full sub-$*$-autonomous-subcategory of deterministic innocent strategies, trivial symmetry |
| Nominal computation (ν-calculus, AGMOS 2004) | Full sub-$*$-autonomous-subcategory of strategies with $\mathrm{FSym}(\mathbb{A})$-symmetric arenas |
| Session-typed concurrency (Caires-Pfenning 2010) | CLL fragment of the $*$-autonomous structure |
| Turing-complete computation ($\mathbf{Eff}$) | Kleisli sub-CCC $F^!(\mathbf{Eff}) \subseteq \mathcal{Kl}(!_{\mathbf{CGS}})$, concurrent computable strategies with trivial symmetry |

Sequential (PCF) and Turing-complete (Dialectica) computation are distinct sub-structures of $\mathbf{CGS}$ that meet at the PCF fragment — which admits both the Hyland-Ong full abstraction (sequential view) and the Dialectica-realizability equivalence (concurrent functional view). PCF computation has two dual descriptions inside $\mathbf{CGS}$.

Rice's theorem propagates into this picture cleanly: it is an internal theorem of $\mathbf{Eff}$ (the Turing-complete fragment), and it is carried into $\mathbf{CGS}$ via $F^!$ as a structural property of the concurrent computable sub-CCC. $\mathbf{FOUR}$, internally derived from $\mathbf{Eff}$'s double-negation nucleus, is the truth-value object of that sub-CCC — the four-valued structure of computational truth is a derived feature of $\mathbf{CGS}$'s concurrent computable fragment, not an external stipulation.

The subtheory lattice of $\mathbf{CGS}$ — and therefore of the theory of computing for the typed case — is the lattice of linear logic fragments: MLL $<$ MALL $<$ \{ILL, CLL\} $<$ LL. Each level is a $*$-autonomous sub-theory of the ambient, with explicit embeddings. The untyped subtheory lattice (the nucleus lattice of $\mathbf{Eff}$, between $\mathrm{id}$ and $\neg\neg$) is a derived structure — the nucleus lattice corresponds, via the Kleisli construction, to a fragment of the ILL subtheory lattice of $\mathbf{CGS}$.

## What remains open

Two things remain genuinely open.

**The Dialectica-realizability categorical equivalence.** The embedding $F^!$ carries load from the claim that $\mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \simeq \mathbf{Eff}$ is an exact categorical equivalence of CCCs — same morphism sets, not merely same validated sentences. Hyland (2002) establishes the model-theoretic equivalence (both satisfy the same sentences of HAω). Whether the equivalence is exact categorically — whether the two categories have the same morphisms, not just the same theorems — is the residual open point. If it fails to be exact, $F^!$ maps $\mathbf{Eff}$'s logic into $\mathbf{CGS}$ but may identify morphisms that $\mathbf{Eff}$ distinguishes; the embedding would be faithful but not full.

**Probabilistic and untyped name-passing computation.** Probabilistic computation (Danos-Harmer 2002 probabilistic game semantics) uses measure-theoretic fibrations over game arenas, incompatible with the discrete event-structure combinatorics of $\mathbf{CGS}$: probability requires taking convex combinations of strategies, and the event-structure monoidal structure does not support a canonical such operation. The untyped π-calculus (dynamically allocated names without session typing) requires infinitely-supported symmetry groups in the game arenas — structures that violate $\mathbf{CGS}$'s finitely-supported symmetry groupoid axioms. These two paradigms remain outside the unified framework. Whether an extension of $\mathbf{CGS}$ accommodates them — or whether they require a genuinely different ambient — is the frontier of the question.

Within those boundaries, the theory of computing has a mathematical answer: it is $\mathbf{CGS}$, the $*$-autonomous category of concurrent games with symmetry, containing all deterministic computational paradigms as derived fragments of a single structure.
