---
type: theorem
class: engineering-claim
status: proved
depends-on: [authentication-method, authentication-flow, session-establishment, authentication-as-modal-restriction, bilattice-accessibility-relation, twist-product, twist-product-fusion, twist-product-residuation, four-bilattice, knowledge-order, truth-order, paraconsistency-as-substrate-discipline]
see-also: [authentication-as-modal-restriction, governance-as-modal-restriction, federation-trust-bilattice-graded, capability-non-amplification]
---

# Multi-factor authentication is twist-product fusion of per-factor accessibility cells

**Claim.** Let $a$ be an [account](teaching/explanations/account.md) and $u$ a user-agent presenting $n$ authentication factors $m_1, \dots, m_n$ (each an [authentication-method](teaching/explanations/authentication-method.md)) through a coordinated [authentication-flow](teaching/explanations/authentication-flow.md). Let $r_i := R_i(w_a, w_u) \in \mathbf{L}^\bowtie$ be the per-factor [bilattice accessibility cell](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) that factor $m_i$ alone would induce on the substrate's accessibility relation between $w_a$ and $w_u$, computed per [authentication-as-modal-restriction](authentication-as-modal-restriction.md).

The combined accessibility cell that the multi-factor flow installs is the [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md):

$$R_{\mathrm{MFA}}(w_a, w_u) \;=\; r_1 \odot r_2 \odot \cdots \odot r_n.$$

Per [twist-product-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), $\odot$ is associative and commutative on $\mathbf{L}^\bowtie$ with unit $\langle 1, 1 \rangle$, so the order of factor presentation is immaterial and adding a no-op factor (the unit) leaves the verdict unchanged. The session capability supplied to [authentication-as-modal-restriction](authentication-as-modal-restriction.md) under MFA is then $(\Box_{R_{\mathrm{MFA}}} u_a)_{w_u}$ — the modal restriction along the *fused* accessibility cell.

## Why this holds

Each authentication factor produces, structurally, an accessibility verdict at the cell $(w_a, w_u)$: a public-key signature pushes that cell toward $\mathbf{t}$, a TOTP code pushes it toward $\mathbf{t}$ on a different evidential coordinate, an out-of-band SMS pushes weakly. Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), the substrate's value-domain at any cell is bilattice-valued; per the [twist-product](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md), each value carries an *affirming* coordinate $a_i$ and a *denying* coordinate $b_i$, and a verdict on a factor is a $\langle a_i, b_i \rangle \in \mathbf{L}^\bowtie$.

Combining factors must be the substrate's *standard* binary operation that:

1. *Multiplies* affirming evidence — two independent affirming signals are stronger than either alone, but bounded above by what the underlying residuated lattice $\mathbf{L}$ supports;
2. *Cross-tests* each factor's affirming evidence against the other's denying evidence — a factor that denies kills the joint verdict in proportion to how strongly any other factor was about to affirm;
3. Has $\langle 1, 1 \rangle$ as a unit — the "no factor was presented" cell does not affect the joint verdict.

This is exactly the [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md):

$$\langle a_1, b_1 \rangle \odot \langle a_2, b_2 \rangle = \langle a_1 \cdot a_2,\ (a_1 \to b_2) \wedge (a_2 \to b_1) \rangle.$$

The first coordinate's monoid product captures (1); the cross-residuation in the second coordinate captures (2); the integral unit captures (3). Per [twist-product-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), $\odot$ is commutative and associative, so neither factor order nor parenthesization is content. Per the same theorem, the residual $\Rightarrow$ supplies the structural contract for *step-up*: the strongest accessibility-cell that, fused with the current factors' product, would yield the required clearance.

The substrate's MFA admission is therefore not an ad-hoc "all factors must succeed" Boolean; it is a $\odot$-fold over the bilattice-valued per-factor accessibility cells. The single-factor case ($n = 1$) reduces to [authentication-as-modal-restriction](authentication-as-modal-restriction.md) with $R_{\mathrm{MFA}} = R_1$.

