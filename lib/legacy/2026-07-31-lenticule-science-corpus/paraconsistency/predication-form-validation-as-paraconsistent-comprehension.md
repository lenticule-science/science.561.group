---
type: theorem
class: engineering-claim
status: proved
depends-on: [form, validation-rule, submit-form, form-record, predication-fiber-algebra, predication-hyperdoctrine, predicate-specialization, lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, knowledge-order, truth-order, four-bilattice, closure-rule-system, paraconsistency-as-substrate-discipline]
see-also: [refinements-as-paraconsistent-comprehension, form-submission-doctrine-fidelity, mfa-as-twist-product-fusion]
---

# Form admissibility is the paraconsistent Lawvere comprehension over the form-shape's fiber

**Claim.** Let $F$ be a [form](teaching/explanations/form.md) with [form-record](../objects/form-record.md) bound to a shape-record whose extension is the predicate $p_F$ in the substrate's [predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md). Let $\{\rho_1, \dots, \rho_n\}$ be the form's [validation-rules](teaching/explanations/validation-rule.md), each a [closure-rule](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) producing a per-rule verdict in the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_{p_F}$. Let

$$\varphi_F \;:=\; \bigvee_k\, \mathrm{cl}_{\rho_i}(v) \;\in\; A_{p_F}$$

be the cell-wise [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) join of the per-rule closures applied to candidate input $v$ — the substrate's standard bilattice aggregation of evidence from independent sources. Then the form's *admissible-input subobject* — the substrate's structural carving of $p_F$ into the inputs the form will admit at [submit-form](../morphisms/submit-form.md) — is the *classical* Lawvere comprehension

$$\mathrm{Admit}(F) \;=\; \{p_F : \varphi_F\}_\mathbf{t} \;\in\; \mathcal{C}/p_F,$$

the right adjoint to the $\leq_t$-extension functor furnished by the [classical Lawvere comprehension theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-classical.md). A candidate $v$ is admitted by $F$ iff $\varphi_F(v) = \mathbf{t}$ — the aggregated evidence has settled positively, with neither an unevaluated $\bot$ rule nor a denying $\mathbf{f}$ rule nor a contradicting $\top$ cell.

The dual *paraconsistent* comprehension

$$\mathrm{Conflict}(F) \;=\; \{p_F : \varphi_F\}_\top \;\in\; \mathcal{C}/p_F,$$

furnished by the [paraconsistent Lawvere comprehension theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-paraconsistent.md), carves the substrate's *conflict-surface* — the cells where two or more rules contributed contradictory evidence. The two adjoints carve disjoint sub-supports of $p_F$ ($\mathbf{t}$-support and $\top$-support respectively); together with the $\mathbf{f}$-support of $\varphi_F$ (the per-rule rejection cells, which form their own sub-locale and are not the value of either Lawvere adjoint), they exhaust the cells where $\varphi_F$ has reached a non-$\bot$ verdict. The substrate uses $\mathrm{Admit}(F)$ as the [submit-form](../morphisms/submit-form.md) gate and $\mathrm{Conflict}(F)$ as the contradiction-display surface; both are right adjoints, both are computed from the same $\varphi_F$, and both coexist with the $\mathbf{f}$-cells the substrate displays as direct rule-failure errors.

A form-record may explicitly *commit to* the $\top$-comprehension instead — the federation-canonical variant in which admission requires evidence to be information-maximal rather than positive — for the narrow case of forms whose admissibility is itself a substrate-canonical predication that must survive paraconsistent merge. The substrate's everyday default is $\mathbf{t}$.

## Why this holds

Per [validation-rule](teaching/explanations/validation-rule.md), each rule $\rho_i$ is structurally a closure-rule whose application to a candidate value $v$ produces a fiber-algebra cell — *not* a Boolean. The cell records:

