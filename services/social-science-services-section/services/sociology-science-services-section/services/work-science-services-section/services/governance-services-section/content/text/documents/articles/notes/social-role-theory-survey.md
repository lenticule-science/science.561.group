---

title: "Social Role Theory: A Survey of Competing Accounts"
description: "Survey of sociological, logical, and computational traditions that define what a role is — from Linton's status/role distinction through Goffman's dramaturgical analysis to Boella and van der Torre's multi-agent normative formalization."
introduces: survey
surveys: Role
date-created: 2026-04-03
sources:
  - "Linton, Ralph. *The Study of Man*. Appleton-Century, 1936."
  - "Parsons, Talcott. *The Social System*. Free Press, 1951."
  - "Goffman, Erving. *The Presentation of Self in Everyday Life*. Doubleday, 1959."
  - "Goffman, Erving. *Encounters: Two Studies in the Sociology of Interaction*. Bobbs-Merrill, 1961."
  - "Turner, Ralph H. 'The Role and the Person.' *American Journal of Sociology* 84, no. 1 (1978): 1-23."
  - "Biddle, Bruce J. 'Recent Developments in Role Theory.' *Annual Review of Sociology* 12 (1986): 67-92."
  - "Searle, John R. *The Construction of Social Reality*. Free Press, 1995."
  - "Sandhu, Ravi S., et al. 'Role-Based Access Control Models.' *IEEE Computer* 29, no. 2 (1996): 38-47."
  - "Masolo, Claudio, et al. 'Social Roles and their Descriptions.' *KR 2004*, 267-277."
  - "Boella, Guido, and Leendert van der Torre. 'Organizations in Multi-Agent Systems.' *AAMAS 2006*."
  - "Boella, Guido, and Leendert van der Torre. 'The Ontological Properties of Social Roles in Multi-Agent Systems.' *Artificial Intelligence and Law* 15 (2007): 155-185."
  - "Grossi, Davide, John-Jules Ch. Meyer, and Frank Dignum. 'Counts-as: Classification or Constitution? An Answer Using Modal Logic.' *Journal of Logic and Computation* 18, no. 4 (2008): 631-669."
  - "Searle, John R. *Making the Social World: The Structure of Human Civilization*. Oxford University Press, 2010."
  - "Guala, Francesco, and Frank Hindriks. 'A Unified Social Ontology.' *The Philosophical Quarterly* 65, no. 259 (2015): 177-201."
  - "ANSI/INCITS 359-2004. *Role Based Access Control*."
---

This survey traces the major traditions that define what a [role](../terms/role.md) is, from early sociological formulations through computational formalizations. Each tradition contributes something the others lack: functional theory explains why roles exist, interactionist theory explains how they are performed, structural theory explains how they relate to each other, and normative multi-agent theory gives the formal machinery to reason about them.

## The sociological foundations

### Linton and Parsons: status, role, and normative expectation

Ralph Linton (*The Study of Man*, 1936) introduced the foundational status/role distinction: status is a collection of rights and duties; a role is the dynamic aspect of status — the enactment of those rights and duties. Talcott Parsons (*The Social System*, 1951) adopted and extended this framework, making role-expectations the central unit of social analysis. In Parsons' formulation, a role is defined by a set of normatively governed orientations that ego has toward alter, embedded in reciprocal normative expectations across a social system. Roles are not descriptions of typical behavior but prescriptions — standards whose authority is independent of compliance. Every role comes with internal standards of excellent performance; the same acts can be evaluated as excellent, adequate, or deficient by reference to the role's standards.

### Goffman: dramaturgical performance and role distance

Erving Goffman's *The Presentation of Self in Everyday Life* (1959) introduces the front/back stage distinction: the same role is performed differently in front regions (where the audience is present and performance is managed) and back regions (where performance relaxes). Role distance — the bearer's signals of critical separation from the role, performing it while establishing that they are "more than" the role — appears in *Encounters* (1961): a surgeon who cracks jokes in the OR performs the surgeon role while asserting an individuality that exceeds it. Role embracement (the opposite: deep identification) and role distance together define the spectrum of role-person merger.

Goffman's contribution: roles are not static types but dynamic accomplishments — enacted, maintained, and negotiated. The role as formal structure is the template; the performance is the particular enactment. This maps onto the type/token distinction: the role as type is a bearer-independent interface specification, while each filling is a token instantiation at a particular time by a particular agent.

### Biddle's five strands

Biddle's 1986 survey in the *Annual Review of Sociology* identifies five theoretical strands, each capturing a different aspect of what roles are:

1. **Functional role theory** (Parsons): roles exist because the social system requires certain functions. The role-set of a social position is determined by what the system needs done.
2. **Symbolic interactionist role theory** (Mead, Goffman, Turner): roles emerge from social interaction. Role-taking and role-making are ongoing interpretive processes that constitute roles through enactment. Turner (1962) argues enactment is active role-making, not mere conformity to a script.
3. **Structural role theory** (organizational sociology): roles as nodes in a social network, defined by the pattern of relationships rather than intrinsic properties of the role-bearer.
4. **Organizational role theory**: roles as positions within organizational authority hierarchies. Role conflict, role ambiguity, and role overload as failures of structural coordination.
5. **Cognitive role theory**: roles as mental schemas guiding role-taking. Role knowledge is knowledge about scripts, expectations, and evaluative standards.

### Turner on role-person merger

