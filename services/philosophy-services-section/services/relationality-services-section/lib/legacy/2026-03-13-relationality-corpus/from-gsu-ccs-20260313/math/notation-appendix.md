---

name: notation-appendix
description: "Topic: Conventions and Notation"
---

## Appendix B — Conventions and Notation {#notation-appendix}

### Definition — Set-Theoretic Foundations {#notation-appendix}

All mathematics is carried out in a Grothendieck universe $\mathcal{U}$ large enough to contain all
objects constructed from the step set $\Sigma$. Specifically: $\Sigma$ is a
$\mathcal{U}$-small set; the history category $T$ is $\mathcal{U}$-small; all fiber Heyting algebras
$H_t$ are $\mathcal{U}$-small; the sheaf topos $R = \mathbf{Sh}(T,J)$ is $\mathcal{U}$-locally
small. The terms "small" and "large" are used in the sense of this fixed universe. No large-cardinal
hypotheses beyond Grothendieck universes are assumed. All results are stated for a fixed but
arbitrary relational universe satisfying all eight axioms unless otherwise noted.

When the closure operator $U_G$ is defined (§closure-operator), we work in a background set
theory with classes (NBG-style or von Neumann–Bernays–Gödel) in which $\mathrm{Obj}(R)$ is a class
and subclasses and their intersections are defined.

### Glossary {#glossary}

- **History.** A commutation-equivalence class of finite step sequences; an element
  of the free history monoid $\mathbb{M}(\Sigma, I)$.
- **Witness.** A canonical representative of a history class; a minimal relational history
  for a proposition.
- **Restriction.** How propositions at a longer history retract to a shorter one — the
  contravariant action of $H$ on morphisms of $T$.
- **Gluing.** Propositions consistent on covering histories assemble uniquely to a
  proposition on the covered history.

### Symbol Index {#notation-symbols}

The following table collects the primary symbols used throughout, organized by category.

**History category and site:**

| Symbol | Meaning |
|---|---|
| $\Sigma$ | Finite step set |
| $I \subseteq \Sigma \times \Sigma$ | Independence relation (symmetric, irreflexive) |
| $\mathbb{M}(\Sigma, I)$ | Free history monoid |
| $[w]$ | Commutation-equivalence class of step sequence $w$ |
| $e$ | Empty history (monoidal unit) |
| $t \star u$ | History concatenation |
| $\mathrm{NF}(w)$ | Lexicographic normal form of $w$ |
| $T$ | History category (thin poset-category) |
| $t \leq t'$ | Prefix order: $t'$ has more history than $t$ |
| $T^{(n)}$ | Full subcategory of histories of depth $\leq n$ |
| $J$ | Grothendieck topology on $T$ |
| $(T,J)$ | History site |
| $y(t)$ | Representable sheaf $\mathrm{Hom}_T(-,t)$ |

**Fiber algebras:**

| Symbol | Meaning |
|---|---|
| $H_t$ | Fiber Heyting algebra at history $t$ |
| $\wedge_t, \vee_t$ | Meet and join on $H_t$ |
| $\Rightarrow_t$ | Heyting implication on $H_t$ |
| $\bot_t, \top_t$ | Least and greatest elements of $H_t$ |
| $\sigma_t$ | Saturation nucleus on $H_t$ |
| $\Delta_t$ | Transfer nucleus on $H_t$ |
| $\mathrm{Fix}(\sigma_t)$ | Fixed-point set of $\sigma_t$ |
| $\mathrm{Fix}(\Delta_t)$ | Fixed-point set of $\Delta_t$ |
| $H_t^\ast$ | Doubly quiescent layer $\mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ |
| $\mathbf{HA_{nucl}}$ | Category of finite Heyting algebras with two commuting nuclei |

**Sheaves and the Relational Universe:**

| Symbol | Meaning |
|---|---|
| $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ | Propositional presheaf (reindexing functor) |
| $\rho_{t,t'}$ | Restriction map $H(t') \to H(t)$ for $t \leq t'$ |
| $R = \mathbf{Sh}(T,J)$ | Relational universe (Grothendieck topos) |
| $H \in R$ | Distinguished Heyting-modal object of $R$ |
| $H^\ast \subseteq H$ | Fixed subsheaf |
| $\Omega$ | Subobject classifier of $R$ |
| $[-, -]$ | Internal hom in $R$ |
| $H^\vee = [H, \Omega]$ | Observation sheaf |
| $(H^\vee)^\ast$ | Fixed observation subsheaf |

**Dynamics and dynamics:**

