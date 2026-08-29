---
id: duty
description: "A Duty is a five-tuple (a, p, N, φ, r) — a bearer a, positional grounding p, normative system N, required act φ, and correlative party r — satisfying seven invariants including correlativity, positional derivation, categorical force, and discharge via nuclear fixed-point."
defines: Duty
related: Office, NormativeSystem, DutyOfficer, Captain, Norm, HohfeldianPosition, Contract, Promise, Authority
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  bearer: person
  position: office
  normative-system: normative-system
  required-act: act
  correlative-party: person
output: relational-history-fiber-fixed-layer
ast:
  hohfeldian-first-quartet:
    - bearer:
        - position
        - normative-system
    - required-act:
        - relational-history-fiber-fixed-layer
    - correlative-party
---

# Duty

## Formal definition

A **Duty** is a five-tuple $D = (a, p, N, \varphi, r)$:

$$D = (a,\; p \in \mathrm{Pos},\; N,\; \varphi : T \to \{0,1\},\; r)$$

where: - $a$ is the **duty-bearer** — the agent who holds the duty - $p \in \mathrm{Pos}$ is the **position** grounding the duty — the office, role, or standing that generates it - $N$ is the **normative system** — the authority (law, regulation, custom, contract) that imposes the duty - $\varphi$ is the **required act or state** — the act whose performance discharges the duty; formally a predicate $\varphi : \mathrm{Acts}(a) \to \{0,1\}$ - $r$ is the **correlative party** — the entity whose claim $\varphi$ satisfies; $r$ may be an individual, an institution, or the class of all others

**Seven invariants.** $D$ is a duty if and only if it satisfies:

1. **Correlativity** (Hohfeld): every duty $D(a, \varphi, r)$ entails a claim $C(r, \varphi, a)$.
  If $a$ has a duty to $\varphi$ toward $r$, then $r$ has a claim against $a$ that $a$ shall $\varphi$.

2. **Consistency** (SDL axiom D): $\mathrm{O}(\varphi) \Rightarrow \neg\mathrm{O}(\neg\varphi)$.
  A duty cannot obligate both $\varphi$ and $\neg\varphi$ within the same normative system $N$.

3. **Positional derivation**: the duty derives from position $p$, not from the personal characteristics of bearer $a$.
  If $a' \in p$ (another agent holds the same position), the duty transfers: $D(a', p, N, \varphi, r)$ holds by the same normative system.

4. **Categorical force**: the duty holds independently of whether $\varphi$ serves $a$'s interest.
  It is not a hypothetical imperative $(\text{if you want } G, \text{ then } \varphi)$ but categorical $(\text{you shall } \varphi)$.

5. **Discharge condition**: duty $D$ is discharged when $\varphi$ is at the nuclear fixed point:

$$\mathrm{discharged}(D) \iff \sigma_t(\varphi(a)) = \varphi(a) \;\wedge\; \Delta_t(\varphi(a)) = \varphi(a)$$

The performance of $\varphi$ by $a$ at $t$ must be doubly-settled — both meaning-closed and execution-closed — to constitute discharge.
Performance that is routine ($\Delta_t$-settled) but not yet recognized ($\sigma_t$-unsettled) is incomplete discharge.

6. **Non-delegability**: the duty $D(a, p, N, \varphi, r)$ cannot be transferred to another bearer while $a$ holds position $p$. $a$ may authorize another agent $a'$ to perform acts that contribute to $\varphi$, but accountability for $\varphi$ remains with $a$.
  The required act $\varphi$ is not itself delegable unless $N$ explicitly permits substitution.

7. **Relational predicate**: duty is a three-place relation $\mathbf{D}(a, \varphi, r)$ in the normative system $N$.
  This distinguishes duty from mere obligation-to-act: a duty is always a duty *to* someone.

## The Hohfeldian position

Duty occupies one of four Hohfeldian fundamental legal positions:

| Position | Relational form | Correlative |
|---|---|---|
| **Duty** | $\mathbf{D}(a, \varphi, r)$ | Claim: $\mathbf{C}(r, \varphi, a)$ |
| Privilege | $\neg\mathbf{D}(a, \neg\varphi, r)$ | No-claim: $\neg\mathbf{C}(r, \neg\varphi, a)$ |
| Power | $\mathbf{P}(a, R \to R', r)$ | Liability: $\mathbf{L}(r, R \to R', a)$ |
| Immunity | $\neg\mathbf{P}(r, R \to R', a)$ | Disability: $\neg\mathbf{P}(r, R \to R', a)$ |