Ralph Turner's "The Role and the Person" (*American Journal of Sociology*, 1978) identifies the degree to which a person becomes identified with a role rather than merely performing it. High merger: the person's identity is inseparable from the role. Low merger: the person performs the role while maintaining clear separateness. This is distinct from Goffman's role distance, which is a performed signal; Turner's merger is a psychological and social fact about how deeply the role constitutes the person's identity.

## The constitutive-rule tradition

### Searle: counts-as and institutional facts

Searle's "X counts as Y in context C" formula (*The Construction of Social Reality*, 1995; *Making the Social World*, 2010) is the direct ancestor of normative role theory's role-instantiation condition: an agent counts as a bearer of a role in a given normative system when the system's constitutive rules are satisfied. The role is not a physical entity but an institutional fact constituted by the collective acceptance of the counts-as rule.

### Grossi, Meyer, and Dignum: logical analysis of counts-as

Grossi, Meyer, and Dignum (*Journal of Logic and Computation*, 2008) give the definitive logical analysis of counts-as and constitutive norms, showing how role instantiation is grounded in constitutive rather than regulative normative structure. This distinction matters: a regulative norm governs pre-existing behavior (speed limits regulate driving), while a constitutive norm creates the possibility of the behavior it governs (the rules of chess don't regulate piece-moving; they constitute what it means to move a piece in chess). Role-filling is constitutive: the norms don't regulate an agent who happens to be in the role; they create what it means to be in the role.

### Guala and Hindriks: unified social ontology

Guala and Hindriks (*The Philosophical Quarterly*, 2015) propose a unified account that bridges Searle's constitutive rules with equilibrium-based theories of institutions. Their concept of *normative upgrade* — the transition from mere behavioral regularity to explicitly recognized normative position — describes how latent roles (structural requirements not yet named) become recognized roles.

## Multi-agent systems formalization

### Masolo et al.: ontological foundations

Masolo et al. (*KR 2004*) define a foundational ontology distinguishing roles from agents, relational roles from intrinsic properties, and role-qua-individual from role-as-type. The distinction between the role as type (bearer-independent interface specification) and the role as token (a specific agent filling that role at a specific time) is essential for any formal system that needs to reason about roles.

### Boella and van der Torre: normative roles in multi-agent systems

Boella and van der Torre (2006, 2007) provide the most formally developed normative account in multi-agent systems. A role is a bundle of obligations, permissions, and institutional powers in a normative system, indexed to a social position. Filling a role is a two-phase operation: (1) **role adoption** — the agent commits to accepting the role's norm-set; (2) **role enactment** — the agent performs actions evaluated against the capability signature and norm-set.

Their key result: the normative role system generates a partial order on agent actions — for each role, the actions satisfying the role's norms form an upward-closed set in the action lattice. This connects role theory to fixed-point semantics: the set of role-conformant actions is closed under the normative system's closure operator.

## Computational access control: RBAC

Role-Based Access Control (Sandhu et al., *IEEE Computer*, 1996) gives the computational access-control fragment of role theory:

- $\mathrm{ROLES}$, $\mathrm{USERS}$, $\mathrm{PERMS}$: sets of roles, users, permissions
- $\mathrm{PA} \subseteq \mathrm{ROLES} \times \mathrm{PERMS}$: permission assignment
- $\mathrm{UA} \subseteq \mathrm{USERS} \times \mathrm{ROLES}$: user-role assignment
- Role hierarchy: partial order $\leq$ on $\mathrm{ROLES}$ where $r_1 \leq r_2 \Rightarrow \mathrm{perms}(r_1) \subseteq \mathrm{perms}(r_2)$

RBAC models the capability signature as the permission set and the role hierarchy as the subsumption morphisms. What RBAC does not capture: obligations and prohibitions (not only permissions), and the role's interaction with the normative system's authority structure. RBAC is the administrative access-control projection of the full role concept — it captures the capability side while omitting the normative side.

The ANSI/INCITS 359-2004 extension adds:
- **Role inheritance**: senior roles inherit all permissions of junior roles
- **Separation of duty**: certain role combinations cannot be co-assigned (static SoD) or co-activated (dynamic SoD)
- **Role activation**: a user activates a subset of assigned roles in a session

## Synthesis

The five sociological strands plus the three formal traditions (constitutive rules, multi-agent normative logic, RBAC) converge on a common structure:

| Tradition | What it contributes | What it lacks |
|---|---|---|
| Functional (Parsons) | Why roles exist — system requirements | How roles are enacted or negotiated |
| Interactionist (Goffman, Turner) | How roles are performed, distance, merger | Formal structure of role obligations |
| Structural (network) | How roles relate to each other positionally | Normative content of individual roles |
| Organizational | Role conflict, ambiguity, overload | Constitutive foundations |
| Constitutive (Searle, Grossi) | How roles are created and maintained | Computational implementation |
| Multi-agent (Boella, Masolo) | Formal normative semantics | Social dynamics of performance |
| RBAC (Sandhu) | Computational access control | Obligations, prohibitions, normative depth |

A complete account of roles requires all of these: functional theory to explain why the role exists, structural theory to place it in a network of other roles, normative theory to specify what obligations and permissions it carries, constitutive theory to ground its institutional reality, and computational theory to implement it in systems that assign agents to roles.

## See also

- [role](../terms/role.md) — the formal term definition
- [office](../../../terms/office.md) — a formally invested position with full Hohfeldian deontic profile
- [delegation](../../../terms/delegation.md) — the transfer of bounded authority from principal to agent
- [The Formal Structure of Office](../../../texts/formal-structure-of-office.md) — presheaf model of office
- [dispatch and delegation survey](../../../texts/dispatch-and-delegation-survey.md) — how work reaches agents
