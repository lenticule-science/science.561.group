---
title: "Officer"
description: "An Officer is an agent currently bound to a deontic profile defined by an Office — a named normative position specifying powers, duties, privileges, and immunities that are invariant across holders and transferred by formal installation."
defines: Officer
related: Agent, Role, Office, Fiduciary, Steward, Incumbent, Duty, HohfeldianPosition, Norm, Authority, Trust, Investiture, NormativeSystem
extends: agent
governed-by: office
requires: investiture
enables: [authority, duty]
date-created: 2026-03-18
date-modified: 2026-03-19
---

## Formal tuple

An **Officer** is a triple $(O,\, a,\, \iota)$:

$$\mathrm{Off} = (O,\; a \in H_t,\; \iota)$$

where: - $O = (H_t, \sigma_t, \Delta_t)$ is an Office — a pair of commuting nuclei on fiber $H_t$ - $a \in H_t$ is the **occupant** — the element currently submitted to $O$'s obligations - $\iota$ is the **installation** — the constitutive act that binds $a$ to $O$ (not a mathematical term; a normative event)

Three conditions characterize the officer relation:

1. **Submission**: $a$ is under evaluation by both nuclei — $\sigma_t(a)$ and $\Delta_t(a)$ are both defined and $a \leq \sigma_t(a)$, $a \leq \Delta_t(a)$ (by the inflationary property of nuclei).

2. **Compliance** (settlement): $a$ is a compliant officer iff $a \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ — both obligations discharged simultaneously.

3. **Profile invariance**: the deontic profile $(D_O(α))_{α \in A}$ is a function of $O$, not of $a$.
  Any agent bound to $O$ by installation faces the same $(\sigma_t, \Delta_t)$.
  Vacating (removing the binding $\iota$) leaves $O$ unchanged.

**Obligation gap.** For a non-compliant officer $a \notin H^*_t$, the pair $(\sigma_t(a),\, \Delta_t(a))$ is the **gap** — how much further the nuclei demand.
The element $a$ owes $\sigma_t(a) - a$ to the saturation obligation and $\Delta_t(a) - a$ to the transfer obligation (in the fiber ordering $\leq_t$).
Both gaps close to zero iff $a$ settles.

## What this is

An **Officer** is an agent currently bound to the normative profile of an **Office**.

The mathematical invariant comes from Hohfeld (1913): legal relations decompose into eight fundamental positions, arranged as correlative pairs — right/duty, privilege/no-right, power/liability, immunity/disability.
An **office** is a named vector of Hohfeldian positions over a set of actions and agents-in-scope.
An **officer** is an agent to whom that vector has been formally bound.

The critical structural fact: **the Hohfeldian profile is a function of the office, not of the holder**.
Let O be an office and A a set of actions.
O assigns to each action in A a Hohfeldian position — power, duty, privilege, or immunity — independently of which agent occupies O.
Any agent installed in O acquires that assignment.
When the agent vacates O, the profile persists; the next holder receives the same profile.

Formally:

- An **Office** O over actions A is a function D_O: A → {power, duty, privilege, immunity} (plus the Hohfeldian correlatives on the other side of each relation: liability, no-right, disability, right).
  D_O is defined without reference to any particular holder.
- An **Officer** is a pair (O, a) where a is an agent currently bound to D_O by a normative act of **installation** — the act that transfers the binding from the abstract profile to the concrete agent.

The four Hohfeldian positions in D_O(α) for action α:

- **Power**: the officer's performance of α alters the normative position of others (can grant, commit, authorize)
- **Duty**: the officer is obligated to perform α (or to omit it — a duty of forbearance)
- **Privilege**: the officer may perform α without being under a duty not to (a liberty, not an entitlement)
- **Immunity**: others' exercise of their powers cannot alter the officer's position regarding α

## Installation

Installation is the normative act that binds an agent to D_O.
Before installation, D_O is abstract — no agent is bound.
After installation, the officer (O, a) exists: a has the powers, duties, privileges, and immunities specified by D_O for the duration of occupancy.
Removal reverses the binding; the office persists.

This is what distinguishes an office from a role: a role's capabilities are assigned administratively.
An office's profile is transferred by a constitutive act — installation creates a normative fact, not just an administrative record.

## What distinguishes Officer from Agent

An Agent is defined causally: it submits steps to an interface and receives output.

An Officer is defined normatively: it is bound to a deontic profile D_O that specifies what it may, must, and cannot have done to it.
An agent can be an officer.
An officer is always an agent.
The concepts are orthogonal — agenthood is causal; officerhood is deontic.

## What distinguishes Officer from Role

A Role is an interface type: a named set of required capabilities.
Filling a role is providing a capability witness — showing that the agent can perform the required operations.

An Office is a normative profile: it specifies not just capability but obligation, and it binds through installation rather than capability-matching.
A role says what you can do; an office specifies what you must, may, and are immune from, and who bears the correlative liabilities.

## Gradient

Officer is one concept in a gradient of agent-position structures.
See also:

- Role — capability specification only; filling a role is providing a capability witness, not deontic binding
- Office — the normative position itself: the Hohfeldian profile $D_O$ that persists independent of holders
- Fiduciary — strongest form of acting-for-another: duty of loyalty, no undisclosed benefit, discretion oriented solely toward the principal's account
- Steward — *oikonomos*: delegated authority over another's domain, bounded by the account-rendering obligation
- Incumbent — the current holder in temporal possession of a pre-existing position; the natural person wearing the body politic

## Open questions

- Whether an office can be jointly held (two agents simultaneously bound to the same D_O), and what the formal structure of joint deontic binding is.
- How the Hohfeldian profile D_O relates to nuclear structures in formal systems — see office.md for the nuclear connection between $(\sigma_t, \Delta_t)$ and the two-obligation structure of an office.
