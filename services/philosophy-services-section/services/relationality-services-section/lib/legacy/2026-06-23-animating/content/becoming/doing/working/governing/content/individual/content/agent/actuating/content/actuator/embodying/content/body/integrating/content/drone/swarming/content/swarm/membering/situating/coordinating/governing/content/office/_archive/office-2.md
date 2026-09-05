---
name: office
description: Specification of office records — a normative position that exists independently of any holder; establishes what frontmatter an office file carries.
status: active
topic: governance
---

An office is a normative position that exists and persists independently of any particular holder.
The authority belongs to the office, not to whoever occupies it — when an occupant vacates, the office remains.
An office is not a kind of agent; it is a governance structure that agents serve and that holds a deontic profile: powers, duties, privileges, and immunities that transfer intact to each successive occupant.

## File location

```
work/governance/staff/offices/<slug>.md
```

`kind` and `slug` are derived from placement and filename — they are not frontmatter keys.

## Frontmatter

Every office record MUST carry:

| Key | Value | Notes |
|---|---|---|
| `title` | display name | e.g. `Office of Engineering` |
| `remit` | one sentence | the scope this office governs |
| `status` | `active` \| `vacant` \| `suspended` | occupancy state |

An office record SHOULD carry:

| Key | Value | Notes |
|---|---|---|
| `of-polity` | polity slug | which polity this office belongs to |
| `held-by` | personnel slug | current occupant; omit when vacant |
| `agents-serving` | list of agent slugs | agents whose work serves this office |
| `deontic-profile` | map | `may:`, `must:`, `must-not:` lists of authorized and prohibited actions |

## Body

An office body SHOULD contain:

- A paragraph describing the office's domain and what distinguishes it from adjacent offices.
- A **Remit** section listing specific areas of authority.
- A **Currently held by** note naming the current occupant, or noting vacancy.
- An **Agents serving the office** table.

## What this specification does not pin

- The deontic-profile duty and power schemas — those live in `work/governance/staff/duties/`.
- Installation and vacancy transition mechanics.
- The reporting graph between offices — that is encoded in `reports-to` cells on the agents and offices themselves, not here.
