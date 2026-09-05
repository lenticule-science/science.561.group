---
type: morphism
class: resource-coordination
status: draft
symbol: "\\mathrm{hunt}_O"
depends-on:
  - polity-cell-system
  - oyate
  - akicita-band
  - wakichunza-office
realizes: [resource-allocation]
---

# Buffalo-hunt coordination

The buffalo hunt is the polity's primary subsistence-coordination scope.
It is organized as a periodic settling-cycle running through an oyate's annual life: scout, council, akicita-installation, hunt, distribution, akicita-revocation.
Each step is a specific substrate-operation.
The hunt-cycle is the substrate-content of how the oyate's economic life is governed.

## The cycle

**Scout step.** Scouts (often a small akicita detachment or designated experienced hunters) locate a herd.
The scout-cell $\langle O, \texttt{located-herd-at}, p\rangle$ settles at $\mathbf{t}$.

**Council step.** The wakíčhuŋza convenes a hunt-council, sometimes drawing the full omníčiye for large hunts.
The council settles whether to hunt this herd, how many hunters, which akicita-band will run the hunt, which tiyóšpaye are responsible for which roles.

**Akicita-installation step.** A hunt-akicita-band is installed (cf. [akicita-band](../objects/akicita-band.md)) with scope-action $X = \mathrm{this\text{-}hunt}$.
The band's $\langle B, \texttt{scope-potential}\rangle$ cell goes to $\mathbf{t}$; its $\langle B, \texttt{enforcement-authority}\rangle$ cell follows.

**Hunt step.** The hunt is run.
During hunt-scope-active, the akicita prevent premature individual hunting, ensure the herd is approached correctly, regulate the order of engagement.
A hunter who breaks discipline is sanctioned during the scope-potential period (e.g., bow broken, tipi destroyed).

**Distribution step.** Once the herd is taken, the kill is distributed.
The distribution-rule is structurally non-property-based: the kill belongs to *whoever made it*, but the kill *flows* through the oyate by the gift-economy redistribution morphism (see [gift-economy-redistribution](gift-economy-redistribution.md)) — the kill-maker shares with their kin, who share with their kin, until the whole oyate has received.
The wówačhantognaka (generosity) virtue is the distribution-shaping force.

**Akicita-revocation step.** When the hunt completes, the scope-potential cell drops automatically (cf. [akicita-band](../objects/akicita-band.md) §"Revocation at scope-completion").
The akicita's enforcement-authority lapses.
Any sanctions issued during the scope drop with it: a hunter whose bow was broken is *not* under continuing sanction after the hunt.

## Substrate-algebraic structure

The whole cycle is a finite settling-segment in the strict regime ($\kappa < \omega$): the cells involved (scout-locations, council-decisions, akicita-installations, kill-records, distribution-paths, scope-completion) are all finite for a single hunt, and the cycle terminates in finitely many closure-steps.

The cycle's $\leq_k$-monotonicity is on the *unscoped* substrate-cells: the hunt-event itself, the people-fed-by-it, the standing-cells of the participants.
The *scoped* cells (akicita-scope-active, akicita-enforcement-authority, scoped-sanctions) operate in their scoped-window only.

## What is *not* in the cycle

The hunt-coordination has notable absences:

- **No property-cells over the buffalo.** The herd is not owned by the oyate; the herd is a kin-being (Tȟatȟáŋka, the buffalo-nation; *Pte Oyate*) with its own substrate-standing.
  The hunt is a relation-with-kin, not a property-extraction.
- **No standing-tax-cells.** No portion of the kill is owed to the polity-as-such.
  The polity does not extract resources; the polity coordinates distribution-through-kin.
- **No wage-cells.** The akicita's enforcement-authority during the hunt is not compensated by a special share; the akicita receive the standard kin-share of the kill plus the standing-cell increment of having served as akicita.
- **No alienation-rights.** The kill cannot be sold (in pre-contact substrate) or exchanged-for-money outside the kin-distribution circuit.
  Hides, meat, and bones flow through the gift-economy by default.

These absences are constitutive: $\mathcal{S}_\mathrm{wolak}$ does not contain rules that fire to install property-over-buffalo, taxation-cells, wage-cells, or alienation-cells.

## The buffalo-extermination as substrate-attack

The U.S.-led buffalo-extermination of the 1860s–1880s was *not merely an economic attack* on the Lakota polity.
The substrate-content: the extermination removed the *Pte Oyate* (the Buffalo Nation) from the polity's $E^\mathrm{4leg}$ entity-class at scale, making the hunt-cycle unfireable.
The downstream effects:

- **Akicita-scope evacuation.** With no hunts to coordinate, the akicita's primary substrate-purpose lapsed.
  The akicita-band entity-class did not vanish (akicita continued for the migration and camp-circle scopes), but the central scope was lost.
- **Gift-economy compression.** With the kill-distribution flow eliminated, the gift-economy lost its largest periodic transfer.
  The wówačhantognaka-conduct cells continued at smaller scale.
- **Subsistence-substrate collapse.** Forcing the polity onto reservation rations is the operational form of forcing the polity onto a *foreign closure-rule subsystem* — the U.S. rations system, with its property-cells, conditioning-cells, and surveillance-cells.

The Buffalo Field Campaign, the Tanka Bar enterprise, the buffalo reintroduction work on multiple reservations, are substrate-restoration operations: reinstalling the *Pte Oyate* as a present-entity in the polity's substrate, allowing the hunt-cycle's rules to fire again (in modified form, given continuing ecological constraints).

## Sources

- John Stands in Timber and Margot Liberty, *Cheyenne Memories* (1967) — Plains-nation hunt-coordination practice with structural parallels.
- Royal B.
  Hassrick, *The Sioux* (1964) — recorded hunt-organization including the akicita's hunt-scope.
- Pekka Hämäläinen, *Lakota America* (2019) — the buffalo-hunt's role in Lakota political economy and the substrate-disruption of the extermination.
- Estes, *Our History is the Future* (2019) — the extermination's continuing substrate-effects and contemporary buffalo-restoration.
- *Bring the Buffalo Home: Restoring American Indian Foodways and Lifeways through the Reintroduction of Bison*, various sources from the InterTribal Buffalo Council (since 1991).
