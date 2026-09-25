---
type: question
status: partial
explores: [dispatch, capability-fiber-bundle, work-predicate, task-cell-system]
title: How is capacity expressed as a substrate-algebraic property?
description: "The work vocabulary's dispatch names three checks: capability, authority, capacity."
---

# How is capacity expressed as a substrate-algebraic property?

The work vocabulary's [dispatch](../../humanities/theories/sociology/theories/work/terms/dispatch.md) names three checks: capability, authority, capacity. The [dispatch morphism](../../research/2026/07/31/lenticule-import/library/social-sciences/working/morphisms/dispatch.md) handles capability via residuation on bilattice-valued fibers and authority via the existence of a power [jural-relation](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md). Capacity — "the agent has bandwidth; current open assignments are below the agent's declared capacity" — is a *cardinality* condition: count the agent's open assignment cells, compare to a threshold.

Bilattice algebra does not natively encode cardinalities. A predication fiber's value at a cell is in $\mathbf{2}^\bowtie$; counting cells across an entity-row requires aggregation across the row, which is not a per-cell bilattice operation.

## The cardinality gap, precisely stated

The naive capacity check would be a closure rule of the form:

$$\#\{T : v(\langle T, \texttt{assigned-to}, A\rangle) = \mathbf{t}\} < \mathrm{cap}(A) \;\Longrightarrow\; v(\langle A, \texttt{has-capacity}\rangle) = \mathbf{t}$$

The antecedent requires computing a cardinality — the count of tasks currently assigned to $A$ at bilattice value $\mathbf{t}$. This count is not a bilattice join, meet, or any combination thereof. It is a *set-size function* on the agent's `assigned-to` fiber, mapping the fiber to a natural number, then comparing that number to a threshold.

The bilattice algebra's closure-rule language (in the standard $\Pi_1$ and Scott-continuous fragments) does not include a primitive for "count how many cells in this predicate-row are at $\mathbf{t}$." The counting predicate lives outside the fragment.

## Three proposed resolution strategies

### Strategy 1: Annotation layer (external scheduler)

Capacity is tracked by an external scheduling process that reads the operations settling's `assigned-to` cells, computes the count, and writes a single capacity-summary cell into the settling as an increment:

$$u_\tau\bigl(\langle A, \texttt{current-load}, n\rangle\bigr) = \mathbf{t}$$

at each stage $\tau$ at which $A$'s assignment count is $n$. The dispatch morphism's capacity check then reads the `current-load` cell and compares it to a capacity-declaration cell $\langle A, \texttt{declared-capacity}, m\rangle = \mathbf{t}$.

The comparison $n < m$ remains a cardinality operation, but it is now *in the increment-generation layer*, not in the closure-rule system. The closure rule becomes:

$$r_{\mathrm{cap}}: v\bigl(\langle A, \texttt{current-load}, n\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle A, \texttt{declared-capacity}, m\rangle\bigr) = \mathbf{t} \;\wedge\; n < m \;\Longrightarrow\; v\bigl(\langle A, \texttt{has-capacity}\rangle\bigr) = \mathbf{t}$$

The comparison $n < m$ is a guard on natural-number-valued cells — a metavariable side-condition, not a bilattice operation. This is admissible as a closure-rule *side-condition*, provided the cell-value encoding of natural numbers is explicit. The operation remains $\Pi_1$ modulo the side-condition.

**Drawback:** The `current-load` cell requires the external process to decrement when tasks complete or are abandoned — a non-monotone update. This contradicts settling-monotonicity for the `current-load, n` cells: once $\langle A, \texttt{current-load}, 3\rangle = \mathbf{t}$ is asserted, settling-monotonicity retains it even after load drops to 2. 

Resolution: encode load not as a single cell but as a *timestamped* cell $\langle A, \texttt{current-load-at}, (\tau, n)\rangle$ — the load at a specific stage. The dispatch morphism's capacity check reads the *most recently timestamped* such cell. The substrate accumulates a monotone history of load values; the dispatch rule reads the current-epoch value. This is a standard event-sourcing pattern, substrate-algebraically admissible.

### Strategy 2: Successor-predicate encoding

Encode natural numbers $n$ as a chain of cells within the bilattice: $\langle A, \texttt{slot-count-\!}n\rangle$ for $n = 0, 1, 2, \ldots$, with closure rules:

$$r_{\mathrm{succ}}: v\bigl(\langle A, \texttt{slot-count-\!}n\rangle\bigr) = \mathbf{t} \;\wedge\; [\text{new assignment to } A] \;\Longrightarrow\; v\bigl(\langle A, \texttt{slot-count-\!}(n+1)\rangle\bigr) = \mathbf{t}$$