- $\mathbf{t}$ — the rule positively passed (e.g., the regex matched, the cross-field consistency held).
- $\mathbf{f}$ — the rule positively failed, with the validation-error consequent recorded as substrate content.
- $\bot$ — the rule is unevaluated (the field is empty, the dependency is missing, the rule's premise has not yet matched).
- $\top$ — the rule has been simultaneously confirmed and contradicted (e.g., a unique-handle check passed locally but federation-merged a conflicting registration).

Combining rule outputs cell-by-cell via the knowledge join $\bigvee_k$ produces the form's *aggregated evidence state* $\varphi_F$: each cell records the substrate's bilattice-summed verdict across all applicable rules. Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), this aggregation does not poison: a single $\mathbf{f}$ rule combined with $\mathbf{t}$ rules raises the cell to $\top$ (contradiction surfaced) rather than collapsing it to $\mathbf{f}$; the failing rule's positive evidence and the passing rules' positive evidence are both preserved in $\top$, available for the substrate to display, audit, and federate.

The form's admissibility set is then the $\mathbf{t}$-sub-support of $\varphi_F$ — the cells where the aggregated evidence is positively-settled and uncontradicted. By the [classical Lawvere comprehension theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-classical.md), this set is the domain of the right adjoint $\{p_F : \varphi_F\}_\mathbf{t}$ to the $\leq_t$-extension functor on the slice category $\mathcal{C}/p_F$. The substrate's [submit-form](../morphisms/submit-form.md) admission gate is therefore not "evaluate all rules and Boolean-AND the verdicts" — it is "compute $\varphi_F$ via $\bigvee_k$ and look up membership in $\{p_F : \varphi_F\}_\mathbf{t}$." The two algorithms agree on the *positive admission* result, but the comprehension framing additionally supplies the $\bot$, $\mathbf{f}$, and $\top$ cells as substrate content — the Boolean projection discards these.

The dual paraconsistent comprehension $\{p_F : \varphi_F\}_\top$ — the right adjoint to the $\leq_k$-extension functor — carves the disjoint sub-support where $\varphi_F$ has reached $\top$, exactly the cells with surfaced contradiction. The substrate's "validation errors with conflict highlighting" view is structurally the projection $v \mapsto \varphi_F(v) \in \{\mathbf{f}, \top\}$ over the form-record's cells — the $\mathbf{f}$-cells per the per-rule closures, the $\top$-cells per $\mathrm{Conflict}(F)$.

The two designations agree on a form's admissibility *only* when the rule-set produces no contradictions on $v$ (no cell of $\varphi_F$ is $\top$); on contradictory inputs they sharply disagree, and the engineer-facing form-validation discipline depends on which the form-record commits to. Forms whose admissibility is itself a substrate-canonical predication that must survive federation merge — for example, an account-registration form whose admissibility decides whether the new account is admitted on every federation peer — may declare the $\top$-designation explicitly. Per [refinements-as-paraconsistent-comprehension](../../functional-runtime-platform/theorems/refinements-as-paraconsistent-comprehension.md)'s federation-stability remark, the $\top$-comprehension's membership is preserved under $\vee_k$-merge per [federation-convergence](../../../theorems/federation-convergence.md). For everyday forms (account-update, comment-submission, settings-change), the $\mathbf{t}$-default is the right reading.

## Per-rule verdicts compose without poisoning

The non-poisoning property is the cell-wise structure of $\bigvee_k$ on $\mathbf{FOUR}$. For two rules $\rho_1, \rho_2$ producing cells $u_1, u_2 \in A_{p_F}$, the aggregated cell at coordinate $c$ is $(u_1 \vee_k u_2)(c)$ — the knowledge-join of $u_1(c)$ and $u_2(c)$. Reading on $\mathbf{FOUR}$ projections:

