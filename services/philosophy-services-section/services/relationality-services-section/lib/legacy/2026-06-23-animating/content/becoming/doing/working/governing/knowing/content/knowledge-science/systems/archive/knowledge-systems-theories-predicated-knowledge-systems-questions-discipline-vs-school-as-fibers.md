---
type: question
status: open
explores: [discourse-community-as-fiber, four-group-register-as-fibration, scope]
see-also: [knowledge-organization-survey, predicate-category-stratification]
---

# Are disciplines and schools different kinds of fibers?

The four-group register's situating-stratum subdivides into three: *disciplines*, *schools*, and *lineages*. The predicated framing reads each as a discourse-community-style scope on the substrate. But the three are not interchangeable — a discipline (e.g., neuroscience) and a school (e.g., the Bayesian school within neuroscience) and a lineage (e.g., the Hubel-Wiesel lineage within Bayesian neuroscience) are organised differently and admit different kinds of cross-community federation.

The open question:

> What *substrate-level structural difference* distinguishes disciplines, schools, and lineages, given that all three are scopes per [discourse-community-as-fiber](teaching/explanations/discourse-community-as-fiber.md)?

## Primary proposal: three different fiber index categories

Each of the three is a [scope](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/scope.md) on the substrate, but the *index category* over which scopes vary is different for each.

**Discipline as scope indexed by an institutional category.** Let $\mathbf{Inst}$ be the category whose objects are *institutional jurisdictions* (departments, journals, professional societies, degree-granting bodies) and whose morphisms are recognition-and-membership relations (affiliation, accreditation, joint appointment). A *discipline* is a functor $D: \mathbf{Inst} \to \mathbf{Scope}_{\mathcal{K}}$ that assigns to each institutional jurisdiction the substrate-scope of the knowledge produced under that jurisdiction. Cross-discipline federation (per [federate](../morphisms/federate.md)) requires explicit cross-institutional identity-mappings, and the federated scope is the colimit per [federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md).

**School as scope indexed by a methodological category.** Let $\mathbf{Method}$ be the category whose objects are *methodological commitments* (Bayesian / frequentist, structuralist / poststructuralist, monetarist / Keynesian, computational / connectionist) and whose morphisms are method-translation morphisms (when one school's method can be reduced to or mapped to another's). A *school* is a functor $H: \mathbf{Method} \to \mathbf{Scope}_{\mathcal{K}}$ assigning to each methodological commitment the substrate-scope where its commitments are admitted as closure rules. Cross-school federation is partial when methods can only partially translate; the federation's coherence depends on the existence of a method-translation morphism between the two schools' methodological commitments.

**Lineage as scope indexed by a derivational category.** Let $\mathbf{Lineage}$ be the category whose objects are *intellectual ancestors* (specific scholars, specific works, specific results) and whose morphisms are derivation arrows (whose work derives from whom, with directional time-asymmetry). A *lineage* is a functor $L: \mathbf{Lineage} \to \mathbf{Scope}_{\mathcal{K}}$ assigning to each derivational ancestor the substrate-scope of work derivable from that ancestor's results. Cross-lineage federation is *not symmetric* — content flows forward in time along derivation chains, so federation respects the partial order on $\mathbf{Lineage}$.

## Structural consequences

If the three are functors over different index categories, several substrate-level facts follow:

**(F1) The three index categories interact non-trivially.** A piece of work belongs simultaneously to a discipline (a value in $\mathbf{Inst}$), a school (a value in $\mathbf{Method}$), and a lineage (a value in $\mathbf{Lineage}$). Its substrate scope is the *limit* of the three corresponding scope-functors on the work — the intersection of jurisdiction, method, and ancestry. Cross-stratum coherence is checked by whether this limit is consistent at the substrate level.

**(F2) Cross-type federation is asymmetric.** Federating a discipline-scope with a school-scope (e.g., neuroscience-as-discipline with Bayesian-school) is a *change of base* along a functor $\mathbf{Inst} \to \mathbf{Method}$ (or its converse), which exists only when the change-of-base is well-defined. When it isn't, the federation is partial — the substrate carries both scopes but their cross-cells are $\bot$ until cross-stratum identity is asserted.

**(F3) Lineage federation is monotone in time.** Forward in time, lineage federation is automatic (the descendant inherits the ancestor's substrate-content via derivation morphisms). Backward in time, lineage federation requires explicit "rediscovers/reinterprets" predications — the descendant's content cannot be projected back onto the ancestor without an explicit retroactive identity-mapping.

**(F4) Discipline scopes are typically larger than school scopes which are typically larger than lineage scopes.** Each lineage is contained in (typically) one school; each school is contained in (typically) one or more disciplines; each discipline is contained in the substrate. The containment is functorial: $L \hookrightarrow H \hookrightarrow D \hookrightarrow \mathcal{K}$.

## Companion question: simultaneous belonging

A piece of work belongs to a discipline *and* a school *and* a lineage simultaneously; the three classifications constrain different aspects of the work; cross-type reconciliation (when a discipline and a school disagree about a method) requires substrate-level discipline that the four-group register does not currently name.

Tentative substrate reading: the *simultaneous-belonging predicate* is the limit of the three scope-functors on the work. When the limit is non-empty (the work coherently belongs to all three), the work is well-placed; when the limit collapses (a discipline and a school assign incompatible methods to the work's domain), the substrate records a $\top$-valued meta-predication about the work's classification — a substrate-level fact about the cross-stratum tension.

This is the substrate-level reading of *interdisciplinary work*: not work that belongs to multiple disciplines (which is just multi-classification), but work whose simultaneous-belonging predicate is contested across the disciplinary, methodological, and derivational fiber-restrictions. The Galison "trading zones" literature (per [process-ontology-and-situated-learning](../texts/process-ontology-and-situated-learning.md) §6) becomes the upstream theory of how working communities settle these contestations in practice.

## Status: open

The open issues this note leaves for follow-up:

- The precise category-theoretic specification of $\mathbf{Inst}$, $\mathbf{Method}$, $\mathbf{Lineage}$ — what *exactly* the morphisms are, whether they form posets or full categories, what limits and colimits exist in each.
- Whether the three index categories are themselves *fibered* over a common base (e.g., a category of *epistemic projects* per Knorr-Cetina), which would unify the three under a single substrate-level structure.
- Whether the proposal's predictions about asymmetry of lineage federation (F3) hold against the cross-historical reception literature (when later schools rediscover earlier work and reinterpret it, what substrate operation is that?).
- The relationship between this fiber-difference proposal and the [four-group-register-as-regime](../theorems/four-group-register-as-regime.md) regime-classification proposal — whether the three sub-strata of the situating-stratum land in *different* regimes (which would be a substrate-level distinguishing feature beyond fiber-index difference).

A successful resolution of this question would promote the discipline/school/lineage distinction from a directory-layout convention to a substrate-level structural fact, with corresponding theorems characterising each fiber kind's federation discipline and regime classification.
