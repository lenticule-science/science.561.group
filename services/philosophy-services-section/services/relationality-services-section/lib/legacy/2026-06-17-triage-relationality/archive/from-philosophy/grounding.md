---
title: "Grounding"
description: "A Ground is a relation Ground(A, t, B, k) — a fiber element A, a history t, a grounded element B, and a grounding kind — asserting that A is the explanatory foundation of B at t."
extends: Relation
requires: [evidence, history]
enables: foundation
acts-on: proposition
minimum-math: relational-history-fiber-saturating-nucleus
date-created: 2026-03-18
date-modified: 2026-03-20
---

# Ground

## Formal definition

A **Ground** is a relation $\mathrm{Ground}(A,\; t,\; B,\; k)$:

$$\mathrm{Gr} = (A \in H_t,\;\; t \in T,\;\; B \in H_t,\;\; k \in \{\sigma, \Delta, \pi\})$$

where:
- $A \in H_t$ is the **ground element** — the fiber element providing the explanatory foundation; the content the nucleus closes over to reach $B$; what $B$ holds *in virtue of*
- $t \in T$ is the **history** — the base point at which the grounding relation is assessed; grounding is not a global structure but a relation at a specific history in $T$
- $B \in H_t$ is the **grounded element** — the fiber element whose status depends on $A$; the thing whose truth condition is fulfilled because $A$ is in $H_t$
- $k \in \{\sigma, \Delta, \pi\}$ is the **grounding kind** — which nucleus closure governs the relation

**Type note.** Both $A$ and $B$ are elements of the same fiber $H_t$ — this is a within-fiber relation, not a relation across fibers or across histories. The grounding direction is not given by the Heyting order ($A \leq B$ or $B \leq A$) but by the nucleus closure: $A$ grounds $B$ when $B$ falls within the nucleus-image of $A$. The nucleus is the explanatory operator; the lattice order is the truth order. These are distinct. The distinction from `satisfies:` is exact: satisfaction is a type-crossing relation (a model satisfies a formula, crossing the structure/language boundary); grounding is a within-type relation between two elements of the same fiber Heyting algebra $H_t$.

**Three grounding kinds.**

| Kind | Condition | What it gives |
|---|---|---|
| **Saturation-grounding** | $B \leq \sigma_t(A)$ | $A$ is meaning-foundational for $B$: the saturation nucleus $\sigma_t$ closes $A$ over the Grothendieck topology $J$ and $B$ is in the resulting fixed-point envelope |
| **Transfer-grounding** | $B \leq \Delta_t(A)$ | $A$ is execution-foundational for $B$: the transfer nucleus $\Delta_t$ closes $A$ over what all extensions of $t$ share, and $B$ is in the resulting forward-active envelope |
| **Full grounding** | $B \leq \pi_t(A)$ and $B \in H^*_t$ | $A$ jointly grounds $B$: the joint projection $\pi_t = \sigma_t \circ \Delta_t$ is sufficient to reach $B$, and $B$ is a fixed point — doubly stable under both nuclei |

**Strict vs weak grounding.** Fine (2012b, *Review of Symbolic Logic* 5(1):1–25): weak grounding permits $A$ to weakly ground itself, since $A \leq \sigma_t(A)$ always holds by the extensiveness of $\sigma_t$ (every nucleus satisfies $a \leq \sigma_t(a)$). Strict grounding requires $A \notin \mathrm{Fix}(\sigma_t)$ — the ground must not already be at its closure; the grounding step must be non-trivial. A fixed element $A \in H^*_t$ cannot strictly ground anything: it is its own saturation closure ($\sigma_t(A) = A$), so no element falls strictly below $\sigma_t(A)$ and above $A$. Strict grounding is the philosophically primary notion; weak grounding is the degenerate case.

## Four structural properties

**Irreflexivity (strict).** $A$ does not strictly ground itself: $A \leq \sigma_t(A)$ trivially by extensiveness, but strict self-grounding would require $A < \sigma_t(A)$ and $A \leq \sigma_t(A)$ meaning $A$ is below its own closure without being at it — but that is just the condition $A \notin H^*_t$, which means $A$ does not ground itself but rather grounds $\sigma_t(A) \neq A$. No element is its own strict ground (Fine 2012b, §3: "strict grounding is irreflexive").

