---

name: "Enrollment"
description: "An Enrollment is a triple (p, V, T) — a person p, a vessel V, and an operational period T — such that p becomes a section of V's role fiber for T: a right inverse of the role projection assigning p to a specific position r ∈ Roles(V). The enrollment act (the signing of articles, the assumption of duty) is the discrete event that constitutes the section; before it, p is not crew; after it, p is crew for T. Formally: enrollment is the act of installing a section of the role fibration over the operational period, subject to the counit law of the directed comonad — the section coheres with the presheaf structure of V across T."
date-created: 2026-03-20
params:
  person: person
  vessel: vessel
  operational-period: relational-history
  role: relational-universe-fiber-proposition
output: relational-history-fiber-fixed-layer
ast:
  section:
    - person:
        - vessel
        - operational-period
    - role:
        - vessel
        - operational-period
id: enrollment
defines: Enrollment
related: Crew, Vessel, Person, Investiture, Act, Section, Discharge
date-modified: 2026-03-20
---

## Formal definition

An **Enrollment** is a triple $\mathcal{E} = (p, V, T)$:

$$\mathcal{E} = (p : \mathrm{Person},\; V : \mathrm{Vessel},\; T : \mathrm{Interval})$$

together with:
- A **role assignment** $r = R(p) \in \mathrm{Roles}(V)$ — the specific position $p$ fills in $V$'s complement
- An **enrollment act** $\iota_p$ — the discrete event (signing of articles, assumption of duty, formal assignment) at which $p$ becomes a section of $V$'s role fiber for $T$
- A **discharge predicate** $\delta_p$ — the condition (end of voyage, relief, death) at which the section status terminates

The enrollment constitutes $p$ as a **section** of the role fibration over $V$ for period $T$: the assignment $R(p) = r$ is a right inverse of the role projection $\pi_r : \mathrm{Crew}(V, T) \to \mathrm{Roles}(V)$ at position $r$. The section condition is: $\pi_r(R(p)) = r$ — after enrollment, $p$ is provably in position $r$.

**Four invariants.** $\mathcal{E}$ is an enrollment iff:

1. **Section condition**: $R(p) = r$ and $r \in \mathrm{Roles}(V)$ — $p$ fills an actual role in $V$'s complement, not a phantom position. The section condition $\pi_r \circ R = \mathrm{id}_{\mathrm{Roles}(V)}$ ensures that every required role has a person assigned ([Section](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md): a right inverse of the projection).

2. **Discreteness of enrollment act**: enrollment is not continuous but instantaneous. There is a specific moment $\iota_p$ — the signing, the declaration, the formal assumption — at which $p$ transitions from non-crew to crew. Before $\iota_p$: $p \notin \mathrm{Crew}(V, T)$. After $\iota_p$: $p \in \mathrm{Crew}(V, T)$ with role $r$. This mirrors the [Investiture](../../../../../../../../content/text/glossary/terms/investiture.md) structure: enrollment is the crew-level investiture.

3. **Period-specificity**: $p$'s section status is bounded by $T$. The enrollment constitutes a section for $T$ only — not an indefinite assignment. At $T$'s end (the discharge predicate $\delta_p$), the section status lapses. The bounded-period invariant is what distinguishes crew enrollment from permanent institutional membership.

4. **Counit coherence**: the enrollment section coheres with the presheaf structure of $V$ across $T$. Formally: for each restriction map $H(f) : H_{t'} \to H_t$ (for $t \leq t' \leq T$), $p$'s role-binding at $t'$ restricts correctly to $p$'s role-binding at $t$. This is the counit law of the directed comonad ([Section](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md)): $\varepsilon_V \circ \gamma_p = \mathrm{id}_p$ — after the stepping map advances $p$'s state and the counit restricts it back, $p$'s assignment is unchanged. Perfect enrollment: the person coheres with the vessel across time.

## The section reading

[Section](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md) in the fibration sense: given the role fibration $\pi : \mathrm{Crew} \to \mathrm{Roles}(V)$ that projects each crew member to their assigned role, an enrollment of $p$ into role $r$ is a section $s_r : \{r\} \to \mathrm{Crew}$ with $\pi \circ s_r = \mathrm{id}_{\{r\}}$. The section assigns to the position $r$ the person $p = s_r(r)$ who fills it.

The section condition is the minimal structural occupancy condition. It says:
- $p$ is in the correct fiber (the role $r$ position in $V$)
- The assignment is right-invertible: knowing the role, you can recover the person

