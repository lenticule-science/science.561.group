---
id: role
description: "A Role is a triple (Σ, N, ⪯) — a capability signature Σ specifying the minimum operations any bearer must provide, a norm-set N of role-indexed obligations and permissions that apply to any bearer, and a subsumption position ⪯ in the preorder of all roles ordered by signature inclusion. The defining structure: a role is a bearer-independent normative interface type — the deontic and capability profile that any agent must satisfy to count as filling it. Three projections of the same structure: a role as capability specification (Σ), as norm bundle (N), and as positional node in a role hierarchy (⪯). A role persists when vacant; its norms apply to any and every bearer; no role is constituted by its current occupant."
date-created: 2026-03-18
date-modified: 2026-03-20
params:
  capability-signature: relational-universe-morphism
  norm-set: relational-universe
  preorder-position: relational-universe
output: relational-universe-morphism
ast:
  capability-interface-type:
    - capability-signature:
        - norm-set
    - preorder-position:
        - capability-signature
        - norm-set
aliases:
  - Role
  - role
name: "Role"
---

# Role

## Formal definition

A **Role** is a triple $\mathfrak{R} = (\kappa_R, N_R, \iota_R)$:

$$\mathfrak{R} = (\kappa_R : \mathrm{CapabilitySignature},\; N_R : \mathrm{Set(Norm)},\; \iota_R : \mathrm{CapabilitySignature.
SubsumptionMorphism})$$

