---
type: theorem
class: visible-quotient-instantiation
status: draft
symbol: "\\mathrm{Aut}^{\\mathrm{vis}}(v^{\\mathrm{ch}})"
depends-on: [charter-as-closure-system, jural-relation, deontic-modality, normative-system]
realizes: [visible-automorphism-quotient, invisible-automorphism-subgroup, visible-automorphism-sources, restructure-as-visible-automorphism]
title: Charter amendment as visible automorphism
description: A polity's charter — its closure-rule system together with its named offices, predicates, and jural-relation entities (per charter-as-closure-system) — is a substrate object on which the same visible/invisible automorphism distinction…
---

# Charter amendment as visible automorphism

A polity's charter — its closure-rule system together with its named offices, predicates, and jural-relation entities (per [charter-as-closure-system](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/charter-as-closure-system.md)) — is a substrate object on which the same visible/invisible automorphism distinction applies as in [restructure-as-visible-automorphism](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md). Under this distinction, charter amendments split into two formally distinct strata:

- **Cosmetic amendments** lie in the [invisible automorphism subgroup](../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) $N(v^{\mathrm{ch}})$ — pure renumbering of articles, predicate-renaming with simultaneous citation update, sign-convention reform on the deontic profile, retiring named offices that have never been instantiated. They contribute nothing to $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{ch}})$ and leave every cohomological invariant of the charter unchanged.
- **Substantive amendments** are non-trivial in the visible quotient $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{ch}})$ — consolidations of distinct offices that both have incumbency histories, redefinitions that change the cohomological signature of the deontic profile, jurisdictional re-allocations that touch already-settled cells. They act non-trivially on the [charter-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md), and therefore on the cohomological signature of the polity per [cohomological-signature-of-traditions](cohomological-signature-of-traditions.md).

This is not a definitional choice but a substrate-algebraic consequence of the charter's structure as a closure system on the operations base. The lift of [restructure-as-visible-automorphism](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md) into the governance layer makes precise the practitioner intuition that "renumbering the articles is one thing; consolidating two distinct offices is quite another."

## Setup: the charter settling

Per [charter-as-closure-system](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/charter-as-closure-system.md), a charter $\mathrm{Ch}$ presents as a closure-rule subsystem $\mathcal{C}_{\mathrm{ch}} \subseteq \mathcal{C}_{\mathrm{op}}$ together with a designated cell-system $B_{\mathrm{ch}} \subseteq E_{\mathrm{op}} \times E_{\mathrm{op}}$ holding:

- **Charter-rule cells**: $\langle r, \texttt{is-charter-rule-of}, \mathrm{Ch}\rangle$ for each closure rule $r \in \mathcal{C}_{\mathrm{ch}}$.
- **Office-named cells**: $\langle O, \texttt{named-by-charter}, \mathrm{Ch}\rangle$ for each office whose existence the charter establishes.
- **Predicate-named cells**: $\langle p, \texttt{named-by-charter}, \mathrm{Ch}\rangle$ for each predicate whose vocabulary the charter fixes.
- **Deontic-profile cells**: $\langle O, \pi_d, *\rangle$ for each named office's powers, duties, privileges, immunities (per [deontic-modality](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/teaching/explanations/deontic-modality.md)).
- **Jurisdictional-allocation cells**: $\langle O, \texttt{has-jurisdiction}, \mathcal{J}\rangle$ for each office's jurisdictional grant (per [jurisdiction-as-base-change](../../../../../../../sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/jurisdiction-as-base-change.md)).
- **Succession-priority cells** for each named office: $\langle O, \texttt{succession-priority-}i, h_i\rangle$ for $i = 0, \ldots, n$.

The **charter settling** is the sub-settling $v^{\mathrm{ch}} := v^{\mathrm{op}}|_{B_{\mathrm{ch}}}$ — the operations settling restricted to charter-relevant cells, closed under $\mathcal{C}_{\mathrm{ch}}$. The charter is a substrate predication system in its own right.

## The candidate-amendment shape

By the [visible-automorphism-sources](../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/visible-automorphism-sources.md) theorem, the candidate transformations of $v^{\mathrm{ch}}$ that arise as charter amendments come from the same four sources the operational case exhibits, each instantiated for the charter's particular cell vocabulary:

