---

title: "Role"
description: "A Role is a triple (Σ, N, ⪯) — a capability signature Σ specifying the minimum operations any bearer must provide, a norm-set N of role-indexed obligations and permissions that apply to any bearer, and a subsumption position ⪯ in the preorder of all roles ordered by signature inclusion. The defining structure: a role is a bearer-independent normative interface type — the deontic and capability profile that any agent must satisfy to count as filling it. Three projections of the same structure: a role as capability specification (Σ), as norm bundle (N), and as positional node in a role hierarchy (⪯). A role persists when vacant; its norms apply to any and every bearer; no role is constituted by its current occupant."
defines: Role
related: Agent, Officer, Office, Norm, HohfeldianPosition, NormativeSystem, Institution, Duty, Incumbent, CapabilitySignature
date-created: 2026-03-18
date-modified: 2026-03-20
---

## Formal definition

A **Role** is a triple $\mathfrak{R} = (\kappa_R, N_R, \iota_R)$:

$$\mathfrak{R} = (\kappa_R : \mathrm{CapabilitySignature},\; N_R : \mathrm{Set(Norm)},\; \iota_R : \mathrm{CapabilitySignature.SubsumptionMorphism})$$

where:
- $\kappa_R$ is the **capability signature** — a morphism $\kappa_R : \mathrm{ParamNames}_R \to \mathrm{Types}$ (see [CapabilitySignature](../../../../../../../../engineering/domains/tech/terms/capability-signature.md)) specifying the minimum typed interface any bearer of $R$ must provide; agent $a$ fills $R$ iff the satisfaction proposition $s_{a,\kappa_R} \in H^*_t$ — $a$ provides a doubly-settled value for every parameter in $\kappa_R$; in a rule-based system, $\kappa_R$ corresponds to the parameter block of the role's specification
- $N_R$ is the **norm-set** — the finite set of [Norm](./norm.md)s indexed to role $R$; obligations, permissions, and prohibitions that apply to any bearer of $R$ while they bear it; the norms are role-indexed, not agent-indexed: when $a$ fills $R$, all $n \in N_R$ are instantiated with $a$ as bearer; when $a$ vacates $R$, the norms deactivate for $a$ and activate for whatever new bearer fills $R$; role norms are positional, not personal
- $\iota_R$ is the **subsumption morphism set** — the set of subsumption morphisms $\iota : \kappa_{R'} \hookrightarrow \kappa_R$ (from any less specific role $R'$ into $R$) making $R$ a node in the category of capability signatures ordered by subsumption; $\iota : \kappa_{R'} \hookrightarrow \kappa_R$ exists iff $\mathrm{dom}(\kappa_{R'}) \subseteq \mathrm{dom}(\kappa_R)$ with matching types; filling $R$ entails filling every $R'$ for which such a morphism exists

**Four invariants.** $\mathfrak{R}$ is a role iff it satisfies:

1. **Bearer-independence**: $\mathfrak{R}$ exists independently of any current bearer. The role is constituted by $(\kappa_R, N_R, \iota_R)$, not by any agent currently filling it. An unoccupied role is still a role — its norms are dormant (not activated for any bearer) but the normative profile is fully defined. This is what distinguishes a role from a disposition or habit: habits depend on the specific individual having them; roles are defined by a position in a normative system that persists whether or not any individual currently occupies it.

2. **Signature completeness**: $\kappa_R$ is complete with respect to $N_R$ — every act referred to in any $n \in N_R$ is representable within $\mathrm{dom}(\kappa_R)$. A norm requiring performance of a parameter not declared in $\kappa_R$ would be normatively impossible to satisfy; no role can generate obligations without the corresponding capability declaration. Formally: for each $n \in N_R$ whose propositional content refers to a parameter $p$, the name $p$ must be in $\mathrm{dom}(\kappa_R)$.

3. **Subsumption coherence**: If $\iota : \kappa_{R_1} \hookrightarrow \kappa_R$ is a subsumption morphism, then for every $n_1 \in N_{R_1}$ there is a corresponding obligation entailment in $N_R$ — the more specific role carries all the obligations of the less specific role it subsumes, plus potentially more. More capable roles carry more or equal normative burden. This ensures that filling $R$ cannot evade the obligations of any $R_1$ for which a subsumption morphism into $R$ exists.

4. **Positional distinctness**: Two roles $R_1$ and $R_2$ in the same normative system are the same role iff $\kappa_{R_1} = \kappa_{R_2}$ (equal capability signatures as morphisms) and $N_{R_1} = N_{R_2}$. Different names for the same $(\kappa, N)$ pair are labels for the same role. This invariant rules out phantom roles — positional labels without distinct capability or normative content.

