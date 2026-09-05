---
type: narrative
discusses:
  - cohomological-framework
  - q-enriched-cohomology
  - q-enriched-curry-grothendieck-site
  - d-frame-cohomology-comparison
  - strong-mld-via-composed-duality
  - anderson-putnam-direct-limit
  - lawvere-laplacian-grothendieck-sites
---

# The corpus's cohomological frameworks: how they relate and where they don't

The corpus computes "cohomology" of settlings via the four [cohomological frameworks](../concepts/cohomological-framework.md), grown up alongside each other. Each framework has its own conventions, its own tooling, its own status. Where they overlap they should agree — but the corpus has not yet proved they do. The chapter's downstream theorems (notably the [strong-MLD theorem](../theorems/strong-mld-via-composed-duality.md)) are stated in one framework's language and have proofs that thread through another framework's chain of sketches. The **computational verification** of those theorems uses a third framework that doesn't traverse the proof chain at all. This narrative traces what each framework does, where they overlap, and what's at stake in the cross-framework agreements.

## What each framework computes

The [cohomological-framework concept](../concepts/cohomological-framework.md) defines all four precisely. Briefly:

- **Framework 1** — substitution-matrix Anderson-Putnam: computational, working. The benchmark suite runs on this. Does not prove abstract theorems.
- **Framework 2** — Tarski-Laplacian on discrete-points fiber: proves strict / Scott-continuous regime d-frame cohomology theorems. Treats the fiber as a 0-dim discrete topological space (trivially $C^n = 0$ for $n \geq 1$).
- **Framework 3** — cellular sheaf on the order complex of the clopen lattice (Q-enriched, parallel-pair convention): the per-fiber Curry equivalence chain lives here. Proved on graphs and 2-dim degree-0; sketch on higher-dim CW and on Grothendieck-site assembly. The downstream Verdier / d-frame Verdier composition / strong-MLD chain threads through this.
- **Framework 4** — Lawvere-Laplacian-Q-enriched, weighted-meet convention: theoretical scaffolding for the abstract higher-degree-vanishing theorems. Not concretely computed against any specific settling. Empirically appears to be a different cohomology theory from Framework 3.

## How the frameworks relate downstream

The downstream theorems the chapter cares about — notably the [strong-MLD theorem via composed-duality](../theorems/strong-mld-via-composed-duality.md) classifying aperiodic settlings up to refined equivalence — are stated in language that uses Framework 4's d-frame cohomology, with proofs that thread through Framework 3's cellular sheaf chain:

```
strong-MLD theorem (Framework 3/4 language, sketch status after audit)
    └── d-frame Verdier composition (Framework 3, sketch)
        └── Verdier duality on bitopological site (Framework 3, sketch)
            └── q-enriched-curry-grothendieck-site (Framework 3 assembly, sketch)
                └── q-enriched-curry-cw-complex (Framework 3 induction, sketch)
                    └── q-enriched-curry-finite-graph (Framework 3, proved)
                    └── q-enriched-curry-2-dim-degree-0 (Framework 3, proved, H^0 only)
```

So strong-MLD is **stated-in-Framework-4-language, proved-via-Framework-3 chain with sketch links, verified-via-Framework-1 on specific cases**. Three frameworks, none alone supplying the full chain.

## Multi-path structure: orbit-type classification

The orbit-type classification of a substitution settling — *truth-only, falsity-only, $\top$-firing, $\bot$-firing, or mixed* — can be computed via at least three distinct paths:

