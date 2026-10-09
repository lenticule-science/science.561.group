---
type: definition
class: power-bundle
status: draft
symbol: "\\mathbf{A}"
depends-on: [jural-relation, jurisdiction]
realizes: [authority]
aliases:
  - Authority
---

# Authority

The mathematical realization of [authority](../../../../../../../governance-services-section/content/glossary/terms/authority.md): the bundle of [jural-relations](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md) of `kind: power` that an agent holds over a scope, by virtue of which the agent's acts can create, alter, or extinguish normative relations binding on other agents in the scope.

Authority is *not* a primitive substrate object — it's the *gathering* of an agent's power-jural-relations. The structural content is in the individual jural relations and their scoping; "authority" names the bundle.

## Data

The authority of agent $A$ over a scope (jurisdiction) $\mathcal{J}$ is the set

$$\mathbf{A}(A, \mathcal{J}) \;=\; \{ R^P \in \mathrm{JuralRel}_{\mathrm{op}} : \langle R^P, \texttt{kind}, \texttt{power}\rangle = \mathbf{t},\, \langle R^P, \texttt{potential-holder}, A\rangle = \mathbf{t},\, R^P \in \mathcal{S}_\mathcal{J} \}$$

of [jural relations](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md) of `kind: power` held by $A$ whose closure-rule firings are operative within $\mathcal{J}$.

## Authority as second-quartet bundle

Per the library's [hohfeldian-position](../../../../../../../governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-position.md) text, authority is the *second-quartet* Hohfeldian power: the capacity to *alter normative state*, distinguished from the *first-quartet* claim/duty/privilege that operates on substantive acts.

Substrate-algebraically, this distinction lives in the closure-rule structure:

- **First-quartet** (claim, duty, privilege, no-claim): closure rules whose consequents update *content cells* — a duty's firing settles `obliged-to` cells; a claim's firing settles `entitled-to` cells.
- **Second-quartet** (power, liability, immunity, disability): closure rules whose consequents update *the closure-rule system itself* — a power's exercise admits new closure rules into $\mathcal{S}_{\mathrm{op}}$, alters which existing rules fire, or modifies the substrate's deontic-profile cells on other agents.

Authority's exercise is therefore a *meta-level* operation: it doesn't just settle cells; it changes which rules fire on which cells.

## Authority's exercise

When $A$ exercises authority — issues a command, creates a duty, delegates a power, retracts a privilege — the substrate-algebraic content is an increment that fires one of the following morphisms:

- [Installation](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) — creating new incumbencies with their deontic profiles.
- [Delegation](delegation.md) — creating derived powers in beneficiaries.
- [Revocation](revocation.md) — retracting previously-delegated powers.
- [Assignment](assignment.md) — transferring claims (when authority extends to claim-transfer).
- [Novation](novation.md) — extinguish-and-replace operations.
- [Ratification](ratification.md) — retrospectively settling unauthorized acts.