## Role vs. Office

The distinction between role and office runs through the entire normative ontology. Both describe positions an agent can occupy. The difference is constitutive depth.

A **Role** is a normative interface type: it specifies what you can and must do when you occupy it. Filling a role is capability-matching: you fill $R$ by operative satisfaction of $\kappa_R$ — i.e., $s_{a,\kappa_R} \in H^*_t$ — and acceptance of the norm-set $N_R$. No formal act is required to fill a role you are capable of filling; role-filling can be informal.

An **[Office](../../../terms/office.md)** is a formally invested deontic position: a full [HohfeldianPosition](../domains/hohfeldian/terms/hohfeldian-position.md) profile (powers, duties, privileges, immunities) transferred by a formal investiture act $I^+$. The office specifies not just what the occupant can do but what they must, may, and are immune from — the complete four-position Hohfeldian profile. Offices are installed; roles are filled.

An Office always defines a Role: the office's power-profile specifies a capability signature and the office's duties specify a norm-set. A Role does not always define an Office: roles can be filled without formal investiture, and roles specify capability without the full Hohfeldian correlative structure that offices carry.

Practically: filling a role does not confer the deontic standing that holding an office confers. A de facto captain — one who performs all functions of the captain role but was never formally invested — lacks the captain's legal authority, immunities, and formal accountability structure.

## Nuclear derivation

**Role proposition.** For each role $R$ in normative system $I$ at history $t$, define:

$$\rho_R \in H_t$$

as the proposition "role $R$ is constitutively active in $I$ at history $t$."

**Filling proposition.** For each agent $a$ and role $R$, define:

$$f_{a,R} \in H_t$$

as the proposition "agent $a$ fills role $R$ at history $t$."

**Role operativity.** Role $R$ is operative at $t$ iff:

$$\rho_R \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$

The double-settlement condition: $\sigma_t(\rho_R) = \rho_R$ — the normative community recognizes $R$ as a valid position within $I$; and $\Delta_t(\rho_R) = \rho_R$ — the role structure is stable forward and will not be dissolved in the next step.

**Filling operativity.** Agent $a$ operatively fills role $R$ at $t$ iff:

$$f_{a,R} \in H^*_t$$

This requires $\rho_R \in H^*_t$ (role is operative), $a \in H^*_t$ (agent is a recognized [Person](../../../../../../philosophy/terms/person.md)-node), and the satisfaction proposition $s_{a,\kappa_R} \in H^*_t$ — agent $a$ operatively satisfies the role's [CapabilitySignature](../../../../../../../../engineering/domains/tech/terms/capability-signature.md) $\kappa_R$.

**Four failure modes.** The nuclear partition gives four institutional states for $\rho_R$:

| Quadrant | $\sigma_t(\rho_R)$ | $\Delta_t(\rho_R)$ | Role status |
|---|---|---|---|
| $H^*_t$ | $= \rho_R$ | $= \rho_R$ | Operative: recognized and institutionally stable |
| $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ | $= \rho_R$ | $> \rho_R$ | Recognized but fragile — community accepts it but the normative structure cannot sustain it forward (a declining profession, an obsolete office) |
| $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ | $> \rho_R$ | $= \rho_R$ | Structurally required but unrecognized — a latent role the system needs but has not yet named |
| $H_t \setminus (H^*_t \cup \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | $> \rho_R$ | $> \rho_R$ | Proposed only — drafted but neither recognized nor structurally operative |

**Theorem (Norm Activation).** If $f_{a,R} \in H^*_t$ and $n \in N_R$, then the instantiated norm $n[a/\mathrm{bearer}] \in \mathrm{Fix}(\sigma_t)$.

*Proof sketch.* Since $f_{a,R} \in H^*_t \subseteq \mathrm{Fix}(\sigma_t)$, the filling is meaning-settled. The normative system $I$'s saturation nucleus $\sigma_t$ is defined such that $\mathrm{Fix}(\sigma_t)$ is closed under norm-instantiation from role-fillings — this is the meaning-closure condition of the institution (see [Institution](./institution.md), Invariant 2). For any $n \in N_R$, the instantiation $n[a/\mathrm{bearer}]$ is the norm with the generic bearer replaced by the specific agent $a$; the meaning-closure of the institution forces every constitutive rule and every norm-instantiation that follows from a settled role-filling into $\mathrm{Fix}(\sigma_t)$. Therefore $n[a/\mathrm{bearer}] \in \mathrm{Fix}(\sigma_t)$. $\square$

The Norm Activation Theorem is the nuclear content of Parsons' claim that roles carry normative expectations: the moment filling is operative, the full norm-set is meaning-settled for the bearer.

**Theorem (Subsumption Monotonicity).** If $\iota : \kappa_{R_1} \hookrightarrow \kappa_{R_2}$ is a subsumption morphism and $f_{a,R_2} \in H^*_t$, then $f_{a,R_1} \in H^*_t$.

*Proof sketch.* $f_{a,R_2} \in H^*_t$ implies $s_{a,\kappa_{R_2}} \in H^*_t$ (operative satisfaction of $\kappa_{R_2}$). By the Subsumption Satisfaction Monotonicity theorem ([CapabilitySignature](../../../../../../../../engineering/domains/tech/terms/capability-signature.md)): since $\iota : \kappa_{R_1} \hookrightarrow \kappa_{R_2}$ is a subsumption morphism, operative satisfaction of $\kappa_{R_2}$ entails operative satisfaction of $\kappa_{R_1}$, i.e., $s_{a,\kappa_{R_1}} \in H^*_t$. Since $f_{a,R_1}$ is constituted by $s_{a,\kappa_{R_1}}$ together with $\rho_{R_1} \in H^*_t$ (which holds by the same argument applied to the role propositions), we have $f_{a,R_1} \in H^*_t$. $\square$

Subsumption Monotonicity is the nuclear content of the RBAC role hierarchy: filling a more specific role simultaneously fills every role it subsumes.

**Role vacancy.** Role $R$ is vacant at $t$ iff:

$$\rho_R \in H^*_t \quad \text{and} \quad \nexists\, a : f_{a,R} \in H^*_t$$

The role is operative but no agent's filling of it is operative. Vacancy is well-defined: $\rho_R \in H^*_t$ while all filling propositions remain outside $H^*_t$.

**Role conflict.** Agent $a$ faces role conflict between $R_1$ and $R_2$ at $t$ iff $f_{a,R_1}, f_{a,R_2} \in H^*_t$ and there exist $n_1 \in N_{R_1}$, $n_2 \in N_{R_2}$ such that:

$$n_1[a/\mathrm{bearer}] \wedge n_2[a/\mathrm{bearer}] \notin H^*_t$$

The jointly instantiated norms from both roles cannot be doubly-settled simultaneously. By the Norm Activation Theorem, both $n_1[a/\mathrm{bearer}]$ and $n_2[a/\mathrm{bearer}]$ are in $\mathrm{Fix}(\sigma_t)$ (meaning-settled) whenever both fillings are operative. Role conflict is therefore not a recognition failure — both norms are recognized — but an execution failure: the obligations cannot be jointly execution-settled ($\Delta_t$-settled) at the same history. This is the nuclear characterization of Biddle's role strain: not incoherence of recognition but impossibility of simultaneous execution.

## Role vs. adjacent concepts

| Concept | Constituting relation | Norm-set | Formal status | Filled how |
|---|---|---|---|---|
| **Role** | Capability-signature + norm-set | $N_R$ indexed to role | Bearer-independent type | Capability-matching + norm-acceptance |
| **[Office](../../../terms/office.md)** | Full Hohfeldian deontic profile | Duties derived from powers | Formally invested position | Investiture $I^+$ |
| **[Norm](./norm.md)** | Deontic operator on proposition | Itself | Element of $\mathrm{Fix}(\sigma_t)$ | N/A — exists, not filled |
| **[Duty](./duty.md)** | Three-place Hohfeldian relation | N/A — is a norm instance | $\mathbf{D}(a, \varphi, r) \in H^*_t$ | Established by authority act |
| **[Incumbent](../../../terms/incumbent.md)** | Person $\times$ Office pair | Inherits from office | $(p, o)$ with $f_{p,o} \in H^*_t$ | Investiture |

## See also

- [Social Role Theory Survey](../texts/social-role-theory-survey.md) — survey of sociological, logical, and computational traditions (Linton, Parsons, Goffman, Biddle, Searle, Boella & van der Torre, RBAC)
- [office](../../../terms/office.md) — a formally invested deontic position
- [delegation](../../../terms/delegation.md) — the transfer of bounded authority
- [agent](../../../../../../../../engineering/domains/tech/terms/agent.md) — entity that perceives and acts to achieve goals
