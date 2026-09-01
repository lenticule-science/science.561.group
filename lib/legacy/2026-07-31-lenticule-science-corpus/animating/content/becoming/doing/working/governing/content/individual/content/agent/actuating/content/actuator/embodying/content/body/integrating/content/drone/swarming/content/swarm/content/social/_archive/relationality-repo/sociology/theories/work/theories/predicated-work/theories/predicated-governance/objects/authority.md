---
type: definition
class: power-bundle
status: draft
symbol: "\\mathbf{A}"
depends-on: [jural-relation, jurisdiction]
realizes: [authority]
---

# Authority

The mathematical realization of [authority](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/theories/governance/terms/authority.md): the bundle of [jural-relations](jural-relation.md) of `kind: power` that an agent holds over a scope, by virtue of which the agent's acts can create, alter, or extinguish normative relations binding on other agents in the scope.

Authority is *not* a primitive substrate object — it's the *gathering* of an agent's power-jural-relations.
The structural content is in the individual jural relations and their scoping; "authority" names the bundle.

## Data

The authority of agent $A$ over a scope (jurisdiction) $\mathcal{J}$ is the set

$$\mathbf{A}(A, \mathcal{J}) \;=\; \{ R^P \in \mathrm{JuralRel}_{\mathrm{op}} : \langle R^P, \texttt{kind}, \texttt{power}\rangle = \mathbf{t},\, \langle R^P, \texttt{potential-holder}, A\rangle = \mathbf{t},\, R^P \in \mathcal{S}_\mathcal{J} \}$$

of [jural relations](jural-relation.md) of `kind: power` held by $A$ whose closure-rule firings are operative within $\mathcal{J}$.

## Authority as second-quartet bundle

Per the library's [hohfeldian-position](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/theories/governance/theories/hohfeldian/terms/hohfeldian-position.md) text, authority is the *second-quartet* Hohfeldian power: the capacity to *alter normative state*, distinguished from the *first-quartet* claim/duty/privilege that operates on substantive acts.

Substrate-algebraically, this distinction lives in the closure-rule structure:

- **First-quartet** (claim, duty, privilege, no-claim): closure rules whose consequents update *content cells* — a duty's firing settles `obliged-to` cells; a claim's firing settles `entitled-to` cells.
- **Second-quartet** (power, liability, immunity, disability): closure rules whose consequents update *the closure-rule system itself* — a power's exercise admits new closure rules into $\mathcal{S}_{\mathrm{op}}$, alters which existing rules fire, or modifies the substrate's deontic-profile cells on other agents.

Authority's exercise is therefore a *meta-level* operation: it doesn't just settle cells; it changes which rules fire on which cells.

## Authority's exercise

When $A$ exercises authority — issues a command, creates a duty, delegates a power, retracts a privilege — the substrate-algebraic content is an increment that fires one of the following morphisms:

- [Installation](../morphisms/installation.md) — creating new incumbencies with their deontic profiles.
- [Delegation](../morphisms/delegation.md) — creating derived powers in beneficiaries.
- [Revocation](../morphisms/revocation.md) — retracting previously-delegated powers.
- [Assignment](../morphisms/assignment.md) — transferring claims (when authority extends to claim-transfer).
- [Novation](../morphisms/novation.md) — extinguish-and-replace operations.
- [Ratification](../morphisms/ratification.md) — retrospectively settling unauthorized acts.

Each of these requires a power-jural-relation in $A$'s authority bundle whose `scope-action` matches the operation.

## Three traditions, three structural commitments

Per the library text, three traditions ground authority differently.
Substrate-algebraically:

**Weber** (legitimate authority via tradition / charisma / rational-legal).
Substrate content: the *grounds for $A$ holding the power* — recorded as cells like $\langle R^P, \texttt{grounded-in}, \texttt{tradition} \rangle$ or $\langle R^P, \texttt{grounded-in}, \texttt{charter-rule} \rangle$.
The grounding is itself substrate data, audit-replayable.

**Raz** (service conception: authority is justified by enabling subjects to better act on their own reasons).
Substrate content: a *justification cell* on each authority-derived rule, recording the second-order justification.
Subjects can audit whether the authority's directives serve them or merely command.

**Searle** (status-function declaration: authority is collectively-accepted normative status).
Substrate content: a *recognition cell* $\langle A, \texttt{recognized-as-authority-by}, \mathrm{Group}\rangle = \mathbf{t}$ asserting collective acceptance.
Without recognition, the power-cells are at $\bot$ regardless of any other ground — Searle's commitment is that authority is socially-constituted, not naturally-found.

The three traditions are not in conflict at the substrate level: a single authority bundle $\mathbf{A}(A, \mathcal{J})$ can have grounds-cells, justification-cells, and recognition-cells *all settled simultaneously*, with each tradition reading the same substrate state through its own lens.

## Bounded by jurisdiction

Authority is always scoped: $\mathbf{A}(A, \mathcal{J})$ depends on $\mathcal{J}$.
The same agent $A$ may have different authority bundles in different jurisdictions:

- $\mathbf{A}(A, \mathcal{J}_1) \neq \mathbf{A}(A, \mathcal{J}_2)$ — distinct power-jural-relations operative in distinct scopes.
- $\mathbf{A}(A, \mathcal{J}_1 \cap \mathcal{J}_2)$ — the powers operative in both scopes.

Per [jurisdiction](jurisdiction.md), each jurisdiction's closure-rule subsystem $\mathcal{S}_\mathcal{J}$ determines which power-jural-relations fire within it.
Authority outside its jurisdiction is *latent*: the cells exist, but the closure rules don't propagate them in the unauthorized scope.

## Authority and the *ultra vires* condition

An act exceeds authority — *ultra vires* — when it falls outside the scope-action cells of $A$'s power-jural-relations.
Substrate-algebraically: a closure rule that admits an authority-exercising act checks `scope-action` membership; if not matched, produces a failure-witness instead of the intended consequent.

This is the substrate-algebraic content of "authority cannot legitimize an act it does not cover."
It's not a separate enforcement layer; it's the closure-rule's own admissibility check.

## Composition with charter

The [charter-as-closure-system](../theorems/charter-as-closure-system.md) is the founding source of authority bundles in a working community: charter rules create the initial offices and assign power-jural-relations to those offices.
Subsequent installations transfer those bundles to natural-person occupants (officers); subsequent delegations create derived bundles in beneficiaries.

The authority chain bottoms out at the charter — per [installation](../morphisms/installation.md)'s composition with authority chains, the founding installations have no prior authority but are constituted by the charter directly.
The charter is the *base case* of authority; everything else derives.
