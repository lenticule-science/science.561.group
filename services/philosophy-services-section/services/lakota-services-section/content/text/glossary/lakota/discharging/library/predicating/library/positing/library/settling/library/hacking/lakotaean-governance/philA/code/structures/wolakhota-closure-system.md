---
type: definition
class: closure-rule-system
status: draft
symbol: "\\mathcal{S}_{\\mathrm{wolak}}"
depends-on:
  - polity-cell-system
  - closure-rule-system
  - closure-rule-language
  - wakhan-as-cell-quality
  - wolakota-as-closure-discipline
  - four-virtues-as-evaluation-predicates
realizes: [normative-system]
---

# Wolakȟota closure-rule system

The closure-rule subsystem $\mathcal{S}_\mathrm{wolak}$ that fires on the [polity-cell-system](polity-cell-system.md) $(E_\mathrm{lak}, \Pi_\mathrm{lak}, \mathcal{C}_\mathrm{lak}, w_\mathrm{lak})$.
It is the substrate-algebraic content of the Lakota lifeway-discipline.
Conduct produced under $\mathcal{S}_\mathrm{wolak}$ is legitimate within the polity; conduct produced under rules outside $\mathcal{S}_\mathrm{wolak}$ is ineffective at advancing wicozani regardless of its other effects.

## Structure

$\mathcal{S}_\mathrm{wolak} \subseteq \mathcal{R}_\mathrm{lak}$ is a designated closure-rule subsystem in the [closure-rule language](../../../../../../../../math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) over the polity-cell-system.
The subsystem partitions into seven rule-classes.

### (W1) Kin-propagation rules

For every kin-predicate $p \in \Pi^\mathrm{kin}$:

