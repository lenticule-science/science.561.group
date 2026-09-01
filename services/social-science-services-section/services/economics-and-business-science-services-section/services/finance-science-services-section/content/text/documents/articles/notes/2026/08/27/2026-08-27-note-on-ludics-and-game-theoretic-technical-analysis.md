---
name: note-on-ludics-and-game-theoretic-technical-analysis
description: >-
  Tests the operator's markets-are-games thesis against Kelly/Shannon, Caillois, Girard's ludics, and existing game-theoretic finance; concludes Kelly's own paper already licenses the equivalence, ludics does not ground price formation, Caillois's four-fold is a partial and partly-misleading metaphor, and proposes two unvalidated but mathematically real technical-analysis candidates.
date-created: 2026-08-27
type: notes
authors:
  - claude-sonnet-5
keywords:
  - game-theory
  - ludics
  - information-theory
  - kelly-criterion
  - caillois
  - girard
  - technical-analysis
---

# Ludics and Game-Theoretic Technical Analysis

The operator's starting position: "markets are games, it's all gambling," and the question is whether rigorous game theory, ludics, and information theory — not the chart-pattern folklore that dominates retail trading writing — can be combined into genuinely new technical analysis.
This note carries that research through to a verdict, honestly, including the parts where the answer is no.
The full sourced research, with every claim's attribution grade and every fetch failure logged in place, is the [ludics-and-game-theoretic-technical-analysis research record](../../../../../../../../../../../../../data/records/2026-08-27-markets-as-games/ludics-and-game-theoretic-technical-analysis.md); this note draws from it without re-deriving it, per the section's density standard — thin restatement is a violation, so quotes, equations, and citation grades are carried here, not summarized away.

## Canonical ownership, decided and justified

This note lives here, in the finance section, rather than under either candidate ludics/game-science home.
Two other sections were genuinely live candidates and are rejected here for stated reasons, per the L-Space rule that a note has one canonical owner and cross-disciplinary relevance is expressed by relations, not duplicate copies.

The [Ludics Services Section](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/README.md) under Social Theory is the home for Jean-Yves Girard's proof-theoretic ludics — its README states this scope explicitly, distinct from Caillois — and it already hosts a live, substantive research thread, the [Girard–Caillois substrate correspondence question](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/content/text/documents/notes/questions-on-girard-caillois-substrate-correspondence.md), which is the more natural home for *further Girard-ludics theory*.
This note is not that: §3 below concludes Girard's actual formal content does not ground price formation, so there is no ludics theory being extended here for that section to own — only a negative result about an attempted application, which belongs with the application domain (finance), not the theory domain.

Social Theory's [Game Ludics Services Section](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/README.md), covering Huizinga and Caillois's cultural play theory, already holds substantial, non-stub definitions of [agon](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/agon.md), [alea](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/alea.md), [mimicry](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/mimicry.md), and [ilinx](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/ilinx.md) (dated 2026-03-06), which this note links to rather than forking finance-scoped copies — the same discipline the task brief itself specified for `kelly-criterion`, applied consistently to the other four terms the brief listed even though the brief did not flag them as pre-existing.
Caillois's general theory of play belongs there; a *market-specific application* of it, including where that application is assessed to fail, belongs with markets.

Finance is the most specific defensible owner left: this note's actual deliverable — is there a real, computable technical-analysis method here — is a finance question, and this section already carries the load-bearing apparatus it extends (Kelly, [fractional Kelly](../../../../../../../text/glossary/terms/fractional-kelly.md), [geometric mean maximization](../../../../../../../text/glossary/terms/geometric-mean-maximization.md), [subfair games](../../../../../../../text/glossary/terms/subfair-game.md), from the same-day [note on growth-optimal sizing when ruin is cheap](./2026-08-27-note-on-growth-optimal-sizing-when-ruin-is-cheap.md)) as a live, continuing research thread rather than a graft onto unrelated material.

## 1. The information-theory bridge is not a metaphor — it's an identity, read from the primary source

