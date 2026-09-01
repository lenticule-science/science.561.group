---
type: theorem
status: established
depends-on: [norm-conflict, norm-conflict-as-top-valued-cell, restorative-accountability, normative-system, authority-gate]
proves: [colonial-law overlay produces persistent top cell; resolution requires political authority]
---

# Restorative-retributive norm conflict

When a polity's normative system contains both restorative and retributive accountability norms — a condition characteristic of communities subject to colonial law overlay — violation events produce a $\top$-valued accountability-disposition cell.
This is a specific instance of [norm-conflict-as-top-valued-cell](norm-conflict-as-top-valued-cell.md) with structure determined by the two accountability patterns, and with a resolution-path analysis that shows why the conflict is often persistent.

## Setup

Let $\mathcal{P}$ be a polity with normative system $\mathcal{S}_N = \mathcal{S}_{\mathrm{rest}} \cup \mathcal{S}_{\mathrm{retrib}}$, where $\mathcal{S}_{\mathrm{rest}}$ is the [restorative-accountability](../objects/restorative-accountability.md) closure-rule subsystem and $\mathcal{S}_{\mathrm{retrib}}$ is a retributive accountability subsystem (violation implies sanction-debt on the harming party).

Both subsystems fire on the same violation-witness cell $\langle V, \texttt{harm-recorded}\rangle = \mathbf{t}$, but their immediate consequents are on different cells:

- $\mathcal{S}_{\mathrm{rest}}$ fires: $\langle R, \texttt{repair-needed}, \tau\rangle = \mathbf{t}$ (the ruptured relation requires repair).
- $\mathcal{S}_{\mathrm{retrib}}$ fires: $\langle P_h, \texttt{owes-sanction}, S\rangle = \mathbf{t}$ (the harming party owes a sanction).

These do not directly conflict — they fire on different cells.
The conflict arises at the accountability-disposition level.

## The accountability-disposition conflict

The charter must also determine what *accountability disposition* applies to the violation: which accountability form governs this case?
Both subsystems have such rules:

$$n_{\mathrm{rest}}: \langle V, \texttt{harm-recorded}\rangle = \mathbf{t} \;\Longrightarrow\; \langle V, \texttt{accountability-disposition}\rangle \to \texttt{restorative-process}$$

$$n_{\mathrm{retrib}}: \langle V, \texttt{harm-recorded}\rangle = \mathbf{t} \;\Longrightarrow\; \langle V, \texttt{accountability-disposition}\rangle \to \texttt{retributive-sanction}$$

By [norm-conflict-as-top-valued-cell](norm-conflict-as-top-valued-cell.md), both norms fire and push $\langle V, \texttt{accountability-disposition}\rangle$ to $\mathbf{t}$ (restorative) and $\mathbf{f}$ (retributive) simultaneously.
The result:

$$\langle V, \texttt{accountability-disposition}\rangle = \mathbf{t} \vee_K \mathbf{f} = \top$$

The accountability disposition is overdetermined: both processes are simultaneously required, and neither can proceed without resolving which takes precedence.

## Interaction effects beyond the disposition cell

Even when an adjudication provisionally selects a disposition — forcing the disposition cell from $\top$ toward one value — the interaction between the two accountability processes produces further $\top$ cells:

- Retributive sanction may preclude the harming party's participation in restorative deliberation (imprisoned or constrained parties cannot engage in community-based repair).
- Restorative process completion may be cited as grounds to decline or reduce retributive sanction — or may be denied this effect by the retributive norm.
- The harming party's $\langle P_h, \texttt{accountability-complete}\rangle$ cell is contested: the retributive subsystem fires it on sanction-payment; the restorative subsystem fires it on relation-restoration.
  If both fire simultaneously, the completion cell reaches $\top$.

These secondary $\top$ cells grow $H^1$ beyond the primary disposition conflict.

## Why the conflict is often persistent: the political authority constraint

The three resolution paths from [norm-conflict](teaching/explanations/norm-conflict.md) are adjudication, norm revision, and visible automorphism.
In the colonial-law-overlay context:

**Adjudication** is available but provisional: each violation event re-triggers both norms, and the disposition cell reaches $\top$ again unless the charter is changed.
Adjudication addresses individual cases; it does not eliminate the structural conflict.

**Norm revision** — removing or revising the retributive norms from $\mathcal{S}_N$ — is often unavailable to the community.
The retributive norms were installed by an external authority (colonial legal system) whose authority-gate the community does not hold.
The community cannot authorize the norm-revision act; the external authority will not authorize it.
The revision path is blocked by a governance authority problem.

**Visible automorphism** — restructuring the normative system to eliminate the conflict at its source — requires political authority to restructure the charter.
If the charter is partially held by an external authority, the automorphism cannot proceed unilaterally.

The result: the $\top$ cell is persistent not because the substrate cannot resolve it technically, but because the resolution paths require political authority that the community lacks.
This is the substrate-algebraic account of *legal pluralism under colonial constraint* — the community's law and the imposed law are both operative, their conflict is real, and the resolution requires political change that is outside the community's current normative reach.

## Connection to [tradition-pluralism-as-fragment-coproduct](tradition-pluralism-as-fragment-coproduct.md)

Tradition pluralism shows that multiple governance patterns can coexist when their fragment-coproduct is compatible.
The restorative-retributive case is the failure mode of this coexistence: when two accountability patterns produce contradictory consequents on the same cell, they are not compatible as a coproduct — their compatibility condition fails.
The $\top$ cell is the substrate-algebraic evidence of the failure.

A polity that has *chosen* both patterns as part of its coproduct would have written charter rules distinguishing when each applies (restorative for community-internal violations, retributive for external-interface violations, etc.), preventing the disposition-cell conflict.
The $\top$ cell is characteristic of *imposed* coexistence — where the two patterns were not jointly designed but are both operative because one was imposed on the other.
