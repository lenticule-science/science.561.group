---
type: concept
class: semantic-anchor
status: draft
depends-on: [operations-base, operations-settling, jural-relation, closure-rule-system, truth-knowledge-cohomology-long-exact-sequence]
---

# Normative–operational layering

The structural commitment that separates *what an agent has standing to do* (the normative layer, formalized in [predicated-governance](theories/predicated-governance/)) from *what an agent is doing or has done* (the operational layer, formalized in predicated-work proper). Both layers live on the same [operations base](../objects/operations-base.md) and share the same predication cells, but they appear under different predicates.

The predicate-category $\mathcal{C}_{\mathrm{op}}$ partitions naturally:

- **Operational predicates:** `assigned-to`, `completed-by`, `dispatched-by`, `failed-by`, `requires-capability`, `provides-capability`, `has-goal`, `terminates-on`, `decomposes-into`, `depends-on`, `abandoned-by`, `cancelled`, `suspended-by`. These predicates' cells record the substantive work.
- **Normative predicates:** `holds-power-over`, `has-duty-to`, `has-privilege-of`, `bears-immunity-from` and the other Hohfeldian-position predicates, plus `recognized-as-incumbent-of`, `inducted-into`, `subject-to`, `within-jurisdiction-of`. These predicates' cells record the standings.

## Cross-layer closure rules: a taxonomy

The two layers interact through *cross-layer closure rules* in $\mathcal{S}_{\mathrm{op}}$. These rules have antecedents in one layer and consequents in the other. The taxonomy has four types:

### Type N→O: Normative-conditioned operational rules

Antecedent reads normative cells; consequent writes operational cells. The normative standing *gates* or *drives* an operational event.

**Canonical example — dispatch authority gate:**
$$r_{\mathrm{auth}}: v\bigl(\langle R, \texttt{kind}, \texttt{power}\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle R, \texttt{potential-holder}, A\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle R, \texttt{scope-action}, \texttt{dispatch-}T\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle A, \texttt{authority-to-dispatch}, T\rangle\bigr) = \mathbf{t}$$

The jural-relation cells (normative) derive the `authority-to-dispatch` cell (operational). The dispatch morphism's authority check reads this derived cell.

**Capability propagation on incumbency:**
$$r_{\mathrm{cap}}: v\bigl(\langle \iota, \texttt{recognized-as-incumbent-of}, O\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle \iota, \texttt{inducted-into}, O\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; \bigwedge_{c \in \mathrm{cap}(O)} v\bigl(\langle \iota, \texttt{provides-capability}, c\rangle\bigr) \geq_k v\bigl(\langle O, \texttt{provides-capability}, c\rangle\bigr)$$

Incumbency cells (normative, from [office-as-double-settlement](theories/predicated-governance/objects/office-as-double-settlement.md)) propagate capability cells (operational, from [capability-fiber-bundle](../objects/capability-fiber-bundle.md)).

**Eligibility rule:**
$$r_{\mathrm{elig}}: v\bigl(\langle A, \texttt{authority-to-dispatch}, T\rangle\bigr) = \mathbf{t} \;\wedge\; \delta(A, T) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle A, \texttt{eligible-for}, T\rangle\bigr) = \mathbf{t}$$

Authority (normative) and capability-matching (operational) jointly derive eligibility (operational).

### Type O→N: Operational-triggered normative rules

Antecedent reads operational cells; consequent writes normative cells. An operational event *creates or modifies* normative standing.

**Duty-on-assignment:**
$$r_{\mathrm{duty}}: v\bigl(\langle T, \texttt{assigned-to}, A\rangle\bigr) = \mathbf{t} \;\Longrightarrow\; v\bigl(\langle R_{\mathrm{duty}}, \texttt{kind}, \texttt{duty}\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle R_{\mathrm{duty}}, \texttt{potential-holder}, A\rangle\bigr) = \mathbf{t} \;\wedge\; v\bigl(\langle R_{\mathrm{duty}}, \texttt{scope-action}, \texttt{complete-}T\rangle\bigr) = \mathbf{t}$$