$$\forall x, y, z.\quad v(p)(x, y) \geq_k \mathbf{t} \;\wedge\; v(p')(y, z) \geq_k \mathbf{t} \;\Longrightarrow\; v(p'')(x, z) \geq_k \mathbf{t}$$

for $p, p', p''$ ranging over the kinship composition table (parent-of composed with sibling-of yields aunt-or-uncle-of, etc.).
The rules are $\Pi_1$ over entities and quantifier-free over cells; they fire Scott-continuously.

### (W2) Conduct-evaluation rules

For each of the four virtues $\nu \in \{\mathrm{wówačhantognaka}, \mathrm{wóksape}, \mathrm{wóohitika}, \mathrm{wówačhiŋtȟaŋka}\}$ and each conduct-predicate $p_\nu \in \Pi^\mathrm{con}$:

$$\forall x, y.\quad v(\mathrm{acts-}\nu\mathrm{-toward})(x, y) \geq_k \mathbf{t} \;\Longrightarrow\; v(\mathrm{stands-as-wolakhota})(x) \geq_k \mathbf{t}$$

The four-virtue evaluation runs cumulatively: an agent's standing-as-wolakȟota cell rises in $\leq_k$ as virtue-conduct cells accumulate.
This is the four-virtues-as-evaluation-predicates pattern from [four-virtues-as-evaluation-predicates](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/four-virtues-as-evaluation-predicates.md), specialized to the polity-scale standing predicate.

### (W3) Kin-obligation rules

For each kin-predicate and each virtue:

$$\forall x, y.\quad v(\mathrm{kin\text{-}of})(x, y) \geq_k \mathbf{t} \;\Longrightarrow\; v(\mathrm{owes\text{-}}\nu\mathrm{-to})(x, y) \geq_k \mathbf{t}$$

Kinship installs obligation.
The owes-virtue-to cells are *deontic*: their settling at $\mathbf{t}$ does not by itself mean the obligation has been *discharged*; that requires the corresponding acts-$\nu$-toward cell to also settle at $\mathbf{t}$.
The distinction between owed-and-discharged conduct is the substrate-content of moral standing-in-relation.

### (W4) Witness-bearing rules

For each ceremonial predicate $p \in \Pi^\mathrm{wkn}$ and each wičháša wakȟáŋ identifier:

$$\forall x.\quad v(\mathrm{witnessed\text{-}by})(x, w) \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(\mathrm{witnessing\text{-}cell}) = 1 \;\Longrightarrow\; v(\mathrm{wakhan\text{-}bearing})(x) \geq_k \mathbf{t}$$

The wakȟáŋ-bearing quality of a cell propagates through proper witnessing.
Ceremonial witness is the substrate-mechanism by which non-wakȟáŋ-marked cells become wakȟáŋ-marked.
The propagation requires both the witnessing-cell at $\mathbf{t}$ and the witnessing-cell's wakȟáŋ-marking at $1$ — non-wakȟáŋ witnesses do not propagate the quality.

### (W5) Office-installation rules

For the naca-office, akicita-office, wičháša-wakȟáŋ-office:

$$\mathrm{recognition\text{-}cell}(a, o) \geq_k \mathbf{t} \;\wedge\; \mathrm{induction\text{-}cell}(a, o) \geq_k \mathbf{t} \;\Longrightarrow\; v(\mathrm{holds\text{-}office})(a, o) \geq_k \mathbf{t}$$

Office-installation requires the double-settlement: recognition (the populace witnesses) and induction (the ceremonial installation).
Specific office-classes refine this with additional conditions; see [naca-office](naca-office.md), [akicita-band](akicita-band.md), [wicasa-wakhan-office](wicasa-wakhan-office.md).

### (W6) Withdrawal rules

For every standing-relation predicate $p \in \Pi^\mathrm{std}$:

$$v(\mathrm{iyuha\text{-}sni\text{-}from})(a, \omega) \geq_k \mathbf{t} \;\Longrightarrow\; v(p\text{-}for\text{-}engagement\text{-}\omega)(a, \cdot) = \bot$$

Iyúhá-šni from an engagement $\omega$ retracts the agent's standing-cells *for that engagement* to $\bot$ (under-determined).
It does *not* retract the agent's kin-cells, witness-cells, or other engagement-independent cells.
The substrate distinguishes withdrawal-from-engagement from severance-of-relation; iyúhá-šni does the first only.

### (W7) Restorative rules

For each harm-cell predicate:

$$v(\mathrm{harmed})(x, y) \geq_k \mathbf{t} \;\Longrightarrow\; v(\mathrm{relation\text{-}requires\text{-}repair})(x, y) \geq_k \mathbf{t}$$

Coupled with the [wiping-of-tears morphism](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/morphisms/wiping-of-tears-as-polity-quiescence-restoration.md), restorative rules drive harm-cells toward repair rather than toward punishment-installation. $\mathcal{S}_\mathrm{wolak}$ contains *no* rule of the form $\mathrm{harmed} \Longrightarrow \mathrm{sanction\text{-}installed}$; the absence is structural.

## Scott-continuity

(W1), (W2), (W4), (W5), (W6), (W7) are all quantifier-free in the cell-atoms and so Scott-continuous (cf. [closure-rule-language](../../../../../../../../math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) §"Quantifier complexity").
(W3) is also Scott-continuous: the antecedent is a finite-cell condition.

By the [four-regime dichotomy](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), a polity-settling under $\mathcal{S}_\mathrm{wolak}$ alone lives in the strict regime (when $E_\mathrm{lak}$ and $\Pi_\mathrm{lak}$ are finite) or the Scott-continuous regime ($\kappa = \omega$, when the entity-set is infinite, e.g., countably-many ancestors). $H^1$ vanishes for the settling-associated sheaf in both regimes; cohomological residue from disagreement does not accumulate at the level of $\mathcal{S}_\mathrm{wolak}$ alone.

This matters: a polity firing $\mathcal{S}_\mathrm{wolak}$ in isolation has *clean* settling behavior.
Cohomological residue arises only when $\mathcal{S}_\mathrm{wolak}$ interacts with a *competing* closure-rule system on the same substrate — most centrally, the settler-state's $\mathcal{S}_\mathrm{settler}$ firing on overlapping cells.
The contestation-residue is in the *intersection*, not in $\mathcal{S}_\mathrm{wolak}$ itself.

## Naturality in $\mathcal{C}_\mathrm{lak}$

The rule-shapes in (W1)–(W7) are stated uniformly over the predicate-category — generator-class variables in place of specific predicates — so the closure operator $\mathrm{cl}^{\mathcal{S}_\mathrm{wolak}}$ satisfies the naturality axiom (4) of [closure-operator](../../../../../../../../math/theories/categories/theories/predication-categories/morphisms/closure-operator.md).
Predicate-category reindexing commutes with closure: $f^* \circ \mathrm{cl}^{\mathcal{S}_\mathrm{wolak}}_p = \mathrm{cl}^{\mathcal{S}_\mathrm{wolak}}_q \circ f^*$ for $f : q \to p$ in $\mathcal{C}_\mathrm{lak}$.

This is what allows the predicate-converse generator to commute with the closure: the *kin-of(x, y)*-fired conclusions agree with the *kin-of(y, x)*-fired conclusions up to converse-reindexing.
The polity's kinship-logic is symmetric in the structurally-correct way.

## What $\mathcal{S}_\mathrm{wolak}$ does *not* contain

The absences are content-bearing:

- **No coercion rules.** No rule of form *agent-$a$-is-bound-to-action-$X$ $\Rightarrow$ enforcement-cell-fires*.
  The polity's compliance mechanism is reputational ($\mathcal{S}_\mathrm{wolak}$'s W2 chain settles standing-as-wolakȟota) and relational (W3 deontic-cells), not coercive.
