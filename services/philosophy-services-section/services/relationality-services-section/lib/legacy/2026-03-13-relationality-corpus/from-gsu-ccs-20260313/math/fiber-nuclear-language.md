---
name: fiber-nuclear-language

description: "The nuclear Heyting-modal propositional calculus of the proposition fibers; two nuclear operators Saturate and Transfer realize the saturation and transfer nuclei of the fiber commutative nuclear square."
---

### Definition — Fiber Nuclear Language {#fiber-nuclear-language}

The **fiber nuclear language** FiberNuclearLanguage is the level-zero instance of the
[nuclear language](nuclear-language.md) pattern — the [nuclear language](nuclear-language.md)
of the proposition fibers (see [fiber](fiber.md)). It has:

- a single type $\mathsf{Prop}$ (interpreted in $H_t$); there are no function types
  or product types in FiberNuclearLanguage;
- contexts $\Gamma$ as finite lists of propositional variable assignments
  $x_1 : \mathsf{Prop}, \ldots, x_n : \mathsf{Prop}$;
- term formers at type $\mathsf{Prop}$ for the Heyting-nuclear structure:
  $$
  M \wedge N,\quad M \vee N,\quad M \Rightarrow_t N,\quad
  \mathsf{True},\ \mathsf{False},\quad
  \mathsf{Saturate}(M),\quad \mathsf{Transfer}(M),
  $$
  together with the equations expressing the Heyting algebra laws for
  $\wedge, \vee, \Rightarrow_t, \bot, \top$ and the nucleus axioms for
  $\mathsf{Saturate}$ and $\mathsf{Transfer}$.
  Here Saturate realizes the saturation nucleus $\sigma_t$ and Transfer
  realizes the transfer nucleus $\Delta_t$; see
  [saturation-transfer-dyad](saturation-transfer-dyad.md) for the
  phenomenological account of these names.

Typing judgments are written $\Gamma \vdash_t M : \mathsf{Prop}$ for each history $t$.

#### Denotation of the Nuclear Operators {#fiber-nuclear-language-denotation}

At history $t$:
$$
\llbracket \mathsf{Saturate}(M) \rrbracket_t \;:=\; \sigma_t\!\bigl(\llbracket M \rrbracket_t\bigr),
\qquad
\llbracket \mathsf{Transfer}(M) \rrbracket_t \;:=\; \Delta_t\!\bigl(\llbracket M \rrbracket_t\bigr).
$$

Saturate is the syntactic realization of the saturation nucleus $\sigma_t$;
Transfer is the syntactic realization of the transfer nucleus $\Delta_t$.

#### Nucleus Axioms at the Term Level {#fiber-nuclear-language-axioms}

The nucleus axioms manifest as term-level equations and reduction rules:

| Nucleus axiom | Saturate form | Transfer form |
|---|---|---|
| Extensive | $M \leq \mathsf{Saturate}(M)$ | $M \leq \mathsf{Transfer}(M)$ |
| Idempotent | $\mathsf{Saturate}(\mathsf{Saturate}(M)) \to \mathsf{Saturate}(M)$ (R1) | $\mathsf{Transfer}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(M)$ (R2) |
| Meet-preserving | $\mathsf{Saturate}(M \wedge N) \to \mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)$ (R3) | $\mathsf{Transfer}(M \wedge N) \to \mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N)$ (R4) |
| Top-preserving | $\mathsf{Saturate}(\mathsf{True}) \to \mathsf{True}$ (R5) | $\mathsf{Transfer}(\mathsf{True}) \to \mathsf{True}$ (R6) |

The commutativity of $\sigma_t$ and $\Delta_t$ (see [nucleus-commutation](nucleus-commutation.md)) is witnessed by:
$$
\mathsf{Saturate}(\mathsf{Transfer}(M)) \;\to\; \mathsf{Transfer}(\mathsf{Saturate}(M)) \qquad\text{(R7).}
$$

The full reduction system R1–R19$'$ is given in [reduction-system](reduction-system.md).

**Remark — The Level-Zero Instance.** {#remark-fml0-subscript} FiberNuclearLanguage is
the level-zero instance — the language of propositions about
histories in the base relational universe $R$. Higher tower levels carry analogous
level-$n$ nuclear languages; together these constitute the
[TowerNuclearLanguage](tower-nuclear-language.md) family. Their colimit is
the [HyperversalNuclearLanguage](hyperversal-nuclear-language.md).
That family structure is not yet in scope here; FiberNuclearLanguage
is the first encounter.

**Remark — Correspondence with the Mitchell–Bénabou Language.** {#remark-fml0-mitchell-benabou}
FiberNuclearLanguage is defined on its own terms — by the types, term formers, and equational
theory above. It corresponds to the propositional modal fragment of the Mitchell–Bénabou
language of $R = \mathbf{Sh}(T,J)$ (Johnstone, *Sketches of an Elephant* §D1.2):
FiberNuclearLanguage terms embed faithfully into the MB language, which extends further with
function types, product types, and the full CCC structure. This correspondence confirms
that FiberNuclearLanguage is well-grounded in the internal logic of $R$. It does not define
FiberNuclearLanguage by that relationship — FiberNuclearLanguage stands on its own as the nuclear
Heyting calculus of the fiber algebras. All core results in this paper are stated and
proved within FiberNuclearLanguage itself.

**Remark — Residuals and the Adjunction Chain.** {#remark-fml0-residuals}
The residual structure of the relational quantale (see [remark-fiber-quantale](fiber.md))
underlies the adjunction pattern in FiberNuclearLanguage.
The inclusion $Q^\ast_\sigma \hookrightarrow Q$ has a left adjoint $x \mapsto \sigma x$,
making $\sigma$ the counit of a reflective subcategory; dually for $\Delta$. In each
fiber $H_t$, where $\otimes = \wedge$ and residuals reduce to Heyting implication, this
becomes the standard $\wedge \dashv {\Rightarrow}$ adjunction. The FiberNuclearLanguage term
formers Saturate and Transfer are the syntactic realizations of the nuclear
reflections $\sigma_t$ and $\Delta_t$: the counit maps are witnessed at the term level
by the extensivity equations $M \leq \mathsf{Saturate}(M)$ and $M \leq \mathsf{Transfer}(M)$,
and the idempotency of the reflections is witnessed by the KZ reductions
$\mathsf{Saturate}(\mathsf{Saturate}(M)) \to \mathsf{Saturate}(M)$ and
$\mathsf{Transfer}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(M)$ (see [reduction-system](reduction-system.md)).
