---
type: theorem
class: cech-resolution-instantiation
status: sketch
symbol: "\\mathrm{audit}(v) \\;=\\; \\check{H}^*(\\{U_i\\}; v)"
depends-on: [operations-settling, recurrent-practice, witness-as-increment, adjudicate-witness-conflict, completion-as-quiescence]
realizes: [cech-derived-comparison-on-bitopological-site, settling-cohomology-vanishing-via-husainov-cech]
---

# Audit as Čech resolution of operations settling

An **audit** — the substrate-algebraic content of *"a designated examiner re-examines the operations settling at chosen sample-points and reports the findings"* — presents as a **Čech resolution of the operations-settling sheaf** with respect to an **audit cover** $\{U_i\}_{i \in I}$ of the operations base.
Audit-findings — the operationally-recognized output of the audit — are exactly the **classes in the Čech cohomology** $\check{H}^*(\{U_i\}; v_{\mathrm{op}})$.

By [cech-derived-comparison-on-bitopological-site](../../../../../../math/theories/categories/theories/predication-categories/theorems/cech-derived-comparison-on-bitopological-site.md), Čech and derived cohomology coincide for sufficiently fine subcanonical covers — so a **complete audit** (one whose cover is fine enough to satisfy the comparison hypothesis) recovers the full derived signature of the operations settling.
By [settling-cohomology-vanishing-via-husainov-cech](../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md), audits over **Husainov-acyclic** covers — covers whose site-structure satisfies the Dedekind–MacNeille cut-poset acyclicity hypothesis of the cited theorem — produce no Čech classes in degrees $\geq 2$; the substantive audit content is then concentrated in $\check{H}^0$ (agreed-on cells) and $\check{H}^1$ (gaps the cover cannot reconcile), with no higher-degree noise from the cover decomposition.

The substantive claim is that **audit completeness, sample-coverage, and audit-finding-class are not project-management heuristics but cohomological invariants** — and that the practitioner-recognized phenomena of "audit-trail gaps," "sample-frame bias," and "auditor disagreement" correspond to specific classes in the Čech double complex of the audit cover.

## Setup: audit cover, audit-fiber, audit-findings

An **audit cover** of the operations base $\mathcal{B}_{\mathrm{op}}$ is a covering family $\{U_i \hookrightarrow \mathcal{B}_{\mathrm{op}}\}_{i \in I}$ in the [parameter-base-topology](../../../../../../math/theories/categories/theories/predication-categories/objects/parameter-base-topology.md) on the operations site.
Operationally, each $U_i$ is a **sample frame** — a substructure of operations the audit will examine in detail (a date range, a department, a transaction type, a counterparty class).
The collection $\{U_i\}$ is the audit's **scope** — what the audit looks at.

The **audit-fiber** at sample $U_i$ is the restriction $v_{\mathrm{op}}|_{U_i}$ of the operations settling to $U_i$ — the cell-system the auditor reconstructs from $U_i$'s witnesses and operational records.
Per [witness-as-increment](../morphisms/witness-as-increment.md), each examined witness contributes an increment; the audit-fiber is the closure of these increments under the polity's audit-relevant closure rules.