This encodes counting as a sequence of $\Pi_1$ rule firings that walk the successor chain. The capacity check becomes: "does $\langle A, \texttt{slot-count-\!}m\rangle$ reach $\mathbf{t}$ before the dispatch fires?" — i.e., has the successor chain reached the declared capacity bound?

**Drawback:** Same monotonicity problem — the `slot-count` cells do not decrease. The encoding works for *accumulating* counts (how many total tasks have ever been assigned to $A$) but not for *current* counts. The approach requires the timestamped encoding from Strategy 1 to handle completions.

Additionally, the successor chain is infinite in principle; for a capacity bound of $m$, only cells up to $\langle A, \texttt{slot-count-\!}m\rangle$ need to be materialized. This makes the approach viable for bounded capacities, finite settling, strict regime.

### Strategy 3: Slot-cell pre-allocation (preferred)

Replace cardinality counting with a *pre-allocated slot* structure. For each agent $A$ with declared capacity $m$, materialize $m$ slot cells in the initial valuation:

$$v_0\bigl(\langle A, \texttt{slot}, k\rangle\bigr) = \mathbf{t} \quad \text{for } k = 1, \ldots, m$$

Each slot is `free` or `occupied`. Dispatch *consumes* a slot by asserting $\langle A, \texttt{slot}, k, \texttt{occupied-by}, T\rangle = \mathbf{t}$ for the dispatched task $T$. Completion *releases* the slot — but again, slot release is non-monotone.

The monotone treatment: use *slot-epoch* cells. Each slot $k$ has cells $\langle A, \texttt{slot}, k, \texttt{epoch}, e, \texttt{occupied-by}, T\rangle$. Dispatch at epoch $e$ occupies a slot; completion at epoch $e' > e$ marks the slot as released in epoch $e'$. A slot is *currently free* if there is no epoch-$e$ occupation without a corresponding epoch-$e'$ release for $e' > e$. The capacity check is: "there exists a slot $k$ with no unmatched occupation cell in the current epoch."

This is a cell-existence check, not a count. The closure rule:

$$r_{\mathrm{slot}}: \exists k: v\bigl(\langle A, \texttt{slot}, k, \texttt{free-in-epoch}, e\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle A, \texttt{has-capacity}\rangle\bigr) = \mathbf{t}$$

The existential is over a *finite* pre-allocated set (slots 1 through $m$), so it is a finite disjunction — in $\Pi_1$ (as a family of $m$ rules, one per slot). No cardinality counting is required; the question is only whether any slot-free cell exists. This keeps the capacity check in the $\Pi_1$ closure-rule fragment and the strict regime for finite $m$.

**This is the preferred resolution.** It replaces the cardinality problem with a resource-allocation problem that is substrate-algebraically native.

## Implications for dispatch morphism

Under the slot-cell scheme, the [dispatch morphism](../../research/2026/07/31/lenticule-import/library/social-sciences/working/morphisms/dispatch.md) has a clean substrate-algebraic form. The three dispatch checks become:

1. **Capability check**: $\pi^\exists(\sigma_A)(c) \geq_k \mathbf{t}$ for each capability $c$ required by task $T$ (already formalized via [project-fiber-to-capability](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/project-fiber-to-capability.md)).
2. **Authority check**: jural relation of kind `power` with scope-action `assign-task-$T$` exists with potential-holder $A$ at $\mathbf{t}$ (formalized via [jural-relation](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md)).
3. **Capacity check**: $\exists k: v(\langle A, \texttt{slot}, k, \texttt{free-in-epoch}, e\rangle) = \mathbf{t}$ — a free slot exists in the current epoch (formalized via slot-cell pre-allocation above).

All three checks are $\Pi_1$ (or finite disjunctions of $\Pi_1$ rules), keeping dispatch in the strict regime.

## What remains open

**Dynamic capacity changes.** The slot-cell scheme pre-allocates $m$ slots; if $A$'s declared capacity changes (reduces or expands), the slot-cell set must be revised. Expansion is monotone (add new slot cells). Reduction is non-monotone (retire slot cells). The non-monotone case requires the timestamped-epoch pattern: old slot cells remain in the substrate as historical facts; the capacity-check rule reads only current-epoch slots.

**Non-integer capacity.** Some capacity notions are non-integer (fractional effort, partial allocation). The slot-cell scheme handles this if slots are typed by effort-fraction cells, but the epoch-matching logic becomes more complex. This is left as an extension.

**Interaction with k-of-n decomposition.** The k-of-n decomposition pattern (see [decomposition-patterns](decomposition-patterns.md)) requires the same cardinality reasoning the slot-cell scheme resolves: k-of-n settles the parent when $k$ slots among $n$ subtask-completion cells are occupied. The slot-cell scheme applies directly: pre-allocate $k$ "completion-slot" cells; each subtask completion occupies one; the parent settles when all $k$ slots are occupied. This makes k-of-n a special case of the slot-cell capacity check applied at the decomposition level.