**Path A — substitution-matrix accounting.** Read off the bilattice value of each letter, classify firings per their $L_+$ / $L_-$ contributions, count. Realized in [`tools/predication_categories/examples/benchmark_1_fibonacci.py`](../tools/predication_categories/examples/benchmark_1_fibonacci.py); verified against the [benchmark suite's 7 cases](../examples/benchmark-suite-summary.md). **Status: realized in code, working.** Does not constitute a proof of the strong-MLD theorem; it is a per-substitution verification.

**Path B — cellular Curry assembly.** Compute $H^1_{\mathbf{dFrm}}$ via Framework 3's cellular sheaf machinery: per-fiber Curry equivalence on the bitopological-site fibers, then assembly across the predicate × stage base. Apply the d-frame Verdier composition to extract per-firing $D_\mu$ generators, classify each by orbit type via the strong-MLD theorem. **Status: chain of sketches.** Base cases proved; everything from CW-complex extension up is sketch.

**Path C — Q-enriched Lawvere-Laplacian.** Compute via Framework 4 directly. **Status: framework scaffolded but not concretely computed.** The Lawvere-Laplacian extension theorem is sketch-status; the framework has not been computed against any specific substitution settling.

The three paths *should* all agree on the orbit type for any specific substitution. Path A is the only one that has been *checked against specific examples*; Paths B and C are abstract proofs whose outputs on specific examples have not been computed and compared with Path A. The strong-MLD theorem's "sketch" status (post-audit) comes from Path B; its empirical credibility comes from Path A's benchmark verifications. These are independent supports, not joint.

## Per-fiber structure on the bitopological setting

For the bitopological setting, the per-base-point fiber category $\mathbf T_{(q,\tau)}$ is the order complex of the lattice of pairwise-Stone clopens of $X_q^\tau$ (per the [bitopological settling site object](../objects/bitopological-settling-site.md) and the [Q-enriched Curry on Grothendieck sites theorem](../theorems/q-enriched-curry-grothendieck-site.md)). For the standard Belnap setting ($\mathbf L = \mathbf 2$, $X_q^\tau = \{+, -\}$), the lattice has 4 elements and its order complex is the contractible subdivided square: 4 vertices, 5 edges (chains $x < y$), 2 triangles (chains $x < y < z$).

This is the fiber on which per-fiber Curry equivalence is computed for the assembly into Layer 2 / Verdier duality. **It is not the underlying paired-Priestley space's discrete-poset structure** (which would be 0-dim with 2 cells, the Framework 2 reading); it is the order complex of the clopen lattice (2-dim, 4+5+2 cells, contractible).

Classical abelian Curry equivalence on contractible cellular complexes gives $H^k \cong H_k$ for all $k$ — concentrated in degree 0 with $H^0 \cong H_0 \cong $ global sections. The d-frame-valued case should inherit this; concrete computation is the working question [per-fiber Curry on the clopen lattice fiber](../questions/per-fiber-curry-on-clopen-lattice-fiber.md). The 5-pass suite of that question now confirms d-frame Curry equivalence at $H^0/H_0$ for the simplest Belnap placement ($\Delta^+ = \{+\}, \Delta^- = \{-\}$), with all four d-frame components ($L_+, L_-, \mathrm{con}, \mathrm{tot}$) matching what the [strict-regime d-frame cohomology theorem](../theorems/strict-regime-d-frame-cohomology.md) predicts in its discrete-points framework. This is one verified case of Framework 2 ↔ Framework 3 agreement, not a general theorem; the question's "Next investigations" section lists what would consolidate this into a general Framework-2-to-3 translation.

### A second fiber reading also lives in the corpus

Separately from the order-complex-of-clopens reading just described, the [strict-regime d-frame cohomology theorem](../theorems/strict-regime-d-frame-cohomology.md) (status: proved) computes its fiber cohomology using a *different* reading: the fiber as the underlying paired-Priestley space treated as a 0-dim discrete topological space. Under that reading, the Tarski Laplacian on cochains has $C^0 = $ product of d-frame values at the two points and $C^n = 0$ for $n \geq 1$ trivially.

These are different cell structures on different objects:
- The order-complex reading (Framework 3): fiber = order complex of the clopen lattice; 4+5+2 cells; contractible Δ¹.
- The discrete-points reading (Framework 2): fiber = paired-Priestley space as a discrete topological space; 2 cells; trivially 0-dim.

Both readings give the same overall conclusion ("fiber cohomology concentrated in degree 0") for different reasons:
- Order-complex: contractibility of Δ¹ ⇒ classical Curry concentrates cohomology in degree 0.
- Discrete-points: there are no higher-dim cochains ⇒ trivially no higher cohomology.

Whether the two readings give the same cohomology *object* in degree 0 is what Pass 1+ of the per-fiber Curry working question is checking. **First positive evidence: Pass 1 showed the order-complex computation of the $L_+$ shadow's $H^0$ equals what the discrete-points framework's strict-regime theorem would predict** — both give $\mathcal P(\Delta^+) \cong \mathbf 2$ for the standard Belnap placement.

## What this narrative does NOT say

- It does not claim any of the frameworks is wrong. Each is internally consistent within its scope.
- It does not refute the strong-MLD theorem or the d-frame cohomology comparison. Those theorems' structural arguments are at the chapter's standard rigor level; the demotions to `sketch` reflect that their proofs depend on chains of sketches, not that the structural arguments are unsound.
- It does not claim the multi-path structure is unique to this chapter — having computational tools that verify specific cases alongside abstract theoretical proofs is normal and healthy in mathematical practice.

What the narrative *does* claim: predication categories' frameworks have not been shown to agree with each other on any concrete case. The downstream theorems' proofs and the downstream theorems' computational verifications are independent supports. Future work that needs the frameworks to agree (e.g., to extend the benchmark verifications to cases not covered by Path A) should make that agreement explicit before relying on it. The [per-fiber Curry working question](../questions/per-fiber-curry-on-clopen-lattice-fiber.md) is the current potential site for making one such agreement explicit.

## Position in predication categories

This narrative is meta-level: it doesn't add new mathematics, it adds *legibility* to the existing mathematics. The chapter's structural completeness is now *honestly* documented rather than implicitly assumed.

The follow-up work, each its own piece of substantive work:
1. **Compute Path B explicitly on a benchmark case.** The [per-fiber Curry working question](../questions/per-fiber-curry-on-clopen-lattice-fiber.md) is the start of this — once its passes complete, the next step is composing the per-fiber result into the Grothendieck-site assembly for a specific benchmark substitution.
2. **Compute Path C explicitly on a benchmark case.** Harder because Framework 4 hasn't been computed against any concrete example.
3. **Verify Stubbe 2005 / Lopez 2024 background facts** that Frameworks 3 and 4 cite.