The **overlap audit-fibers** $v_{\mathrm{op}}|_{U_{ij}}$ at $U_{ij} := U_i \cap U_j$ are the cell-systems the auditor reconstructs from the *intersection* of two sample frames — typically, observations recorded in both frames (an auditor cross-checks two departments' books on a shared transaction; the overlap-fiber is the cell-system both books should agree on).

The **audit Čech complex** is the standard Čech complex $$\check{C}^n(\{U_i\}; v_{\mathrm{op}}) = \prod_{i_0 < \cdots < i_n} v_{\mathrm{op}}(U_{i_0 \cdots i_n})$$ with the alternating-sum differential.
Its cohomology $\check{H}^n(\{U_i\}; v_{\mathrm{op}})$ is the **audit cohomology** at the chosen cover.

## Statement

**Theorem (audit as Čech resolution).** *Let $v_{\mathrm{op}}$ be the [operations settling](../objects/operations-settling.md) of a substrate, and $\{U_i\}_{i \in I}$ an audit cover of the operations base satisfying:*

1. *(Subcanonical covering.)
  The audit cover is a covering family in the [parameter-base-topology](../../../../../../math/theories/categories/theories/predication-categories/objects/parameter-base-topology.md), and the operations settling presents as a [settling-associated sheaf](../../../../../../math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) on the bitopological site.*

2. *(Witness-locality.)
  Each $U_i$ has its own witness-base — the auditor at $U_i$ has full access to the witness records that produced the cells in $U_i$.*

*Then:*

(a) **(Audit-findings as Čech cohomology.)** *The audit performed against the cover $\{U_i\}$ produces findings exactly in the audit cohomology $\check{H}^*(\{U_i\}; v_{\mathrm{op}})$.
Concretely:* - *$\check{H}^0(\{U_i\}; v_{\mathrm{op}})$ records **agreed-on operational content** — cells the auditor reconstructs consistently across overlapping sample frames;* - *$\check{H}^1(\{U_i\}; v_{\mathrm{op}})$ records **audit gaps** — cells assertable in some $U_i$ but not consistent across pairwise overlaps; the substrate-algebraic content of "the audit cannot reconcile two departments' accounts of the same transaction."*

(b) **(Complete audit recovers derived signature.)** *If the cover $\{U_i\}$ is fine enough to satisfy the hypotheses of [cech-derived-comparison-on-bitopological-site](../../../../../../math/theories/categories/theories/predication-categories/theorems/cech-derived-comparison-on-bitopological-site.md), then $\check{H}^*(\{U_i\}; v_{\mathrm{op}}) \cong H^*(v_{\mathrm{op}})$ — the audit recovers the full derived cohomological signature of the operations settling.
Such audits are **complete** in the substrate-algebraic sense: no operational content escapes them.*

(c) **(Husainov-acyclic audits have no higher-degree noise.)** *If the cover $\{U_i\}$ satisfies the [husainov-acyclicity](../../../../../../math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md) hypothesis on the bitopological site (i.e., the cover's site-structure satisfies the Dedekind–MacNeille cut-poset acyclicity required by [settling-cohomology-vanishing-via-husainov-cech](../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md)), then $\check{H}^n(\{U_i\}; v_{\mathrm{op}}) = 0$ for all $n \geq 2$, and the audit produces findings only in degrees 0 and 1.
Operationally: a Husainov-acyclic audit is **noise-free above the gap-degree** — agreed-on content lives in $\check{H}^0$, audit-gap content lives in $\check{H}^1$, and no spurious higher-degree classes arise from the cover decomposition.
Note that the cited theorem establishes vanishing only for $n \geq 2$; the $\check{H}^1$ degree (audit gaps) is not killed by acyclicity and remains the substantive locus of audit findings beyond agreement.*

(d) **(Audit-cover refinement is a Čech-resolution refinement.)** *Refining an audit cover from $\{U_i\}$ to $\{U_i'\}$ (where each $U_i'$ is contained in some $U_i$) corresponds to a Čech-complex morphism $\check{C}^*(\{U_i\}; v_{\mathrm{op}}) \to \check{C}^*(\{U_i'\}; v_{\mathrm{op}})$.
The induced morphism on cohomology is a refinement of the audit findings; in the limit (the colimit over all covers), the resulting cohomology is the **derived cohomology** $H^*(v_{\mathrm{op}})$ — the substrate-algebraic content of *"a sufficiently thorough audit reveals everything that is structurally there to be revealed."**

## Sketch

**(a)** By hypothesis (1), the operations settling is a sheaf on the subcanonical site, so the standard Čech complex computes a cohomology theory invariant of the cover up to comparison.
The $\check{H}^0$ is the equalizer of the restriction maps $\prod_i v_{\mathrm{op}}(U_i) \rightrightarrows \prod_{i<j} v_{\mathrm{op}}(U_{ij})$ — exactly the cells consistently reconstructed across overlaps.
The $\check{H}^1$ is the cokernel of the restriction map, modulo the boundaries from $\check{C}^0$ — exactly the obstruction to consistent reconstruction.
The substrate-algebraic interpretation tracks these constructions: $\check{H}^0$ is what every overlapping pair agrees on; $\check{H}^1$ is what some pair fails to reconcile. $\square$ (Sketch (a))

**(b)** The cited [cech-derived-comparison-on-bitopological-site](../../../../../../math/theories/categories/theories/predication-categories/theorems/cech-derived-comparison-on-bitopological-site.md) establishes the Čech-derived comparison for sufficiently fine covers.
A "complete audit" is by definition one whose cover satisfies this hypothesis.
The conclusion is direct application of the cited theorem to the operations-settling sheaf. $\square$ (Sketch (b))

**(c)** The cited [settling-cohomology-vanishing-via-husainov-cech](../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md) establishes Čech (and derived) cohomology vanishing in degrees $n \geq 2$ for sites satisfying the Husainov-acyclicity hypothesis on Dedekind–MacNeille cut posets.
Applied to the audit-cover bitopological site (assuming it inherits the Husainov-acyclicity hypothesis from the operations site), the same conclusion holds: $\check{H}^n(\{U_i\}; v_{\mathrm{op}}) = 0$ for $n \geq 2$.
The cited theorem does **not** force $\check{H}^1$ vanishing — and indeed should not, since $\check{H}^1$ records the audit-gap content of (a).
A Husainov-acyclic audit is therefore "noise-free above the gap degree" rather than "noise-free": every $\check{H}^{n \geq 2}$ class is suppressed, so all audit content is either $\check{H}^0$ (agreement) or $\check{H}^1$ (gap). $\square$ (Sketch (c))

**(d)** Cover refinement induces a chain map between Čech complexes — this is standard for sheaf cohomology with respect to a presheaf of abelian groups (here, the bilattice-valued cells of $v_{\mathrm{op}}$).
The colimit over all covers, ordered by refinement, gives the derived cohomology by general nonsense; for the bitopological setting, this is the formal content of [cech-derived-comparison-on-bitopological-site](../../../../../../math/theories/categories/theories/predication-categories/theorems/cech-derived-comparison-on-bitopological-site.md).
The substrate-algebraic reading: an audit can always be refined further; in the limit, the audit recovers the derived cohomology — the maximal possible audit content. $\square$ (Sketch (d))

## Operational consequences

### Audit gaps are $H^1$-class obstructions

The (a) reading identifies *audit gaps* — the practitioner-recognized phenomenon of "two sources of record disagree on the same transaction" — with classes in $\check{H}^1$ of the audit cover.
By [adjudication-modes-and-h1](adjudication-modes-and-h1.md), each $H^1$-class corresponds to an adjudication-mode obligation; the auditor's resolution of the gap (typically: an [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md) operation) selects the $H^1$-representative the audit will report.

The substrate-algebraic content: audit gaps are *cohomological*, not procedural.
An audit cover with non-trivial $\check{H}^1$ has gaps no amount of further sampling within that cover can close — the gap is a structural feature of the cover decomposition.
Closing the gap requires either a finer cover (per (d)) or an adjudication of the conflicting pair (per [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md)).

### Sample-frame bias is a non-Husainov-acyclic audit cover

The (c) reading clarifies the practitioner-recognized phenomenon of *sample-frame bias* — the audit's findings being skewed by the choice of sample frame.
Substrate-algebraically: an audit cover is **biased above the gap degree** when its site-structure fails the Husainov-acyclicity hypothesis — when the cover's Dedekind–MacNeille cut-poset structure carries non-trivial higher Čech classes.
The bias is the spurious $\check{H}^{n \geq 2}$ classes generated by the cover decomposition, distinct from the genuine operational $H^*(v_{\mathrm{op}})$ being approximated.
(Bias *at* the gap degree — non-trivial $\check{H}^1$ — may still be genuinely operational; only the $n \geq 2$ classes are pure decomposition artifacts.)

Audit standards that prescribe "stratified random sampling" are, in the substrate-algebraic reading, prescribing *Husainov-acyclic* sampling: stratify so that the cover's cut-poset structure carries no higher-degree Čech classes.
The standards' reliability claim is the substrate-algebraic claim that Husainov-acyclic-cover audits produce no findings in $\check{H}^{\geq 2}$, concentrating genuine audit content in $\check{H}^0$ and $\check{H}^1$.

### Audit completeness is cover-fineness

The (b) reading identifies *audit completeness* — the practitioner-recognized notion of "the audit covered everything that needed to be covered" — with cover-fineness sufficient for the Čech-derived comparison.
A complete audit is not one that examines every cell (impossible for any non-trivial settling) but one whose cover is fine enough that $\check{H}^* \cong H^*$ — every derived class of the operations settling has a Čech-class representative the audit can find.

The substrate-algebraic content: completeness is *not* exhaustivity.
A cover that is fine in the right way can be much smaller than the full settling and still complete.
The auditor's choice of cover is a choice of where to examine in detail; cover-fineness captures the rigor of that choice.

### Recurrent audits are colimit-refinements

A **recurrent audit** — one performed at each iteration of a [recurrent-practice](../objects/recurrent-practice.md) — is, per (d), a sequence of cover-refinements ordered by the practice's recurrence.
The audit's findings at iteration $n+1$ refine those at iteration $n$; in the limit, the cumulative audit history converges to the derived cohomology of the operations settling at the time-cell-system the audit examines.
This is the substrate-algebraic content of *"continuous auditing"* — the audit-program's refinement structure converges, in the limit, to the full derived signature.

## Audit-trail integrity

The audit-cover formalism gives a substrate-algebraic reading of *audit-trail integrity* — the property that audit findings cannot be tampered with after the fact.
By [witness-as-increment](../morphisms/witness-as-increment.md), each witness contributes an increment to $v_{\mathrm{op}}$; the audit cohomology is computed *from* the witness-increment record.
Audit-trail integrity is then the **immutability of the witness-increment record under the cover**: any post-hoc edit to a witness-increment is a change to a cell in some $U_i$, which the cover refinement (d) detects as a discontinuity in the Čech-cohomology refinement series.

In particular: a tampered audit-trail produces a recurrent audit whose cohomology *changes* under refinement in a way the un-tampered audit's would not.
The substrate-algebraic content of "audit-trail integrity is verifiable by re-audit" is exactly this: the Čech-resolution refinement series is computable from the witness-increment record, and any change to that record is detectable as a discrepancy in the refinement.

## Status

`sketch` because:

- The Čech-derived comparison hypothesis (b) is an established result in [cech-derived-comparison-on-bitopological-site](../../../../../../math/theories/categories/theories/predication-categories/theorems/cech-derived-comparison-on-bitopological-site.md), but the precise specialization to the operations-settling sheaf depends on which sheaf-condition formalism the operations carry; subcanonical conditions are assumed but not verified per substrate.
- The acyclic-cover hypothesis of (c) is verified for [husainov-cech](../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md) covers in the cited theorem, but the audit-layer specialization — that "acyclic cover" coincides with the audit-standards notion of "stratified random sampling" — is conjectural and requires per-sampling-method verification.
- The (d) refinement-colimit content is correct in the standard sheaf-cohomology setting, but the bitopological refinement structure may have additional content (per [verdier-duality-bitopological-site](../../../../../../math/theories/categories/theories/predication-categories/theorems/verdier-duality-bitopological-site.md)) that this sketch does not extract.
- The audit-trail integrity reading is consistent with the witness-increment formalism but requires the immutability assumption on the witness-increment record; substrates without an immutable witness record (e.g., overwritable journals) do not satisfy this assumption directly.

The directional content — that audit-cover, audit-completeness, audit-bias, and audit-gaps correspond to Čech-resolution constructs, and that audit findings are cohomology classes of a Čech complex over the audit cover — is the substantive proposal of this sketch.

## Where used

- [witness-as-increment](../morphisms/witness-as-increment.md) — supplies the cell-level data the audit-fibers reconstruct from.
- [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md) — the operation that resolves $\check{H}^1$-class audit gaps; per [adjudication-modes-and-h1](adjudication-modes-and-h1.md), it selects the $H^1$-representative the audit reports.
- [completion-as-quiescence](completion-as-quiescence.md) — the audit examines whether the operations have reached closure-quiescence; the audit's $H^0$ records the quiescent cells.
- [agent-team-as-bilattice-network-sheaf](agent-team-as-bilattice-network-sheaf.md) — the auditor itself is an agent (or team of agents) whose witness-network forms a bilattice-network sheaf; multi-auditor consensus on findings is the network-sheaf $H^0$ of the auditor team.
- [federation-cohomology-as-mayer-vietoris](theories/predicated-governance/theorems/federation-cohomology-as-mayer-vietoris.md) — federation-level audits use the same Mayer-Vietoris machinery on a jurisdictional cover; the present theorem and the cited theorem combine for inter-jurisdictional audits (e.g., an international tax audit's cover-structure has both audit-cover and jurisdictional-cover content).
- [restorative-accountability](theories/predicated-governance/objects/restorative-accountability.md) — restorative-process audits typically use coarser, stakeholder-defined covers rather than fine sampling; the present theorem clarifies why such audits surface fewer $H^1$ gaps but more $H^0$ ambiguity.

## Open downstream

- *Audit-cover topology vs. operational topology.* The audit cover lives in the operations-base topology; whether the audit topology and the operational topology coincide (auditor and operator look at the same site-structure) or diverge (auditor's site is coarser, e.g., when auditors aggregate operations into reportable categories) deserves explicit treatment.
  The divergence introduces a separate Čech-derived comparison between the two topologies.
- *Auditor disagreement as cover-isomorphism failure.* Two auditors using different covers reach the same audit findings iff their Čech complexes are quasi-isomorphic.
  Whether the practitioner-recognized phenomenon of "auditor judgment" reduces to choices that preserve quasi-isomorphism (and hence are operationally equivalent) or includes choices that genuinely change the cohomology (and hence are operationally substantive) is open.
- *Risk-based auditing as targeted refinement.* Risk-based audit standards prescribe finer covers in regions of high operational risk.
  Substrate-algebraically: refine $\{U_i\}$ to $\{U_i'\}$ with finer pieces in the operational sub-region where higher derived cohomology is expected.
  Whether this targeted refinement converges faster to the derived cohomology than uniform refinement is a comparison-of-spectral-sequences question — open and operationally important.