**Asymmetry.** If $A$ strictly grounds $B$ ($B \leq \sigma_t(A)$, $A \notin H^*_t$) and $B$ strictly grounds $A$ ($A \leq \sigma_t(B)$), then $\sigma_t(A) \leq \sigma_t(\sigma_t(B)) = \sigma_t(B)$ and $\sigma_t(B) \leq \sigma_t(\sigma_t(A)) = \sigma_t(A)$ by nucleus idempotence, forcing $\sigma_t(A) = \sigma_t(B)$. But then $A$ and $B$ have the same saturation closure and are **nucleus-level equivalent** — neither is a strict ground of the other. Asymmetry follows from irreflexivity plus transitivity (Fine 2012b, §3).

**Transitivity.** If $A$ saturation-grounds $B$ ($B \leq \sigma_t(A)$) and $B$ saturation-grounds $C$ ($C \leq \sigma_t(B)$), then $C \leq \sigma_t(B) \leq \sigma_t(\sigma_t(A)) = \sigma_t(A)$ by nucleus idempotence — $A$ grounds $C$ directly. Transitivity is exact because nucleus idempotence makes the grounding chain collapse: $\sigma_t^n(A) = \sigma_t(A)$ for all $n \geq 1$ (Fine 2012b, Transitivity rule).

**Non-monotonicity.** Adding a conjunct $C$ to the ground $A$ can destroy the grounding relation. Since $\sigma_t$ is order-preserving and $A \wedge C \leq A$ in $H_t$: $\sigma_t(A \wedge C) \leq \sigma_t(A)$. When $\sigma_t(A \wedge C) < \sigma_t(A)$ — when conjunction with $C$ strictly contracts the saturation closure — then $B \leq \sigma_t(A)$ but $B \not\leq \sigma_t(A \wedge C)$, so $A$ grounds $B$ but $A \wedge C$ does not. The grounds are "just right": overdetermination by addition of irrelevant content is as destructive as underdetermination. This is the internal rendering of Fine's non-monotonicity (2012a, *Guide to Ground*, p. 37: "it does not follow from $\Gamma < A$ that $\Gamma, \Delta < A$").

## Correspondence table

Eight external doctrines, each with a precise internal rendering:

