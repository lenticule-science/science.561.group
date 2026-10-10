---
type: narrative
status: draft
discusses: [operations-base, operations-settling, task-cell-system, normative-operational-layering]
---

# Three formalisms of work, one structure

The work vocabulary in [humanities/theories/sociology/theories/work/](../../../) carries three distinct mathematical formalisms across its texts.
Each is well-developed, internally consistent, and answers a different question about the same underlying content.
Predicated-work treats them as *parallel presentations* of one structure — different coordinate charts on the same manifold of work.

## The three charts

**1.
Bilattice-substrate (predicated-work).** This program.
Operations are settlings of a [predication-settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) over a work-themed predicate category.
Tasks, plans, workflows live as predication-cell sets with goal valuations; dispatch is residuation; completion is settling-quiescence; the four-regime classification typologizes work by closure-ordinal structure.
The chart's strength: it inherits the math program's settling dynamics, regime classification, cohomology, and moduli — work is a structure inside a categorical apparatus that already has its own proved theorems.

**2.
Heyting-presheaf with nuclear closures.** The work texts [formal-structure-of-office](../../../texts/formal-structure-of-office.md) and [formal-structure-of-delegation](../../../texts/formal-structure-of-delegation.md) develop offices and delegations as Heyting algebras $H_t$ at each history $t$, with two nuclear closures $\sigma_t$ (recognition) and $\Delta_t$ (induction) whose joint fixed points $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ name doubly-stable authority.
Restriction maps in a presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$ encode delegation; the four shadow-class table (Proposition 2 in the delegation text) characterizes derived-grant types.
The chart's strength: the nuclear-doctrine apparatus is mature in topos theory, the Heyting-algebra structure carries directly to derived-equivalent presentations, and the Roman legal correspondence (*munus / honor / dignitas*) lands at clean structural conditions.

**3.
Free-algebra ground-terms with substitution closure.** The text [algebraic-structure-of-work](../../../texts/algebraic-structure-of-work.md) develops operations, work, and work units as universal-algebra term-structures: signatures $\Sigma$ provide operation symbols with arities; work is term application $\omega(a_1, \ldots, a_n)$ possibly with free variables; work units are ground terms; settlement closes free variables via substitution.
The four work-types (process, procedure, derivation, inquiry) correspond to the four positions in the inquiry → process settlement path.
Plan dependencies impose equations on the free term algebra, generating a quotient $T(\Sigma, X) / E$.
The chart's strength: it captures the *combinatorial* structure of work composition cleanly, with the work-type classification falling out of the substitution closure.

## What each chart sees clearly that the others see less clearly

- **Bilattice-substrate** sees temporal evolution, epistemic state, and normative-operational interaction best.
  Settling-monotonicity, four-regime classification, and the bilattice's four-valued evidence structure are first-class.
  The *two-layer predicate structure* of [normative-operational-layering](../teaching/explanations/normative-operational-layering.md) — the O→N and N→O closure rules that relate task performance to duty generation and authority to dispatch gating — is a bilattice-substrate native structure: the four cross-layer rule types (N→O, O→N, N→N, O→O) are closure-rule classifications, and the settling-monotonicity of both layers is inherited uniformly.

- **Heyting-presheaf** sees authority structure best.
  The fixed-point conditions for incumbency, the restriction-map structure of delegation, the geometric morphisms for jurisdiction are immediate.
  Temporal dynamics and combinatorial composition require additional encoding.
  The normative-operational *interaction* (authority as a gating condition on operational dispatch) requires additional structure beyond the Heyting-presheaf chart's native tools — it sees authority's internal structure but not its operational coupling.

- **Free-algebra** sees combinatorial composition best.
  Operation/work/work-unit typing, plan dependencies as equations, settlement-as-substitution are immediate.
  Temporal dynamics and authority structure are not native.
  The normative-operational *interaction* is invisible in the free-algebra chart: there is no native encoding of "a completed task generates a duty on the assigned agent."

## What the bilattice-substrate chart uniquely captures

The key structural contribution that the bilattice-substrate chart provides and the other two do not:

