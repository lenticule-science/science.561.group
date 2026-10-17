---
term-kind: object
status: conjectural
class: pro-object
symbol: \mathrm{AVALON}
aliases:
  - "AVALON"
  - "Abelian Vectored Adic Laplacian Operadic Nerve"
date-created: 2026-08-26
date-modified: 2026-08-26
depends-on:
  - ../../../../../../../content/text/glossary/terms/operad.md
  - ../../../../../../../content/text/glossary/terms/operadic-nerve.md
  - ../../../../../../../content/text/glossary/terms/nerve.md
  - ../../../../../../../content/text/glossary/terms/linearization.md
  - ../../../../../../../content/text/glossary/terms/dold-kan-correspondence.md
  - ../../../../../../../content/text/glossary/terms/dendroidal-complex.md
  - ../../../../../../../content/text/glossary/terms/chain-complex.md
  - ../../../../../../../content/text/glossary/terms/graded-vector-space.md
  - ../../../../../../../content/text/glossary/terms/hilbert-space.md
  - ../../../../../../../content/text/glossary/terms/abelian-category.md
  - ../../../../../../../content/text/glossary/terms/adic.md
  - ../../../../../../../content/text/glossary/terms/laplacianizer.md
  - ../../../../../../../content/text/glossary/terms/laplacianizability.md
  - ../../../../../../../content/text/glossary/terms/hodge-laplacian.md
see-also:
  - ../../../../../../../content/text/documents/articles/research-articles/moduli-of-laplacianizers.md
  - ../../../../../../../content/text/glossary/terms/moduli-of-laplacianizations.md
references:
  - key: may1972geometry
    type: book
    authors:
      - May, J. Peter
    year: 1972
    title: The Geometry of Iterated Loop Spaces
    publisher: Springer
  - key: moerdijkweiss2007dendroidal
    type: article
    authors:
      - Moerdijk, Ieke
      - Weiss, Ittay
    year: 2007
    title: Dendroidal sets
    journal: Algebraic & Geometric Topology
    volume: 7
    pages: 1441-1470
  - key: doldkan1958
    type: article
    authors:
      - Dold, Albrecht
    year: 1958
    title: Homology of symmetric products and other functors of complexes
    journal: Annals of Mathematics
  - key: gutierrezlukacsweiss2011dendroidal
    type: article
    authors:
      - Gutiérrez, Javier J.
      - Lukács, Andor
      - Weiss, Ittay
    year: 2011
    title: Dold-Kan correspondence for dendroidal abelian groups
    journal: Journal of Pure and Applied Algebra
    volume: 215
    pages: 1669-1687
    eprint: '0909.3995'
    eprinttype: arxiv
  - key: gk1994koszul
    type: article
    authors:
      - Ginzburg, Victor
      - Kapranov, Mikhail
    year: 1994
    title: Koszul duality for operads
    journal: Duke Mathematical Journal
    volume: 76
    number: 1
    pages: 203-272
  - key: pridham2010unifying
    type: article
    authors:
      - Pridham, J. P.
    year: 2010
    title: Unifying derived deformation theories
    journal: Advances in Mathematics
    volume: 224
    number: 3
    pages: 772-826
  - key: lurie2011dagx
    type: unpublished
    authors:
      - Lurie, Jacob
    year: 2011
    title: 'DAG X: Formal moduli problems'
---

# Abelian Vectored Adic Laplacian Operadic Nerve

**Status: conjectural**, but less so than the first two drafts of this entry. As originally stated, AVALON leaned on symmetric operads and an unestablished dendroidal generalization of the [Dold–Kan correspondence](../../../../../../content/text/glossary/terms/dold-kan-correspondence.md); the second draft posed that gap as a settling/quiescence question, by analogy with `Closure.SettlingMonotonicityQuiescence` elsewhere in this corpus. A literature check (2026-08-26) found that the analogy was solving the wrong problem: for **non-symmetric** operads, a genuine dendroidal Dold–Kan theorem is proved — Gutiérrez, Lukács & Weiss, "Dold–Kan correspondence for dendroidal abelian groups," *J. Pure Appl. Algebra* 215 (2011), 1669–1687 [@gutierrezlukacsweiss2011dendroidal] — and no settling process is needed there at all. This revision restricts AVALON's input to non-symmetric operads specifically so that step can cite a theorem instead of conjecturing one. The price of that restriction, and the two gaps it exposes in exchange, are stated plainly in the construction below: the cited theorem does not cover symmetric operads, and it does not land in ordinary chain complexes, so a further, genuinely unestablished step — turning its actual target, a [dendroidal complex](../../../../../../content/text/glossary/terms/dendroidal-complex.md), into something a Laplacian can act on — is now the load-bearing open question, not normalization itself.