**1. Bilattice-negation gauge.** Reversing the polarity convention of the charter — e.g., a charter that records "permitted-to" cells and is amended to record the equivalent "not-prohibited-from" cells, with all closure rules updated to the new convention. Always cosmetic; the gauge component contributes nothing to the visible quotient (per [restructure-as-visible-automorphism](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md) §*The four sources*).

**2. Fiber-swap symmetry.** Swapping subject and object in symmetric jural relations within the charter — for instance, in a charter where mutual-obligation cells are presented as $\langle A, \texttt{owes-mutual}, B\rangle$ and amended to $\langle B, \texttt{owes-mutual}, A\rangle$. Cosmetic exactly when the operational state on those relations is fiber-swap-symmetric, which is the typical case for genuinely symmetric jural relations.

**3. Entity-permutation $\mathrm{Sym}(E_{\mathrm{ch}})$-stabilizer.** The most operationally consequential source. The renaming group acts by permuting named offices, predicates, jurisdictions, or succession candidates within $E_{\mathrm{ch}}$. The stabilizer is the **automorphism group of the charter under relabeling**.

**4. Predicate-automorphism stabilizer.** Replacing one charter-predicate's name with another while preserving its place in the closure-rule structure. A charter that uses "magistrate" and is amended to use "justice" throughout — with every closure rule updated to refer to the new name — sits here.

## Statement

For a charter settling $v^{\mathrm{ch}}$ on $B_{\mathrm{ch}}$, a **candidate amendment** is a triple $(\pi_E, \pi_\Pi, g)$ — a permutation $\pi_E$ of $E_{\mathrm{ch}}$, a generator-class-preserving endofunctor $\pi_\Pi$ of $\mathcal{C}_{\mathrm{ch}}$, and an element $g \in K_4$ from the [work symmetry group](../../../../glossary/terms/work-symmetry-group.md) — acting on $v^{\mathrm{ch}}$ stagewise. The candidate is an **amendment-automorphism** when it stabilizes $v^{\mathrm{ch}}$, i.e., lies in $\mathrm{Aut}^\simeq(v^{\mathrm{ch}})$. Such an amendment is **cosmetic** iff it lies in the invisible subgroup $N(v^{\mathrm{ch}})$, **substantive** iff its image in $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{ch}})$ is non-trivial.

**Theorem (charter-amendment dichotomy, conditional on stabilization).** *Let $\phi = (\pi_E, \pi_\Pi, g) \in \mathrm{Aut}^\simeq(v^{\mathrm{ch}})$ be an amendment that stabilizes the charter settling. Then $\phi$ is cosmetic iff $(\pi_E, \pi_\Pi)$ fixes every newly-designated cell position in $B_{\mathrm{ch}}$. Equivalently, $\phi$ is substantive iff $(\pi_E, \pi_\Pi)$ permutes at least one cell position in $B_{\mathrm{ch}}$ that has been touched by an increment at some stage of $v^{\mathrm{ch}}$.*

The conditioning matters: most candidate amendments **fail** to stabilize $v^{\mathrm{ch}}$. An amendment that merely *announces* a new structure — without satisfying the stabilization condition $v^{\mathrm{ch}}_\tau \circ (\pi_E \times \pi_E) = g \cdot v^{\mathrm{ch}}_\tau$ stagewise — is neither cosmetic nor substantive in this dichotomy; it is **regime-changing**, sitting outside $\mathrm{Aut}^\simeq(v^{\mathrm{ch}})$ entirely. Such amendments produce a different charter, not a self-symmetry of the existing one.

## Sketch

The argument is the direct lift of [restructure-as-visible-automorphism](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md) to the charter sub-settling. The [visible-automorphism-sources](../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/visible-automorphism-sources.md) theorem identifies $N(v)$ for any settling $v$ as exactly those automorphisms acting trivially on the settling-associated sheaf $\mathcal{F}_v$ — equivalently, those fixing every newly-designated cell. Applied to $v = v^{\mathrm{ch}}$: the gauge component, when it stabilizes, acts only on values and is trivial on the sheaf; the relabeling $(\pi_E, \pi_\Pi)$ contributes to the sheaf via cell-position action and is trivial iff it fixes every cell position touched by a charter increment. Combining: $\phi$ is cosmetic iff its relabeling component fixes every newly-designated charter cell. $\square$