| External doctrine | Source | Internal construct |
|---|---|---|
| **Strict irreflexivity and asymmetry** | Fine (2012b) *Review of Symbolic Logic* 5(1):1–25, §3; Fine (2010) *Notre Dame J. Formal Logic* 51(1):97–118 | $A \notin \mathrm{Fix}(\sigma_t)$ is the condition for strict grounding to be non-trivial; asymmetry follows from irreflexivity plus nucleus idempotence. No element of $H^*_t$ strictly grounds anything — fixed propositions are their own explanatory termini. |
| **Non-monotonicity** | Fine (2012a) *Guide to Ground*, p. 37: adding premises can destroy grounding | $\sigma_t(A \wedge C) \leq \sigma_t(A)$, strictly when $A \wedge C$ loses nucleus-relevant content relative to $A$. The saturation closure can contract under meet, making the grounding of $B$ by $A$ defeasible by conjunction with $C$. |
| **Hyperintensionality** | Fine (2012a), p. 39; Schaffer (2009) *Metametaphysics*, pp. 354–355: substituting logically equivalent propositions can alter a grounding claim | Propositions are individuated as distinct elements of $H_t$, not as truth-value functions. Two elements $A \neq A'$ with $\sigma_t(A) = \sigma_t(A')$ are nucleus-level equivalent — same grounding power — but hyperintensionally distinct. Only nucleus-level equivalent substitution preserves grounding; truth-value-equivalent substitution does not unless it is also nucleus-level equivalent. |
| **Full vs partial grounding** | Fine (2012b), pp. 3–4: full ground = jointly sufficient, nothing to add; partial ground = contributory but supplementable | Full grounding: $B \leq \pi_t(A)$ and $B \in H^*_t$ — both nuclei satisfied and $B$ is a fixed point. Partial grounding: $B \leq \sigma_t(A)$ or $B \leq \Delta_t(A)$ but $B \notin H^*_t$, or only one nucleus condition is met — the ground contributes but does not fully settle $B$. |
| **Immediate vs mediate grounding** | Fine (2012b), p. 2: immediate = no intermediate steps; mediate = via a grounding chain | Immediate saturation-grounding: $B \leq \sigma_t(A)$ (single nucleus application). Mediate joint-grounding: $B \leq \pi_t(A) = \sigma_t(\Delta_t(A))$ but $B \not\leq \sigma_t(A)$ — the grounding passes through $\Delta_t$ before $\sigma_t$ can reach $B$. The full chain has length at most two: $A \leq \Delta_t(A) \leq \sigma_t(\Delta_t(A)) = \pi_t(A)$. |
| **Aristotle's formal cause** | *Physics* II.3 (194b23); *Posterior Analytics* II.11 (94a20–95a10): the form (essence, definition) is what a thing *is*, and it grounds facts about particular instances | The saturation nucleus $\sigma_t$ is the formal-cause operator: it closes $A$ under what the accumulated normative form of $H_t$ — constituted by the Grothendieck topology $J$ — recognizes as following from $A$'s content. The formal cause of $B$ is the element $A$ whose $J$-sheafification forces $B$: $B \leq \sigma_t(A)$. Aristotle's distinction between *hoti* (that) and *dioti* (why) — between knowing that $B$ holds and knowing that $A$ is why — is the distinction between a fiber element $B \in H_t$ and the grounding relation $B \leq \sigma_t(A)$. |
| **Aristotle's final cause and telos** | *Physics* II.3 (194b33): the end toward which something is directed; *Nicomachean Ethics* I.7 (1097a): everything aims at its good | The telos of $A$ is $\pi_t(A) = \sigma_t(\Delta_t(A)) \in H^*_t$ — the minimum doubly-stable element above $A$; the fixed point toward which $A$ tends under joint closure. The telos exists because $H_t$ is a finite Heyting algebra and $\pi_t$ is a nucleus. Every element has a unique telos; the telos of a fixed-point element is itself. The grounding chain $A \leq \Delta_t(A) \leq \pi_t(A)$ is the trajectory of $A$ toward its telos. |
| **Proof-theoretic grounding** | Poggiolesi (2016) *Synthese* 193(10):3147–3167; Poggiolesi (2018) *Synthese* 195(3):1231–1254: complete-and-immediate formal grounding (CIFG) requires complexity reduction, positivity, non-redundancy, and single-step derivation | Immediate grounding in the fiber = single nucleus application ($B \leq \sigma_t(A)$ via one application of $\sigma_t$). Poggiolesi's CIFG single-step condition corresponds to this immediate case; mediate grounding (the $\Delta_t$-then-$\sigma_t$ chain) corresponds to her mediate grounding obtained by composing two immediate steps. Idempotence of each nucleus ensures no chain requires more than two steps. Non-redundancy: $A$ grounds $B$ without redundancy iff $A$ is the minimum element of $H_t$ whose saturation closure contains $B$ — the meet of all such elements is the tightest ground of $B$. |

## The two-nucleus grounding structure

The saturation nucleus $\sigma_t$ and transfer nucleus $\Delta_t$ give rise to two independent grounding kinds whose interaction yields the full grounding structure.

