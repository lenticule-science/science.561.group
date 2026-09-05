---
id: ratification
description: "A Ratification is a triple (O, a, ρ) — an authorizing office O, an act a performed without O's prior authorization, and a ratification declaration ρ by which O retrospectively settles a's propositional content into H*_{t*}. The defining structure: ratification applies σ_{t*} ex post facto to a proposition φ ∈ H_{t*} \ H*_{t*} — the act's content was not settled at the time of performance but becomes settled by the ratification declaration. The act a is then treated as having been authorized from the moment of performance: the Hohfeldian liability that attached to the unauthorized actor dissolves, and the obligations created by the act become binding on O. Formally: a nucleus application σ_{t*}(φ) = φ triggered not by the performance of a but by O's subsequent declaration."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  office: office
  unauthorized-act: act
  ratification-declaration: relational-history-restriction-map
output: relational-history-fiber-fixed-layer
ast:
  retrospective-nucleus:
    - ratification-declaration:
        - office
        - unauthorized-act
    - unauthorized-act:
        - office
---

# Ratification

## Formal definition

A **Ratification** is a triple $\mathcal{Q} = (O, a, \varrho)$:

$$\mathcal{Q} = (O : \mathrm{Office},\; a : \mathrm{Act},\; \varrho : \mathrm{Declaration})$$

where: - $O$ is the **authorizing office** — the office that holds (or has held) the Hohfeldian power to authorize acts of the type performed by $a$; $O$'s authority over the domain $D(a)$ is the precondition for valid ratification - $a$ is the **unauthorized act** — an act performed by an agent $p$ within $O$'s domain $D(a)$ but without $O$'s prior authorization; $a$'s propositional content $\phi_a \in H_{t_a}$ was not in $H^*_{t_a}$ at the time of performance ($\sigma_{t_a}(\phi_a) \neq \phi_a$) - $\varrho$ is the **ratification declaration** — a speech act by $O$ (or by the holder of $O$) that settles $\phi_a$ retrospectively: after $\varrho$, $\sigma_{t^*}(\phi_a) = \phi_a$ and the act is treated as authorized from $t_a$

The ratification acts as a retrospective $\sigma_{t^*}$ application: $\phi_a$ moves from $H_{t_a} \setminus H^*_{t_a}$ (unsettled at the time of performance) into $H^*_{t^*}$ (settled as of the ratification moment $t^*$), and the history is adjusted so that $\phi_a$ is treated as having been in $H^*_{t_a}$.

**Four invariants.** $\mathcal{Q}$ is a valid ratification iff:

1. **Authority to ratify**: $O$ holds the power to authorize acts of the type performed by $a$.
  One cannot ratify what one could not have authorized: $O$ must have $\phi_a \in \mathrm{Dom}(\sigma_O)$ — the propositional content of $a$ is within $O$'s settling domain.
  An act performed entirely outside $O$'s authority cannot be ratified by $O$ (it would require ratification by whoever does have authority over $D(a)$).

2. **Full knowledge**: $\varrho$ must be made with full knowledge of the facts — $O$ must know what $a$ was and what it committed $O$ to before declaring ratification.
  Ratification without full knowledge is voidable: $O$ can withdraw it upon discovering material facts not known at the time of $\varrho$.
  This is the agency law principle: the principal must have known (or had constructive knowledge of) the material facts of the agent's unauthorized act before ratification is binding.

3. **Whole act ratification**: $O$ cannot ratify part of $a$ and reject the rest.
  If $a$ is a composite act (a contract, a decision, an instruction), $\varrho$ ratifies the whole.
  Partial ratification is not ratification — it is a new act modifying $a$.
  This is the Roman law rule: *ratihabitio mandato comparatur* (ratification is equivalent to a mandate) — a mandate must be complete.

4. **No intervening prejudice to third parties**: if a third party has acquired rights between $t_a$ (performance) and $t^*$ (ratification) that would be defeated by treating $a$ as authorized from $t_a$, ratification may not prejudice them.
  The retrospective effect of ratification does not reach back to defeat vested rights of innocent third parties.

## The retrospective nucleus

The core formal structure of ratification is the **retrospective nucleus application**: $\sigma_{t^*}$ is applied at the ratification moment $t^*$ to a proposition whose settlement was absent at the act moment $t_a$.
The result is treated as if settlement had occurred at $t_a$.

In the relational universe: - At $t_a$: $\phi_a \in H_{t_a} \setminus H^*_{t_a}$ — the act's content is present in the fiber but not settled; the act was performed but lacked authorization - $\varrho$ at $t^*$: $O$ applies $\sigma_{t^*}$ to $\phi_a$; the declaration satisfies the felicity conditions for $\sigma_{t^*}$-settlement - After $\varrho$: $\sigma_{t^*}(\phi_a) = \phi_a$ — the content is settled as of $t^*$; retrospectively, $\phi_a \in H^*_{t_a}$ by the institutional fiction that ratification creates

