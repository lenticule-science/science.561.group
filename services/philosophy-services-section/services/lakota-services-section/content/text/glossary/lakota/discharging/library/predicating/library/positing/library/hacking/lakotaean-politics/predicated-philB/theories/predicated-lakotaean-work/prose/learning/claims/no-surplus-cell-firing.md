---
type: theorem
status: sketch
depends-on:
  - work-cell-system
  - wolakhota-closure-system
  - kin-obligation-firing
  - labor-extraction-as-surplus-cell
realizes: [labor-extraction-as-surplus-cell]
title: $\mathcal{S}\mathrm{wolak}$ contains no surplus-cell-firing rule
description: Statement.
---

# $\mathcal{S}_\mathrm{wolak}$ contains no surplus-cell-firing rule

**Statement.** The closure-rule subsystem $\mathcal{S}_\mathrm{wolak}$ does not contain any closure rule whose consequent is a surplus-cell — a cell of the form $\langle a, \texttt{surplus-produced}, X\rangle$ in the sense of the predicated-work [labor-extraction-as-surplus-cell theorem](../../../../../../../../../../../../../../../../../../../relationality-services-section/services/agency-services-section/content/text/glossary/concepts/labor-extraction-as-surplus-cell.md).
The structural-content: the Lakota polity's substrate does not *recognize* surplus as a cell-class.

The absence is constitutive of the Lakota work-form's substrate.
Labor-extraction in the predicated-work sense requires the surplus-cell-firing to be available in the substrate; $\mathcal{S}_\mathrm{wolak}$ does not provide it.

## Proof

The predicated-work surplus-cell is installed by a rule of the form:

$$\langle a, \texttt{performs-work}, X\rangle = \mathbf{t} \;\wedge\; \langle X, \texttt{output-value}, V\rangle = \mathbf{t} \;\wedge\; \langle a, \texttt{compensated}, c\rangle = \mathbf{t} \;\wedge\; V > c \;\Longrightarrow\; \langle a, \texttt{surplus-produced}, V - c\rangle = \mathbf{t}$$

This rule shape requires three substrate-conditions: (i) work has been performed measurably, (ii) the output has a numeric value $V$, and (iii) the agent's compensation $c$ is a numeric value comparable to $V$.
The rule fires when $V > c$, recording the difference as a surplus-cell on the agent's substrate.

$\mathcal{S}_\mathrm{wolak}$'s rules (W1)–(W7) (cf. [wolakhota-closure-system](../../../../../../../../settling/library/hacking/lakotaean-governance/philA/code/structures/wolakhota-closure-system.md)) operate on:

- Kin-relations (W1).
- Virtue-conduct (W2).
- Kin-obligation (W3).
- Witness-bearing (W4).
- Office-installation (W5).
- Withdrawal (W6).
- Restorative repair (W7).

None of these rule-classes produces *numeric-value-comparison* consequents on agent-work-cells.
The (W2) virtue-conduct evaluation fires *standing-as-$\nu$* cells in $\leq_k$, but does not fire numeric output-value cells.
The (W3) kin-obligation rule fires *owes-virtue-to* cells, not *compensated* cells.

Equivalently: $\mathcal{S}_\mathrm{wolak}$'s predicate-categories $\mathcal{C}_\mathrm{lak}$ does not contain *numeric-value-of-work* predicates in $\Pi^\mathrm{wówašake}, \Pi^\mathrm{wakȟáŋ\text{-}w}$, etc. Work-cells fire at $\mathbf{t}$ (work done) or $\mathbf{f}$ (work refused/badly done) or $\bot$ (work not done) — not at numeric values.

Since the surplus-cell-firing rule's antecedent requires numeric-output cells that $\mathcal{S}_\mathrm{wolak}$ does not fire, the surplus-cell-firing rule cannot be triggered within $\mathcal{S}_\mathrm{wolak}$.
The rule is *absent from* $\mathcal{S}_\mathrm{wolak}$'s closure-rule set; substrate-events that would fire surplus-cells under $\mathcal{S}_\mathrm{wage}$ produce no consequents under $\mathcal{S}_\mathrm{wolak}$ alone. $\square$

## Consequences

(a) **Labor-extraction is not a $\mathcal{S}_\mathrm{wolak}$-firing.** By the predicated-work theorem, labor-extraction is *defined* as the installation of surplus-cells on workers.
If $\mathcal{S}_\mathrm{wolak}$ cannot fire surplus-cells, then no $\mathcal{S}_\mathrm{wolak}$-internal operation produces labor-extraction.
The polity's substrate does not extract labor *internally*.