- **No property-cell rules.** No rule installs exclusive-ownership cells over places, beings, or objects.
  Place-relations in $\Pi^\mathrm{plc}$ are kin-relations, not property-relations.
- **No punitive rules.** No rule transforms a harm-cell into a confinement-cell, exile-cell (banishment exists but is exceptional and not rule-driven; see [banishment-as-relation-severance](../morphisms/banishment-as-relation-severance.md)), or sanction-cell.
- **No external-authority rules.** No rule of form *settler-state-authority-$A$-issued-directive $\Rightarrow$ binding-cell*.
  External authority is *not* a wolakȟota-firing condition; treaties bind through (W4)-wakȟáŋ-marking, not through external sovereignty.

## Reclamation as rule-installation

The historical disruption of the polity — boarding schools, ceremony-suppression under federal Indian policy, the Wounded Knee massacre, the Pick-Sloan dams, the ongoing pressure on Pȟahá Sápa — operated by *removing rules from* $\mathcal{S}_\mathrm{wolak}$: making (W4) witness-bearing rules unfireable by criminalizing the ceremonies, weakening (W1) kin-propagation by separating children from kin in boarding schools, suppressing (W5) office-installation by federally-imposing alternative chief-selection.

The contemporary reclamation work — language revitalization, ceremony-reclamation, the Sicangu Lakota Oyate's *wicozani* initiative, the kinship-rebuilding programs, the treaty-defense litigation, the LandBack movement — is *re-installation of rules into* $\mathcal{S}_\mathrm{wolak}$.
The substrate-algebraic content: the closure-rule subsystem is being restored to its full firing scope, after decades of forced restriction.
The polity's wicozani recovery tracks the restoration: as $\mathcal{S}_\mathrm{wolak}$ regains its full rule-set, the settling's quiescence condition (cf. [wicozani-as-quiescence](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/wicozani-as-quiescence.md)) becomes reachable again.

## Sources

- [wolakota-as-closure-discipline](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/wolakota-as-closure-discipline.md) — the upstream substrate-algebraic articulation.
- [four-virtues-as-evaluation-predicates](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/four-virtues-as-evaluation-predicates.md) — the conduct-evaluation rule-class.
- Albert White Hat Sr., *Reading and Writing the Lakota Language* (1999), and *Life's Journey — Zuya* (2012) — contemporary articulation of the lifeway in Sicangu Lakota voice.
- Joseph Marshall III, *The Lakota Way* (2002) — the four virtues as discipline.
- Ella Deloria, *Speaking of Indians* (1944) — kin-obligation as the substrate of conduct.
- Vine Deloria Jr., *The World We Used to Live In* (2006) — wakȟáŋ-bearing witness as constitutive.