where: - $\kappa_R$ is the **capability signature** — a morphism $\kappa_R : \mathrm{ParamNames}_R \to \mathrm{Types}$ (see [CapabilitySignature](../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/lenticule-science-corpus/capability-signature.md)) specifying the minimum typed interface any bearer of $R$ must provide; agent $a$ fills $R$ iff the satisfaction proposition $s_{a,\kappa_R} \in H^*_t$ — $a$ provides a doubly-settled value for every parameter in $\kappa_R$; in FARS, $\kappa_R$ is exactly the `params:` block of the role's spec - $N_R$ is the **norm-set** — the finite set of [Norm](norm.md)s indexed to role $R$; obligations, permissions, and prohibitions that apply to any bearer of $R$ while they bear it; the norms are role-indexed, not agent-indexed: when $a$ fills $R$, all $n \in N_R$ are instantiated with $a$ as bearer; when $a$ vacates $R$, the norms deactivate for $a$ and activate for whatever new bearer fills $R$; role norms are positional, not personal - $\iota_R$ is the **subsumption morphism set** — the set of subsumption morphisms $\iota : \kappa_{R'} \hookrightarrow \kappa_R$ (from any less specific role $R'$ into $R$) making $R$ a node in the category of capability signatures ordered by subsumption; $\iota : \kappa_{R'} \hookrightarrow \kappa_R$ exists iff $\mathrm{dom}(\kappa_{R'}) \subseteq \mathrm{dom}(\kappa_R)$ with matching types; filling $R$ entails filling every $R'$ for which such a morphism exists

**Four invariants.** $\mathfrak{R}$ is a role iff it satisfies:

1. **Bearer-independence**: $\mathfrak{R}$ exists independently of any current bearer.
  The role is constituted by $(\kappa_R, N_R, \iota_R)$, not by any agent currently filling it.
  An unoccupied role is still a role — its norms are dormant (not activated for any bearer) but the normative profile is fully defined.
  This is what distinguishes a role from a disposition or habit: habits depend on the specific individual having them; roles are defined by a position in a normative system that persists whether or not any individual currently occupies it.

2. **Signature completeness**: $\kappa_R$ is complete with respect to $N_R$ — every act referred to in any $n \in N_R$ is representable within $\mathrm{dom}(\kappa_R)$.
  A norm requiring performance of a parameter not declared in $\kappa_R$ would be normatively impossible to satisfy; no role can generate obligations without the corresponding capability declaration.
  Formally: for each $n \in N_R$ whose propositional content refers to a parameter $p$, the name $p$ must be in $\mathrm{dom}(\kappa_R)$.

3. **Subsumption coherence**: If $\iota : \kappa_{R_1} \hookrightarrow \kappa_R$ is a subsumption morphism, then for every $n_1 \in N_{R_1}$ there is a corresponding obligation entailment in $N_R$ — the more specific role carries all the obligations of the less specific role it subsumes, plus potentially more.
  More capable roles carry more or equal normative burden.
  This ensures that filling $R$ cannot evade the obligations of any $R_1$ for which a subsumption morphism into $R$ exists.

4. **Positional distinctness**: Two roles $R_1$ and $R_2$ in the same normative system are the same role iff $\kappa_{R_1} = \kappa_{R_2}$ (equal capability signatures as morphisms) and $N_{R_1} = N_{R_2}$.
  Different names for the same $(\kappa, N)$ pair are labels for the same role.
  This invariant rules out phantom roles — positional labels without distinct capability or normative content.

## Role vs. Office

The distinction between role and office runs through the entire normative ontology of this system.
Both describe positions an agent can occupy.
The difference is constitutive depth.

A **Role** is a normative interface type: it specifies what you can and must do when you occupy it.
Filling a role is capability-matching: you fill $R$ by operative satisfaction of $\kappa_R$ — i.e., $s_{a,\kappa_R} \in H^*_t$ — and acceptance of the norm-set $N_R$.
No formal act is required to fill a role you are capable of filling; role-filling can be informal.

An **[Office](../../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/office.md)** is a formally invested deontic position: a full [HohfeldianPosition](../../../../services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-position.md) profile (powers, duties, privileges, immunities) transferred by a formal investiture act $I^+$.
The office specifies not just what the occupant can do but what they must, may, and are immune from — the complete four-position Hohfeldian profile.
Offices are installed; roles are filled.

An Office always defines a Role: the office's power-profile specifies a capability signature and the office's duties specify a norm-set.
A Role does not always define an Office: roles can be filled without formal investiture, and roles specify capability without the full Hohfeldian correlative structure that offices carry.

Practically: filling a role does not confer the deontic standing that holding an office confers.
A de facto captain — one who performs all functions of the captain role but was never formally invested — lacks the captain's legal authority, immunities, and formal accountability structure.

## Social role theory

The sociological tradition provides the external-research foundation that purely type-theoretic accounts lack.

**Linton (1936) and Parsons (1951)**: Ralph Linton (*The Study of Man*, 1936) introduced the foundational status/role distinction: status is a collection of rights and duties; a role is the dynamic aspect of status — the enactment of those rights and duties.
Parsons (*The Social System*, 1951) adopted and extended this framework, making role-expectations the central unit of social analysis.
In Parsons' formulation, a role is defined by a set of normatively governed orientations that ego has toward alter, embedded in reciprocal normative expectations across a social system.
Roles are not descriptions of typical behavior but prescriptions — standards whose authority is independent of compliance.
Every role comes with internal standards of excellent performance; the same acts can be evaluated as excellent, adequate, or deficient by reference to the role's standards.

**Goffman (1959, 1961)**: the dramaturgical approach to role and performance.
Goffman's *The Presentation of Self in Everyday Life* (1959) introduces the front/back stage distinction: the same role is performed differently in front regions (where the audience is present and performance is managed) and back regions (where performance relaxes).
Role distance — the bearer's signals of critical separation from the role, performing it while establishing that they are "more than" the role — appears in *Encounters* (1961): a surgeon who cracks jokes in the OR performs the surgeon role while asserting an individuality that exceeds it.
Role embracement (the opposite: deep identification) and role distance together define the spectrum of role-person merger.

Goffman's contribution: roles are not static types but dynamic accomplishments — enacted, maintained, and negotiated.
The role as formal structure $(\kappa_R, N_R, \iota_R)$ is the template; the performance is the particular enactment.
This distinction is load-bearing in the nuclear framework: the role as type is the operativity proposition $\rho_R$ at the base of the site; the filling $f_{a,R}$ is a proposition in the fiber at a specific history.

**Biddle (1986, *Annual Review of Sociology*)**: role theory survey — five theoretical strands: 1. **Functional role theory** (Parsons): roles exist because the social system requires certain functions; the role-set of a social position is determined by what the system needs done 2. **Symbolic interactionist role theory** (Mead, Goffman, Turner): roles emerge from social interaction; role-taking and role-making are ongoing interpretive processes that constitute roles through enactment; Turner (1962) argues enactment is active role-making, not mere conformity to a script 3. **Structural role theory** (organizational sociology): roles as nodes in a social network; defined by the pattern of relationships, not by intrinsic properties of the role-bearer 4. **Organizational role theory**: roles as positions within organizational authority hierarchies; role conflict, role ambiguity, and role overload as failures of structural coordination 5. **Cognitive role theory**: roles as mental schemas guiding role-taking; role knowledge is knowledge about scripts, expectations, and evaluative standards

The five strands correspond to the components of $\mathfrak{R}$ and the nuclear derivation: functional theory → $\kappa_R$ (what the role must accomplish); interactionist and cognitive theory → the meaning-settlement conditions ($\sigma_t$); structural and organizational theory → $\iota_R$ (subsumption morphisms in the role network) and the role conflict analysis.

**Searle (1995, 2010)**: the constitutive rules grounding.
Searle's "X counts as Y in context C" formula (*The Construction of Social Reality*, 1995; *Making the Social World*, 2010) is the direct ancestor of normative role theory's role-instantiation condition: agent $a$ counts as a bearer of role $R$ in context $C$ (= normative system $I$) when $f_{a,R} \in H^*_t$.
The role is not a physical entity but an institutional fact constituted by the collective acceptance of the counts-as rule.

**Boella and van der Torre (2006, 2007)**: the most formally developed normative account in multi-agent systems.
A role is a bundle of obligations, permissions, and institutional powers in a normative system, indexed to a social position.
Filling a role is a two-phase operation: (1) **role adoption** — the agent commits to accepting the role's norm-set; (2) **role enactment** — the agent performs actions evaluated against the capability signature and norm-set.
Their key result: the normative role system generates a partial order on agent actions — for each role, the actions satisfying the role's norms form an upward-closed set in the action lattice.
This is the connection to the nuclear framework's fixed-point structure.

**Masolo et al. (2004, *KR 2004*)** and **Grossi, Meyer, Dignum (2008, *Journal of Logic and Computation*)**: the ontological and logical grounding.
Masolo et al. define a foundational ontology distinguishing roles from agents, relational roles from intrinsic properties, and role-qua-individual from role-as-type — the distinction between $\rho_R$ (the type proposition) and $f_{a,R}$ (the token filling).
Grossi et al. give the definitive logical analysis of counts-as and constitutive norms, showing how role instantiation is grounded in constitutive rather than regulative normative structure.

## RBAC formalization

Role-Based Access Control (Sandhu et al., *IEEE Computer*, 1996) gives the computational access-control fragment:

- $\mathrm{ROLES}$, $\mathrm{USERS}$, $\mathrm{PERMS}$: sets of roles, users, permissions
- $\mathrm{PA} \subseteq \mathrm{ROLES} \times \mathrm{PERMS}$: permission assignment
- $\mathrm{UA} \subseteq \mathrm{USERS} \times \mathrm{ROLES}$: user-role assignment
- $\mathrm{eff\_perms}(u) = \bigcup\{ \mathrm{perms}(r) \mid (u, r) \in \mathrm{UA} \}$
- Role hierarchy: partial order $\leq$ on $\mathrm{ROLES}$ where $r_1 \leq r_2 \Rightarrow \mathrm{perms}(r_1) \subseteq \mathrm{perms}(r_2)$

RBAC models $\kappa_R$ as the permission set (each permission is a typed capability declaration) and the role hierarchy as the subsumption morphisms $\iota_R$.
What RBAC does not capture: the norm-set $N_R$ (obligations and prohibitions, not only permissions), and the role's interaction with the normative system's authority structure.
RBAC is the administrative access-control projection of the full role concept — it captures the capability side ($\kappa_R$) while omitting the normative side ($N_R$).

The ANSI/INCITS 359-2004 extension adds: - **Role inheritance**: senior roles inherit all permissions of junior roles — formalizing subsumption coherence (invariant 3) - **Separation of duty**: certain role combinations cannot be co-assigned (static SoD) or co-activated (dynamic SoD) — a constraint on $\mathrm{UA}$ that prevents role conflict of a specific institutional type - **Role activation**: a user activates a subset of assigned roles in a session — the operational correlate of the filling/vacancy distinction

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

This requires $\rho_R \in H^*_t$ (role is operative), $a \in H^*_t$ (agent is a recognized [Person](person.md)-node), and the satisfaction proposition $s_{a,\kappa_R} \in H^*_t$ — agent $a$ operatively satisfies the role's [CapabilitySignature](../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/lenticule-science-corpus/capability-signature.md) $\kappa_R$.

**Four failure modes.** The nuclear partition gives four institutional states for $\rho_R$:

| Quadrant | $\sigma_t(\rho_R)$ | $\Delta_t(\rho_R)$ | Role status |
|---|---|---|---|
| $H^*_t$ | $= \rho_R$ | $= \rho_R$ | Operative: recognized and institutionally stable |
| $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ | $= \rho_R$ | $> \rho_R$ | Recognized but fragile — community accepts it but the normative structure cannot sustain it forward (a declining profession, an obsolete office) |
| $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ | $> \rho_R$ | $= \rho_R$ | Structurally required but unrecognized — a latent role the system needs but has not yet named |
| $H_t \setminus (H^*_t \cup \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | $> \rho_R$ | $> \rho_R$ | Proposed only — drafted but neither recognized nor structurally operative |

**Theorem (Norm Activation).** If $f_{a,R} \in H^*_t$ and $n \in N_R$, then the instantiated norm $n[a/\mathrm{bearer}] \in \mathrm{Fix}(\sigma_t)$.

*Proof sketch.* Since $f_{a,R} \in H^*_t \subseteq \mathrm{Fix}(\sigma_t)$, the filling is meaning-settled.
The normative system $I$'s saturation nucleus $\sigma_t$ is defined such that $\mathrm{Fix}(\sigma_t)$ is closed under norm-instantiation from role-fillings — this is the meaning-closure condition of the institution (see [Institution](institution.md), Invariant 2).
For any $n \in N_R$, the instantiation $n[a/\mathrm{bearer}]$ is the norm with the generic bearer replaced by the specific agent $a$; the meaning-closure of the institution forces every constitutive rule and every norm-instantiation that follows from a settled role-filling into $\mathrm{Fix}(\sigma_t)$.
Therefore $n[a/\mathrm{bearer}] \in \mathrm{Fix}(\sigma_t)$. $\square$

The Norm Activation Theorem is the nuclear content of Parsons' claim that roles carry normative expectations: the moment filling is operative, the full norm-set is meaning-settled for the bearer.

**Theorem (Subsumption Monotonicity).** If $\iota : \kappa_{R_1} \hookrightarrow \kappa_{R_2}$ is a subsumption morphism and $f_{a,R_2} \in H^*_t$, then $f_{a,R_1} \in H^*_t$.

*Proof sketch.* $f_{a,R_2} \in H^*_t$ implies $s_{a,\kappa_{R_2}} \in H^*_t$ (operative satisfaction of $\kappa_{R_2}$).
By the Subsumption Satisfaction Monotonicity theorem ([CapabilitySignature](../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/lenticule-science-corpus/capability-signature.md)): since $\iota : \kappa_{R_1} \hookrightarrow \kappa_{R_2}$ is a subsumption morphism, operative satisfaction of $\kappa_{R_2}$ entails operative satisfaction of $\kappa_{R_1}$, i.e., $s_{a,\kappa_{R_1}} \in H^*_t$.
Since $f_{a,R_1}$ is constituted by $s_{a,\kappa_{R_1}}$ together with $\rho_{R_1} \in H^*_t$ (which holds by the same argument applied to the role propositions), we have $f_{a,R_1} \in H^*_t$. $\square$

Subsumption Monotonicity is the nuclear content of the RBAC role hierarchy: filling a more specific role simultaneously fills every role it subsumes.

**Role vacancy.** Role $R$ is vacant at $t$ iff:

$$\rho_R \in H^*_t \quad \text{and} \quad \nexists\, a : f_{a,R} \in H^*_t$$

The role is operative but no agent's filling of it is operative.
Vacancy is well-defined: $\rho_R \in H^*_t$ while all filling propositions remain outside $H^*_t$.

**Role conflict.** Agent $a$ faces role conflict between $R_1$ and $R_2$ at $t$ iff $f_{a,R_1}, f_{a,R_2} \in H^*_t$ and there exist $n_1 \in N_{R_1}$, $n_2 \in N_{R_2}$ such that:

$$n_1[a/\mathrm{bearer}] \wedge n_2[a/\mathrm{bearer}] \notin H^*_t$$

The jointly instantiated norms from both roles cannot be doubly-settled simultaneously.
By the Norm Activation Theorem, both $n_1[a/\mathrm{bearer}]$ and $n_2[a/\mathrm{bearer}]$ are in $\mathrm{Fix}(\sigma_t)$ (meaning-settled) whenever both fillings are operative.
Role conflict is therefore not a recognition failure — both norms are recognized — but an execution failure: the obligations cannot be jointly execution-settled ($\Delta_t$-settled) at the same history.
This is the nuclear characterization of Biddle's role strain: not incoherence of recognition but impossibility of simultaneous execution.

## Role vs. adjacent concepts

| Concept | Constituting relation | Norm-set | Formal status | Filled how |
|---|---|---|---|---|
| **Role** | Capability-signature + norm-set | $N_R$ indexed to role | Bearer-independent type | Capability-matching + norm-acceptance |
| **[Office](../../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/office.md)** | Full Hohfeldian deontic profile | Duties derived from powers | Formally invested position | Investiture $I^+$ |
| **[Norm](norm.md)** | Deontic operator on proposition | Itself | Element of $\mathrm{Fix}(\sigma_t)$ | N/A — exists, not filled |
| **[Duty](../../../../services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/duty.md)** | Three-place Hohfeldian relation | N/A — is a norm instance | $\mathbf{D}(a, \varphi, r) \in H^*_t$ | Established by authority act |
| **[Incumbent](incumbent.md)** | Person $\times$ Office pair | Inherits from office | $(p, o)$ with $f_{p,o} \in H^*_t$ | Investiture |

## Open questions

- Whether the Norm Activation condition ($n[a/\mathrm{bearer}] \in \mathrm{Fix}(\sigma_t)$ when $f_{a,R} \in H^*_t$) holds for all norms in $N_R$ or only for the obligatory ones — whether permissions in $N_R$ are activated by the same mechanism (their pseudocomplement is not in $\mathrm{Fix}(\sigma_t)$) or require a different analysis: specifically, whether a permission in $N_R$ is a license that moves certain propositions into the bearer's $\mathrm{Fix}(\sigma_t)$ as permitted acts, rather than a proposition already in $\mathrm{Fix}(\sigma_t)$.
- Whether the category of capability signatures ordered by subsumption morphisms has products and coproducts — whether the meet $\kappa_{R_1} \times \kappa_{R_2}$ (the signature requiring all parameters of both) and coproduct $\kappa_{R_1} + \kappa_{R_2}$ (the signature requiring only parameters common to both) exist in all cases; and whether the corresponding role meet and join are always well-defined, or whether norm-set incompatibility can block the join.
- Whether role conflict has a canonical resolution mechanism in the nuclear framework — whether there is a priority ordering on competing norms from different roles that determines which wins when jointly instantiated, and whether this corresponds to a partial order on the nuclei themselves (one closure operation taking precedence over another in the intersection of their fixed sets).
- Whether Goffman's **role distance** (*Encounters*, 1961) — performing a role while signaling non-identification with it — has a nuclear representation: whether there is a state where $f_{a,R} \in H^*_t$ (filling is operative) while some proposition $g_{\mathrm{distance}} \in H^*_t$ encodes $a$'s non-commitment to the role's internal standards of excellence — and whether these two propositions can coexist in $H^*_t$ or whether genuine role distance requires a separate fiber-level structure.
- Whether Turner's **role-person merger** (*The Role and the Person*, AJS 1978) — the degree to which a person becomes identified with a role rather than merely performing it — has a formal nuclear analog: whether high role-person merger corresponds to the agent's personal propositions being strongly interlocked with $f_{a,R}$ in $H^*_t$ (the agent's settled propositions are densely connected to the role-filling proposition) while low merger corresponds to $f_{a,R} \in H^*_t$ being isolated — present in the fixed fiber but unconnected to the agent's other settled commitments.
- Whether the **latent role** state ($\sigma_t(\rho_R) > \rho_R$, $\Delta_t(\rho_R) = \rho_R$) — structurally required but unrecognized — corresponds to the Guala-Hindriks (2015) unified social ontology's account of institutional functions that a social equilibrium performs without participants having named them; and whether the process of recognizing a latent role (moving $\rho_R$ from $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ into $H^*_t$) is the nuclear model of Hindriks and Guala's *normative upgrade* — the transition from mere behavioral regularity to explicitly recognized normative position.
- Whether the **role-as-type / role-as-token** distinction — between the role $\mathfrak{R} = (\kappa_R, N_R, \iota_R)$ as a type and the filling proposition $f_{a,R} \in H_t$ as a token — corresponds to the distinction between the capability signature $\kappa_R$ as a global section of the base site (defined over all histories) and the satisfaction proposition $s_{a,\kappa_R}$ as a fiber element (local to history $t$); and whether this corresponds to the type/term distinction in dependent type theory.

## Related

- [Social Role Theory Survey](../../../../services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/documents/articles/notes/social-role-theory-survey.md) — survey of sociological, logical, and computational traditions (Linton, Parsons, Goffman, Biddle, Searle, Boella & van der Torre, RBAC)