The cells comprising $\mathbf{A}(A, \mathcal{J})$ — the power-jural-relation entities with their kind, holder, and scope-action cells — are $\leq_k$-monotone once settled at $\mathbf{t}$.
By the [predication-settling CALM corollary](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- The query "does $A$ hold power $R^P$ in jurisdiction $\mathcal{J}$?" is coordination-free: any distributed replica of the substrate can confirm positive authority without round-tripping to a central node.
- The query "does $A$ *lack* power $R^P$ in $\mathcal{J}$?"
  (the *ultra vires* negative check) is anti-monotone and requires coordination — confirming incapacity means confirming the absence of power-cells, which cannot be concluded locally from any snapshot.

The *ultra vires* check in the closure rule — "does the scope-action cell match?" — is itself a positive query (is the scope-action cell settled at $\mathbf{t}$?) and is coordination-free.
The ultra-vires *failure* case (the scope-action cell is at $\mathbf{f}$ or $\bot$) requires coordination to confirm, because it requires establishing the absence of a settled match.

In the [temporal 2-category](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_\mathcal{P}, \lambda)$, each authority-conferring morphism — installation, delegation, revocation — is a 1-cell from the stage at which it occurs to the stage at which its effect stabilizes:

$$\mathrm{Install}(\tau_0, \tau_1) : (\tau_0, \mathcal{C}_\mathcal{P}) \to (\tau_1, \mathcal{C}_\mathcal{P})$$

The authority chain from charter to current incumbent is the *composite* of these 1-cells: founding installation, subsequent delegations, subsequent delegations-of-delegations, etc. The composite 1-cell maps the charter's founding stage (the initial 0-cell $(\tau_0, \mathcal{C}_\mathcal{P})$) to the current incumbent's dignitas stage.

The temporal BC condition ([temporal Beck-Chevalley](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md)) holds for authority chains when the fiber of power-cells at each stage commutes with the settling-morphism along the chain.
Authority chains that branch (two derivees receiving powers from the same delegator) satisfy BC iff the two branching 1-cells are related by an invertible 2-cell — meaning the two derivees' authority fibers are structurally interchangeable.
Authority chains that fail BC at some branch are *non-equivalent derivation paths*, meaning the order of intermediate delegations and revocations produces structurally distinct authority fibers.

The authority chain bottoms out at the charter — per [installation](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md)'s composition with authority chains, the founding installations have no prior authority but are constituted by the charter directly.
The charter is the *base case* of authority; everything else derives.
In the temporal 2-category, the charter's founding stage is the initial 0-cell, and the charter installation 1-cells are the first morphisms in the composite authority-chain 1-cell.

Each of these requires a power-jural-relation in $A$'s authority bundle whose `scope-action` matches the operation.

## Three traditions, three structural commitments

Per the library text, three traditions ground authority differently. Substrate-algebraically:

**Weber** (legitimate authority via tradition / charisma / rational-legal). Substrate content: the *grounds for $A$ holding the power* — recorded as cells like $\langle R^P, \texttt{grounded-in}, \texttt{tradition} \rangle$ or $\langle R^P, \texttt{grounded-in}, \texttt{charter-rule} \rangle$. The grounding is itself substrate data, audit-replayable.

**Raz** (service conception: authority is justified by enabling subjects to better act on their own reasons). Substrate content: a *justification cell* on each authority-derived rule, recording the second-order justification. Subjects can audit whether the authority's directives serve them or merely command.

**Searle** (status-function declaration: authority is collectively-accepted normative status). Substrate content: a *recognition cell* $\langle A, \texttt{recognized-as-authority-by}, \mathrm{Group}\rangle = \mathbf{t}$ asserting collective acceptance. Without recognition, the power-cells are at $\bot$ regardless of any other ground — Searle's commitment is that authority is socially-constituted, not naturally-found.

The three traditions are not in conflict at the substrate level: a single authority bundle $\mathbf{A}(A, \mathcal{J})$ can have grounds-cells, justification-cells, and recognition-cells *all settled simultaneously*, with each tradition reading the same substrate state through its own lens.

## Bounded by jurisdiction

Authority is always scoped: $\mathbf{A}(A, \mathcal{J})$ depends on $\mathcal{J}$. The same agent $A$ may have different authority bundles in different jurisdictions:

- $\mathbf{A}(A, \mathcal{J}_1) \neq \mathbf{A}(A, \mathcal{J}_2)$ — distinct power-jural-relations operative in distinct scopes.
- $\mathbf{A}(A, \mathcal{J}_1 \cap \mathcal{J}_2)$ — the powers operative in both scopes.

Per [jurisdiction](jurisdiction.md), each jurisdiction's closure-rule subsystem $\mathcal{S}_\mathcal{J}$ determines which power-jural-relations fire within it. Authority outside its jurisdiction is *latent*: the cells exist, but the closure rules don't propagate them in the unauthorized scope.

## Authority and the *ultra vires* condition

An act exceeds authority — *ultra vires* — when it falls outside the scope-action cells of $A$'s power-jural-relations. Substrate-algebraically: a closure rule that admits an authority-exercising act checks `scope-action` membership; if not matched, produces a failure-witness instead of the intended consequent.

This is the substrate-algebraic content of "authority cannot legitimize an act it does not cover." It's not a separate enforcement layer; it's the closure-rule's own admissibility check.

## Composition with charter

The [charter-as-closure-system](../../../glossary/theorems/charter-as-closure-system.md) is the founding source of authority bundles in a working community: charter rules create the initial offices and assign power-jural-relations to those offices. Subsequent installations transfer those bundles to natural-person occupants (officers); subsequent delegations create derived bundles in beneficiaries.

The authority chain bottoms out at the charter — per [installation](../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md)'s composition with authority chains, the founding installations have no prior authority but are constituted by the charter directly. The charter is the *base case* of authority; everything else derives.
