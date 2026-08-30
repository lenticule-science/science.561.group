---
id: discharge
description: "A Discharge is a triple (d, a, t) — a duty d, a performance act a by the duty-bearer, and a history t at which the performance settles at the nuclear fixed point H*_t. The defining structure: discharge is not merely performance — it is recognized performance; the act must be both execution-settled (Δ_t) and meaning-settled (σ_t) to count as discharge."
defines: Discharge
related: Duty, Office, Officium, Clerk, DutyOfficer
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  duty: duty
  performance-act: relational-universe
  settling-history: relational-history
output: relational-history-fiber-fixed-layer
ast:
  relational-history-saturating-nucleus:
    - duty:
        - performance-act
    - relational-history-transferring-nucleus:
        - duty
        - performance-act
        - settling-history
---

# Discharge

## Formal definition

A **Discharge** is a triple $\mathcal{D} = (d, a, t)$:

$$\mathcal{D} = (d : \mathrm{Duty},\; a : \mathrm{Act},\; t \in T)$$

satisfying the discharge condition:

$$\mathrm{discharged}(d, a, t) \iff \sigma_t(a) = a \;\wedge\; \Delta_t(a) = a \iff a \in H^*_t$$

where $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is the doubly-quiescent stable sublattice at history $t$.

**Components:**
- $d$ is the **duty** being discharged — a [Duty](./duty.md) $(a_{\mathrm{bearer}}, p, N, \varphi, r)$ specifying what must be done
- $a$ is the **performance act** — the act performed by $d$'s bearer in satisfaction of $\varphi$
- $t \in T$ is the **settling history** — the point in the history at which discharge is evaluated; the performance must settle at $t$

**Three invariants.** $\mathcal{D}$ is a discharge iff it satisfies:

1. **Execution settlement**: $\Delta_t(a) = a$. The act has been performed according to fixed procedure — the execution path is complete, the required steps have been taken, the act is procedurally finished. Without this, the duty is not yet performed.

2. **Meaning settlement**: $\sigma_t(a) = a$. The performance is recognized by the governing normative system $N$ and by the correlative party $r$ as constituting satisfaction of $\varphi$. Without this, the act may have been performed but is not yet acknowledged as discharge. A payment that the creditor does not recognize as payment is not discharge; a filing the court does not record is not discharge.

3. **Joint settlement**: both 1 and 2 must hold simultaneously. $a \in H^*_t$. This is why discharge requires the fixed point of both nuclei — a duty can be:
   - **Executed but unrecognized** ($\Delta_t(a) = a$, $\sigma_t(a) \neq a$): the act was done but not acknowledged — procedurally complete, semantically open
   - **Acknowledged but unexecuted** ($\sigma_t(a) \neq a$, $\Delta_t(a) = a$ — this case doesn't arise cleanly; acknowledgement of an unperformed act is not discharge)
   - **Fully discharged** ($a \in H^*_t$): both settled simultaneously

## The execution/recognition gap

The gap between execution settlement and meaning settlement is the most practically significant feature of discharge. Consider:

| Scenario | $\Delta_t(a) = a$? | $\sigma_t(a) = a$? | Discharged? |
|---|---|---|---|
| Act performed and recognized | Yes | Yes | Yes |
| Act performed, recognition pending | Yes | No | No |
| Act performed, recognition refused | Yes | No | No — dispute arises |
| Act not performed | No | — | No |

The execution/recognition gap creates the space for duty-discharge disputes: the bearer claims $a \in H^*_t$; the correlative party claims $\sigma_t(a) \neq a$ (the performance does not satisfy $\varphi$). The resolution requires the governing normative system $N$ to adjudicate — applying $\sigma_t$ to determine whether the act counts.

## Discharge vs. satisfaction vs. performance

These three terms are commonly conflated but are formally distinct:

- **Performance**: the bearer does act $a$ — the execution, regardless of recognition
- **Satisfaction**: the correlative party $r$ accepts $a$ as meeting their claim — the recognition, regardless of whether $a$ was formally performed
- **Discharge**: $a \in H^*_t$ — both execution-settled and meaning-settled; the duty is legally/normatively extinguished

Discharge is the strongest condition: it requires both performance and satisfaction to be simultaneously settled. A payment satisfies the creditor (recognition) and discharges the debt (joint settlement) simultaneously. A substitute performance satisfies only if the normative system $N$ accepts substitution ($\sigma_t$ maps the substitute act to the same fixed point as the specified act).

## Discharge by operation of law

In some cases, discharge occurs without performance: statute of limitations, frustration of contract, impossibility, merger. These are meaning-closures ($\sigma_t$) applied to the duty itself rather than to a performance act — the duty is moved to its settled state by the system's recognition that it no longer applies, not by the bearer's act.

Formally: $\sigma_t(d) = d^*$ where $d^* \in H^*_t$ is the discharged state of the duty, achieved without a corresponding performance act $a$. This is the exceptional case: discharge is normally $(d, a, t)$ with a non-trivial performance; discharge by operation of law is the degenerate case where $a = \varnothing$ and $\sigma_t$ acts directly on $d$.

## Relation to the nuclear quartet

The discharge condition $a \in H^*_t$ places the performance in the [Process](./process.md) position of the nuclear quartet — the doubly-closed position where both meaning and execution are settled. An unperformed duty corresponds to the [Inquiry](./inquiry.md) position (neither closed); a procedurally specified but unexecuted duty corresponds to [Procedure](./procedure.md) (meaning-closed only); a performed but unrecognized act corresponds to [Derivation](./derivation.md) (execution-closed only).

## Open questions

- Whether partial discharge is coherent — whether a divisible duty can be partially discharged by partial performance, and what the formal condition for partial discharge is.
- Whether the meaning-settlement condition $\sigma_t(a) = a$ is sufficient when $N$ is contested — whether discharge requires recognition by a specific party (the correlative $r$) or by the normative system $N$ more generally.
- The formal relationship between discharge and the [Clerk](./clerk.md)'s authentication function $A$ — whether the clerk's entry of a judgment is the $\sigma_t$ operation that converts an executed judicial decision into a discharged legal obligation.