| Symbol | Meaning |
|---|---|
| $\circledast$ | History convolution (Day convolution) on $R$ |
| $\mathbf{1}$ | Unit object of $(R, \circledast)$ (terminal sheaf $\cong y(e)$) |
| $G_s$ | Directed comonad (precomposition by step $s$) |
| $\epsilon : G_s \Rightarrow \mathrm{Id}$ | Counit (restriction to shorter prefix) |
| $\nu : G_s \Rightarrow G_s \circ G_s$ | Comultiplication (double-extension); $\nu_s$ for the map, $\nu_X$ for its action on $X \in R$ |
| $\mathrm{coKl}(G_s)$ | CoKleisli category of $G_s$ |
| $U_G$ | Generative universe closure operator |
| $A$ | Atomic class $\{y(t)\}_{t \in T} \cup \{H\}$ |
| $\mathcal{F}$ | Finite family of structural operations (Axiom of Generative Basis) |
| $R_{\mathrm{gen}}$ | Generated sub-universe |
| $\mathcal{M}_n$ | Moduli space of depth-$n$ nucleus families |

**Invariant locale and spectral theory:**

| Symbol | Meaning |
|---|---|
| $\mathsf{Phase}$ | Invariant locale (internal phase space) |
| $\mathcal{O}(\mathsf{Phase}) = H^\ast$ | Frame of opens of $\mathsf{Phase}$ |
| $\mathsf{Saturate} : H \to H^\ast$ | Stabilization map |
| $T^\sharp : H^\ast \to H^\ast$ | Induced dynamics on opens |
| $K$ | Coefficient ring (e.g., $\mathbb{R}$) |
| $V$ | Sheaf of invariant modes |
| $V_t = K^{H_t^\ast}$ | Fiber of $V$ at history $t$ |
| $\delta_t : V_t \to V_t$ | Defect operator fiber |
| $E_\lambda \subseteq V$ | Eigenspace subsheaf for eigenvalue $\lambda$ |
| $H^n(T,J;\,\mathcal{V})$ | Sheaf cohomology group |
| $\Gamma(\mathcal{V})$ | Global sections functor |

**Language:**

| Symbol | Meaning |
|---|---|
| FiberNuclearLanguage | Fiber nuclear language (nuclear Heyting-modal propositional calculus) |
| $\mathsf{Prop}$ | Base type in FiberNuclearLanguage |
| $\Gamma \vdash_t M : A$ | Typing judgment at history $t$ |
| $\llbracket M \rrbracket_t$ | Denotation of term $M$ at history $t$ |
| $\mathsf{Saturate}(M)$ | Modal term former for saturation nucleus |
| $\mathsf{Transfer}(M)$ | Modal term former for transfer nucleus |

### Conventions Governing This Document {#notation-conventions}

**Axiom names.** Eight axioms appear across the four main sections, each named by its mathematical
role: Histories and Fiber Algebras in §history-and-fiber-algebra; Fiber Language in §modal-calculus; Reindexing, Relational
Faithfulness, Locality, and Stability in §sheaf-construction; Generative Basis in §closure-and-self-generation.

**Prefix order direction.** The prefix order on histories is **natural**: $t \leq t'$ means $t'$ has
*more* history than $t$. Do not reverse this.

**Presheaf convention.** All sheaves and presheaves on $T$ are **contravariant**: restriction maps
go from longer histories to shorter ones, i.e., $H(t') \to H(t)$ for $t \leq t'$.

**Heyting implication.** Written $\Rightarrow_t$; not to be confused with set-theoretic implication
$\Rightarrow$ or the type-theoretic arrow $\to$.

**Normalization-move description superseded.** Earlier presentations of the relational universe axioms described
morphisms of $T$ as "normalization sequences" (deletion, commutation, reassociation). That language
describes how two step sequences in $\Sigma^\ast$ are identified as the *same object* of $T$ (the same
commutation-equivalence class), not as arrows between distinct objects. The thin-preorder structure
described in §history supersedes the earlier rewriting-category framing. All downstream
constructions use the preorder convention exclusively.

**Section references.** All cross-references use `{#custom-id}` anchors. No section is referenced
by number, since section numbers break when content moves.

**Claim labeling.** All claims are labeled (Definition, Axiom, Proposition, Theorem, Corollary,
Conjecture, Remark, Construction). Unlabeled assertions are not made. Proofs are either given in
full or explicitly marked as sketches. The only conjecture in this document is the Conjecture —
Fischer-Rao Convergence (§fischer-rao-convergence).

**Axiom–Theorem boundary.** The Theorem of Least Fixed Point (§self-generation) marks the point
at which the axioms become provable properties of $R$. All claims before that theorem in §closure-and-self-generation
are axioms or consequences of previously stated axioms. All claims after it are theorems about the
constructed object $R$.
