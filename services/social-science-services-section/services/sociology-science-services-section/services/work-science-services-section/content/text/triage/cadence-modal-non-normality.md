---
type: theorem
status: sketch
depends-on: [cadence-as-modal-frame, recurrent-practice, modal-non-normality, modal-necessity-operator, twist-product-right-residual, four-bilattice]
realizes: [recurrence, cadence, commitment]
---

# Forward commitments do not propagate through cadence frames by implication

The [cadence-as-modal-frame](teaching/explanations/cadence-as-modal-frame.md) view supplies $\Box_{R^{\mathrm{cad}}}$ and $\Diamond_{R^{\mathrm{cad}}}$ as bilattice modal operators on a [recurrent practice](../objects/recurrent-practice.md). Because those operators are the predication-categories' [bilattice modal necessity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) instantiated on $R^{\mathrm{cad}}$, the [modal non-normality theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md) transfers verbatim. The K-axiom

$$\Box_{R^{\mathrm{cad}}}(\phi \to \psi) \to \bigl(\Box_{R^{\mathrm{cad}}}\phi \to \Box_{R^{\mathrm{cad}}}\psi\bigr)$$

does **not** in general settle to $\mathbf{t}$ on $R^{\mathrm{cad}}$. The operational reading is sharp and substantive: forward standing-policy commitments do not propagate through implication-bearing rules in the closure-rule subsystem $\mathcal S_R$ of the practice. A working community that has settled "$\phi$ at every upcoming cycle" and that has settled "in every cycle, $\phi \to \psi$" has *not* thereby settled "$\psi$ at every upcoming cycle." Each cycle must commit to $\psi$ on its own.

## Statement

**Theorem.** *Let $R = (\mathcal S_R, T_R, \alpha_R)$ be a recurrent practice with cadence frame $R^{\mathrm{cad}}$ on the [operations settling](../objects/operations-settling.md). For some choice of cells $\phi, \psi \in \Phi_{\mathrm{op}}$ and some valuation $v^{\mathrm{op}}$ that settles $\Box_{R^{\mathrm{cad}}}\phi = \mathbf t$ and $\Box_{R^{\mathrm{cad}}}(\phi \to \psi) = \mathbf t$, the K-axiom evaluates to $\bot$, not to $\mathbf t$ or $\top$. Equivalently: forward $\Box_{R^{\mathrm{cad}}}$-commitment is not closed under detachment under implication evaluated cycle-locally.*

## Proof

Direct instantiation of [modal-non-normality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md) at the cadence frame. Take a single-cycle horizon ($h_R = 0$) and a single accessible stage $\sigma_0$ with $R^{\mathrm{cad}}(\sigma_0, \sigma_0) = \bot$ — the *uncommitted* cadence-edge: the practice's own rules do not yet warrant the cadence link with positive evidence. Set $u^\phi_{\sigma_0} = \bot$ (the antecedent's cell is uncontested but unsettled at the accessible stage) and $u^\psi_{\sigma_0} = \mathbf f$ (the consequent's cell carries a negative witness at that stage).

Per the [twist-product right residual](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md), $\bot \to \mathbf f = \bot$, so $u^{\phi \to \psi}_{\sigma_0} = \bot$. Then $\Box_{R^{\mathrm{cad}}}\phi = \bot \to \bot = \mathbf t$, $\Box_{R^{\mathrm{cad}}}(\phi \to \psi) = \bot \to \bot = \mathbf t$, and $\Box_{R^{\mathrm{cad}}}\psi = \bot \to \mathbf f = \bot$. The K-axiom evaluates to $\mathbf t \to \bot = \bot$. $\square$

## What this earns operationally

Three concrete consequences for the design and reading of recurrent practices.

1. **Standing-policy implication is not standing-policy detachment.** A weekly review that has standing-committed to "review every PR" and standing-committed to "every PR review implies a triage update" has *not* thereby standing-committed to "produce a triage update every cycle." The triage update must be its own forward commitment, settled in $\mathcal S_R$ by its own rule. This formalizes the practice-design intuition that *derived* obligations across cycles must be *explicitly* re-committed; relying on cycle-local implication to discharge a forward obligation is a structural error, not a discipline failure.

2. **Implication-bearing rules in $\mathcal S_R$ have purely cycle-local force.** Closure rules of the form $\phi \to \psi$ in $\mathcal S_R$ fire *within* a cycle on the witnesses present in that cycle. They do not export their force to neighboring cycles. The cadence frame's modal structure — $\Box$ as cross-cycle quantification — does not commute with the cycle-local $\to$. This is why audit-replays of past cycles produce different $\psi$-states across cycles even when $\phi$ and $\phi \to \psi$ both hold uniformly: the consequent fires per-cycle, not as a frame-theoretic theorem.

3. **Calendar-locked deliverables require frame-level commitment, not implication-chains.** A recurrent practice cannot establish "every upcoming cycle ships X" by chaining "every upcoming cycle does Y" with "Y implies shipping X." The shipping commitment must enter $\mathcal S_R$ as a $\Box$-asserted antecedent of the practice's own settlement rules. Practices that try to derive forward deliverables by cycle-local implication exhibit measurable cycle-to-cycle delivery variance — the cohomological signature is a non-zero $H^0$ on the residual $(\Box \phi \wedge \Box(\phi \to \psi)) \setminus \Box\psi$ shadow sheaf.

## Relation to the K-axiom-failing fragment

The bilattice modal logic $\mathrm{NM}^{\mathrm{B}}$ ([modal-non-normality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md)) is a paraconsistent non-normal modal logic. The cadence frame inherits this fragment. Predicated-work commitments expressed in the K-axiom-failing fragment of $\mathrm{NM}^{\mathrm{B}}$ are precisely those that **cannot** be discharged by cycle-local implication; the surviving (non-K) modal axioms — necessitation of $\mathbf t$, monotonicity in the conclusion, conjunction of necessities — are the axioms a recurrent practice's commitments *do* satisfy.

This is why the practice-design discipline of the substrate ship's [agential-orchestration-platform](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/_index.md) treats forward commitments as first-class closure-rule entries (`commits-to-in-cycle`, `recurrent-deliverable`) rather than derived facts. The math forces this design choice; it is not a stylistic preference.

## Relation to existing pieces

- [cadence-as-modal-frame](teaching/explanations/cadence-as-modal-frame.md) supplies the modal operators this theorem analyzes; this theorem identifies which modal axioms those operators do *not* satisfy and reads the failure operationally.
- [regime-of-recurrent-practice](./regime-of-recurrent-practice.md) classifies practices by closure ordinal; this theorem is regime-independent — K fails uniformly across the four regimes because it is a property of the modal operator's algebra on $\mathbf{FOUR}$, not of the closure dynamics.
- [aim-generativity-iff-aperiodic](./aim-generativity-iff-aperiodic.md) gives the cohomological condition for aim-generative practices; the K-axiom failure here is structurally upstream of that — it constrains *any* recurrent practice's commitment vocabulary, not only the aperiodic ones.