## Applied taxonomy

The theorem partitions the standard charter-amendment vocabulary as follows.

### Cosmetic amendments

- **Article renumbering.** A renaming that permutes article identifiers (e.g., Article XIV becomes Article XII) while updating all internal cross-references. The renaming acts on cells $\langle r_i, \texttt{numbered-as}, n_i\rangle$ — but no charter increment has typically been recorded *against the article number itself*; the increments are against the charter rule's content. The permutation fixes all cells that have been touched by an increment, hence is cosmetic.
- **Predicate-name reform with simultaneous closure-rule update.** Replacing "magistrate" with "justice" throughout, *with* all closure rules updated. The relabeling stabilizes $v^{\mathrm{ch}}$ (since the closure rules now refer to the new name); fixed cells are exactly the renamed-predicate cells, none of which the prior charter recorded under the new name; the amendment is cosmetic.
- **Sign-convention reform.** Reversing the convention from "permitted-to" to "not-prohibited-from" everywhere, with all closure rules and recorded cells transformed accordingly. The bilattice-negation gauge component; cosmetic.
- **Retiring never-instantiated offices.** Removing a named office $O$ from the charter when no incumbency cell $\langle h, \texttt{instituted-into}, O\rangle$ has ever been settled. The relabeling permutes $O$ to a default void-entity; since no increment has touched $O$'s cells, the permutation fixes all newly-designated cells; cosmetic.

### Substantive amendments

- **Office consolidation.** Merging two named offices $O_1, O_2$ both with incumbency histories — $\pi_E$ identifies $O_1$ and $O_2$. By the theorem, this permutes cells $\langle h, \texttt{instituted-into}, O_1\rangle$ and $\langle h', \texttt{instituted-into}, O_2\rangle$ that both have prior increment-touches. Substantive.
- **Deontic-profile redefinition that touches recorded cells.** Adding a power $\pi_d$ to office $O$'s deontic profile *when $O$ has previously exercised the absence of that power* (i.e., the cell $\langle O, \pi_d, *\rangle$ was settled at $\bot$ or $\mathbf{f}$ as part of a prior recorded act). The amendment moves a previously-recorded cell to $\mathbf{t}$; this is not a self-symmetry but a regime-change. If it *is* presented as a self-symmetry (by a relabeling that reassigns the prior $\bot$-cell to a different entity), the relabeling fails to fix newly-designated cells; substantive.
- **Jurisdictional re-allocation touching settled cells.** Moving a matter from jurisdiction $\mathcal{J}_1$ to $\mathcal{J}_2$ when $\mathcal{J}_1$ has previously exercised the matter — the cells $\langle a, \texttt{within-jurisdiction-of}, \mathcal{J}_1\rangle$ have been settled at $\mathbf{t}$ for some prior act $a$. The relabeling permutes settled cells; substantive.
- **Succession-list amendment that affects past successions.** Reordering the priority list $L = (h_0, h_1, \ldots)$ when a prior succession has fired against the old list. The list-cell permutation interacts with prior succession-event cells; substantive.

### Neither cosmetic nor substantive (regime-changing)

- **Adding a wholly new office.** Charter is amended to create an office $O_{\mathrm{new}}$ with previously-unrepresented deontic profile. There is no prior cell-pattern $v^{\mathrm{ch}}$ that the amendment maps to itself; the amendment produces a charter with a different cell-system entirely. This is not in $\mathrm{Aut}^\simeq(v^{\mathrm{ch}})$.
- **Founding-document replacement.** A new charter replacing the old. The cell-system $B_{\mathrm{ch}}$ changes; not an automorphism of the old.
- **Jurisdictional re-allocation that changes scope.** Adding a new jurisdiction $\mathcal{J}_{\mathrm{new}}$ to an office that previously had no jurisdictional grant — produces new cells, not a self-symmetry of the old charter.

## Cohomological reading: amendment-cohomology as the polity's drift