## What the name parses as

Read right to left, each word adds one layer of structure to the last:

1. **Nerve** — present a piece of algebraic data as a presheaf: a family of sets, one per shape in some indexing category, built from composable diagrams in the data.
2. **Operadic** — the algebraic data being presented is a **non-symmetric** [operad](../../../../../../content/text/glossary/terms/operad.md) (no $S_n$-action; inputs are ordered, not merely labeled), and the indexing shapes are *planar* rooted [trees](../../../../../../content/text/glossary/terms/tree.md): the [operadic nerve](../../../../../../content/text/glossary/terms/operadic-nerve.md) on the planar tree category $\Omega_p$, not the full symmetric $\Omega$.
3. **Laplacian** — the operadic nerve is not left as bare combinatorics; it is, eventually, fitted with a compatible Hilbert structure realizing its cohomology as the kernel of a self-adjoint operator, in the sense of this corpus's [Laplacianizer](../../../../../../content/text/glossary/terms/laplacianizer.md) program — "eventually" because an extra step, absent from the ordinary Laplacianizer program, has to happen first; see Step 3.5 below.
4. **Adic** — this is not done once but along a filtered tower of operads, and the construction is carried through to the inverse limit of the tower: an [adic](../../../../../../content/text/glossary/terms/adic.md) completion, not a single stage.
5. **Vectored** — at each stage, the (Set-valued) operadic nerve is [linearized](../../../../../../content/text/glossary/terms/linearization.md) into vector spaces before anything else is done to it — every subsequent layer is built on vector-space, not merely set, data.
6. **Abelian** — the linearized, tree-shaped data is normalized into a [dendroidal complex](../../../../../../content/text/glossary/terms/dendroidal-complex.md) — an honest object of an [abelian category](../../../../../../content/text/glossary/terms/abelian-category.md) — via the now-established [dendroidal Dold–Kan theorem](../../../../../../content/text/glossary/terms/dold-kan-correspondence.md) [@gutierrezlukacsweiss2011dendroidal]. This is settled, but it is *not* the same as landing in an ordinary chain complex; see Step 3 below for why that distinction is the crux of the whole entry.

The construction below builds these in the order they are needed, which is not quite reading order; a remark after the definition explains why "Abelian" and "Vectored" are not redundant with each other despite both eventually landing in vector spaces.

## Construction

Fix a field $\Bbbk$ (typically $\mathbb R$, as in the rest of the Laplacianizer program).

**Input.** An *adic tower of non-symmetric operads*: a sequence of non-symmetric [operads](../../../../../../content/text/glossary/terms/operad.md) $\mathcal O_0, \mathcal O_1, \mathcal O_2, \ldots$ in $\mathbf{Set}$ (no $S_n$-action; composition maps only, on ordered inputs), together with operad maps $\pi_i: \mathcal O_{i+1} \twoheadrightarrow \mathcal O_i$ realizing $\mathcal O_i$ as $\mathcal O_\infty / I^{i+1}$ for a fixed operadic ideal $I$ of some ambient operad $\mathcal O_\infty$ — an operadic ideal being, as in Koszul duality for operads [@gk1994koszul], a sub-collection $I(n) \subseteq \mathcal O_\infty(n)$ absorbing under operadic composition (if any input or the output slot of a composite lies in $I$, so does the composite), so that each $\mathcal O_\infty / I^{k}$ is again an operad and the $\pi_i$ are honest operad maps. (Dropping the $S_n$-equivariance requirement from the classical operadic-ideal definition costs nothing here, since that requirement only bites for symmetric operads.)

**Step 1 (Operadic nerve).** Form the [operadic nerve](../../../../../../content/text/glossary/terms/operadic-nerve.md) $N\mathcal O_i$ of each stage: the *planar* dendroidal set with $N\mathcal O_i(T) = \mathrm{Hom}_{\mathbf{Operad}}(\Omega_p(T), \mathcal O_i)$ for each finite planar rooted tree $T \in \Omega_p$. The maps $\pi_i$ induce dendroidal maps $N\mathcal O_{i+1} \to N\mathcal O_i$, so $(N\mathcal O_i)_i$ is itself a tower.