## $\mathbf{FOUR}$-projection: the engineer-facing summary

Projecting through the unique bilattice homomorphism to [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), $\odot$ acts on the four corners as follows (computed from the definition with $\mathbf{t} = \langle 1, 0 \rangle$, $\mathbf{f} = \langle 0, 1 \rangle$, $\bot = \langle 0, 0 \rangle$, $\top = \langle 1, 1 \rangle$):

| $r_1 \backslash r_2$ | $\mathbf{t}$ | $\mathbf{f}$ | $\bot$ | $\top$ |
|---|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{f}$ | $\bot$ | $\top$ |
| $\mathbf{f}$ | $\mathbf{f}$ | $\mathbf{f}$ | $\mathbf{f}$ | $\mathbf{f}$ |
| $\bot$ | $\bot$ | $\mathbf{f}$ | $\bot$ | $\bot$ |
| $\top$ | $\top$ | $\mathbf{f}$ | $\bot$ | $\top$ |

Reading the row/column for $\mathbf{f}$: a single factor with verdict $\mathbf{f}$ (positively-denied — wrong password, expired token, revoked key) drives the joint verdict to $\mathbf{f}$ regardless of the other factors. *$\mathbf{f}$ is absorbing under $\odot$.* This is the structural justification for the operational rule "any factor failing rejects the whole flow" — it is not a policy choice; it is the bilattice's behavior.

Reading the row/column for $\bot$: a missing or unevaluated factor (the user did not present TOTP) leaves the joint verdict at $\bot$ unless another factor supplies $\mathbf{f}$. The flow remains *unauthenticated* rather than *denied* — and per [authentication-as-modal-restriction](authentication-as-modal-restriction.md), $\Box_R$ at $\bot$ admits no positive capability.

Reading the diagonal at $\top$: a factor whose verdict is contradictory (signature verifies *and* the same key is on a known-revocation list) propagates $\top$ — the substrate carries the contradiction forward to [authentication-as-modal-restriction](authentication-as-modal-restriction.md), which surfaces it rather than silently coercing to $\mathbf{t}$ or $\mathbf{f}$.

## Engineering consequence

