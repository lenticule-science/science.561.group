---
type: theorem
status: sketch
depends-on: [leitourgia, bigraded-settling-cohomology, recognition-as-bigraded-common-knowledge, office-as-double-settlement, settling-quiescence]
---

# Leitourgia full discharge is bigraded settlement of two independent predicates

The [leitourgia](../objects/leitourgia.md) $\Lambda = (\lambda, \varphi, C, \iota)$ achieves full discharge if and only if both the form-enactment predicate $\mathrm{fe}(\Lambda)$ and the forward-stability predicate $\mathrm{fs}(\Lambda)$ have settled affirmingly — and the two predicates are *independent* in the bigraded settling cohomology.

## Claim

**Full discharge iff bigraded affirming settlement.** $\Lambda$ is fully discharged at settling stage $\tau^*$ iff:

$$v_{\tau^*}(\langle \iota, \texttt{form-enacted}\rangle) = \mathbf{t} \;\wedge\; v_{\tau^*}(\langle \iota, \texttt{forward-stable}\rangle) = \mathbf{t}$$

**Independence.** The two predicate cells live in distinct components of the [bigraded-settling-cohomology](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bigraded-settling-cohomology.md):

- $\mathrm{fe}(\Lambda)$ is a backward predicate: its content accumulates from past witnessing increments under the knowledge order $\leq_k$. It is a generator in $H^0_{\mathrm{bkd}}$ — the zero-cohomology class of backward-directed settling.
- $\mathrm{fs}(\Lambda)$ is a forward predicate: its content is fixed by forward-stability closure rules that fire when the form-enactment predicate settles and propagate the discharge into continuations. It is a generator in $H^0_{\mathrm{fwd}}$ — the zero-cohomology class of forward-directed settling.

The two classes are independent: no closure rule derives one directly from the other; form-enactment settlement *triggers* the forward-stability rule (making it fire), but the forward-stability predicate's content is on a different fiber from the form-enactment predicate's content.

## Sketch

**Bigraded structure.** The bigraded settling cohomology separates the settling's content into backward-accumulating evidence (past witnesses settling cells upward) and forward-propagating obligations (closure rules that fire to carry content into continuations). The leitourgia's two predicates sit one on each axis: $\mathrm{fe}(\Lambda)$ is evidence of the past enactment; $\mathrm{fs}(\Lambda)$ is the obligation-propagation that the discharge carries forward.

**Full discharge as meet.** By the [frobenius-for-knowledge-and-truth-meets](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/frobenius-for-knowledge-and-truth-meets.md) theorem, the truth-order meet $\bigwedge^{(t)}$ of bigraded settling classes is well-defined. Full discharge corresponds to the meet of the two classes being in the designated region ($= \mathbf{t}$ in both components). The meet structure makes full discharge a conjunction, not a disjunction or a sequential dependency.

**Independence.** The form-enactment rule fires on witnessing increments from the gathering community. The forward-stability rule fires on the form-enactment cell's settling. These are two distinct rules in $\mathcal{S}_\varphi$; neither is derivable from the other in the base closure-rule language. The cells they settle are in different fibers: $\langle \iota, \texttt{form-enacted}\rangle$ is in the evidence fiber; $\langle \iota, \texttt{forward-stable}\rangle$ is in the obligation fiber. Independence in cohomology follows from the absence of any cross-fiber rule that would derive one from the other without the triggering step.

## Corollary — partial discharge is not full discharge

The anomalous state "forward-stable only" ($\mathrm{fs}(\Lambda) = \mathbf{t}$, $\mathrm{fe}(\Lambda) = \bot$) is structurally impossible under the rule ordering: the forward-stability rule has $\mathrm{fe}(\Lambda) = \mathbf{t}$ as antecedent. A settling in which forward-stability has fired without form-enactment having fired would require either a rule-ordering violation (impossible in the least-fixed-point construction) or an external increment directly asserting $\mathrm{fs}(\Lambda) = \mathbf{t}$ without the form-enactment trigger — which would be a normative anomaly requiring repair.

## Corollary — parallel with office incumbency

The office-as-double-settlement object requires recognition (backward) and induction (forward) to both settle at $\mathbf{t}$ for full incumbency. The leitourgia requires form-enactment (backward) and forward-stability (forward) to both settle at $\mathbf{t}$ for full discharge. The structural parallel is exact: both are bigraded settlement conditions with one backward and one forward predicate. The difference is the temporal direction of the obligation: office incumbency is a forward-looking obligation taken on; leitourgia discharge is a backward-accumulating recognition of past performance plus its forward propagation.
