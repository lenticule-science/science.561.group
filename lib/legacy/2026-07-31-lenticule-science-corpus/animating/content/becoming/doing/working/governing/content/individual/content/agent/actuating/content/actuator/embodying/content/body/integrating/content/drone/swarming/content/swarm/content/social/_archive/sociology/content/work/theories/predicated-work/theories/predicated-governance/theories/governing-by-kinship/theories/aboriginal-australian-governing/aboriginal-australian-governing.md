---
name: Aboriginal Australian governing
description: The Aboriginal Australian realization of kinship-based governance — specifying the moiety / section / subsection partition structure, Songlines as cohomological classes, age-grade temporal authority, and contested-Songline authority as a truth-knowledge cohomological obstruction. Drawn from the indigenous-governance-traditions survey.
type: definition
class: relational-infrastructure-realization
status: draft
realizes: ../../governing-by-kinship.md
depends-on: [governing-by-kinship, jural-relation, polity, jurisdiction, consensus-closure]
---

The Aboriginal Australian realization of the [governing-by-kinship](../../governing-by-kinship.md) pattern.
The abstract structure $(G, \mu, \mathrm{path\text{-}knowledge})$ is filled in with the specific tradition's grouping algebra, the specific knowledge cells that index along it, and the specific closure rules that condition on it.

## Kinship grouping structure $G$

The Aboriginal Australian partition is *nested and overlapping*: up to three partitions of $\mathrm{Pop}_\mathcal{P}$ — *moieties* (2 groups), *sections* (4), *subsections* (8).
Each agent belongs to one group at each partition level, hence to multiple groups simultaneously.
The three partitions are not independent; the section partition refines the moiety partition, and the subsection partition refines the section partition.

The kinship-membership function $\mu$ maps each agent to their triple of group positions: $\mu(a) = (m, s, ss)$ with $m$ their moiety, $s$ their section, $ss$ their subsection.
Each agent therefore carries three `member-of-group` cells, one per partition level.

## Songlines as cohomological classes

A *Songline* is a sacred route across the landscape that encodes law, history, geography, and ceremonial obligation in narrative and song form.
In the predication-categorical reading, a Songline is a distinguished path through the cell-pattern graph — a sequence of cells whose joint settlement constitutes the law-of-this-place — and corresponds to a *cohomological class* in the substrate's $H^1$.

The math program's aperiodic-regime classification classifies aperiodic settlings up to MLD-equivalence by their $H^1$-class.
Songlines are *named cohomological classes*: a tradition's accumulated wisdom about which $H^1$-classes encode law, history, and ceremonial obligation.
Knowing a Songline is holding the readable normative content of a path through the cell graph.

The content of *singing the correct verses navigates the landscape, locates resources, recites the law*: the Songline-cell encodes a sequence of cells whose joint settlement constitutes the law-of-this-place.
Reciting the Songline is invoking the sequence — settling each cell in turn, advancing through the cohomological class.
Authority over the region belongs to those who hold (have inherited via kinship) the Songline-cells — the cohomological-class cells settled at $\mathbf{t}$ in their record.

The content of *break in ceremony means a break in the transmission of governance*: ceremonial cells fire closure rules that maintain the Songline-class cells settled.
Without ceremonial firings, the cells move toward $\bot$ as the cell graph processes the absence-of-witnessing — the cohomological invariant decays.
Governance is sustained by ongoing maintenance work, not held by static structure.

## Age-grade authority

Leadership roles in this tradition are tied to life stages; authority passes through age cohorts.
The predication-categorical content:

- Each agent's record carries a `current-age-grade` cell, settled at the appropriate value.
- Closure rules that admit authority-exercising acts gate on age-grade cells.
- As an agent ages, their age-grade cell moves through values; acts admissible at one age-grade become inadmissible at another, and vice versa.

Age-grade authority is a *temporal* axis of kinship-eligibility (per the abstract record's kinship-jurisdiction overlap pattern): the population's authority distribution is not static; it shifts as members age.
The cell graph maintains the shifting distribution as a recurrent practice — age transitions are cycle-boundary witnesses; the closure rule firing on those boundaries updates each agent's age-grade cell.

This places upper limits on individual authority: *authority is always tied to life experience and places upper limits on how long any individual exercises power*.
The content: an agent's age-grade cell, once past a given value, cannot fire admissibility for acts requiring earlier age-grades.

## Truth-knowledge LES for contested Songline authority

Since Songlines are identified as $H^1$-classes, contested Songline authority — when two kinship lines both assert holding a particular Songline's knowledge cells — produces a non-trivial inconsistency sheaf.

The truth-knowledge long exact sequence applied to the Songline's knowledge-cells sheaf $\mathcal{F}_{\mathrm{Songline}}$:

When authority over a Songline is undisputed (one kinship line holds the cells; all members of that line exhibit them consistently): $\mathcal{F}^{(\top)}_{\mathrm{Songline}} = 0$.
The LES collapses; the Songline's $H^1$-class is cleanly computed from $H^1_k$ alone.

When Songline authority is *contested* (two kinship lines both assert holding the knowledge; the cell graph receives witnesses from both; the same Songline-cells receive conflicting claims): $\mathcal{F}^{(\top)}_{\mathrm{Songline}} \neq 0$ on the contested cells.
The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}) \to H^1_t(\mathcal{F}^{(t)})$ is non-zero.
The obstruction class $[\partial] \in H^1_t$ is the signature of the authority dispute — non-trivial truth-order cohomology at degree 1, sourced from the contested knowledge cells.

Resolution of the dispute (per the community's governance process — typically elder-consensus across relevant kinship lines) corresponds to: a governance act settles the contested cell unambiguously in one direction; $\mathcal{F}^{(\top)}_{\mathrm{Songline}}$ returns to zero; the $H^1_t$-class becomes trivial; the clean $H^1$-class of the Songline is restored.
The governance process is the content of making $[\partial] = 0$.

This gives Songline authority disputes a precise structure: they are $H^1_t$-obstruction classes, quantifiable (rank = number of contested cells), resolvable (governance process = making $\mathcal{F}^{(\top)} = 0$), and audit-traceable (the LES records the dispute's cohomological history).

## Open

The Songline-as-cohomological-class identification is sketch-level.
A worked instance — taking a specific named Songline (with appropriate consultation from communities holding the knowledge) and computing its content as an explicit path through cells — would ground the structural claim.
The math program's machinery for path-cohomology in aperiodic regimes supplies the formal apparatus; the worked instance requires substantive collaboration with the relevant communities and is not within the scope of this record.
