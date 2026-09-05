---
type: definition
class: cobordism
status: draft
symbol: "H : \\mathcal{B}_{\\mathrm{prior}} \\to \\mathcal{B}_{\\mathrm{next}}"
depends-on: [operations-settling, operations-loop, recurrent-practice]
realizes: [settling-cobordism-category]
---

# Handoff cobordism

A **handoff cobordism** is a [settling cobordism](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md) instantiated to model the standard operational pattern of one team or one cycle handing operational state to another: shift handoff, sprint-end-to-sprint-start, cycle-to-cycle continuation, succession in office, generational role transfer.

The pattern is the same in every case: the work continues, but the bearers change; the operational state at the close of the prior bearer's settling becomes the boundary condition for the next bearer's settling.

## Data

A handoff cobordism $H$ between two operations settlings $v^{\mathrm{op}}_{\mathrm{prior}}$ (the closing party) and $v^{\mathrm{op}}_{\mathrm{next}}$ (the receiving party) is the data of two boundary predication systems and a bulk transition settling between them, oriented in the [settling cobordism](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md)'s direction $\mathcal{B}_{\mathrm{in}} \to \mathcal{B}_{\mathrm{out}}$:

- An **in-boundary** $\mathcal{B}_{\mathrm{prior}} = (B_H, \mathcal{C}_H, v^-_H)$: the closure-stable subset of cells delivered by the prior bearer at the close of $v^{\mathrm{op}}_{\mathrm{prior}}$. $B_H \subseteq E_{\mathrm{op}} \times E_{\mathrm{op}}$ is the set of cells the prior bearer commits to the receiving bearer; $v^-_H : B_H \to \mathbf{FOUR}$ assigns each such cell its bilattice value at the close of $v^{\mathrm{op}}_{\mathrm{prior}}$. The valuation $v^-_H$ is closure-stable by construction — only cells already settled at the close of the prior settling are transferred.
- An **out-boundary** $\mathcal{B}_{\mathrm{next}} = (B_H, \mathcal{C}_H, v^+_H)$: the closure-stable subset of cells received by the next bearer at the opening of $v^{\mathrm{op}}_{\mathrm{next}}$. The cell-system $B_H$ may be the same as on the in-boundary (a clean transfer) or extended (the next bearer's onboarding adds cells to the joint subcategory before the transition closes). The valuation $v^+_H$ is the closure-stable result of running the bulk transition on $v^-_H$.
- A **bulk** $v^{\mathrm{op}}_H$ — the *transition settling*: an operations settling on the union $\mathcal{C}_{\mathrm{prior}} \cup \mathcal{C}_H \cup \mathcal{C}_{\mathrm{next}}$ whose initial valuation restricts to $v^-_H$ on $B_H$ and whose closure restricts to $v^+_H$ on $B_H$. The bulk runs the closure dynamics on the handoff boundary together with whatever new entities the receiving bearer brings, and produces the closure-stable boundary condition for the receiving settling.

The cobordism therefore goes $H : \mathcal{B}_{\mathrm{prior}} \to \mathcal{B}_{\mathrm{next}}$ in the cobordism category's direction. The closing state of the prior settling supplies the *in-boundary* (the cobordism's initial); the opening state of the next settling consumes the *out-boundary* (the cobordism's final). Composition $H_2 \circ H_1$ glues the out-boundary of $H_1$ — the opening state delivered to bearer $i+1$ — with the in-boundary of $H_2$ — the closing state bearer $i+1$ later hands to bearer $i+2$.

## What is and is not in the handoff boundary

The handoff boundary $\mathcal{B}_H$ contains *closure-stable* cells — those whose values are already settled and are committed to the next bearer. It does **not** contain:

- **Newly-designated cells from the outgoing bearer's final stage** that have not yet propagated through closure. These do not satisfy the closure-stability requirement of [settling-cobordism boundaries](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md) and are operationally identifiable as the "in-flight" work the outgoing bearer was still completing.
- **Cells outside the working scope of the receiving bearer.** The incoming bearer typically does not inherit the full cell-system of the outgoing bearer — administrative records of the prior bearer, decisions specific to the prior incumbency, or operational history outside the scope of the role being transferred remain with the outgoing settling.
- **The void cone of the outgoing settling**: cells the outgoing bearer was working toward but never settled. These remain at $\bot$ in the handoff and become part of the *void cone of the new settling* — the work the new bearer inherits as still-to-be-done.

The handoff boundary is therefore the *intersection* of "closure-stable in $v^{\mathrm{op}}_{\mathrm{prior}}$" and "in scope of the receiving role $v^{\mathrm{op}}_{\mathrm{next}}$." This intersection is what the prior bearer formally hands over.

## Composition: chained handoffs

By the composition rule of the [settling cobordism category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md), handoff cobordisms compose along their shared boundaries: $H_2 \circ H_1$ glues the out-boundary of $H_1$ — the opening state delivered to bearer 2 — with the in-boundary of $H_2$ — the closing state bearer 2 hands to bearer 3.

Operational instance: a chain of weekly shift handoffs over a quarter is a composite cobordism $H_n \circ \cdots \circ H_1$ between the closing-of-week-1 boundary and the opening-of-week-($n+1$) boundary. The closure ordinal of the composite is the ordinal sum of the per-handoff bulk closure ordinals — *not* the sum of within-week settling ordinals, which are absorbed into the bearer-internal $v^{\mathrm{op}}_i$ rather than into the handoff cobordisms.

Composition is associative because ordinal sum is, and because the closure-stable boundary at each handoff is uniquely determined by the prior bulk's closure.

## Monoidal product: parallel handoffs

The disjoint-union monoidal product of cobordisms gives **parallel handoffs**: $H_1 \otimes H_2$ models two simultaneous, disjoint handoffs — e.g., the outgoing engineering team hands engineering work to the incoming engineering team while the outgoing operations team independently hands operations work to the incoming operations team. The monoidal product is well-defined on disjoint cell-systems; it fails (raises a non-empty intersection) when the two handoffs touch overlapping cells, in which case the proper structure is a single non-trivial pair-of-pants cobordism rather than a tensor product.

A **pair-of-pants handoff cobordism** $P : \mathcal{B}_1 \otimes \mathcal{B}_2 \to \mathcal{B}_3$ is the substrate-algebraic structure of a *merger handoff*: two outgoing teams' handoff boundaries are merged into a single receiving team's boundary. Conversely, $P^\vee : \mathcal{B}_3 \to \mathcal{B}_1 \otimes \mathcal{B}_2$ is a *split handoff* — one outgoing team's boundary is divided between two receiving teams.

## Special handoff types

**Disk handoff (onboarding).** A disk cobordism $D_{\mathcal{B}_{\mathrm{next}}} : \emptyset \to \mathcal{B}_{\mathrm{next}}$ models *onboarding from no prior bearer*: the cobordism's in-boundary is empty (no inherited settled cells), and the bulk produces the receiving bearer's opening state on the out-boundary from nothing. The closure ordinal of the disk handoff is the time the new bearer takes to settle into a working operational state from nothing.

**Closed handoff (succession proper).** A closed cobordism $\Sigma : \emptyset \to \emptyset$ models a *complete succession cycle* that begins from no inherited state, runs through a series of handoffs, and returns to no inherited state — the full lifecycle from inception to dissolution of an operational structure. The TQFT partition function $Z(\Sigma)$ is the operational invariant of the entire lifecycle.

**Identity handoff.** A trivial $\mathrm{id}_\mathcal{B} : \mathcal{B} \to \mathcal{B}$ — the same bearer continues, no handoff happens. This is the cobordism between consecutive stages of a single operations settling without role transition. It is the unit of composition.

## Duality: the rollback cobordism

The dual $H^\vee : \mathcal{B}_{\mathrm{next}}^\vee \to \mathcal{B}_{\mathrm{prior}}^\vee$ of a handoff cobordism reverses the trajectory and applies the [internal $\mathbb{Z}/2$-gauge](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/internal-z2-gauge.md) negation to all boundary values. Operationally: the dual cobordism is the **rollback** — running the handoff dynamics backward, with positive evidence reread as negative and vice versa.

Rollback is sometimes operationally meaningful (a handoff is repudiated, the outgoing bearer is reinstated, the boundary state is unwound) and sometimes not (most handoffs are not reversible in practice). The cobordism's dual exists structurally regardless; whether the dual is *operationally instantiable* depends on whether the bearer, the records, and the closure rules permit reversal.

## Cohomological reading

By the [TQFT structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md) theorem, the cohomology functor $Z = H^\bullet(\mathcal{F}_{(-)})$ assigns to each handoff boundary $\mathcal{B}_H$ a graded module $Z(\mathcal{B}_H)$ and to each handoff cobordism $H$ a linear map $Z(H) : Z(\mathcal{B}_{\mathrm{in}}) \to Z(\mathcal{B}_{\mathrm{out}})$.

Operational reading:

- $Z(\mathcal{B}_{\mathrm{prior}})$, $Z(\mathcal{B}_{\mathrm{next}})$ are the **modules of cohomological obligations** at the in-boundary (closing) and out-boundary (opening) of the handoff — the unresolved $H^1$-classes (per [adjudication-modes-and-h1](../theorems/adjudication-modes-and-h1.md) and [cadence-modal-non-normality](../theorems/cadence-modal-non-normality.md)) the prior bearer hands over and the next bearer receives. Acknowledged-but-standing contradictions, persistent function-class commitments, modal non-normality classes — all transfer through $Z(H)$.
- $Z(H) : Z(\mathcal{B}_{\mathrm{prior}}) \to Z(\mathcal{B}_{\mathrm{next}})$ is the **transfer linear map** that records how the cohomological structure delivered at the close of the prior settling lands in the cohomological structure available at the opening of the next settling. The kernel of $Z(H)$ is what the handoff *drops* (cohomological structure that does not transfer); the cokernel is what the receiving bearer *adds* without inherited basis (new obligations introduced during the bulk transition).

The pair-of-pants $Z(P)$ is a **multiplication on the cohomology** — by [settling-frobenius-structure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md), this is the algebraic operation that fuses two prior teams' obligations into one receiving team's obligation structure. Mergers are concretely Frobenius-algebraic.

## Relation to operations-loop and recurrent-practice

A [recurrent-practice](./recurrent-practice.md) is generated by an [operations-loop](./operations-loop.md) — a cyclic settling. Each cycle's transition to the next cycle is a handoff cobordism, in this case from a settling to *itself* (same bearer, same scope, new cycle). The handoff boundary $\mathcal{B}_H$ at a cadence boundary is the closure-stable state of the just-closed cycle, which becomes the opening state of the next cycle.

The recurrent-practice is therefore a *closed loop of handoff cobordisms*: $H_{n+1} \circ H_n \circ \cdots$ where each $H_i$ is the cycle-to-cycle handoff. The [cadence-as-modal-frame](teaching/explanations/cadence-as-modal-frame.md) modal structure on the recurrence is the modal structure on this composition; the [cadence-modal-non-normality](../theorems/cadence-modal-non-normality.md) class is an obstruction to the handoff composition being trivial in cohomology.

## Where used

- [operations-loop](./operations-loop.md) — each cycle-to-cycle transition in a loop is a handoff cobordism.
- [recurrent-practice](./recurrent-practice.md) — recurrent-practices are composites of handoff cobordisms.
- (predicated-governance) [succession in office](theories/predicated-governance/_index.md) — installation of an incumbent into a vacant office is a disk handoff cobordism; transfer of office between incumbents is a non-trivial handoff cobordism with the office's [deontic modality](theories/predicated-governance/concepts/deontic-modality.md) on the boundary.
- [generational-review-as-transfinite-bounded](../examples/generational-review-as-transfinite-bounded.md) — generational role transfer is a handoff cobordism whose bulk has transfinite-bounded regime.