Assignment (operational) creates a duty to complete (normative, a jural-relation entity). This is the substrate-algebraic content of "accepting a task creates an obligation." The duty persists (settling-monotonicity) until the assignment is superseded by completion, abandonment, or reassignment — each of which adds evidence but cannot retract the original duty cell.

**Accountability-right on dispatch:**
When an agent dispatches a task (operational), the dispatching agent acquires a correlative accountability-right — a normative standing that the dispatchee owes a completion report. This is a Type O→N rule deriving a `claim/right` jural relation from the `dispatched-by` operational cell.

**Charter-violation-creates-liability:**
When a charter rule's firing asserts a violation-record cell (operational consequent of a charter rule, itself Π₁), a subsequent O→N rule derives a `liability` jural relation on the responsible agent — normative standing created by operational fact.

### Type N→N: Normative-internal rules

Antecedent and consequent both in the normative layer. These are purely within [predicated-governance](theories/predicated-governance/) and include:
- Correlative-pairing rules: from a `power` jural relation, derive its correlative `liability`.
- Charter-tier closure rules: from a rule-tier violation, derive the corresponding guideline-required response.
- Succession rules: from a `revocation` increment on an incumbent, derive the office's vacancy state.

These rules are the heart of the predicated-governance subtheory.

### Type O→O: Operational-internal rules

Antecedent and consequent both in the operational layer. These are purely within predicated-work and include:
- Task-lifecycle rules (open → active → completed).
- Decomposition composition rules (all subtasks settled → parent settled).
- Dispatch-eligibility rules (capability matching → eligible-for cell).
- Activation-guard rules (abandonment → active-rules-suspended).

## The interaction graph

The four rule types form a directed graph of layer interactions:

```
N ──N→O──→ O
↑           |
O→N         O→O
|           ↓
O ←──N→N──  N
```

Cycles are possible: an operational event (O) creates normative standing (O→N), which enables a further operational event (N→O), which triggers another operational event (O→O), which then triggers another normative change (O→N). The operations settling handles cycles correctly via the LFP construction — cycles produce fixed-point conditions, not infinite loops, because all rules are inflationary in $\leq_k$.

## Normative changes as increments

Normative changes — charter amendments, office installations, delegations, revocations — are increments $u_\tau$ to the operations settling, not metadata changes to the closure-rule system itself. This is a structural commitment: the *rules* governing the working community ($\mathcal{S}_{\mathrm{op}}$) are fixed for a given operational period; the *content* of the normative layer (who holds what office, what duties are in effect) is increment-driven.

A charter amendment is a change to $\mathcal{S}_{\mathrm{op}}$ — a modification to the rules themselves. This is a higher-order operation: it changes the closure-rule system, not just its settled content. Charter amendments are therefore outside the scope of the operations settling's increment sequence for a fixed rule-set. The amendment event marks the boundary between two operational periods with different $\mathcal{S}_{\mathrm{op}}$.

By contrast, an installation (making someone an incumbent of an office), a delegation (granting a sub-power), or a revocation (withdrawing a jural relation) are all increments within a fixed $\mathcal{S}_{\mathrm{op}}$: they add $\mathbf{t}$ witnesses to normative cells. The Type N→O rules then propagate these normative changes into the operational layer during the next closure-rule firing cycle.

## Two-color settling analysis

The two layers can be analyzed as a *two-color settling*: predication cells in $\Phi_{\mathrm{op}}$ are colored **O** (operational) or **N** (normative); the four rule types are edges in the two-color dependency graph.

The two-color settling has a *topological* structure: if we restrict to Type N→O rules only (ignoring Type O→N), the normative layer is the *base* and the operational layer is the *fiber* over it. Normative standing determines what operational moves are possible. The operational fiber changes dynamically as increments and closure rules fire; the normative base changes at the boundary between operational periods (charter amendments).

