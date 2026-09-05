---
title: "Charter"
description: "A Charter is a founding document that constitutes a community and declares its governing policies — establishing who acts, under what authority, and what counts as a valid covering of the scope."
amendment-authority: [commissioning-authority, captain, joint]
scope-governance: [fixed, phased, organic]
date-created: 2026-03-18
date-modified: 2026-04-28
---

## What this is

A **Charter** is a founding document that constitutes a community and declares its governing policies.

The term comes from the Latin *carta* (paper, document). Historically: a royal charter establishes an organization, grants it powers, and constitutes it as a legal body. A city charter defines who governs, what authority they hold, and what rules bind the community. A corporate charter declares the community of shareholders and directors and the policies under which they operate.

The invariant across all uses: **a charter constitutes a community and declares the policies that govern its operations**. Before a charter, there may be a complete specification (a **Blueprint**) — but no community is constituted and no one is bound. A charter is the act of constitution: it names who acts here and establishes what they are bound by.

A charter is a [StatusFunctionDeclaration](./status-function-declaration.md): it is the constitutive speech act of the form *X counts as Y in context C* where $X$ is the specified community, $Y$ is the institutional status of that community (constituted body, governed by these policies), and $C$ is the scope. The four-tuple $(X, Y, C, A)$ maps directly: the community $X$ is the [Group](../../../../../../math/theories/algebra/terms/group.md) being constituted; the status $Y$ includes the [NormativeSystem](./normative-system.md) of governing policies; the context $C$ is the scope; and the authorizing act $A$ is the [Authority](./authority.md) that makes the charter binding rather than merely advisory.

The governing policies declare the [NormativeSystem](./normative-system.md) — the deontic constraints on community members. These are [Norm](./norm.md) instances specifying what members must, may, and must not do within the scope. The charter's `norm-set` child in the AST names these governing norms; its `position-set` child names the [Office](../../../terms/office.md)s the community establishes; its `constitutive-rule-set` child names the *X counts as Y* rules by which institutional facts in this community are created.

## What a Charter enables

A charter makes two things possible that a blueprint alone cannot provide:

1. **Governing principles** (a soul): the deepest commitments of the community can only be stated once the community exists. Axioms constrain operations; governing principles constrain the agents performing them. You cannot write principles for a community that has not yet been constituted.

2. **Witnessing assembly**: once the covering structure is declared — what families of operations or observations count as full coverage of the charter's scope — compatible local actions can begin assembling into community-level commitments. This is the step toward an operative institution.

## What distinguishes a Charter from what comes before and after

Before a charter: a **Blueprint** — complete specification, no constituted community.

A charter: the specification equipped with a declared agent community and covering policies.

After a charter: an operative institution — when the community has begun assembling actions into commitments and producing institutional facts under the charter's rules.

## Charter amendment

A charter amendment is a change to the rules of governance — substituting new policies, new positions, or new constitutive rules for the old. Three types are structurally distinct:

| Amendment type | Relation to old charter | Institutional effect |
|---|---|---|
| **Conservative (additive)** | Old rules remain valid; new rules added above them | All previously settled institutional facts remain settled; new categories of fact become possible |
| **Restrictive (subtractive)** | Some previously recognized rules are revoked | Previously recognized institutional facts may need to be re-evaluated; some previous settlements lose their grounding |
| **Non-conservative** | New rules incomparable with old rules — neither additive nor subtractive | The institutional structure must be re-grounded; ongoing facts whose support was in the revoked rules may require re-justification under the new rules |

**Amendment validity condition.** A conservative amendment is always valid: the old charter's commitments remain in force under the new charter's expanded scope. A restrictive or non-conservative amendment is **constitutionally valid** only if it preserves the *hard core* of the charter's founding commitments — the irreducible set of policies the charter cannot dissolve without dissolving itself. If the proposed amendment would revoke any element of the hard core, the result is not an amendment but a re-charter: the old institution is dissolved and a new one is constituted in its place.

## Governing principles can be deferred

The charter constitutes the structure (the community, the positions, the scope). The community's deepest normative commitments — its governing principles — can be deferred to first operational activity. Until the principles are installed, the community exists (the charter is in force, the structure is constituted) but is not yet operative: no institutional fact can be settled until the principles supply the criteria for settlement.