**The normative-operational coupling.** The [normative-operational-layering](../teaching/explanations/normative-operational-layering.md) of the predicate category — with its O→N rules (task dispatch generates duties), N→O rules (authority gates dispatch), N→N rules (norm application produces normative state), and O→O rules (task lifecycle transitions) — is a *closure-rule classification* on the two-colored predicate category $\mathcal{C}_{\mathrm{op}}$.
This two-coloring is native to the bilattice-substrate chart and absent from the Heyting and free-algebra charts.

The bilattice-substrate chart is the only one of the three that sees both the normative layer and the operational layer as *fibers of the same predication settling* — and therefore the only one that sees the cross-layer closure rules as rules in the *same* closure-rule system.
The Heyting-presheaf chart sees the normative layer in full but the operational layer only partially; the free-algebra chart sees the operational layer in full but the normative layer as an external annotation.

**The four-state evidential structure.** The $\bot$ / $\mathbf{t}$ / $\mathbf{f}$ / $\top$ reading of every cell — distinguishing *not-yet-settled* from *positively-settled*, *negatively-settled*, and *contradicted* — is bilattice-native.
The Heyting-presheaf chart's algebras are Boolean at the classical positions; the intermediate epistemic states require additional structure.
The free-algebra chart does not model epistemic states at all.

## Translation between charts

The three charts are equivalent presentations in the same sense that linear algebra over $\mathbb{R}^n$ has multiple coordinate systems: the same content under different parametrizations.
Specific translations:

- **Heyting → Bilattice.** Per [office-formalism-equivalence theorem](../theories/predicated-governance/theorems/office-formalism-equivalence.md), the Heyting algebra fiber $H_t$ corresponds to the fiber-positive-coordinate $A^+_p$ of a predication fiber algebra; the two nuclear closures correspond to two closure rules on two separate predicates (institution / induction); the joint fixed-point set corresponds to joint $\mathbf{t}$-settlement of both predicate cells; restriction maps correspond to settling-morphisms.
  The normative-operational coupling in the bilattice chart adds content to this translation: the Heyting chart's authority structure becomes, in the bilattice chart, the N-colored predicate fibers with their O→N and N→O cross-layer closure rules.
- **Free-algebra → Bilattice.** A ground term $\omega(c_1, \ldots, c_n)$ corresponds to a [task-cell-system](../objects/task-cell-system.md) whose cells encode the operation symbol and its bound parameters.
  Substitution of free variables corresponds to closure-rule firings that settle the variable cells.
  Plan dependencies as equations $E$ correspond to closure-rule constraints in the [decompose-task morphism](../morphisms/decompose-task.md).
  The four work-types correspond to four classes of closure-rule subsystems (cycle-independent, finite-history, etc., per [regime-of-recurrent-practice](../theorems/regime-of-recurrent-practice.md)).
- **Heyting ↔ Free-algebra.** Less directly developed; the Heyting algebra of plan-dependency equations is a quotient algebra in the universal-algebra sense (the term algebra modulo $E$), and the presheaf structure $H : T^{\mathrm{op}} \to \mathbf{HA}$ adds temporal indexing to that quotient.
  Whether this is a clean translation requires more work.

## Why three charts and not one

The charts emerged from different traditions.
The Heyting-presheaf chart is grounded in topos theory and Roman/medieval legal doctrine (Kantorowicz, Plowden, Gierke).
The free-algebra chart is grounded in universal algebra (Lambek-categorical-grammar lineage, Lawvere theories) and AI planning (STRIPS, partial-order plans, PDDL).
The bilattice-substrate chart is grounded in many-valued logic (Belnap, Fitting), bilattices (Arieli-Avron, Jung-Rivieccio), and category theory of fibrations (Lawvere hyperdoctrines, Maruyama).

Each tradition has its own mature theorems.
The work vocabulary chose to import all three rather than reduce to one.
Predicated-work's role is not to subsume the other two but to make the *bilattice-substrate version* available with full math-program inheritance, while keeping the other charts referenceable as alternative presentations.

## What this means operationally

For a specific operational question, pick the chart that sees it clearly:

- *Is this incumbency stable?* → Heyting-presheaf (joint-fixed-point check).
- *Will this plan settle?* → Free-algebra (substitution closure under the dependency equations).
- *What kind of work-pattern is this practice?* → Bilattice-substrate (regime placement).
- *What's the cohomological invariant of this function?* → Bilattice-substrate (aperiodic-regime classification by $H^1$-class).
- *Does this delegation chain have proper bounds?* → Heyting-presheaf (presheaf functoriality).
- *Can these workflows compose?* → Free-algebra (type matching at boundaries).
- *Does dispatch generate a duty on the assigned agent?* → Bilattice-substrate (O→N cross-layer rule).
- *Does the agent have authority to perform this task?* → Both Bilattice-substrate (authority-fiber $\delta^N$) and Heyting-presheaf (power jural relation in $H^*_t$) — with the bilattice chart additionally showing the authority's *operational coupling* to dispatch.

The translation theorems (where they exist) let operationally-different questions feed back into one another.
Where translations are not yet worked out, the charts are independent — using one's machinery doesn't automatically make the other's machinery available on the same content.

## What the bilattice-substrate chart uniquely contributes to the derived theory program

Beyond the normative-operational coupling and four-state evidential structure noted above, the bilattice-substrate chart is the exclusive source of three structural contributions that the derived theories (predicated-work and predicated-governance) rely on:

**The CALM corollary.** The [CALM (Consistency As Logical Monotonicity) corollary](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md) applies to $\leq_k$-monotone settling queries.
Its operational content — *positive queries are coordination-free; universal negatives require coordination* — is a native bilattice-substrate result.
The Heyting-presheaf chart has no epistemic-order structure on which to define $\leq_k$-monotonicity; the Heyting algebra's ordering is truth-order only.
The free-algebra chart has no settling dynamics and therefore no CALM analog.
Whenever predicated-work identifies that "confirming $X$ happened is coordination-free" (dispatch confirmation, grant confirmation, plan-completion confirmation, sprint-handoff confirmation), this is a bilattice-substrate-exclusive claim.
The other two charts cannot make it.

**Temporal 2-category and temporal Beck-Chevalley.** The [temporal 2-category](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$ and the [temporal Beck-Chevalley theorem](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) are bilattice-substrate structures — they require the settling's temporal indexing $\lambda$ and the monad-comonad structure ($\mathbb{M}$/$\mathbb{N}$) on the temporal 2-category.
The Heyting chart's presheaf $H: T^{\mathrm{op}} \to \mathbf{HA}$ has a time-indexed structure but lacks the 2-cell dynamics that make temporal BC available.
The free-algebra chart has no temporal structure at all.
The temporal 2-category framing of workflow composition, settle-cycle morphisms, sprint-handoff coherence, and conditional-decomposition BC conditions are all bilattice-substrate-exclusive.

**Klein-four symmetry.** The bilattice $\mathbf{FOUR}$'s Klein-four symmetry group $\{\mathrm{id}, k, t, c\}$ — generated by the knowledge negation $k: (a,b) \mapsto (b,a)$, truth negation $t: (a,b) \mapsto (\bar{a}, \bar{b})$, and conflation $c = k \circ t$ — acts on all cell values.
Every predicated-work structure inherits this symmetry: task cells, capability cells, alignment cells, goal cells, duty cells.
This symmetry is invisible in the Heyting chart (whose algebras are Boolean at the classical positions, with no $\bot/\top$ symmetry) and in the free-algebra chart (which has no valuation structure).
When predicated-work classifies work regime by four positions ($\bot$/$\mathbf{t}$/$\mathbf{f}$/$\top$), this classification is Klein-four-orbit-structured: the four positions are the Klein-four group's orbits on a two-element Boolean base.
The classification's stability under $k$ (knowledge symmetry) is what makes the four-regime dichotomy regime-stable across different operationalizations.

## Position in the program

This narrative anchors the *parallel-formalisms* commitment of predicated-work.
Subsequent narratives can pick specific translations to develop in detail (the Heyting-Bilattice translation is partially worked in [office-formalism-equivalence](../theories/predicated-governance/theorems/office-formalism-equivalence.md); the Free-algebra-Bilattice translation is sketched here but not formalized; the Heyting-Free translation is left open).
The charts are not in competition; they are the result of importing three mature traditions into one work vocabulary, and the synthesis work is to make their translations precise.