The section condition says nothing about dynamics (how $p$ came to be enrolled), obligation (whether $p$ is fulfilling their duties), or performance (how well $p$ is executing role $r$). Those dimensions are added by [Duty](../domains/governance/terms/duty.md) (the deontic obligations of the role), [Discharge](../../../../services/governance-services-section/content/text/glossary/terms/discharge.md) (performance recognition), and [Serving](./serving.md) (the ongoing act of service).

## Enrollment vs. investiture

[Investiture](../../../../../../../../content/text/glossary/terms/investiture.md) installs an agent into a **formal office** with a Hohfeldian deontic profile — a position in the normative system. Enrollment installs a person into a **role in a crew** for a bounded operational period. The structures are related but distinct:

| Dimension | Investiture | Enrollment |
|---|---|---|
| Scope | Formal office with deontic profile | Operational role in a vessel's complement |
| Duration | Until relief act $I^{-1}$ | Bounded by operational period $T$ |
| Constituting act | Installation ceremony / orders | Articles of agreement / duty assignment |
| What persists | The office and its deontic profile | The vessel's complement schema |
| Math grounding | Section of duty-fibration | Section of role-fibration |

A commanding officer is both invested (holds a formal command office) and enrolled (serves as crew for the voyage). For ordinary crew, enrollment creates the role-section; investiture into the command office is the additional step that creates the authority section.

## Discharge of enrollment

The section status terminates when the discharge predicate $\delta_p$ is satisfied:
- **Voyage completion**: the articles of agreement close at the end of $T$; all crew sections lapse simultaneously
- **Individual relief**: $p$ is relieved from their role; the section $s_r \mapsto p$ is replaced by $s_r \mapsto p'$ for the relief crew member $p'$
- **Death or incapacity**: the section lapses; the role position becomes vacant; complement coverage may fail

At discharge, $p$ leaves the crew fiber for $V$ and returns to the pool of persons. The vessel $V$ continues; the section $s_r$ is vacant until a new enrollment fills it.

## Math grounding

The enrollment structure grounds in two math concepts:

**[Section](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md)**: the abstract section condition $p \circ s = \mathrm{id}$ is what enrollment instantiates. The role fibration $\pi : \mathrm{Crew}(V) \to \mathrm{Roles}(V)$ is the fibration; enrollment is the section. The counit law ($\varepsilon_X \circ \gamma = \mathrm{id}_X$) is the period-coherence condition: the enrolled person's assignment advances with the vessel's history and restricts correctly.

**[Natural Transformation](../../../../../../humanities/domains/math/domains/categories/domains/ordinary-categories/terms/natural-transformation.md)**: a person's enrollment across the operational period $T$ is a natural transformation $p_T : \mathbf{1} \Rightarrow \mathrm{Crew}(V, -)$ from the terminal presheaf to the crew presheaf — a coherent assignment of $p$ to the vessel's crew at every history in $T$, compatible with the restriction maps.

## Open questions

- Whether collective enrollment (all crew members signing articles simultaneously) is the categorical product of individual enrollments, or whether the articles constitute the crew as a unit (a limit of the individual sections) with additional coherence conditions not present in the product.
- Whether the minimum complement condition $|\mathrm{Crew}(V,T)| \geq k$ has a formal expression in terms of the section coverage: whether a vessel below minimum complement fails to have a jointly surjective family of sections — and whether joint surjectivity is a covering condition in the site topology $J$ of the vessel.
- Whether enrollment into command position (the first officer or captain's section) has a special structure — a distinguished section among the crew sections — and whether the distinction corresponds to the section being in $H^*_{t^*}$ (doubly settled) rather than merely in $H_{t^*}$.

- Whether collective enrollment (all crew members signing articles simultaneously) is the categorical product of individual enrollments, or whether the articles constitute the crew as a unit (a limit of the individual sections) with additional coherence conditions not present in the product.
- Whether the minimum complement condition $|\mathrm{Crew}(V,T)| \geq k$ has a formal expression in terms of the section coverage: whether a vessel below minimum complement fails to have a jointly surjective family of sections — and whether joint surjectivity is a covering condition in the site topology $J$ of the vessel.
- Whether enrollment into command position (the first officer or captain's section) has a special structure — a distinguished section among the crew sections — and whether the distinction corresponds to the section having reached affirming joint settlement (full installation) rather than merely being a candidate.
