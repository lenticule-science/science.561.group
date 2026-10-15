---
type: definition
class: fiber-bundle
status: draft
symbol: "\\mathcal{K}"
depends-on: [operations-base, predication-fiber-algebra]
date-modified: 2026-10-15
---

# Capability fiber bundle

The capability fiber bundle pairs provided-capability and required-capability
predications over the [operations base](operations-base.md). In this draft
model, K=(K_prov,K_req) is the pair of predication fiber algebras over the
operations base. Each component is a FOUR-valued function on E_op×E_op;
provided-capability and required-capability select the relevant predicate.
Each predication has a FOUR evidence value. For an agent A, task T and
capability c, the relevant sections are

\[\sigma_A(c)=v\langle A,\texttt{provides-capability},c\rangle,\qquad
\rho_T(c)=v\langle T,\texttt{requires-capability},c\rangle.\]

| Value | Evidence about the predication |
| --- | --- |
| ⊥ | Neither positive nor negative evidence recorded |
| t | Positive evidence only |
| f | Negative evidence only |
| ⊤ | Both polarities recorded; a conflict to examine |

A capability assertion, test result, enrollment or exclusion is evidence with
a source and scope. It is not automatically a proved ability under every
operating condition. Keep the test environment, validity interval and required
resource conditions when evaluating an agent against a task. Unknown and
conflicting evidence must remain available to the admission rule.

## Dispatch and authority

The original predicated-work dispatch construction compares the agent's
provided section with the task's required section by residuation. Its exact
residuated structure and readiness criterion must be supplied by the admitting
model. A prose assertion that two names match is not this construction.

Authority is a separate normative relation. The later original-work source
distinguishes `holds-power-over` and `requires-authority-for` sections, and
requires valid installation or delegation acts. Technical capability does not
confer authority. Office membership can expose institutional resources or
declare a provision rule; membership alone does not demonstrate the holder's
personal competence, availability, or permission for an arbitrary action.

## Institutional capability propagation

The authored office-membership rule is retained as an evidence-propagation
rule: when member-of(A,O)=t and provides-capability(O,c)=t, add positive support
so provides-capability(A,c) ≥ₖ t. Its stated evidence reading is an enrollment
witness or capability assertion, not a demonstrated personal performance.
The rule is proposed as a predicate-specialization realization; that structural
claim still requires its carrier and map. A consumer must say whether the
capability is institutionally provisioned, personally tested or dependent on
available resources. This rule does not on its own confer arbitrary authority.

## Evidence growth and effective revision

In FOUR's knowledge order, adding negative evidence to t yields ⊤. No
inflationary update on that same cell can take ⊤ to f: that would discard its
positive coordinate. The previous text explicitly assigns ⊤→f to a separate substrate repair
catalog, not to the closure rules. That distinction is retained. The repair
catalog's concrete operation and laws have not been recovered here; the
knowledge-order argument restricts ordinary settlement, not every possible
revision operation.

A revocation or corrected assessment must preserve the historical evidence and
identify the applicable time, scope or successor assessment. The owning
governance/representation contract must specify how current eligibility is
computed from those records. This term does not invent a new truth value,
codec, relation identifier or universal revision policy. A consumer that lacks
the policy reports unresolved eligibility rather than silently deleting a
polarity.

## SignCell realization and receiving

Required for the current consumer: actor and capability normalization produce
reusable ActorCell and CapabilityCell representations under the existing
SignCell identity law. Source-specific marketplace, code or provider records
refer to those cells. Preserve their source identities and co-reference
history. The predicate strings above do not establish current registry IDs.

Receiving cases distinguish positive provision, absent provision, explicit
exclusion, contradictory evidence, stale evidence, an authorized but incapable
agent, and a capable but unauthorized agent. No case may gain authority from a
capability assertion alone.

## Provenance and proof status

This is a draft work model. The prior current-section text is retained in Git
history. The expanded authority/capability distinction is in the
[original capability bundle](https://github.com/emsenn/561-theory/blob/04a09cb4f14dfa58994db7a6864fe7771ddca882/humanities/theories/sociology/theories/work/theories/predicated-work/code/structures/capability-fiber-bundle.md).
The current mathematical owner is
[FOUR](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Positing/Four.lean).
Its declared knowledge-order laws concern that formal carrier; they do not
prove a deployed capability evaluator or Mission-category correspondence.
