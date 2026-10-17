---
type: question
class: program-shaping
status: partial
explores:
  - orbit-coloring-generator
  - boundary-extended-predicate-category
  - predication-fibration
  - predication-hyperdoctrine
  - closure-2-monad
  - four-regime-dichotomy
  - verdier-duality-bitopological-site
  - strong-mld-via-composed-duality
  - relaxed-bilattice-homomorphism-classification
---

# How do orbit-coloring generators integrate with the chapter's structure?

The [relaxed bilattice homomorphism classification](../theorems/relaxed-bilattice-homomorphism-classification.md) settled the morphism-algebra question raised by dropping bottom-preservation: the new structure is finite — 8 [orbit-coloring generators](../../../orbit-coloring-generator.md) — not a continuum, with [no equivariant non-principal ultrafilters](../theorems/sym-e-no-invariant-non-principal-ultrafilter.md) to bring in a Lindström-quantifier extension. Every downstream layer of the chapter — fibration, hyperdoctrine, closure 2-monad, four-regime classification, Verdier duality, strong-MLD — was built over the bottom-preserving predicate category $\mathcal C$. The question is what the analogous structure looks like over the [boundary-extended predicate category](../objects/boundary-extended-predicate-category.md) $\mathcal C^\beta$.

The cascade is much smaller than originally conjectured. None of the sub-questions below is open in the "needs a continuum-scale construction" sense; each is a concrete, finite structural check.

## Sub-question 1 — Fibration extension — RESOLVED with caveat

Resolved by [orbit-coloring fibration extension](../theorems/orbit-coloring-fibration-extension.md). The fibration extends to $\mathcal C^\beta$ with (A1) automatic and (A2) extended cellwise. (A3) splits:

- **(A3-bilattice)** holds for all 18 generators by the relaxed-classification theorem.
- **(A3-residuated)** holds for the 10 generators with no constant-$\bot$ cell. The 8 that fail are inheriting a pre-existing chapter tension — chapter generators with proper sub-support fail (A3-residuated) at off-$D$ cells by the same $\bot \odot \bot = \mathbf f$ obstruction. See [residuated preservation tension on bottom cells](prose/remarks/residuated-preservation-tension-on-bottom-cells.md).

The cleavage is functorial under composition for all 18 generators (leftmost-wins on per-orbit assignments). The natural sub-fibration that closes both (A3) fragments is the 10-generator $\bot$-free inventory; the 18-generator full $\mathcal C^\beta$ extension closes (A3-bilattice) only.

What remains open in this sub-question is whether the chapter wants to take an explicit stance among the three options (R1)/(R2)/(R3) catalogued in the residuated-tension remark. That is a chapter-level convention question rather than a math question, and is best deferred until the other sub-questions either confirm the same split-fragment pattern or surface a different obstruction.

## Sub-question 2 — Hyperdoctrine adjoints — RESOLVED

Resolved by [orbit-coloring hyperdoctrine extension](../theorems/orbit-coloring-hyperdoctrine-extension.md). The hyperdoctrine extends to $\mathcal C^\beta$ with all four conditions (B1)-(B4) holding, in both $\le_k$ and $\le_t$ axes, for all 18 generators. The extension is passive as predicted:

- **(B1)** Adjoints exist by per-orbit decomposition — constant orbits give characteristic-function adjoints, ev orbits inherit chapter adjoints.
- **(B2)** Frobenius holds orbit-by-orbit: trivial on constant orbits, chapter-standard on ev orbits.
- **(B3)** Beck-Chevalley holds because pullbacks against orbit-coloring generators preserve orbit structure, and BC reduces to chapter BC on ev orbits and to constant identities on constant orbits.
- **(B4)** Comprehension extends by finite case-checking on the slice $\mathcal C^\beta/p$.

The two-internal-logics architecture is unchanged. Orbit-coloring generators are confirmed as idempotent inconsistency-injection morphisms with degenerate adjoint structure on painted orbits — no new quantifier types appear, no Lindström-quantifier extension is generated, and the chapter's existing hyperdoctrinal framework continues over $\mathcal C^\beta$ without restructuring.

## Sub-question 3 — Closure 2-monad — RESOLVED with restriction

Resolved by [orbit-coloring closure 2-monad extension](../theorems/orbit-coloring-closure-2-monad-extension.md). The closure 2-monad extends to $\mathcal C^\beta$ **iff** the closure operator satisfies two new conditions:

- **(C1) Boundary stability** — the four orbit-coloring boundary states $w_{c_\Delta\, c_{\Delta^c}}$ for $c_O \in \{\bot, \top\}$ must be closure-fixed.
- **(C2) Orbit decomposability** — the closure must factor as $\mathrm{cl}_p^\Delta \otimes \mathrm{cl}_p^{\Delta^c}$ on the orbit partition, with no inter-orbit information transfer.

This is a **genuinely new selection condition**, not the passive enrichment seen in sub-questions 1-2. Many of the chapter's natural inferential closures fail it: transitivity, relational-hypothesis modus ponens, axiomatic insertions, equivalence-relation closures with reflexivity or transitivity. The closures that survive are largely those confined to single $\mathrm{Sym}(E)$-orbits — pointwise saturation, single-orbit rules, identity.

The "no fifth regime" prediction holds — the four-regime dichotomy doesn't acquire a new regime. But each existing regime is cut down to its (C1)+(C2)-admissible sub-class, and the cut is severe in the Scott-continuous, transfinite-bounded, and aperiodic regimes (most natural inferential closures fail (C2)). The factorization "identity-on-painted + ordinary-on-unpainted" is correct *for admissible closures*, not as a free fact.