| $u_1(c) \backslash u_2(c)$ | $\mathbf{t}$ | $\mathbf{f}$ | $\bot$ | $\top$ |
|---|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{t}$ | $\top$ | $\mathbf{t}$ | $\top$ |
| $\mathbf{f}$ | $\top$ | $\mathbf{f}$ | $\mathbf{f}$ | $\top$ |
| $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\bot$ | $\top$ |
| $\top$ | $\top$ | $\top$ | $\top$ | $\top$ |

Reading the $\mathbf{f}$ row: a rule producing $\mathbf{f}$ at coordinate $c$ does not poison the joint cell to $\mathbf{f}$ across the form. It *preserves* $\mathbf{f}$ when the other rule was uninformed (so the substrate displays a single rule's error), *raises to $\top$* when the other rule was affirming (so the substrate surfaces the conflict rather than silently coercing to one side). The other cells of $\varphi_F$ — touched only by passing rules — remain at $\mathbf{t}$. *No silent coercion of conflict to $\mathbf{f}$ and no propagation of one cell's failure to other cells.* Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), this is the substrate's standard discipline.

A few computed corner cases (using the $\mathbf{FOUR}$ table above):

- *Two rules both confirm at $c$*: $\mathbf{t} \vee_k \mathbf{t} = \mathbf{t}$. Cell admitted under $\{p_F : \varphi_F\}_\mathbf{t}$.
- *One rule denies, one rule confirms at $c$*: $\mathbf{t} \vee_k \mathbf{f} = \top$. Cell *excluded* from $\{p_F : \varphi_F\}_\mathbf{t}$ (the form is not admitted on $v$); cell *included* in $\{p_F : \varphi_F\}_\top$ (the conflict is surfaced).
- *One rule unevaluated, one rule confirms at $c$*: $\mathbf{t} \vee_k \bot = \mathbf{t}$. Cell admitted — the unevaluated rule does not block when it has not been informed.
- *Both rules unevaluated at $c$*: $\bot \vee_k \bot = \bot$. Cell *excluded* from both comprehensions; the form is not yet adjudicable at this cell — its draft status per [form](teaching/explanations/form.md).
- *One rule denies at $c$, no other rule applies*: $\mathbf{f}$. Cell excluded; the substrate displays the rule's error.

The $\bot$-cells form the form's *draft-state sub-locale*; the $\mathbf{f}$-cells form the *single-rule-error sub-locale*; the $\top$-cells form $\mathrm{Conflict}(F)$; the $\mathbf{t}$-cells form $\mathrm{Admit}(F)$. The four sub-locales partition the cells of $p_F$ where $\varphi_F$ has been computed, and the substrate's form lifecycle (draft → submitted → admitted-or-failed) tracks transitions between them.

This is what lets the substrate display *all* validation errors at once on a form rejection rather than "stop at the first failure": every failing cell remains visible in $\varphi_F$, and the [submit-form](../morphisms/submit-form.md) rejection witness can enumerate them. A Boolean-conjunction validator cannot do this without parallel structure invented separately; the comprehension framing yields it for free.

## When to use the $\top$-designation explicitly

A form's admissibility crosses the substrate's trust boundary: the user-agent supplies values, the substrate admits them into shared state. Per [form-submission-doctrine-fidelity](form-submission-doctrine-fidelity.md), the doctrine the substrate commits to on admission must remain valid under federation. The classical $\{p_F : \varphi_F\}_\mathbf{t}$ admits cells whose aggregated verdict is $\mathbf{t}$ locally; an inbound federation message carrying counter-evidence ($\mathbf{f}$ on the same cell) raises the cell to $\top$ via $\vee_k$ in the merged state, removing it from the local-truth comprehension. Local-truth admission can therefore be *revised down* by federation — the substrate may need to retract a previously-admitted form-submission whose admissibility was contradicted post-hoc by an inbound peer.

For most forms this is the right discipline: admission is provisional, contradictions are visible, retraction is structural rather than exceptional. Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), the substrate already handles such retractions uniformly.