The deferral condition: governing principles can be declared at any time after constitution, but no institutional judgment can be issued before they are. The first act of institutional operation must supply the principles as a precondition for any binding judgment.

## Charter scope and viability

A charter's scope — the domains of activity it claims to govern — affects the institution's viability. Richer charters (governing more concurrent domains) require the community to operate more carefully and deliberately to achieve convergence on settled facts. The relationship is not arbitrary: institutions whose scope outruns their capacity to settle institutional facts produce divergent expectations, conflicting precedents, and ultimately the dissolution of the institutional structure into separate sub-institutions or private deliberation.

The viability threshold is structural: a community can sustain at most as much scope as it can settle institutional facts about. Beyond that, settlement breaks down — the community exists but cannot generate the institutional facts the charter calls for.

## Amendment authority

The formal amendment condition (preserves hard core, valid type) does not specify who has the *power* to initiate an amendment. Three models exist in practice:

**Commissioning authority amends.** The [confederacy](../../../../../terms/confederacy.md) or sovereign that [commissioned](./commissioning.md) the institution holds amendment power. The captain operates under the charter; the commissioning authority can change it. This is the strongest form of external control — the institution's constitution is not in its own hands. Analogy: a corporation's charter is amended by the shareholders, not by the CEO.

**Captain amends.** The captain, as the embodiment of the institution's ongoing governance, holds amendment power within the charter's own bounds. The commissioning authority set the original charter but the captain can modify it as circumstances require. This gives the captain more autonomy but creates a risk: the captain could amend away constraints that protect the [beneficiaries](./beneficiary.md). Safeguard: the hard core (the founding commitments) cannot be amended without dissolving the charter — only the non-core provisions are within the captain's amendment power.

**Joint amendment.** Amendments require both the commissioning authority's approval and the captain's authorship. The captain drafts amendments (because the captain understands operational needs); the commissioning authority ratifies them (because the commissioning authority holds constitutional authority). This is the most common model in practice: the captain proposes, the board approves.

The choice between these models is itself a charter-level decision — it must be declared at commissioning. A charter that is silent on amendment authority defaults to the commissioning authority, because the power to constitute includes the power to reconstitute.

## Scope governance

Charter scope can be governed in three ways:

**Fixed scope.** The charter declares its scope at commissioning and does not change it. Scope changes require a new charter (which is formally a decommissioning and recommissioning). This is the most conservative model — the institution's domain of activity is settled once and the community can calibrate to it.

**Phased expansion.** The charter pre-authorizes future scope contingent on demonstrated capacity. "The ship governs knowledge infrastructure now; when it demonstrates the ability to operate stably at this scope, it may expand to physical infrastructure." The phases are declared at commissioning but activated later (by the captain or the commissioning authority, depending on amendment authority). Scope expands as the community demonstrates it can settle institutional facts at the broader scope.

**Organic growth.** The captain determines operational scope within the charter's bounds, expanding or contracting as circumstances require. The charter sets the endeavor and the rules; the captain decides what domains to engage. This gives maximum operational flexibility but creates risk: the captain may expand scope faster than the community can sustain coherent settlement of institutional facts at the broader scope.

The viability threshold provides the test: scope is sustainable as long as the community can continue to produce settled institutional facts under it. If institutional facts begin to diverge — different members of the community holding incompatible settlements — the scope has exceeded the institution's capacity and must be reduced or the institutional process must slow.

## Open questions

- Whether the boundary between a constitutionally valid amendment and a re-charter is precise — whether the hard core of a charter is always identifiable in advance, or whether some amendments are recognized as re-charters only retrospectively, after the institution has effectively dissolved.
- Whether the institution's viability threshold can be measured directly, or whether it can only be inferred from the breakdown of settlement (after the fact). If it can be measured directly, the measurement might be useful as a feedback signal in the institution's own self-governance.
- Whether amendments that are valid in their own terms but produce gaps in the institutional structure (some institutional facts that were settled under the old charter become unmoored under the new) have a recognized resolution procedure, or whether such gaps are simply absorbed into the institution's interpretive practice over time.
