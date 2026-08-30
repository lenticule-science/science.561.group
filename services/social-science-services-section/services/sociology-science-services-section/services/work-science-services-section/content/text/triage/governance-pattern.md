---
type: concept
class: classification
status: draft
depends-on: [normative-system, polity, jural-relation, consensus-closure, rotational-authority, restorative-accountability, governing-by-kinship, conduct-teachings-as-evaluation-predicates, cohomological-equivalence, closure-rule-system]
realizes: [governance-tradition]
---

# Governance pattern

A *governance pattern* is the substrate-algebraic name for what a community's [non-Hohfeldian governance traditions narrative](teaching/explanations/non-hohfeldian-governance-traditions.md) calls a "tradition" or "framework" — Hohfeldian rights-and-duties, Haudenosaunee consensus, ayllu rotation, Ubuntu restorative accountability, Aboriginal kinship-infrastructure, Anishinaabe conduct-teachings, Black radical refusal, military-command hierarchy, jurisdictional federation. Each is a structural commitment about *which closure rules drive the polity's settling* and *which witness language those rules speak*. Governance patterns are first-class substrate objects, comparable, composable, classifiable.

## Definition

A governance pattern $\pi$ within a [polity](../objects/polity.md) $\mathcal{P}$ is a triple

$$\pi \;=\; (\mathcal{S}_\pi,\; \mathcal{W}_\pi,\; \mathrm{Rec}_\pi)$$

where:

- $\mathcal{S}_\pi \subseteq \mathcal{S}_{\mathcal{P}}$ — the *closure-rule fragment*: the subsystem of the polity's [closure rules](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) that constitutes the pattern. For consensus governance, $\mathcal{S}_\pi$ contains rules of the form $\bigwedge_a \langle a, \texttt{aligns-with}, \phi\rangle = \mathbf{t} \Rightarrow \langle \phi, \texttt{settled}\rangle = \mathbf{t}$ ([consensus-closure](../objects/consensus-closure.md)). For Hohfeldian governance, $\mathcal{S}_\pi$ contains the [installation](../morphisms/installation.md), [delegation](../morphisms/delegation.md), [revocation](../morphisms/revocation.md), [novation](../morphisms/novation.md), and [correlate-of](../morphisms/correlate-of.md) closure rules. For rotational governance, $\mathcal{S}_\pi$ contains the [rotational-authority](../objects/rotational-authority.md) cycle rules. Etc.

- $\mathcal{W}_\pi$ — the *witness language*: the subset of substrate predicates that the pattern's rules read on antecedents and write on consequents. Consensus governance reads `aligns-with` cells; Hohfeldian governance reads `holds-power`/`bears-duty` cells; kinship governance reads `member-of-group` cells; conduct-teachings governance reads `exhibits-teaching` cells. The witness language is what a community using the pattern actually has to *record*; it is the operational interface between lived practice and the substrate.

- $\mathrm{Rec}_\pi$ — the *recognition discipline*: the closure-rule sub-fragment by which the pattern's outputs become *binding* on the populace. For consensus governance, recognition is the post-deliberation acknowledgment cell; for Hohfeldian governance, it is the [office-as-double-settlement](../objects/office-as-double-settlement.md) recognition pair (per [recognition-as-bigraded-common-knowledge](../theorems/recognition-as-bigraded-common-knowledge.md)); for kinship governance, recognition is the kin-positional cell-pattern that admits an act as "of-our-people"; for restorative governance, recognition is the community-restoration acknowledgment.

## Examples