A small class of forms records *substrate-canonical state* whose admissibility must not be revisable on federation merge — typically because subsequent substrate operations would otherwise have to be retroactively voided. For these the form-record may declare the $\top$-designation, in which case admission requires the aggregated verdict to be $\top$ (information-maximal: the form is admitted only after every federation peer has weighed in and the joint result is contradiction-or-confirmation, not still-being-determined). Per [federation-convergence](../../../theorems/federation-convergence.md), $\top$ is the $\vee_k$-top and is fixed under further $\vee_k$-merge, so $\{p_F : \varphi_F\}_\top$-membership is federation-active. The cost is that $\top$-designated forms admit *more slowly* — they require federation to settle before submission resolves — and admit on contradicted inputs (the substrate then handles the contradiction via its conflict discipline rather than refusing).

The substrate's default remains $\mathbf{t}$. The $\top$-designation is opt-in for the rare case where federation-stability of the admission decision matters more than admit-on-positive-evidence.

## Engineering consequence

- **Validation errors are content, not exceptions.** The $\mathbf{f}$- and $\top$-cells of $\varphi_F$ are themselves substrate predications (the validation-error consequents per [validation-rule](teaching/explanations/validation-rule.md)). Per [self-representation](../../teaching/explanations/self-representation.md), they are queryable, witnessed, and federate. The form-rejection response is the projection of these cells, not a thrown exception.
- **All errors surface at once.** The cell-wise $\bigvee_k$ preserves every rule's per-cell verdict; the form-submission witness lists every failing or contradicted cell in one pass. No separate "report all errors" pass over the rules is required, and contradictions display alongside straightforward failures rather than masking them.
- **Cross-substrate validation is consistent.** Per [federation-convergence](../../../theorems/federation-convergence.md), validation closures applied at federation peers converge on the same $\varphi_F$ via $\vee_k$ of per-peer cells. Two substrates running the same form against the same input arrive at the same conflict-and-admission decomposition.
- **Substrate-state validation rules participate uniformly.** A substrate-state-consistency rule (per [validation-rule](teaching/explanations/validation-rule.md): "this email is already registered") that produces $\mathbf{f}$ is a closure-rule producing a fiber cell, identical in shape to a format-check rule. The comprehensions do not distinguish syntactic from semantic rules; both contribute to $\varphi_F$ uniformly.
- **Multi-step wizards are sub-comprehensions.** Per [form](teaching/explanations/form.md), a wizard's per-step validation produces a sub-comprehension $\{p_{F_i} : \varphi_{F_i}\}_\mathbf{t}$ at each step; per-step admission is sub-comprehension membership; the wizard's overall admission is the limit of these sub-comprehensions in the slice category $\mathcal{C}/p_F$. This is the substrate-side justification for "advance to next step iff this step is fully validated."
- **Conditional fields shift the relevant sub-locale.** A field that is irrelevant for a given input (a "details" field hidden when "type = simple") produces $\bot$ at coordinates outside the conditional's enabled scope. Per the $\mathbf{FOUR}$ table, $\bot \vee_k \mathbf{t} = \mathbf{t}$ — an unevaluated irrelevant rule does not block admission when other rules at the same cell affirm. The comprehensions therefore correctly admit inputs that have not filled in irrelevant fields, with no special-casing per conditional.
- **Save-as-draft is the $\bot$-sub-locale.** A draft form is one whose validation has not yet been requested — every rule cell sits at $\bot$, $\varphi_F$ is identically $\bot$ — so the form is *neither* in $\mathrm{Admit}(F)$ *nor* in $\mathrm{Conflict}(F)$, but is admissible as a *draft predication* per [form](teaching/explanations/form.md). Resuming a draft re-runs the closures and may move cells from $\bot$ toward any of the other three sub-locales.

## What the theorem rules out