A duty is not a power (which creates new normative relations) and not a privilege (which is the absence of a duty).
The correlative of a duty is always a claim held by $r$ against $a$.

## Standard Deontic Logic reading

In SDL, the duty $D(a, \varphi, r)$ is expressed as $\mathrm{O}_a(\varphi)$: it is obligatory for $a$ to bring about $\varphi$.

The consistency axiom D: $\mathrm{O}(\varphi) \Rightarrow \mathrm{P}(\varphi)$ (obligation implies permission), equivalently $\mathrm{O}(\varphi) \Rightarrow \neg\mathrm{O}(\neg\varphi)$.

The transmission principle: if $\mathrm{O}(\varphi)$ and $\varphi \Rightarrow \psi$, then $\mathrm{O}(\psi)$ — obligation transmits along entailment.

## Discharge and the nuclear fixed-point

The discharge condition (invariant 5) uses the nuclei $\sigma_t$ and $\Delta_t$ of the fiber $H_t$ at the current history $t$:

- $\Delta_t(\varphi(a)) = \varphi(a)$: the performance of $\varphi$ is **execution-settled** — the procedure for counting it as performance is fixed and has been followed
- $\sigma_t(\varphi(a)) = \varphi(a)$: the performance is **meaning-settled** — the act is recognized by $N$ and by $r$ as constituting discharge

Both must hold.
A duty can be executed but unrecognized (execution-settled, meaning-open), or recognized in principle but not yet executed (meaning-settled, execution-open).
Full discharge requires $\varphi(a) \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

## Duty and position

The positional derivation invariant (3) gives the relation between duty and [Office](office.md):

$$p \vdash D \iff N \models \mathbf{D}(\mathrm{holder}(p), \varphi, r)$$

The position $p$ is the source of $D$.
When the holder changes — when $a$ is succeeded by $a'$ — the duty $D$ transfers to $a'$.
The duty outlasts any particular bearer; it attaches to the position, not the person.

Duties from offices are categorically different from personal obligations: personal obligations dissolve with the person, positional duties transfer.

## Duty and Norm

A duty is the instantiation of a [Norm](norm.md) at a specific bearer $a$ and correlative $r$.
The [Norm](norm.md) triple $(\varphi, O, N)$ — propositional content, deontic operator, normative system — is the general form; a duty is that triple indexed to $a$ and $r$:

$$D(a, p, N, \varphi, r) = \mathrm{Norm}(\varphi, \mathrm{O}, N)\;\text{applied to}\;(a, p, r)$$

The deontic operator $O$ in the [Norm](norm.md) spec is the `obligation-modality` opcode — the same opcode that appears in this spec's AST under `required-act`.
The distinction between Norm (the general deontic proposition) and Duty (the position-indexed instance) mirrors the distinction between a type and a term: the Norm is the type; the Duty $(a, p, N, \varphi, r)$ is a term of that type, with bearer and correlative filled in.

The [HohfeldianPosition](hohfeldian-position.md) spec places Duty in the first quartet: Duty is the jural correlative of Claim-Right.
The `hohfeldian-jural-correlative` opcode in the AST above names this correlative relation explicitly — whenever a duty $D(a, \varphi, r)$ holds, a claim $C(r, \varphi, a)$ holds in the same [NormativeSystem](normative-system.md), by the jural correlativity axiom.

## Open questions

- Whether the discharge condition must require $\varphi(a) \in H^*_t$ or whether $\Delta_t$-settlement alone constitutes sufficient discharge in legal contexts (execution without recognition).
- Whether a [NormativeSystem](normative-system.md) can generate contradictory duties and, if so, what the resolution operator is — whether the nuclear quartet provides a natural conflict-resolution structure (the [Norm](norm.md) spec's `consistency-predicate` opcode names this requirement formally without resolving it).
- Whether [Contract](contract.md)'s bilateral norm-binding $(P_1, P_2, \Phi_{12}, \Phi_{21}, V)$ is exactly a pair of duties — $D(P_1, \cdot, N_\mathrm{contract}, \Phi_{12}, P_2)$ and $D(P_2, \cdot, N_\mathrm{contract}, \Phi_{21}, P_1)$ — or whether the exchange structure $(\Phi_{12}, \Phi_{21})$ adds something that two bare duties do not contain (consideration, simultaneity of commitment).