This finding affects sub-questions 4 and 5: their resolution requires checking whether the closures underlying Verdier-duality and strong-MLD structure satisfy (C1)+(C2). Cannot be assumed.

## Sub-question 4 — Verdier dual at the boundary — RESOLVED conditionally

Resolved by [orbit-coloring Verdier extension](../theorems/orbit-coloring-verdier-extension.md). Standard [Jung-Rivieccio duality](../../../../../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) does **not** directly accept relaxed bilattice morphisms — constant-$\top$ painting maps $\bot_{A_q}$ to $\top_{A_p}$, breaking $\bot$-preservation. The dual representation requires a finite enrichment of the target category by *absurd points* (at most four per fiber: $\Delta$-$\top$, $\Delta$-$\bot$, $\Delta^c$-$\top$, $\Delta^c$-$\bot$), giving the equivalence

$$(\mathbf{DBiLat}_\mathrm{relaxed})^\mathrm{op} \simeq \mathbf{PairedPriSp}^\beta.$$

Verdier duality on the [bitopological settling site](../../../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md) then extends through this finite enrichment **conditionally on the closure satisfying (C1)+(C2)** from sub-question 3. The three Verdier layers (sheafhood preservation, Curry assembly, transfinite-cellular fibers) all pass through because absurd points are degenerate 0-cells with no boundary attaching maps.

Key consequences:

- **$H^1$ aperiodic invariant unchanged.** Absurd points contribute only to $H^0$, not $H^1$. The aperiodic-classification framework and its Verdier-dual co-classification are preserved exactly.
- **Self-duality.** Painted values $\top, \bot$ are negation-fixed in $\mathbf{FOUR}$, so absurd points are self-dual fixed points of the composed d-frame duality (spatial × value-category gauge).
- **Six-functor formalism not advanced.** Boundary route adds finite degenerate content; obstacles to six-functor formalism are derived-structural, unaffected.

The question text's prediction (collapse-to-single-point dual, finite concrete extension, no Stone-Čech) is structurally correct, formalized via the relaxed Jung-Rivieccio enrichment. Missed only the closure-admissibility caveat inherited from sub-question 3.

## Sub-question 5 — Strong-MLD with orbit-colored firings — RESOLVED

Resolved by [orbit-coloring strong-MLD extension](../theorems/orbit-coloring-strong-mld-extension.md). The 3-element firing-orbit-type classifier $\{\text{truth-only}, \text{falsity-only}, \top\}$ is **unchanged**: no new fourth type appears. Orbit-coloring is an initial-condition operation, not a firing; it produces no new firings (by (C2), $\top$-painted orbits are closure-fixed; $\bot$-painted orbits collapse with unpainted under (C1)). Painted constants $\top, \bot$ are negation-fixed in $\mathbf{FOUR}$ — the would-be type would be $\top$, but no firings appear to be typed.

What changes is the strong-MLD classifier *space*:

$$\mathcal{M}_{\mathrm{sMLD}}^\beta = \mathcal P(\{\Delta, \Delta^c\}) \times \mathcal{M}_{\mathrm{sMLD}}^{\mathrm{aper}}|_{\text{unpainted-orbit substructure}}.$$

The 4-element saturation-pattern factor $\mathcal P(\{\Delta, \Delta^c\}) = \{\emptyset, \{\Delta\}, \{\Delta^c\}, \{\Delta, \Delta^c\}\}$ records which orbits are $\top$-saturated. The both-painted case $\{\Delta, \Delta^c\}$ is a distinguished singleton — the "fully saturated boundary class" with $L_{\mathrm{ns}} = \emptyset$ — sitting outside the 3-element type taxonomy (no firings to type).

This refinement is **strict** (real MLD-distinction): $\top$-saturation cannot be locally inverted, so $\top$-painted orbits are not MLD-equivalent to unpainted ones. The saturation-pattern factor and the chapter's $H^1 \times \tau^{\mathbb D}$ refinement compose orthogonally.

The question's "natural fourth value $\top$-everywhere" hint is resolved: it IS a distinguished class (the both-painted boundary), but it's a refinement of the classifier *space*, not a fourth firing-orbit type within the 3-element classifier.

Conditional on closure admissibility (C1)+(C2) from sub-question 3.

## What's not open

The previously-conjectured directions — fifth regime in the four-regime classification, six-functor extension via Stone-Čech boundary, ultrafilter-stratified strong-MLD continuum, Lindström-quantifier hyperdoctrine extension — are all closed *negatively* by the [no $\mathrm{Sym}(E)$-equivariant non-principal ultrafilter](../theorems/sym-e-no-invariant-non-principal-ultrafilter.md) obstruction. The corresponding objects (compactified bitopological site, fifth-regime concrete instance, etc.) should not be drafted; they are not where the structural content actually lives.

## Reading

The honest distillation: dropping bottom-preservation doesn't open a door to a Lindström-quantifier extension of the chapter. It opens a door to a small finite enrichment by inconsistency-injection generators. The remaining structural questions are concrete and finite, and the chapter's existing two-internal-logics / four-regime / Verdier / strong-MLD architecture appears to extend over $\mathcal C^\beta$ without substantial restructuring — modulo the five sub-questions above, each of which is a finite check rather than a research program.

If the engineering layer (paraconsistent fault-injection, deliberate-inconsistency overlays for testing, etc.) wants explicit syntactic handles for the orbit-coloring generators, that's where $\mathcal C^\beta$ earns its keep. The math layer's gain is more modest: a complete classification (no hidden generators are silently excluded by bottom-preservation) and a tight obstruction theorem (the chapter's natural-symmetric-group framing is fundamentally incompatible with non-principal asymptotic information).