- **Stop-at-first-failure validation.** A substrate that aborts validation on the first $\mathbf{f}$ cell is computing a Boolean projection of $\varphi_F$ rather than $\varphi_F$ itself. Other rules' verdicts and contradictions are lost; neither comprehension is realized. Per [self-representation](../../teaching/explanations/self-representation.md), the substrate's validation witness must record every applicable rule's per-cell verdict.
- **Silent coercion of $\top$ to $\mathbf{t}$ or $\mathbf{f}$.** A form admitted on a $\top$-cell under the default $\mathbf{t}$-designation is admitting on a contradiction — admission belongs only to the $\mathbf{t}$-sub-support of $\varphi_F$. The substrate must surface the contradiction (route the cell to $\mathrm{Conflict}(F)$ and refuse admission) rather than silently coerce to one side.
- **Conflating $\mathrm{Admit}(F)$ and $\mathrm{Conflict}(F)$.** The two comprehensions carve disjoint sub-supports of $p_F$ ($\mathbf{t}$-cells vs. $\top$-cells). A substrate that admits whenever $\varphi_F \neq \bot$ — folding contradiction into admission — is not implementing either Lawvere comprehension; it is implementing the join of their domains, which has no adjoint characterization and loses the substrate's conflict-surface discipline.
- **Mixing $\mathbf{t}$- and $\top$-designation within one form.** A single form-record commits to one *admission* designation (the conflict surface is always $\top$). Per [refinements as paraconsistent comprehension](../../functional-runtime-platform/theorems/refinements-as-paraconsistent-comprehension.md)'s "the two adjoints carve different sub-supports" remark, the two designations admit different inputs; a form that runs some rules at $\mathbf{t}$-admission and others at $\top$-admission is structurally two different forms, not one.
- **Validation outside the substrate's rule system.** A "validator" implemented as a side-effecting function call outside the [closure-rule-system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) does not produce a fiber cell and cannot contribute to $\varphi_F$. Per [validation-rule](teaching/explanations/validation-rule.md), validation rules must be substrate-recorded closure-rules.

## What the theorem requires

- The form's [validation-rule](teaching/explanations/validation-rule.md) records are substrate-content closure-rules whose application produces $A_{p_F}$-valued cells.
- The substrate's [submit-form](../morphisms/submit-form.md) computes $\varphi_F = \bigvee_k \mathrm{cl}_{\rho_i}(v)$ rather than a Boolean projection.
- The form-record declares its admission-designation ($\mathbf{t}$ default, or $\top$ for federation-active admission); the conflict-surface comprehension $\{p_F : \varphi_F\}_\top$ is computed in either case.
- Validation outcomes are recorded as substrate predications per [self-representation](../../teaching/explanations/self-representation.md).

## Position

This theorem is the IAP-side counterpart of [refinements-as-paraconsistent-comprehension](../../functional-runtime-platform/theorems/refinements-as-paraconsistent-comprehension.md) (functional-runtime-platform): refined types and form admissibility are *the same construction* on different fibers of the substrate's predication hyperdoctrine. A refined type carves a function's argument fiber; a form's admissibility carves an input shape's fiber; both are right adjoints to extension functors per the Lawvere comprehension theorems, with the regime-classification on the underlying closure-rule system controlling decidability per [refinements-as-paraconsistent-comprehension](../../functional-runtime-platform/theorems/refinements-as-paraconsistent-comprehension.md)'s Part 4. The substrate's input-validation discipline is therefore the same theorem at two engineering surfaces — refinements at the function boundary, forms at the user boundary — backed by one categorical structure.

Together with [form-submission-doctrine-fidelity](form-submission-doctrine-fidelity.md) (form submissions are doctrine-faithful federation envelopes) and [mfa-as-twist-product-fusion](mfa-as-twist-product-fusion.md) (MFA is twist-product fusion of accessibility cells), this completes the IAP's account of *user-supplied substrate input*: forms admit content via paraconsistent comprehension, MFA admits identity via twist-product fusion, and submissions cross trust boundaries via doctrine-faithful envelopes. Each axis is one categorical construction rather than a bespoke validation/auth/transport subsystem.