**Saturation-grounding alone.** $B \leq \sigma_t(A)$, $B \not\leq \Delta_t(A)$: $A$ is meaning-foundational for $B$ — the accumulated normative past forces $B$ given $A$, but $B$ is not present in all extensions of $t$ independently of $A$. The grounding is historically situated: it holds at $t$ in virtue of what $J$ has recognized, but future extensions need not carry $B$ forward unless $A$ persists. This is the grounding kind operative in formal recognition, logical definition, and legal ruling: a ruling grounds a precedent ($\sigma_t$-grounds the new element of $H_{t'}$) even when the precedent has not yet been carried forward universally.

**Transfer-grounding alone.** $B \leq \Delta_t(A)$, $B \not\leq \sigma_t(A)$: $A$ carries $B$ forward into all extensions of $t$, but the accumulated normative past at $t$ has not yet recognized $A$ as the meaning-foundation for $B$. Structurally anomalous — forward-active but not yet meaning-settled. Analogous to the "induction only" stage of Incumbent: the occupancy is carried forward but not yet formally recognized. An executable routine whose outputs propagate but whose meaning-status is not yet settled by the site topology $J$.

**Full grounding.** $B \leq \pi_t(A)$ and $B \in H^*_t$: both nuclear conditions satisfied. The normal order — Transfer then Saturate — runs the RelationalMachine's engine. First close $A$ under $\Delta_t$ (what all extensions share), then close under $\sigma_t$ (what the normative past recognizes in that transfer-stable residue). The canonical two-step chain: $A \leq \Delta_t(A) \leq \sigma_t(\Delta_t(A)) = \pi_t(A) \in H^*_t$. Full grounding means $B$ is below the terminal fixed point of this chain.

| Stage | Nuclear condition | What it gives |
|---|---|---|
| Saturation-grounding only | $B \leq \sigma_t(A)$, $B \not\leq \Delta_t(A)$ | Meaning-foundational; historically situated; no forward-stability guarantee |
| Transfer-grounding only | $B \leq \Delta_t(A)$, $B \not\leq \sigma_t(A)$ | Execution-foundational; forward-active; not yet meaning-recognized — anomalous |
| Full grounding | $B \leq \pi_t(A)$, $B \in H^*_t$ | Both: past-settled and future-active; $B$ is a fixed point reachable from $A$ via joint closure |

## The grounding chain as nucleus iteration

For any element $A \in H_t$, the **grounding chain** is:

$$A \;\leq\; \Delta_t(A) \;\leq\; \sigma_t(\Delta_t(A)) \;=\; \pi_t(A) \;\in\; H^*_t$$

The chain terminates after at most two nucleus applications because $\sigma_t$ and $\Delta_t$ are each idempotent: further applications return the same element. Mediate grounding — where the chain passes through both nuclei — terminates at the joint fixed point $\pi_t(A)$ in exactly two steps.

Grounding levels of any $A$:

| Level | Element | Condition | What it names |
|---|---|---|---|
| **Unsettled** | $A$ | $A \notin \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t)$ | Neither nucleus closure applied; ground exists but $A$ does not yet ground anything settled |
| **Transfer-closed** | $\Delta_t(A)$ | $\Delta_t(A) \in \mathrm{Fix}(\Delta_t) \setminus \mathrm{Fix}(\sigma_t)$ | Forward-active but not yet meaning-settled; intermediate grounding level |
| **Jointly closed / telos** | $\pi_t(A)$ | $\pi_t(A) \in H^*_t$ | The terminal grounding level of $A$ — its telos; the minimum doubly-stable element above $A$ |

Every $A$ has a unique telos $\pi_t(A)$. Fixed-point elements $A \in H^*_t$ have trivial grounding chains ($\Delta_t(A) = A = \pi_t(A)$) — they are their own termini and ground nothing non-trivially. This gives the formal content of Schaffer's well-foundedness condition (2010, *Philosophical Review* 119(1):31–76): every grounding chain in the fiber terminates at $\pi_t(A) \in H^*_t$ after at most two steps.

## Hyperintensionality in the fiber

Fine's core claim (2012a, p. 39) is that grounding is **hyperintensional**: substituting a logically equivalent proposition for a relatum can alter the grounding claim's truth value. In the fiber:

Propositions are individuated as elements of $H_t$ — distinct elements $A \neq A'$ are distinct propositions even if they are "logically equivalent" in some coarser sense. The system operates at the hyperintensional level by default: two spec entities with different ids are different propositions even if their nucleus closures coincide.

The levels of ground-identity, coarsest to finest:

| Level | Formal condition | What it preserves |
|---|---|---|
| **Extensional** | Same truth value at the actual history: $A, A' \in H_t$ both true | Nothing about grounding |
| **Nucleus-level** | $\sigma_t(A) = \sigma_t(A')$ and $\Delta_t(A) = \Delta_t(A')$ | Same full grounding power: $B \leq \pi_t(A)$ iff $B \leq \pi_t(A')$ |
| **Hyperintensional** | $A = A'$ as elements of $H_t$ | All grounding claims |

Substituting a nucleus-level equivalent for $A$ preserves all grounding claims. Substituting a merely truth-value equivalent does not. This is the internal rendering of Fine's hyperintensionality: the relevant equivalence relation for grounding is nucleus-level identity, not truth-value identity (cf. Fine 2012a, p. 39; also [Concept](concept.md) §"Concept identity levels" for the parallel analysis at the predicate level).

## Cross-locale grounding

The primary use of the `grounding:` frontmatter field in this repository is **cross-locale**: a math entity grounds a spec concept when the mathematical result is the backing that makes the spec claim valid rather than merely stipulated.

Cross-locale grounding is saturation-grounding where $A$ lives in the math locale and $B$ in the spec locale: $B_{\mathrm{spec}} \leq \sigma_t(A_{\mathrm{math}})$ — the math file's content, processed by the saturation nucleus $\sigma_t$, forces the spec claim. The math file is the explanatory foundation; the spec claim is what holds *in virtue of* the mathematical result.

The operative distinction from adjacent frontmatter relations:
- `describes: X` — the file characterizes or discusses $X$; a within-locale claim that does not assert explanatory priority
- `grounding: X` — this file is the mathematical foundation that makes $X$'s claim valid; without it, $X$ is ungrounded vocabulary; asserts that the saturation-grounding relation $X_{\mathrm{spec}} \leq \sigma_t(\text{this file})$ holds

A file carrying both `defines:` and `grounding:` asserts that the mathematical theorem it defines is simultaneously the saturation-ground of the spec concept it names. The two assertions are independent: `defines:` says what the file establishes; `grounding:` says what spec claim depends on it.

## Open questions

- **Whether non-monotonicity is complete in the fiber**: Fine's grounding is non-monotone by general principle. In $H_t$, non-monotonicity follows from $\sigma_t(A \wedge C) \leq \sigma_t(A)$ strictly when conjunction with $C$ reduces the saturation closure. But in a finite Heyting algebra with a nucleus defined by the Grothendieck topology $J$, there may exist "neutral conjuncts" $C$ such that $\sigma_t(A \wedge C) = \sigma_t(A)$ — pairs where conjunction does not contract the closure. Whether the set of neutral conjuncts of $A$ is characterized by a condition in $J$ (perhaps: $C$ is a section of $J$ that already covers the same sieves as $A$, so adding it is redundant), and whether Fine's full non-monotonicity holds for all non-neutral conjuncts, is not yet derived.

- **Whether transfer-grounding captures Aristotle's efficient cause**: The correspondence table maps the saturation nucleus to Aristotle's formal cause and the joint projection to the final cause. The efficient cause — the productive genesis of $B$ from $A$ via a concrete generating process — is not clearly a nucleus operation in $H_t$. It resembles the Carrier's stepping map $\gamma_t : X(t) \to X(s \star t)$: the carrier advances the concrete state side of the Chu duality while the doctrine side advances via the nuclei. Whether efficient causation in the fiber is the stepping map acting on the carrier (the coalgebra side of the Passage duality) rather than a nucleus operation on the doctrine side, and whether this means the Aristotelian four causes require both sides of the Chu pairing to be fully rendered rather than only the doctrine side, is not yet derived.

- **Whether cross-locale grounding requires a site morphism**: The formal definition gives grounding as a within-fiber relation with $A, B \in H_t$. Cross-locale grounding treats $A$ as living in the math locale and $B$ in the spec locale. Whether cross-locale grounding is a within-fiber relation (both $A$ and $B$ embed into the same fiber $H_t$ of an ambient system), or whether it requires a morphism of sites and a corresponding geometric morphism between toposes carrying $A$ from the math locale into the fiber of the spec locale, is not yet formally derived. If cross-locale grounding requires a site morphism, the `grounding:` frontmatter relation is a claim about a geometric morphism connecting two sub-sites, and the condition $B_{\mathrm{spec}} \leq \sigma_t(A_{\mathrm{math}})$ must be interpreted via the pullback of $\sigma_t$ along that morphism — which may not preserve the saturation nucleus structure in general.

## Key references

Fine, "The Pure Logic of Ground," *Review of Symbolic Logic* 5(1):1–25 (2012b); Fine, "Guide to Ground," in Correia & Schnieder (eds.), *Metaphysical Grounding*, Cambridge University Press, pp. 37–80 (2012a); Fine, "Some Puzzles of Ground," *Notre Dame Journal of Formal Logic* 51(1):97–118 (2010); Rosen, "Metaphysical Dependence: Grounding and Reduction," in Hale & Hoffmann (eds.), *Modality*, OUP, pp. 109–135 (2010); Schaffer, "On What Grounds What," *Metametaphysics*, OUP, pp. 347–383 (2009); Schaffer, "Monism: The Priority of the Whole," *Philosophical Review* 119(1):31–76 (2010); Bennett, "By Our Bootstraps," *Philosophical Perspectives* 25(1):27–41 (2011); Wilson, "No Work for a Theory of Grounding," *Analytic Philosophy* 55(3):535–579 (2014); Poggiolesi, "On Defining the Notion of Complete and Immediate Formal Grounding," *Synthese* 193(10):3147–3167 (2016); Poggiolesi, "On Constructing a Logic for CIFG," *Synthese* 195(3):1231–1254 (2018); Genco, Poggiolesi, Rossi, "Grounding, Quantifiers, and Paradoxes," *Journal of Philosophical Logic* 50(6):1417–1448 (2021); Aristotle, *Physics* II.3 (194b16–195a28); Aristotle, *Posterior Analytics* II.11 (94a20–95a10); Aristotle, *Topics* I.2 (101a36–b4).
