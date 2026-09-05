---
type: object
class: governance-pattern
status: draft
depends-on: [governance-pattern, operations-settling, authority-gate, charter-as-closure-system, restorative-accountability]
realizes: [black-radical-tradition, abolition-theory, fugitive-governance]
---

# Black Radical Refusal

A governance-pattern object modeling three interrelated contributions of the Black Radical Tradition to predicated-governance: *refusal* of inherited normative grammars, *fugitive governance* outside institutional jurisdictions, and *abolition* as positive construction of life-affirming closure-rule fragments. Drawing on Cedric Robinson, Fred Moten, Stefano Harney, Saidiya Hartman, Angela Davis, Ruth Wilson Gilmore, and Robin D.G. Kelley.

**Status note.** This object is explicitly a sketch. The library question [black-radical-tradition-governance-substrate](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/questions/black-radical-tradition-governance-substrate.md) asks for grounded accounts from BRT scholars that can populate this object's substrate parameters accurately. The formalization here is provisional; it should be revised as that sourcing accumulates.

## Three pattern components

### Refusal

Refusal in the BRT is not mere non-compliance — it is a collective governance act: the assertion that certain status-function-declarations are illegitimate and will not be recognized as valid closure-rule inputs. Cedric Robinson's *Black Marxism* (1983) describes how enslaved and colonized peoples maintained alternative ontologies and governance forms that the imposed normative grammar could not fully capture — not by accepting those grammars and resisting within them, but by sustaining distinct normative orders.

Substrate representation: the refusal pattern adds *blocking cells* to the governance-pattern subsystem. A blocking closure rule fires: if a status-function-declaration $D$ belongs to a blocked-grammar class $\Gamma$, then

$$\langle D, \texttt{blocked-by-refusal}, \Gamma\rangle = \mathbf{t},$$

and the [authority-gate](teaching/explanations/authority-gate.md) for any act grounded in $D$ is blocked. The blocking cell is not the same as a veto in the consensus sense (which blocks on alignment failure). It is a *categorical exclusion*: acts grounded in certain normative grammars simply do not have standing to fire in this governance-pattern subsystem.

The structural consequence: refusal creates a $\top$-valued authority cell at the boundary between the external system's authorization and the refusal-pattern's block. This is the substrate-algebraic representation of dual-authority tension — the imposed system asserts authorization; the refusal-pattern asserts block — producing the overdetermined cell that marks governance-pattern incompatibility (per [tradition-pluralism-as-fragment-coproduct](../theorems/tradition-pluralism-as-fragment-coproduct.md)). Unlike the colonial-overlay conflict analyzed in [restorative-retributive-norm-conflict](../theorems/restorative-retributive-norm-conflict.md), refusal is a *deliberate construction* of the blocking cell, not a consequence of imposed coexistence.

### Fugitive governance

Fred Moten and Stefano Harney's *The Undercommons* (2013) and Saidiya Hartman's accounts of enslaved sociality describe *fugitive* spaces — governance forms that operate in the gaps, cracks, and margins of institutional jurisdictions. The hush harbor, the Underground Railroad network, the maroon community, the mutual aid circle — these are not simply non-institutional; they are governance forms with their own closure-rule subsystems, authority structures, and normative vocabularies.

Substrate representation: fugitive governance is a lusory closure subsystem — following the [lusory-constraint analysis](../teaching/explanations/lusory-constraint-and-the-magic-circle.md) — that establishes its own jurisdictional scope precisely by operating where the institutional jurisdiction does not reach. The jurisdictional boundary is the condition of possibility for the fugitive governance form; the grammar of the institutional system is excluded from the fugitive subsystem's closure rules by construction.

The [jurisdictional-vires](../morphisms/jurisdictional-vires.md) morphism provides the formal machinery: the fugitive subsystem's acts are *intra vires* within its own jurisdiction and *ultra vires* with respect to the institutional system's jurisdiction — but the institutional system's jurisdiction does not extend to the fugitive space. The jurisdictional conflict is a boundary-condition dispute, not an internal inconsistency in either subsystem.

This is the substrate-algebraic content of "the undercommons": a governance space that inhabits the institution without being governed by its closure rules, maintaining a different set of authority cells and settlement conditions.

### Abolition as positive construction

Ruth Wilson Gilmore's formulation — abolition as the creation of "life-affirming institutions" (*Golden Gulag*, 2007) — rejects the characterization of abolition as merely the removal of carceral systems. Angela Davis (*Are Prisons Obsolete?*, 2003; *Abolition Democracy*, 2005) argues similarly: abolition is not a policy of subtraction but a project of construction.

Substrate-algebraic content: abolition is not the retraction of punitive closure-rule cells — settling-monotonicity prohibits retraction of cells once settled at $\mathbf{t}$. Abolition is the construction of an alternative closure-rule fragment $S_{\mathrm{abol}}$ that:

1. Produces life-affirming cells (care, mutual aid, community accountability, restorative response) for the harms that punitive cells were nominally designed to address.
2. Does *not* contain the punitive closure rules — they are absent from $S_{\mathrm{abol}}$, not negated.
3. Is cohomologically incompatible with the punitive fragment $S_{\mathrm{punit}}$ when both are active: the two fragments produce $\top$ on the accountability-disposition cell (per [restorative-retributive-norm-conflict](../theorems/restorative-retributive-norm-conflict.md)).

The abolitionist project is a governance-pattern replacement: building $S_{\mathrm{abol}}$ sufficiently that $S_{\mathrm{punit}}$'s cells are no longer needed to address harm — not by removing $S_{\mathrm{punit}}$ (which monotonicity prohibits) but by making its cells structurally irrelevant to the community's harm-response.

## Interaction with restorative accountability

The BRT's abolition-as-construction project overlaps significantly with [restorative-accountability](./restorative-accountability.md): both prioritize relation-repair over punishment, both treat accountability as a community rather than carceral process. The structural relationship: abolition-as-construction and restorative accountability share the care-based cell vocabulary but differ in political scope and analysis. Restorative accountability is a *process design*; abolitionism is a *theory of governance transformation* that analyzes why punitive processes exist and what abolishing them structurally requires.

The abolitionist analysis adds a layer the restorative-accountability object does not contain: the [colonial-law overlay](../theorems/restorative-retributive-norm-conflict.md) that forces punitive-fragment coexistence is not an accident but a political structure. Abolition names the political project of replacing that structure, not merely operating restorative processes within it.

## Cohomological signature

The refusal-pattern's blocking cells produce $\top$ at the boundary with any imposed system attempting to fire blocked-grammar declarations. This is not an error state to be resolved but a *structural fact about political incompatibility*: the refusal-pattern's $H^1$ over the disputed boundary measures the extent of the normative conflict. The fugitive governance subsystem's $H^1$ is typically trivial *within* its own jurisdiction (internally consistent governance); the non-trivial cohomology lives at the boundary between fugitive and institutional jurisdictions.

The abolitionist project's cohomological signature changes over time: as $S_{\mathrm{abol}}$ grows and the community increasingly routes harm-response through it, the $\top$ cells at the accountability-disposition predicate shift from "imposed incompatibility" (the restorative-retributive conflict) toward "structural obsolescence" of the punitive fragment — the punitive closure rules cease to fire because the harms they nominally address are handled elsewhere.