(b) **Wealth-accumulation is not substrate-supported.** A polity-form that fires surplus-cells supports the accumulation of cells representing accumulated-value on specific agents — wealth, capital. $\mathcal{S}_\mathrm{wolak}$'s absence of surplus-cells corresponds to the absence of accumulation: the gift-economy redistribution (cf. [gift-economy-redistribution](../../../../../../../../settling/library/hacking/lakotaean-governance/philA/code/transformers/gift-economy-redistribution.md)) flows resources through wówačhantognaka-conduct, *not* through accumulation-cells.
Wealthy individuals in the Lakota polity-form had wealth measured in *standing* (high wówačhantognaka-conduct cell counts, high honor-cells, large kin-network) and in *gifted-out items* (the wealthy gave more), not in accumulated-property cells.

(c) **The reservation-era forced-labor period operated by overlay.** When U.S. government boarding-school, allotment, and contract-labor systems imposed wage-labor cells on reservations, they did so under $\mathcal{S}_\mathrm{wage}$ (the wage-labor closure-rule subsystem of U.S. economic substrate).
The cells fired under $\mathcal{S}_\mathrm{wage}$; the Lakota substrate's $\mathcal{S}_\mathrm{wolak}$ continued to fire its own (W3) kin-obligation cells in parallel.
The result was a multi-observer-system with two subsystems firing on overlapping cells — accountability-disposition cells at $\top$ in the merged settling, parallel to the [reservation-overlay-as-bc-failure](../../../../../../../../settling/library/hacking/lakotaean-governance/philA/prose/learning/claims/reservation-overlay-as-bc-failure.md) on the governance side.

(d) **Restoration of Lakota work-form is rule-removal, not rule-addition.** Contemporary reclamation of Lakota economic life — gift-economy revivals, tribal-enterprise reforms that route resources through tribal-government rather than individual accumulation, the buffalo-restoration work, food-sovereignty initiatives — is *contracting the overlap* on which $\mathcal{S}_\mathrm{wage}$ fires, restoring $\mathcal{S}_\mathrm{wolak}$'s firing-scope on the polity's substrate.
The work-form's restoration does not require *adding* rules to $\mathcal{S}_\mathrm{wolak}$; it requires *removing the imposed overlay* of $\mathcal{S}_\mathrm{wage}$.

## What this does not entail

The theorem does not claim that Lakota people did not engage in trade or in resource-exchange.
They did: extensive Plains-nation trade networks, intermarriage-and-gift exchange with neighboring polities, exchange with European traders at trading posts (Bent's Fort, Fort Pierre, etc.).
The substrate-content of those exchanges is *gift-class* (with continuing-relation expectations) rather than *exchange-class* (one-time market-transaction).
The cells installed by Lakota-European trade fire under $\mathcal{S}_\mathrm{wolak}$'s gift-economy rules (which include cross-polity gift-exchange under (Ω3) and (Ω4) of [oceti-sakowin](../../../../../work/theories/predicated-work/theories/predicated-governance/theories/predicated-lakotaean-governance/objects/oceti-sakowin.md)) when conducted properly, and as $\mathcal{S}_\mathrm{wage}$-cells when not.

The asymmetry was operationally significant in the historical record: European traders typically expected the exchange to be *transactional* (one-time, value-equivalent, no continuing-relation), while Lakota parties expected the exchange to be *relational* (installing continuing-kin-of-trade cells, with the expectation of ongoing gift-flow).
The substrate-class mismatch is the historical-record-substrate of many recorded misunderstandings between the parties.

## Significance

The theorem is the structural-content of "the Lakota polity does not have an internal extraction economy."
This is not a virtue-claim or a moral-claim; it is a substrate-algebraic fact about which closure-rule firings are in $\mathcal{S}_\mathrm{wolak}$.
The polity's resilience under the long pressure of forced-economic-restructuring rests substantially on the substrate's continuing operation of $\mathcal{S}_\mathrm{wolak}$'s gift-economy rules in parallel with the imposed $\mathcal{S}_\mathrm{wage}$.

A polity-form that *had* surplus-cell-firing rules internally would have a different cohomological signature — wealth-accumulation classes that the Lakota substrate lacks, internal class-stratification that the polity does not exhibit.
The Lakota polity-form's signature is *flat-redistribution* in this cohomological sense; the [cohomological-signature-of-traditions](../../../../../../../../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/documents/articles/notes/undated/cohomological-signature-of-traditions.md) theorem applied to the Lakota tradition produces this signature as a measurable feature.

## Sources

- Marcel Mauss, *The Gift* (1925) — comparative gift-economy theory.
- David Graeber, *Debt: The First 5,000 Years* (2011) — gift-economy vs debt-economy distinction.
- Pekka Hämäläinen, *Lakota America* (2019) — Plains-nation economic substrate.
- Estes, *Our History is the Future* (2019) — reservation-era forced-labor and contemporary restoration.
- Robin Wall Kimmerer, *Braiding Sweetgrass* (2013) — Indigenous gift-economy as ecological-ethical substrate.
- *NDN Collective* and various contemporary materials on food-sovereignty and economic restoration.