| Pattern | $\mathcal{S}_\pi$ characteristic rule | $\mathcal{W}_\pi$ key predicates | $\mathrm{Rec}_\pi$ form |
|---|---|---|---|
| Hohfeldian | residuated authority gate ([authority-gate](./authority-gate.md)) | `holds-power`, `bears-duty`, `claim-against`, `is-immune-from` | dignitas-recognition pair |
| Consensus | universal $\bigwedge_a$ over populace alignments | `aligns-with`, `dissents-from`, `abstains-on` | unanimous-acknowledgment cell |
| Rotational | cycle-recurrence on incumbency cells | `currently-bears`, `eligible-for`, `previous-incumbent` | cycle-completion witness |
| Restorative | repair-needed firing on relation-rupture | `harm-by`, `harm-to`, `relation-rupture`, `repair-needed` | community-restoration acknowledgment |
| Kinship | base-change over kinship partition | `member-of-group`, `kin-relation-to`, `path-knowledge` | kin-positional admission |
| Conduct-teachings | teaching-evaluation aggregation | `exhibits-teaching`, `community-judgment-of` | teaching-coherence cell |
| Military-command | composite delegation chain ([delegation-as-authority-residuation](../theorems/delegation-as-authority-residuation.md)) | `command-authority`, `reports-to`, `under-orders-of` | chain-of-command recognition |
| Jurisdictional | base-change to sub-base ([jurisdiction-as-base-change](../theorems/jurisdiction-as-base-change.md)) | `within-scope-of`, `subject-to`, `ultra-vires` | jurisdictional-invocation acceptance |
| Black-radical refusal | non-applicability rule blocking external SFD-bindings | `refuses-rule`, `fugitive-from`, `not-bound-by` | community-internal recognition |

## Equivalence and classification

Two patterns $\pi, \pi'$ are *cohomologically equivalent* if their closure-rule fragments produce isomorphic [bigraded settling cohomology](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bigraded-settling-cohomology.md) classes when run in isolation on a common base. By [cohomological equivalence](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/cohomological-equivalence.md), this means they produce indistinguishable substrate dynamics: any operational claim true under one is true under the other, up to the math program's classification invariants.

The equivalence partition gives the *taxonomy of governance patterns*. The math distinguishes Hohfeldian from consensus from rotational from restorative; the [cohomological-signature-of-traditions](../theorems/cohomological-signature-of-traditions.md) theorem records what specifically distinguishes them.

## Why patterns, not "frameworks" or "traditions"

Three reasons to use this technical name rather than the loose "framework" or "tradition" the survey literature uses:

1. **Compositionality.** Patterns compose: a polity's $\mathcal{S}_{\mathcal{P}}$ can be the union of multiple patterns' fragments. The compositional structure is a [tradition-pluralism-as-fragment-coproduct](../theorems/tradition-pluralism-as-fragment-coproduct.md) statement. "Tradition" in everyday usage suggests an exclusive choice; "pattern" makes plural-pattern polities first-class.

2. **Tradition-versus-instance distinction.** A tradition (e.g., Anishinaabe governance) is a *family* of patterns instantiated by specific communities with specific witness-language vocabularies. The math operates on patterns; the lived practice operates on traditions; the relation between them is one-to-many.

3. **Operational substance.** The $(\mathcal{S}_\pi, \mathcal{W}_\pi, \mathrm{Rec}_\pi)$ triple is operationally tractable: a community can ask, of any proposed governance choice, "what closure rules does it commit me to firing? what cells does it require me to record? how do its outputs become binding?" These are answerable questions; "what tradition am I in?" is not always answerable.

## Relation to existing pieces

The [non-Hohfeldian governance traditions narrative](teaching/explanations/non-hohfeldian-governance-traditions.md) describes patterns informally; this concept supplies the formal apparatus. The existing objects [consensus-closure](../objects/consensus-closure.md), [rotational-authority](../objects/rotational-authority.md), [restorative-accountability](../objects/restorative-accountability.md), [governing-by-kinship](../objects/governing-by-kinship.md), and [conduct-teachings-as-evaluation-predicates](../objects/conduct-teachings-as-evaluation-predicates.md) are each *concrete patterns*. The Hohfeldian apparatus (jural-relation, deontic-modality, authority-gate, charter-as-closure-system) is the *Hohfeldian pattern* in this taxonomy — one pattern among many, no longer treated as default substrate.