By [cohomological-signature-of-traditions](cohomological-signature-of-traditions.md), each governance pattern has a cohomological signature on the charter settling. Amendment-cohomology refines this:

- **Cosmetic amendments** preserve the cohomological signature exactly. The charter's $H^\bullet(\mathcal{F}^{\mathrm{ch}})$ — including its $H^1$ adjudication-classes per [adjudication-modes-and-h1](adjudication-modes-and-h1.md) — is untouched.
- **Substantive amendments** induce a non-trivial linear map on $H^\bullet(\mathcal{F}^{\mathrm{ch}})$. The kernel records what cohomological content the amendment *retires* (e.g., the unique-incumbent class of $O_1$ vanishes when $O_1$ and $O_2$ are consolidated); the cokernel records what cohomological content the amendment *introduces* (e.g., the consolidated office's combined deontic profile contributes new generators).
- **Regime-changing amendments** do not produce a linear map at all — the source and target $H^\bullet$ live on different cell-systems and require an explicit comparison morphism (typically the [combined-cohomology-classifying-morphism](../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/combined-cohomology-classifying-morphism.md)) to relate.

The **drift cohomology** of a polity over time — the composite of all substantive amendments — is the substrate-algebraic content of "this polity is no longer the same polity it was." Cosmetic amendments contribute nothing to drift; substantive amendments contribute a measurable cohomological displacement; regime-changing amendments are not drift but discontinuity.

## Caveat — charter-stabilization is the rare case

For real charters with substantive content — many named offices, distinct incumbency histories, idiosyncratic deontic profiles — the entity-permutation stabilizer is typically trivial. Most charters sit at rigid moduli points. The theorem's force is therefore one-directional in practice: it explains *why most charter amendments that try to present themselves as cosmetic actually are not* (they permute named entities with distinct cell-histories) and *why a small class of amendments — pure renumbering, retiring of dormant offices, sign-convention reform — provably are cosmetic in a substrate-algebraic sense*.

A charter with non-trivial $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{ch}})$ admits *non-trivial substantive amendments that nevertheless leave the charter cell-for-cell identical*. These charters are operationally distinguishable: parallel offices with mirror-image histories, deliberately symmetric multi-chamber legislatures whose chambers have identical records, federations with isomorphic-by-design constituent constitutions. The size of $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{ch}})$ is the **structural redundancy diagnostic** of a polity's charter.

## Where used

- [charter-as-closure-system](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/charter-as-closure-system.md) — supplies the charter settling on which the visible/invisible distinction is computed.
- [cohomological-signature-of-traditions](cohomological-signature-of-traditions.md) — the cohomological signature is preserved by cosmetic amendments and displaced by substantive ones; this theorem partitions amendments by their action on the signature.
- [tradition-pluralism-as-fragment-coproduct](tradition-pluralism-as-fragment-coproduct.md) — for a polity carrying multiple governance patterns, each pattern's charter fragment has its own visible-automorphism quotient; amendment-cosmeticity must be checked per fragment, not globally.
- [succession-as-handoff-cobordism](succession-as-handoff-cobordism.md) — a charter amendment to the succession list is cosmetic iff it permutes only never-fired list positions; once a succession has fired against a list position, amending that position is substantive.
- [restructure-as-visible-automorphism](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md) — the operational-layer parent theorem; this note is its governance-layer specialization.

## Open downstream

- *Constitutional-revision indexing.* For a polity that has undergone many amendments, the composite drift cohomology is computable in principle; in practice, the charter-cell archaeology required to determine which prior cells each amendment touched is non-trivial. Whether existing legal-historical scholarship's "constitutional moments" align with substantive-amendment events in this sense is a downstream empirical-formal question.
- *Cosmeticity as a justiciable condition.* The theorem provides a substrate-algebraic test for whether an amendment is cosmetic. Whether courts evaluating "purely procedural" vs. "substantive" amendments could in principle apply this test — and what evidence (incumbency-history records, prior cell-touches) it would require — is open.
- *Multi-stage amendments.* Some amendments are presented as cosmetic at stage $\tau$ but become substantive at stage $\tau + k$ once new incumbency cells touch the renamed positions. The theorem's stagewise structure handles this, but the operational discipline of "cosmeticity is not a permanent property" deserves articulation.