**Step 2 (Vectored).** [Linearize](../../../../../../content/text/glossary/terms/linearization.md) each stage levelwise: $\Bbbk[N\mathcal O_i]$, a *dendroidal vector space* — a presheaf on $\Omega_p$ valued in $\mathbf{Vect}_\Bbbk$, the exact setting of [@gutierrezlukacsweiss2011dendroidal]'s $d\mathcal{Ab}$ (worked over a field rather than $\mathbb Z$). The tower structure survives, now as a tower of dendroidal vector spaces.

**Step 3 (Abelian).** Apply the dendroidal Dold–Kan normalization functor $\mathrm{Nm}: d\mathbf{Vect}_\Bbbk \to d\mathbf{Ch}_\Bbbk$ of [@gutierrezlukacsweiss2011dendroidal] — a genuine, proved adjoint equivalence, not a conjecture — to obtain
$$D_\bullet(\mathcal O_i) := \mathrm{Nm}\big(\Bbbk[N\mathcal O_i]\big) \in d\mathbf{Ch}_\Bbbk,$$
a [dendroidal complex](../../../../../../content/text/glossary/terms/dendroidal-complex.md): one vector space per planar tree, with a structure map for every face (inner or outer) of that tree, not a single sequence $C_n \to C_{n-1}$. This *is* the abelian-categorical object the name promises — $d\mathbf{Ch}_\Bbbk$ is an honest abelian category — but it is emphatically not a [chain complex](../../../../../../content/text/glossary/terms/chain-complex.md) in the sense the rest of this construction (built on the Laplacianizer program's single-differential Hodge machinery) actually needs. That gap is Step 3.5.

**Step 3.5 (Totalization — the open step).** Fix the total-degree function $\deg(T) := \#\mathrm{vertices}(T)$ on planar trees; every face map of $\Omega_p$, inner or outer, decreases $\#\mathrm{vertices}$ by exactly $1$, so $\deg$ is a legitimate grading to totalize against (the tree-shaped analogue of an ordinal $[n]$ having $n{+}1$ vertices, decreasing by $1$ under each simplicial face). Define
$$\mathrm{Tot}\big(D_\bullet(\mathcal O_i)\big)_m := \bigoplus_{T:\ \deg(T) = m+1} D(T), \qquad \partial := \sum_{\text{faces } \phi} \pm\, \phi,$$
the direct sum over trees of the right degree, with the total differential the signed sum of all face-structure maps — the standard recipe for totalizing a multicomplex whose squares anticommute pairwise. This is the natural, and probably the *only* natural, way to produce an ordinary $\mathbb N$-graded [chain complex](../../../../../../content/text/glossary/terms/chain-complex.md) from a dendroidal complex. Three things about it are not established, and are stated here as open rather than assumed: **(a)** that $\partial \circ \partial = 0$ actually holds — this follows from the standard multicomplex argument *if* every pair of faces of every tree anticommutes, which is what [@gutierrezlukacsweiss2011dendroidal]'s anticommuting-square axiom says for the cases checked here against a secondhand reading of the paper, not against its full precise statement; **(b)** that $\mathrm{Tot}$ preserves the invariant that matters — whether $H_\bullet(\mathrm{Tot}(D_\bullet(\mathcal O_i)))$ agrees with whatever homology-type invariant the cited theorem's own comparison result assigns to $D_\bullet(\mathcal O_i)$, the dendroidal analogue of $\pi_n(X) \cong H_n(NX)$, which this entry does not know the precise statement of; **(c)** that $\mathrm{Tot}$ commutes with the adic limit of Step 4 — totalizing each stage and then taking the limit, as done here, is not obviously the same object as taking the limit of dendroidal complexes first and totalizing the result, and no argument is offered for why the two should agree. Write $H^\bullet(\mathcal O_i) := H_\bullet(\mathrm{Tot}(D_\bullet(\mathcal O_i)))$ for the resulting *operadic cohomology* of the stage, contingent on (a)–(b) above.

**Step 4 (Adic).** The chain maps $\mathrm{Tot}(D_\bullet(\mathcal O_{i+1})) \to \mathrm{Tot}(D_\bullet(\mathcal O_i))$ induced by $\pi_i$ (assuming Step 3.5's totalization is at least functorial, which the construction does not separately establish) assemble the stages into a tower of chain complexes; form its inverse limit degreewise,
$$\widehat C_\bullet := \varprojlim_i \mathrm{Tot}\big(D_\bullet(\mathcal O_i)\big),$$
concretely the chain complex of *threads*: compatible families $(x_i)_i$, with each $x_i$ the image of $x_{i+1}$ — the same thread construction used for [adic](../../../../../../content/text/glossary/terms/adic.md) completions generally, and matching in shape the `InverseSystem`/`Thread` machinery already present in Obsmetrologia's own `Closure.InverseLimit` module (see [below](#connections-to-obsmetrologia)). Whether this limit exists as an honest chain complex, rather than merely a pro-object $\mathrm{Pro}(\mathbf{Ch}_{\ge0}(\mathbf{Vect}_\Bbbk))$, is its own settling question — the tower's closure ordinal, in the sense of the [next section](#connections-to-obsmetrologia). A classical sufficient condition is the Mittag–Leffler condition (images of the transition maps stabilizing); whether that is the *right* condition here, as opposed to a regime condition on this closure ordinal, is not established — see the caution there before treating the two as interchangeable.

**Step 5 (Laplacian).** Equip the tower with a *pro-Laplacianizer*: at each stage, a [Laplacianizer](../../../../../../content/text/glossary/terms/laplacianizer.md) $\mathfrak L_i = (F_i, d_i, \eta_i)$ lifting $\mathrm{Tot}(D_\bullet(\mathcal O_i))$ into graded [Hilbert spaces](../../../../../../content/text/glossary/terms/hilbert-space.md), chosen compatibly across the tower (the transition maps become maps of Hilbert chain complexes). The Hodge Laplacian $\Delta_{n,i} := d_{i,n+1} d_{i,n+1}^* + d_{i,n}^* d_{i,n}$ is then defined at every stage and every degree, and the compatible system $\widehat\Delta_n := (\Delta_{n,i})_i$ is the **adic Laplacian** of the tower. Nothing new is open at this step beyond what the ordinary Laplacianizer program already carries — provided Step 3.5 has actually produced a chain complex to build it on.

**Definition (AVALON).** The Abelian Vectored Adic Laplacian Operadic Nerve of a pro-Laplacianized adic tower of non-symmetric operads $(\mathcal O_i, \pi_i)_i$ is the triple
$$\mathrm{AVALON}(\mathcal O_\bullet) := \big(\widehat C_\bullet,\ \widehat d,\ \widehat\Delta\big) \in \mathrm{Pro}\big(\mathbf{Ch}_{\ge 0}(\mathbf{Hilb}_\Bbbk)\big),$$
the inverse limit of the Hilbert-normalized, totalized dendroidal complexes of the tower's operadic nerves, together with its adic Laplacian $\widehat\Delta$ — well-defined once Step 3.5's totalization is granted, and dependent on it otherwise.

**Conjecture (regime-dependent adic Hodge correspondence).** The working conjecture is that $\ker \widehat\Delta_n \cong \varprojlim_i H^n(\mathcal O_i) =: \widehat H^n(\mathcal O)$ holds exactly in the **strict** and **Scott** regimes of the tower's closure ordinal from Step 4 (in the sense of [Connections to Obsmetrologia](#connections-to-obsmetrologia) below), and need not hold in the transfinite-bounded or aperiodic regimes — stated by direct analogy with `Cohomology.LawvereHarmonicCohomology`'s proved theorem that Čech $H^1$ vanishes exactly in the strict and Scott regimes of *its* closure ordinal, and nowhere else.

This analogy is flagged, not asserted, and deliberately so. Obsmetrologia's own corpus contains exactly one prior attempt at a regime-to-invariant correspondence of this shape — `Closure.SettlementSpiral`'s proposed pairing of the four regimes with specific Pisot numbers — and it is explicitly disavowed there as unproven, and in the one case actually checked (Padovan against Fibonacci), *actively wrong*: the two settle in the *same* regime, not opposite ends of a strict/Scott split. Nothing here has been checked with anything like that rigor, and this conjecture now sits downstream of Step 3.5's three unverified points as well, so it carries their uncertainty in addition to its own. The honest content is two separate claims: (1) that the adic Hodge isomorphism is a *regime phenomenon* at all, contingent only on Step 4's limit behaving well; and (2) that *which* regimes it holds in matches the strict/Scott split found for the unrelated Lawvere-Laplacian construction — the part carrying real risk of being simply wrong, on the Padovan precedent. Claim (1) is the load-bearing one; claim (2) is a guess offered because *some* concrete guess is more useful to have wrong than no guess at all.

## Why the layers are not redundant

A natural objection: $\mathbf{Vect}_\Bbbk$ is already an [abelian category](../../../../../../content/text/glossary/terms/abelian-category.md), so what does "Abelian" add once the construction is already "Vectored"?

The two words are doing different jobs at different steps, and the distinction is sharper now than in earlier drafts of this entry. *Vectored* (Step 2) says the levelwise data — one vector space per tree shape $T$ — has linear structure; a dendroidal vector space by itself carries no differentials at all, only a diagram of vector spaces indexed by $\Omega_p$. *Abelian* (Step 3) says that diagram has been normalized — by an actual theorem — into a [dendroidal complex](../../../../../../content/text/glossary/terms/dendroidal-complex.md), an object with real differential-like structure maps living in a genuine abelian category. What Abelian does *not* do, and what earlier drafts of this entry conflated it with, is deliver an ordinary chain complex: a dendroidal complex has one structure map per face of a tree, and a tree generally has more faces than a linear order does, so there is no single canonical "the" differential until [Step 3.5](#construction) chooses one by totalizing. "Abelian" is therefore fully discharged by a citation; the harder work of getting to something a Laplacian can act on is a separate, still-open step, correctly located downstream of it rather than folded into it.

## Special cases

- **No adic tower** (constant tower, $\mathcal O_i = \mathcal O$ for all $i$, $I = 0$): AVALON degenerates to a single totalized, Hilbert-normalized dendroidal complex — an ordinary [Laplacianizer](../../../../../../content/text/glossary/terms/laplacianizer.md) of $(\text{planar trees}, H^\bullet(\mathcal O))$, contingent on Step 3.5 rather than open at the normalization step. This is the case in which the "Adic" qualifier is vacuous; it does not remove the totalization dependency.
- **$\mathcal O$ concentrated in arities $0, 1$** (an ordinary category $C$): $S_0$ and $S_1$ are both trivial, so this case is symmetric and non-symmetric simultaneously — the restriction to non-symmetric operads costs nothing here. The operadic nerve restricts to the classical [nerve](../../../../../../content/text/glossary/terms/nerve.md) $NC$, Step 3 restricts to the classical, fully settled [Dold–Kan correspondence](../../../../../../content/text/glossary/terms/dold-kan-correspondence.md) (linear trees have exactly one face per degree, so a dendroidal complex there already *is* an ordinary chain complex and Step 3.5's totalization is the identity), and AVALON of a constant such tower reduces exactly to the moduli-of-Laplacianizations picture of [moduli of Laplacianizations](../../../../../../content/text/glossary/terms/moduli-of-laplacianizations.md) applied to the cellular chain complex of $NC$. This is the sanity check that the general construction specializes correctly to already-understood territory, and it is now a *stronger* check than before: every step involved, including totalization, is uncontroversial in this case.
- **$I$-adic tower with $I$ a "weight" or "arity-truncation" ideal**: truncating $\mathcal O_\infty(n)$ to zero above some weight bound gives a tower with $\mathcal O_i(n)$ eventually stable for fixed $n$ and a finite base at each stage — the same finiteness hypothesis that forces the strict regime (`finiteBase → scottContinuous`, `finiteBase → countableCofinality`) in `Closure.Regime`'s four-regime dichotomy. Whether AVALON's own closure ordinal (Step 4's, the only one left) actually inherits strictness from this finiteness the way the spine's does is unchecked, but it is the natural first family of examples to check it on — and the first place to *check* the regime/Mittag–Leffler correspondence rather than assume it.

## Connections to Obsmetrologia

The following are noted as *suggestive, unverified* points of contact with material already present in Obsmetrologia's Lean development — not claims that any of it currently formalizes AVALON, or that the comparisons below have been checked.

- `Closure.Regime` formalizes the **four-regime dichotomy** invoked by Step 4: a closure ordinal $\kappa$ stratifies as **strict** ($\kappa < \omega$), **Scott** ($\kappa = \omega$), **transfinite-bounded** ($\omega < \kappa < \omega_1$), or **aperiodic** ($\kappa \ge \omega_1$) — mutually exclusive, jointly exhaustive, with regime-dependent cohomology ($H^1 = 0$ exactly in strict and Scott). `Closure.SettlingMonotonicityQuiescence` formalizes the companion notion: a closure operator's orbit from a seed, and *quiescence* (reaching a fixed point) as the Eilenberg–Moore condition — `quiescence ⟺ being a closure algebra`. An earlier draft of this entry (before the literature check above) also applied this apparatus to Step 3's normalization; that use has been retracted, since normalization is now a theorem with no orbit to settle. Its legitimate remaining use is at Step 4's limit alone, and `Closure.SettlementSpiral` remains the reason to treat even that use with real caution, not just vocabulary: it is the one place in the corpus where a regime-to-invariant correspondence of this shape was proposed and then checked, and found wrong in the one case tested.
- `Closure.InverseLimit` already formalizes exactly the general-purpose `InverseSystem`/`Thread` machinery that Step 4 above uses informally, and its module comment names a "two-adic residue tower" (`AperiodicOrder.Tiling.CollatzTwoAdicLock`) as a downstream instance — a genuinely adic tower already in the corpus, though not an operad and not (yet) equipped with any Laplacian structure. Whether that tower, or one built the same way from an operad of Collatz-type reductions, gives a nontrivial worked example of AVALON is open.
- `Cohomology.LawvereHarmonicCohomology` formalizes an order-theoretic Laplacian $L = \Box \circ \Diamond$ with a harmonic kernel compared against Čech $H^0/H^1$, and proves the regime split the Conjecture above borrows — $H^1 = 0$ exactly in strict/Scott. It is a different construction from the Hilbert-adjoint Hodge Laplacian used here (different Laplacian, different cohomology, different closure ordinal), so the borrowing is an analogy across constructions, not a shared theorem.
- `Site.Enriched` formalizes quantale-enriched ($Q$-enriched) categories and sheaves, an enrichment discipline distinct from but structurally parallel to the "Vectored" step above; whether the two enrichments interact is unexplored.
- `Cohomology.FrobeniusTQFT`, and Obsmetrologia's cobordism-flavored modules generally, are natural homes for operad algebras — but a Frobenius algebra is classically an algebra over a *symmetric* operad (2-dimensional TQFT does not privilege an ordering of inputs), so this connection point now sits on the open, not-yet-covered symmetric side of AVALON, not on the established non-symmetric core built above. Worth noting precisely because the restriction to non-symmetric operads made in this revision moves it there.

None of the above is a construction of AVALON, or a reduction of AVALON to existing Obsmetrologia machinery — it is a list of the places a future formalization attempt would most plausibly connect to work that already exists.

## Open questions

- **Totalization.** Does the functor $\mathrm{Tot}$ of Step 3.5 actually satisfy $\partial^2 = 0$ in general (not just in the linear-tree case), does it preserve whatever homological invariant [@gutierrezlukacsweiss2011dendroidal]'s own comparison theorem assigns to a dendroidal complex, and does it commute with the adic limit of Step 4? This is now the single largest gap between AVALON as stated and AVALON as a theorem — replacing "does dendroidal normalization exist" (resolved) with "does the standard totalization recipe actually work here, and in which order relative to the limit."
- **Symmetric extension.** Does the Gutiérrez–Lukács–Weiss equivalence extend from $\Omega_p$ (non-symmetric operads) to the full $\Omega$ (symmetric operads with $S_n$-actions), recovering the "Operadic" reading this entry originally used before narrowing it? This is a plain yes/no literature question, not obviously a settling/regime question — no evidence has been offered that it resembles the closure-ordinal pattern found elsewhere in this corpus, and it should not be dressed in that vocabulary without such evidence.
- **Existence of a pro-Laplacianizer.** Does any interesting adic tower of non-symmetric operads (beyond the constant and arity-truncation cases above) admit compatible Hilbert structures across every stage of $\mathrm{Tot}(D_\bullet(\mathcal O_i))$, or is compatibility an obstruction, as it sometimes is for lifting inner products along quotient maps?
- **Moduli.** The constant-tower special case reduces to (a categorical form of) the [moduli of Laplacianizations](../../../../../../content/text/glossary/terms/moduli-of-laplacianizations.md). Does the adic tower version have its own moduli — fibered over the moduli at each finite stage, itself stratified by the closure ordinal — and if so, is it pro-representable, in analogy with formal moduli problems built from towers of nilpotent dg Lie algebras or, more generally, algebras over an operad [@pridham2010unifying; @lurie2011dagx]?
- **Checking, not assuming, the regime correspondence.** Does the strict/Scott vs. transfinite-bounded/aperiodic split claimed for the adic Hodge isomorphism actually hold for Step 4's closure ordinal, or does it fail to line up with cohomology vanishing the way Padovan's and Fibonacci's closure ordinals failed to line up with the Pisot correspondence `SettlementSpiral` originally proposed? Checkable in principle for one concrete adic tower before it is checkable in general, and per that precedent should be checked on a concrete example before being trusted any further.