John Kelly derived his criterion in 1956 at Bell Labs directly from Shannon's information theory, and the connection is not an after-the-fact reading: it is Kelly's own stated result, **read in full** from the OCR text of *Bell System Technical Journal* 35(4):917–926 (full sourcing and every quote's context is in the research record's §1.1; the fetch itself required routing around a failed PDF decode to the Internet Archive's `_djvu.txt` derivative).

For a gambler with side information Y about a true outcome X, betting at fair odds, Kelly proves the growth-optimal exponent of capital *is* Shannon's mutual information:

> "G_max = H(X) − H(X/Y), which is the rate of transmission defined by Shannon."

For the binary symmetric case this specializes to G_max = 1 + p log p + q log q = R, exactly Shannon's capacity formula.
This is the load-bearing claim the operator asked to be established precisely, and it holds: the growth-optimal betting fraction is not analogous to channel capacity, it equals channel capacity, in Kelly's own derivation.

Two facts from the primary text are usually lost in derivative treatments and matter for the operator's thesis specifically.
First, Kelly's justification for maximizing *log*-capital rather than expected capital is **operational** — log-capital is additive across repeated bets, so it composes correctly under compounding — not a risk-aversion utility axiom; the criterion is about how compounding works, not about preferences.
Second, and this is the single strongest primary-sourced piece of evidence for "markets and gambling are the same formal object" found in this whole research pass, Kelly himself extends the model beyond gambling, in his own words: the requirements are "the possibility of reinvestment of profits and the ability to control or vary the amount of money invested," and the channel may correspond "either to a real communication channel or simply to the totality of inside information available to the investor."
That sentence is Kelly, at Bell Labs, in 1956, calling an investor's private information a communication channel with a capacity.

### What follows that practitioners don't already exploit

Kelly is also honest about a gap in his own proof: his growth-dominance result holds only for a *fixed* betting rule, not an adaptive one — "Theorems remain to be proved" for strategies that vary with accumulated history.
That gap is closed 35 years later by Thomas Cover's Universal Portfolio theorem (§4 below), and the throughline from Kelly's stated limitation to Cover's resolution is a real line of technical progress, not a folklore genealogy.

More immediately useful: H. Permuter, Y.-H. Kim, and T. Weissman's "On Directed Information and Gambling" (arXiv:0802.1383, **read directly** via an HTML mirror) generalizes Kelly's i.i.d.-outcome assumption to causally dependent sequences, replacing mutual information with **directed information**, I(Yⁿ→Xⁿ) = Σᵢ I(Xᵢ; Yⁱ | Xⁱ⁻¹) — a sum that by construction can never credit information from the future.
This matters for technical analysis specifically because an ordinary backtest computes exactly the *non-causal* mutual information Kelly's theory licenses using only when side information really is known all at once — which a backtest, run after all the data exists, technically is, and a live system never is.
Directed information reframes "avoid lookahead bias" from trading-desk hygiene into a named, estimable quantity with a provable ceiling — this is worked into a concrete candidate method in §5.

## 2. Caillois's four-fold as a market-regime taxonomy: real for two categories, actively misleading for the other two

No literature was found proposing this exact mapping (four independently-phrased searches, logged in the record's §2.3, returned nothing) — it would be new work if built, and the honest assessment is that it should *not* be built as a headline claim, category by category.

**Agon (competitive price discovery) and alea (irreducible noise) are real correspondences, but redundant ones.** Caillois's agon requires the players themselves to be the source of uncertainty under comparable starting conditions; alea requires the outcome to come from forces outside any player's control, equalizing skilled and unskilled participants.
Both map cleanly onto market microstructure — Kyle's (1985) model literally has an informed trader competing for informational edge (agon) against literal "noise traders" (alea) — but that theory is already fully established independent of Caillois (§4.3).
The correspondence does real work in the sense of being accurate, but no *new* work: it relabels theory that doesn't need the label.

**Mimicry (reflexivity/herding) is a relabeling that drops the concept and keeps only the word.** The [corpus's own mimicry definition](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/mimicry.md) stresses **double consciousness** — a player who knows an assumed identity is fictional but plays it seriously anyway, with no determinate outcome required.
Herding and Keynes's beauty-contest logic (the well-developed literature the operator's prompt correctly points to, cf. Soros's own reflexivity essays) involve none of that: no pretense, no assumed identity, and an activity oriented entirely toward a determinate outcome, P&L.
The only thing common to both is the English word "imitation" — the specific content Caillois built into the category does no work here and is arguably false of it.

**Ilinx (volatility cascades/liquidation spirals) is the weakest pairing, and actively misleading.** The [corpus's own ilinx definition](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/services/game-ludics-services-section/content/text/glossary/terms/ilinx.md) requires **voluntary** pursuit of disorientation in a **bounded, controlled context**, followed by recovery — "the thrill of losing control in a controlled context."
A forced-liquidation cascade (margin calls triggering further margin calls; Soros, on real bubbles: "booms develop slowly but the bust tends to be sudden and devastating," attributed to leveraged forced liquidation, search synthesis) is the opposite on exactly the dimension that makes ilinx a coherent category: it is involuntary, and it is not guaranteed bounded or recoverable — the entire danger of a cascade is that it is not self-limiting.
Calling a liquidation spiral "ilinx" imports a false connotation (safety-within-a-frame, sought-out thrill) that could mislead risk intuition rather than sharpen it.

**Verdict**: two of four correspondences are accurate but do no independent work; the other two are worse than neutral.
There is a genuine primary-adjacent finding worth carrying forward regardless — Caillois himself, per search synthesis not yet verified against the primary French or English text (**[UNVERIFIED]**, flagged in the record), reportedly named stock-market speculation directly as a modern "corruption" of alea escaping the magic circle. If verified, that is Caillois's own 1958 words anticipating part of the operator's thesis, which would be worth a dedicated follow-up read of the primary text.

## 3. Girard's ludics does not ground price formation — a category error, not undeveloped territory

Girard's ludics reduces proof theory to a single primitive, interaction: designs (polarity-carrying, untyped strategy-like objects) interact by exchanging moves; the interaction **converges** when both sides reach the **daimon**, an absorbing "give up gracefully" signal; two designs are **orthogonal** exactly when their interaction converges; a **behaviour** is a set of designs equal to its own biorthogonal closure — the ludics analogue of a Galois-connection double-dual.
No paper, preprint, or substantive secondary discussion connecting ludics to economics, finance, or mechanism design was found across four independently-phrased searches (logged in the record's §3.2); the search tool's own synthesis reached the same negative conclusion independently: ludics "operates at a very different level of abstraction from economic game theory and mechanism design."

Pressed past vocabulary, the mismatch is structural rather than merely unexplored.
Ludics's entire apparatus — designs, orthogonality, behaviours — carries **no numeric or quantitative structure at all**: no price, no size, no probability appears anywhere in the definitions, because the formalism is about whether a symbolic proof-search process normalizes, full stop.
Markets are irreducibly quantitative in exactly the way technical analysis needs: what matters is not whether a trade clears but at what price, what size, against what depth.
Grafting a numeric payoff onto orthogonality-as-biduality would not extend ludics — it would discard the polarity-indexed proof-search structure that makes ludics *ludics*, keeping only the English word "interaction."
The corpus's own [Girard–Caillois substrate correspondence question](../../../../../../../../../../../social-theory-science-services-section/services/ludics-science-services-section/content/text/documents/notes/questions-on-girard-caillois-substrate-correspondence.md) is instructive by contrast: it makes real headway by mapping ludics onto a *purpose-built* paraconsistent bilattice algebra that already has rich numeric/order structure, not onto an empirical domain directly.
Markets have no such intermediate algebra waiting to receive the mapping.

**This is the connection the operator's brief explicitly authorized concluding is superficial, and it is concluded here: the ludics–markets connection is verbal only.** No ludics-grounded technical-analysis method is proposed anywhere in this note.

## 4. Existing game-theoretic finance, surveyed so nothing here is reinvented

Full detail, quotes, and figures for every item below are in the record's §4; summarized here to the point of being usable without re-deriving.

**Shafer & Vovk, *Probability and Finance: It's Only a Game!*** (Wiley, 2001; search synthesis, primary PDFs failed to decode this session) replace measure theory with a two-player betting game as probability's foundation, organized around **Cournot's principle**: a player avoiding bankruptcy cannot multiply capital by a large factor.
Applied to markets, this restates the efficient-market hypothesis constructively and falsifiably: no betting strategy multiplies capital against an index by a large factor without risking ruin.
Their **defensive forecasting** apparatus gives a provable calibration guarantee — but calibration is not profitability, so this disciplines the *claim* of an edge rather than generating one.

**Aumann agreement / no-trade theorems** (1976; search synthesis) show that agents with a common prior cannot rationally bet against each other once posteriors are common knowledge.
Usable only as a diagnostic: any real, sustained edge must come from violating a specific, short, exhaustive list of the theorem's premises — genuine private information not common knowledge, heterogeneous priors (not just heterogeneous information), or non-rational/liquidity-driven counterparties.

**Kyle (1985)**, "Continuous Auctions and Insider Trading" (search synthesis): an informed trader, noise traders, and a competitive market maker produce a linear price-impact equilibrium p = p₀ + λv, where **λ ("Kyle's lambda")** is proportional to volatility and inversely proportional to liquidity.
Real, rigorous, and already fully institutionalized as transaction-cost-analysis and execution-algorithm practice — explicitly the existing gold standard this note is not trying to reinvent.

**The minority game / El Farol** (Arthur 1994; Challet & Zhang 1997; search synthesis) models markets as agents rewarded for landing in the minority, with a self-organized-criticality literature arguing real markets settle into a stable regime of "marginal inefficiency."
Theoretically illuminating about *why* markets sit near-but-not-at efficiency; practically thin as a signal generator, per the literature's own honest characterization ("a weak positive result mostly associated with rare low-entropy events").

**Cover's Universal Portfolio** (1991) is the strongest existing answer to "what does a rigorous Kelly-adjacent trader already have that a folklore trader doesn't," and it already exists.
The precise regret bound, **read directly** from a technical secondary restatement after the primary paper and a survey both failed to render:

> regret against the best constant-rebalanced portfolio in hindsight ≤ (n−1)·log(T+1), for n assets over T periods, matching a lower bound of Ω(n log T)

— a minimax-optimal, distribution-free algorithm that asymptotically matches Kelly-optimal growth **without knowing the return distribution in advance**, closing exactly the gap Kelly himself flagged in 1956 (§1).
Cover's own framing treats this as the direct wealth-growth analogue of universal data compression: a code that compresses at the entropy rate of any source in a class, without knowing which source generated the data, is the same idea as a portfolio that grows wealth at the log-optimal rate for any return sequence, without knowing the distribution.
Stated limitation, read directly: exact computation needs an n-dimensional integral, and the best polynomial-time approximation given in the sources read this session runs in O(T¹⁴n⁴) — genuinely expensive, and transaction costs are not addressed in what was read (flagged gap, not resolved this session).

## 5. Two candidates, real math, honestly unvalidated

Both were checked against the literature specifically to confirm they are not unwitting reinventions (searches logged in the record's §5); neither was found already assembled this way, so both are presented as this note's own proposed synthesis of primary results read above, not as discovered or applied prior art.

**Candidate A — a directed-information edge ceiling.** Estimate the *causal* directed-information rate I(Sⁿ→Rⁿ)/n between a candidate signal Sₜ and forward returns Rₜ (a computable quantity — Jiao et al.'s universal directed-information estimator, arXiv:1201.2334, title located, not implemented here), rather than ordinary correlation or full-sample mutual information.
Kelly's own capacity identity (§1) then gives a **provable ceiling**, not merely an estimate, on the growth-optimal position size any strategy built on that signal can achieve — a converse-type bound, structurally like the channel-coding converse ("no code beats capacity"), that bounds every possible downstream use of the signal at once, which no ordinary backtest can claim to do.
Because directed information's defining sum conditions strictly on the causal past, this ceiling cannot be inflated by the specific form of lookahead bias that comes from full-sample parameter optimization — converting "avoid lookahead bias" from procedural discipline into a formal, falsifiable quantity.
Genuinely open: finite-sample estimator bias on real, fat-tailed, non-stationary return series (arXiv:1902.00580, title located, flagged as an open problem in the literature itself, not read this session) and whether the continuous/multi-outcome generalization of Kelly's binary capacity identity is as clean as the case Kelly actually proved.

**Candidate B — universal-portfolio regret discrepancy as a regime-change statistic.** Run Cover's algorithm over a long window and a short sliding window; each run's regret sits within (n−1)log(T+1) of *that window's own* best-in-hindsight fixed mixture.
Under a genuine structural break, the long-window best mixture becomes a compromise between two incompatible sub-period optima, and the **discrepancy** between short- and long-window realized regret (or between their best-CRP weight vectors) should diverge from what a stable-single-optimum null predicts.
This construction was not found anywhere in the literature searched (adjacent work exists — regime-adaptive continual learning, HMM regime allocation, universal portfolios repurposed for conformal prediction in arXiv:2602.03168 — but not this specific combination), and it is not known whether the discrepancy has a tractable asymptotic distribution under a no-break null, which would be required before calling it a real statistical test rather than a suggestive heuristic.

## Verdict

Kelly's own 1956 paper already licenses treating a trading edge as a literal channel capacity in bits, with a provably optimal bet size — that identity is exact, primary-sourced, and seventy years old, so it is not itself new; what is genuinely underexploited is combining it with the causal (directed-information) generalization for a lookahead-resistant converse bound, and with Cover's already-rigorous universal-portfolio machinery repurposed as a regime-stability diagnostic rather than only a sizing rule.
The Caillois mapping does partial, redundant work for two categories and actively misleading work for the other two, and Girard's ludics is a category error dressed in shared vocabulary — its formal content has no quantitative structure to give price formation, and no such application exists in the literature.
The two proposed methods (§5) are real mathematics built from primary sources read directly in this research pass, but they are unvalidated proposals, not established results, and the record and this note say so without hedging.
