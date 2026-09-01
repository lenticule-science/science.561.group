---
type: morphism
class: relation-severance
status: draft
symbol: "\\mathrm{banish}_a"
depends-on:
  - polity-cell-system
  - tiyospaye
  - oyate
  - omniciye-council
  - restorative-system
realizes: [severance]
---

# Banishment as relation-severance

Banishment is the polity's exceptional response to harm that cannot complete the restorative pathway: the omníčiye decides to remove the agent from the polity's kin-network.
It is structurally distinct from confinement (no holding-cells) and from punishment (no sanction-cells with carry-over); it is the *severance of relation*, full stop.
Banishment is rare, deliberate, and reversible only under specific conditions.

## The morphism

For an agent $a$ banished from polity-unit $P$:

$$\mathrm{banish}_a : v \;\longmapsto\; v'$$

with effects:

- $\langle a, \texttt{member-of}, P\rangle \to \mathbf{f}$ — the membership-cell is *negated*, not merely under-determined.
  The agent is removed from the polity's populace-cell.
- $\langle a, \texttt{kin-of}, b\rangle \to \mathbf{f}$ for each $b \in \mathrm{pop}(P)$ — the kin-cells are severed *across the polity*.
  This is the structurally distinguishing feature: banishment does not just withdraw the agent from one engagement (which would be [iyúhá-šni](iyuha-sni-withdrawal.md)); it severs the underlying relation.
- $\langle a, \texttt{place-relation-with}, p\rangle \to \mathbf{f}$ for each $p \in$ the polity's place-cells.
  The agent loses kin-relation with the polity's land.
- $\langle a, \texttt{standing-with}, P\rangle \to \mathbf{f}$ — all standing-cells are negated.

The morphism is *not* a positing morphism in the standard $\leq_k$-monotone sense; it is a *deliberate setting-to-$\mathbf{f}$* on cells that were previously at $\mathbf{t}$.
This is a substrate-decreasing operation; it is admissible because the operation is *exterior* to the $\leq_k$-monotone family — it represents the polity's explicit constitutional decision rather than a settling-step.

## Substrate-algebraic distinction from related morphisms

| | iyúhá-šni | banishment |
|---|---|---|
| **Initiated by** | The withdrawing agent | The polity (omníčiye) |
| **Scope** | A specific engagement | All engagements + all kin-cells |
| **Kin-cells** | Preserved | Negated |
| **Reversible by** | Re-positing acceptance | Specific re-admission ceremony |
| **Standing** | Preserved outside engagement | Lost across the polity |
| **Substrate-mood** | Refusal-of-engagement | Severance-of-relation |

| | banishment | confinement |
|---|---|---|
| **Holding** | None | The agent is held |
| **Place** | Agent leaves the polity's place-cells | Agent is held in a specific place-cell |
| **Duration** | Until re-admission (if any) | Specified term |
| **Substrate-mechanism** | Relation-severance | Cell-installation over agent |

| | banishment | execution |
|---|---|---|
| **Agent persists** | Yes — outside the polity | No |
| **Substrate-removal** | Relations to the polity removed | Agent entity removed from $E$ |

The Lakota polity uses banishment as its severe-end response; *capital punishment is not in the polity's morphism-set*.
The polity has no closure rule that installs *agent-removed-from-E* cells over members; the substrate-shape is preserved.

## When banishment is decided

The omníčiye decides banishment when:

1. **Harm is severe.** Repeated killings, witchcraft (in the substantive sense: malicious wakȟáŋ-misuse), serial violation of $\mathcal{S}_\mathrm{wolak}$ rules.
2. **Restorative pathway has failed or been refused.** The standard restorative repair-pathway (cf. [restorative-system](../objects/restorative-system.md)) has been attempted and the harming agent has refused or failed to complete it.
3. **Continuing presence is intolerable.** The harmed parties and the wider polity cannot continue in relation with the agent without ongoing harm-cell-recurrence.

The council's decision is deliberate and slow.
It is *not* an automatic consequence of a harm-event — there are no automatic-banishment closure rules in $\mathcal{S}_\mathrm{wolak}$.
Each case is decided by the omníčiye on its specifics.

## Re-admission

Banishment is reversible by a specific re-admission morphism.
The agent must:

1. Demonstrate substantive change.
  The substrate-evidence may be ceremonial (vision-quest, sun-dance offering on behalf of the harmed parties), conduct-evidence (sustained wówačhantognaka over time at distance from the polity), or substrate-restoration-work specific to the harm.
2. Be presented by a wičháša wakȟáŋ and a sponsoring kin (typically a relative not currently in the polity, or a previously-banished agent who has been re-admitted).
3. Be re-installed via a re-admission rite that is structurally similar to huŋkápi: a kin-cell-installation morphism that re-installs the previously-severed kin-relations.

Re-admission is rare.
Many banishments are not reversed; the agent lives outside the polity until death.

## Banishment in the reservation period

The post-1880s reservation period restricted banishment's practical applicability: the federal-government overlay claims jurisdiction over criminal-class harms; the Major Crimes Act (1885) and the Indian Civil Rights Act (1968) constrain the polity's response-to-harm options.

The substrate-state: the *capacity* to fire $\mathrm{banish}_a$ remains in the polity's morphism-set; the *exercise* of it is constrained by the federal overlay.
Some contemporary cases — tribal-council banishment of non-members from the reservation, contemporary internal-banishment of specific harm-perpetrators by tribal council — exercise the morphism within the constrained scope.

## Sources

- Walker 1982, *Lakota Society* — recorded banishment cases in nineteenth-century Sioux practice.
- Powers, *Oglala Religion* (1977) — the relation between banishment, witchcraft accusations, and the polity's response.
- Robert Yazzie, "*Hozho Nahasdlii*: We Are Now in Good Relations: Navajo Restorative Justice" (1998) — comparative Diné system.
- *Banishment and the Justice System* in *Tribal Law and Policy Institute* materials — contemporary banishment in tribal-court systems.
- Estes, *Our History is the Future* (2019) — contemporary reservation-period banishment, including the AIM-era cases.