- **Factor-failure absorption is structural.** The "any-factor-fails-rejects" discipline is the absorbing property of $\mathbf{f}$ under $\odot$, not a separately-engineered policy. A substrate that admits MFA on $n - 1$ factors when one factor returned $\mathbf{f}$ is not implementing $\odot$.
- **Factor order and grouping are immaterial.** Commutativity and associativity of $\odot$ make presentation order, parenthesization, and "primary vs. secondary factor" irrelevant to the verdict. Per [twist-product-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), this is a theorem about $\mathbf{L}^\bowtie$, not an MFA convention.
- **Step-up has an algebraic specification.** Per [twist-product-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), the residual $\Rightarrow$ on $\mathbf{L}^\bowtie$ characterizes for any candidate additional factor cell $x$ the relation between $x \odot r_{\mathrm{current}}$ and a target cell. The substrate's step-up discipline per [authentication-flow](teaching/explanations/authentication-flow.md) is the iterative one: the substrate requests an additional factor, evaluates the candidate $x$, and tests whether $x \odot r_{\mathrm{current}}$ has reached the required clearance via the substrate's standard $\leq_t$ comparison. Per [twist-product-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), this comparison reduces to a residual-form check on $x$ alone, removing one level of $\odot$-evaluation per step. The engineer-facing "what factor strength suffices" is then a residual-form predicate on the candidate factor, computed in the same fiber-algebra as the rest of the substrate's authorization machinery — not a capability table.
- **Independent factors compose monotonically in $\leq_t$, but not in $\leq_k$.** Per [twist-product-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), $\odot$ is monotone in both arguments under the [truth order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) but is not monotone in the [knowledge order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md): adding a factor that supplies more *information* (raises $\leq_k$) can lower the joint $\leq_t$ value if the new information is denying. This is the substrate-side reason MFA strengthens authentication on average but can also surface revocation that single-factor flows miss.
- **Factor-strength grading is the residuated lattice's grade.** A "weak" factor (SMS) with affirming-coordinate $a_i \in \mathbf{L}$ strictly below $1$ multiplies into the joint verdict at $a_i \cdot \prod_{j \neq i} a_j$, which is bounded above by $\prod_{j \neq i} a_j$. Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), the substrate already carries graded accessibility; MFA grades compose with it via $\odot$.
- **Step-down is forbidden by structure.** Once $r_i = \mathbf{f}$ enters the fold, $\mathbf{f}$'s absorbing property under $\odot$ means no later $r_j$ can pull the joint verdict back. The substrate cannot legally implement "MFA but the third factor's success retroactively forgives the first factor's failure" — $\odot$ does not afford it.
- **Per-factor revocation is local.** Revoking factor $m_i$ (per [authentication-method](teaching/explanations/authentication-method.md)'s rotation discipline) collapses $r_i$ to $\mathbf{f}$ on the next evaluation, which collapses the joint $R_{\mathrm{MFA}}$ to $\mathbf{f}$, which collapses the session per [authentication-as-modal-restriction](authentication-as-modal-restriction.md). No separate "MFA-aware revocation" code path is needed.

## What the theorem rules out

- **Boolean MFA.** A substrate computing the joint verdict as the Boolean conjunction $\bigwedge_i \mathbf{1}[r_i = \mathbf{t}]$ is collapsing $\mathbf{L}^\bowtie$ to $\{0, 1\}$ along an *information-discarding* projection. Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), the substrate must not silently coerce $\bot$ to $\mathbf{f}$ or $\top$ to $\mathbf{t}$. A $\bot$ factor (TOTP not yet entered) is not the same as an $\mathbf{f}$ factor (TOTP entered wrongly); the Boolean conjunction loses that distinction; $\odot$ preserves it.
- **MFA over cells the account does not bind.** Each per-factor accessibility cell $r_i$ must reference a factor the [authentication-method](teaching/explanations/authentication-method.md) records bind to *the same account*. Fusing factors from different accounts is a category error in the predication hyperdoctrine — the cells live on different fibers and cannot be combined under $\odot$.
- **Hidden weakening.** A substrate that admits a session at higher capability than $(\Box_{R_{\mathrm{MFA}}} u_a)_{w_u}$ supports — for instance, treating MFA as automatically granting administrator capability — bypasses both this theorem and [authentication-as-modal-restriction](authentication-as-modal-restriction.md). Per [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md), the modal restriction is a structural ceiling.

## What the theorem requires

- The substrate's [authentication-method-record](../objects/authentication-method-record.md) records a per-method affirming coordinate $a_i \in \mathbf{L}$ — the method's intrinsic strength on the substrate's residuated lattice.
- Per [authentication-flow](teaching/explanations/authentication-flow.md), each factor's verification produces a $\mathbf{L}^\bowtie$-valued cell, not a Boolean.
- The substrate's [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) is updated by $\odot$-fold over per-factor cells before [authentication-as-modal-restriction](authentication-as-modal-restriction.md) computes the session's $\Box_R$ value.

## Position

This theorem extends [authentication-as-modal-restriction](authentication-as-modal-restriction.md) from single-factor to multi-factor: the modal restriction is unchanged; the accessibility cell it restricts along is now the $\odot$-fold of per-factor cells. Together with [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md) (graded accessibility across federation), [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md) (governance is modal restriction on the agent), and [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md) (call-graph non-amplification), it completes the substrate's *compositional* account of authorization: factors compose by $\odot$, cells restrict by $\Box_R$, governance composes by modal-restriction stacking, capabilities pass without amplification. Each axis is one operation on $\mathbf{L}^\bowtie$ rather than four engineered subsystems.