The retrospective effect is an institutional fiction: physically, the act occurred at $t_a$ without authorization; normatively, after $\varrho$, the system treats $t_a$ as if $\sigma_{t_a}(\phi_a) = \phi_a$ had held.
This is not a change to the history category $T$ (the physical sequence of events is fixed) but a change to the normative status assignments — the fiber values are reinterpreted.

## Agency law: the principal–agent foundation

Ratification is primarily an agency law concept.
The canonical formulation: *qui facit per alium facit per se* (he who acts through another acts through himself) is the forward direction; ratification is the retrospective form: an unauthorized act by an agent becomes the principal's own act upon ratification.

**Restatement (Third) of Agency, §4.01** (American Law Institute, 2006): > "Ratification is the affirmance of a prior act done by another, whereby the act is given effect as if done by an agent acting with actual authority."

**§4.01(2)**: A person ratifies an act by (a) manifesting assent that the act shall affect the person's legal relations, or (b) conduct that justifies a reasonable assumption of such assent.

**§4.02**: Ratification is effective notwithstanding that the act was done by a person acting without authority, by an agent who exceeded authority, or by a person acting as an agent for a nonexistent principal.

**§4.05 (No partial ratification)**: ratification of an act ratifies the entire act; a person may not ratify only the beneficial parts of an act.
This is invariant 3 in formal terms.

**§4.06 (Knowledge of material facts)**: ratification is not effective unless the ratifying party had knowledge of all material facts at the time of ratification, unless the ratifying party manifested affirmance despite not knowing material facts.
This is invariant 2.

## Historical ground: Roman law and English common law

**Roman law**: *ratihabitio mandato comparatur* (Dig.
46.3.12.4: ratification is equivalent to a mandate).
The principal who ratifies an unauthorized contract is bound as if they had originally authorized it.
The *actio exercitoria* ([Ship](ship.md)) is a ratification mechanism: the exercitor is bound by all contracts the magister made within the voyage scope, whether individually authorized or not — the scope of the voyage functions as a standing ratification of acts within it.

**English common law**: *Bolton Partners v.
Lambert*, (1889) 41 Ch.D.
295 — ratification can relate back to the time of the agent's unauthorized act, binding the principal from that earlier date.
The Court of Appeal held that once ratified, the act is as binding as if the principal had authorized it from the beginning.
This is the retrospective nucleus: the nucleus application at $t^*$ creates the institutional fiction that $H^*_{t_a}$ contained the act's content.

**Limits of retroactivity**: *Presentaciones Musicales SA v.
Secunda*, [1994] Ch 271 — ratification does not operate retroactively if it would prejudice the rights of third parties that arose between the unauthorized act and the ratification.
This is invariant 4: the third-party protection limit on retrospective nucleus application.

## Ratification vs. condonation vs. acquiescence

| Mechanism | Object | Declaration | Retrospective effect |
|---|---|---|---|
| Ratification | An unauthorized act | Explicit | Act treated as authorized from $t_a$ |
| Condonation | A breach or violation | May be implicit | Breach waived; not treated as un-breached |
| Acquiescence | A course of conduct | Implicit (by silence or non-objection) | Conduct treated as tolerated; no affirmative authorization |
| Estoppel | A representation | Not a separate declaration | Party prevented from denying what they represented |

Condonation applies to breaches of an existing obligation: the obligee forgives the breach but does not treat the breach as a non-breach.
In formal terms: condonation removes the remedial duty arising from the breach but does not retroactively settle $\phi_a$ into $H^*_{t_a}$ — the breach record remains; the remedial consequence is waived.

Acquiescence is weaker than ratification: it establishes toleration without affirmation.
An officer who fails to correct a subordinate's unauthorized act may be estopped from denying authorization but has not ratified the act as their own.

## Open questions

- Whether the retrospective nucleus application (treating $\phi_a$ as settled at $t_a$ after $\sigma_{t^*}$ applies at $t^*$) has a formal expression in the history category $T$: whether ratification is a morphism in $T$ that "backdates" the settlement, and whether this corresponds to a retraction of the restriction map $H(f) : H_{t^*} \to H_{t_a}$ — applying the settled value at $t^*$ back through the restriction to $t_a$.
- Whether invariant 4 (no prejudice to third parties) has a formal expression as a commutativity condition: whether ratification is valid iff the diagram $H_{t_a} \leftarrow H_{t^*} \to H_{t'}$ (where $t'$ is the history of third-party rights) commutes after $\sigma_{t^*}$ is applied — whether the retrospective settlement at $t_a$ is consistent with what happened at $t'$.
- Whether the *Bolton Partners* retroactivity principle and its exception (no prejudice to third parties) can be derived as theorems from the nucleus axioms: whether the retroactive settlement is always possible (as a nucleus idempotence consequence) but may be blocked by the requirement that the restriction maps preserve third-party settled content.