Type O→N rules reverse this fiber structure: operational facts can create normative standing. This makes the two-layer structure a genuine *two-way coupling*, not a one-directional derivation. The full interaction (including both directions and the within-layer rules) is a coupled system of two settling fibers, with the cross-layer rules as coupling terms.

The key structural property: the coupling terms (Type N→O and O→N rules) are all Π₁ and inflationary. The coupled system is still a closure-driven settling in the combined predicate space $\Phi_{\mathrm{op}} = \Phi_O \sqcup \Phi_N$, and inherits all the regime classification and CALM properties of the single-layer case.

## Cohomological diagnostics via the truth-knowledge LES

The two-color settling has two cohomologies: truth-order ($H^n_t$, tracking $\mathbf{t}$-valued cells) and knowledge-order ($H^n_k$, tracking $\mathbf{t}$- and $\top$-valued cells). The [truth-knowledge long exact sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) connects them:

$$\cdots \to H^{n-1}(\mathcal{F}^{(\top)}_N) \xrightarrow{\partial_N} H^n_t(\mathcal{F}^{(t)}_N) \to H^n_k(\mathcal{F}^{(k)}_N) \to H^n(\mathcal{F}^{(\top)}_N) \xrightarrow{\partial_N} \cdots$$

with the inconsistency sheaf $\mathcal{F}^{(\top)}_N$ restricted to normative predicates.

**Normative consistency diagnostic.** A *normatively consistent* operations settling has no $\top$-valued normative cells: no duty is simultaneously held and not-held by the same agent, no power is simultaneously granted and revoked, no incumbency is simultaneously recognized and refused. For a normatively consistent settling, $\mathcal{F}^{(\top)}_N = 0$ and the LES collapses: $H^n_t(\mathcal{F}_N) \cong H^n_k(\mathcal{F}_N)$. The truth-order and knowledge-order normative cohomologies agree.

**Normative contradiction detection.** When normative cells reach $\top$ — from conflicting governance events (e.g., two concurrent installations into an exclusive office, a revocation colliding with a concurrent re-installation) — the inconsistency sheaf $\mathcal{F}^{(\top)}_N$ becomes non-zero. $H^0(\mathcal{F}^{(\top)}_N)$ is a free abelian group on the persistently contradicted normative cells — a count of the *unresolved normative conflicts* in the system. The connecting morphism $\partial_N$ maps these persistent conflicts to truth-order cohomology at the next degree, indicating that normative inconsistency creates higher-order operational obstructions.

**Operational consequence of normative inconsistency.** A $\top$-valued normative cell (say, $v(\langle R, \texttt{potential-holder}, A\rangle) = \top$ for a duty) means the Type N→O and O→N rules that read this cell produce outputs with inconsistent justification: both the $\mathbf{t}$-branch and the $\mathbf{f}$-branch of the normative cell propagate into the operational layer. The inconsistency propagates via the N→O coupling rules into operational eligibility and dispatch cells. This is why normative repair (adjudication to resolve $\top$ normative cells to $\mathbf{t}$ or $\mathbf{f}$) is operationally urgent: unresolved normative contradictions corrupt operational decisions downstream.

## Where used

- [operations-base](../objects/operations-base.md) — the predicate category listing both kinds of predicates.
- [predicated-governance/_index.md](theories/predicated-governance/_index.md) — the normative-layer subtheory.
- [dispatch](../morphisms/dispatch.md) — a morphism whose readiness depends on both layers (capability = operational; authority = normative; capacity = operational via slot-cells).
- [charter-as-closure-system](theories/predicated-governance/theorems/charter-as-closure-system.md) — the charter rules are the N→N and N→O rules enforcing the normative layer's commitments.
- [office-as-double-settlement](theories/predicated-governance/objects/office-as-double-settlement.md) — incumbency is a normative state; capability propagation is the N→O rule deriving operational standing from it.
