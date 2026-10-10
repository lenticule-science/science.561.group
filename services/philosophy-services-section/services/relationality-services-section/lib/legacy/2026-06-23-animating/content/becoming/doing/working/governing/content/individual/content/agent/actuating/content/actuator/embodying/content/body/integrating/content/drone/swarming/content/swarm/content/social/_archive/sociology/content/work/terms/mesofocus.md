---

name: "MesoFocus"
description: "A MesoFocus is a triple (H_{t*}, j, Fix(j)) — a focal fiber H_{t*}, a nucleus j on that fiber, and the fixed sub-Heyting-algebra Fix(j). MesoFocus is Level 2 of the three-level focus stack: it answers 'what is settled within the current working fiber' and presupposes a MacroFocus designation. The canonical instance is the nuclear focal sublocale H*_{t*} = Fix(π_{t*}) from the machine's own nuclear pair; non-canonical instances include character mesofocus F_χ and jurisdiction mesofocus. MesoFocus is the sub-algebraic partition of the working fiber into a focal region and an unsettled complement."
date-created: 2026-03-20
---

## Formal definition

A **MesoFocus** is a triple $\mathcal{F}_{\mathrm{mes}} = (H_{t^*}, j, \mathrm{Fix}(j))$:

$$\mathcal{F}_{\mathrm{mes}} = (H_{t^*} : \mathbf{HA}_{\mathrm{nucl}},\; j : H_{t^*} \to H_{t^*},\; \mathrm{Fix}(j) \subseteq H_{t^*})$$

where: - $H_{t^*}$ is the **focal fiber** — the Heyting algebra obtained from a [MacroFocus](./macrofocus.md) $(H, t^*)$ at the designated history $t^*$; it carries the relational universe's nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$ - $j : H_{t^*} \to H_{t^*}$ is the **focal nucleus** — an internal nuclear endomorphism on $H_{t^*}$: idempotent ($j \circ j = j$), monotone ($a \leq b \Rightarrow j(a) \leq j(b)$), inflationary ($a \leq j(a)$), and a Heyting algebra endomorphism ($j(a \wedge b) = j(a) \wedge j(b)$) - $\mathrm{Fix}(j) = \{a \in H_{t^*} : j(a) = a\}$ is the **focal sublocale** — the sub-Heyting-algebra of elements already at their $j$-closure; in locale theory, this is the **closed sublocale** defined by $j$; it is the "settled" region of $H_{t^*}$ relative to the nucleus $j$

A MesoFocus presupposes a MacroFocus: the fiber $H_{t^*}$ exists only after $t^*$ has been designated.
A MesoFocus does not refine the designation $t^*$ — it operates **within** the already-designated fiber.
It answers: *what is settled here?*

**Four invariants.** $\mathcal{F}_{\mathrm{mes}}$ is a mesofocus iff it satisfies:

1. **Fiber containment**: $\mathrm{Fix}(j) \subseteq H_{t^*}$ — the focal sublocale is a subset of the working fiber.
  MesoFocus is always a sub-structure of the MacroFocus's theme; it cannot extend beyond $H_{t^*}$.

2. **Nuclear condition**: $j$ is a nucleus on $H_{t^*}$ — not merely a function, but an idempotent inflationary monotone Heyting endomorphism.
  This ensures $\mathrm{Fix}(j)$ is a Heyting algebra in its own right (a sublocale of $H_{t^*}$) and that $j$ is the retraction of $H_{t^*}$ onto $\mathrm{Fix}(j)$.

3. **Non-triviality**: $\mathrm{Fix}(j) \neq \emptyset$ — the focal sublocale is non-empty.
  Since $j$ is inflationary and $H_{t^*}$ is a Heyting algebra, $\top \in \mathrm{Fix}(j)$ always (because $j(\top) = \top$ by the Heyting algebra endomorphism condition).
  So non-triviality is automatic; it is stated explicitly as an invariant to mark that the mesofocus is never degenerate.

4. **Closure completeness**: every $a \in H_{t^*}$ reaches $\mathrm{Fix}(j)$ via $j$ in one step — $j(a) \in \mathrm{Fix}(j)$ for all $a$.
  This follows from idempotence: $j(j(a)) = j(a)$.
  The focal sublocale is not a distant attractor; every point maps directly into it.

## Canonical instances

The focal nucleus $j$ is not uniquely determined by the MacroFocus $(H, t^*)$.
Different choices of $j$ yield different MesoFoci on the same working fiber.
Three canonical instances:

**Nuclear MesoFocus** (canonical, always present): $$\mathcal{F}_{\mathrm{mes}}^{\mathrm{nuc}} = (H_{t^*},\; \pi_{t^*},\; H^*_{t^*})$$ where $\pi_{t^*} = \sigma_{t^*} \circ \Delta_{t^*}$ is the composite of the relational universe's two commuting nuclei, and $H^*_{t^*} = \mathrm{Fix}(\pi_{t^*}) = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$ is the jointly settled sublocale.
This is the MesoFocus that is structurally guaranteed by the relational universe — every MacroFocus has a nuclear MesoFocus as a canonical sub-structure.

The nuclear MesoFocus is what Focus.md calls the "focal sublocale" and the "hearth": the joint fixed point toward which both nuclear closures converge.
It is the machine's own settled region.

**Character MesoFocus** (present when a [Character](../../../../writing/theories/fiction/terms/character.md) is in play): $$\mathcal{F}_{\mathrm{mes}}^{\chi} = (H_{t^*},\; \chi,\; F_\chi)$$ where $\chi : H_{t^*} \to H_{t^*}$ is the character nucleus from the [Character](../../../../writing/theories/fiction/terms/character.md) spec, and $F_\chi = \mathrm{Fix}(\chi)$ is the behavioral space.
The character MesoFocus identifies the sub-region of the working fiber that is *in character* — where the agent's behavioral dispositions are satisfied.

When a [Persona](persona.md) is installed, the character MesoFocus and nuclear MesoFocus interact.
The intersection $F_\chi \cap H^*_{t^*}$ is the **behavioral settled region** — where the agent is both normatively settled and acting in character.
This is the prosōpon (the presented face) from the Persona spec.

**Jurisdiction MesoFocus** (present when a [Jurisdiction](../../legalism/terms/jurisdiction.md) restricts the working fiber): $$\mathcal{F}_{\mathrm{mes}}^{\mathcal{J}} = (H_{t^*},\; j^{\mathcal{J}},\; \mathrm{Fix}(j^{\mathcal{J}}))$$ where $j^{\mathcal{J}}$ is the nucleus associated with the jurisdiction's sub-topos inclusion; $\mathrm{Fix}(j^{\mathcal{J}})$ is the sub-Heyting-algebra of propositions within the jurisdiction's scope.

## Settlement reading

The MesoFocus divides $H_{t^*}$ into two regions:

| Region | Content | Interpretation |
|---|---|---|
| $\mathrm{Fix}(j)$ | Elements where $j(a) = a$ | Already settled by $j$; the "done" region |
| $H_{t^*} \setminus \mathrm{Fix}(j)$ | Elements where $j(a) \neq a$ | Not yet settled; the "work" region |

The nucleus $j$ is a retraction: every element in the work region maps to its settlement in one step.
The MesoFocus is the dividing line between what has been resolved and what remains open **within the current working fiber**.

This is the settlement reading that the nucleus-sorting math (from `nucleus-sorting.md`) performs: the sorter $(σ_t, Δ_t)$ classifies elements as both-stable ($H^*_t$), backward-stable-only ($\mathrm{Fix}(\sigma_t) \setminus H^*_t$), or neither — and the MesoFocus is the formal name for the result of this classification at the chosen nucleus.

## Relation to information bottleneck

In information theory, the **Information Bottleneck** (Tishby et al., 1999) compresses an input $X$ to a representation $T$ that retains relevance $Y$ while minimizing redundancy.
The compressed representation $T$ is the "relevant" region: the portion of $X$ that matters for $Y$.
The IB focal sublocale is exactly $\mathrm{Fix}(j_{\mathrm{IB}})$ where $j_{\mathrm{IB}}$ is the relevance-maximizing compression nucleus.

In the relational universe: the nuclear MesoFocus $H^*_{t^*}$ is the IB-compressed representation of $H_{t^*}$ under the machine's own nuclear pair — the region that is both meaning-settled ($\sigma$-stable) and transfer-settled ($\Delta$-stable).
The unsettled complement $H_{t^*} \setminus H^*_{t^*}$ is the "redundant" region: it has not yet been compressed to relevance by the two nuclear closures.

## MesoFocus as the Level-2 question

In the three-level focus stack from [Focus](./focus.md), MesoFocus is Level 2:

| Level | Answers | Math object |
|---|---|---|
| **Level 1** ([MacroFocus](./macrofocus.md)) | *Which fiber is the current working context?* | $(H, t^*)$ — pointed presheaf |
| **Level 2** (MesoFocus) | *What is settled within the working fiber?* | $(H_{t^*}, j, \mathrm{Fix}(j))$ — nuclear sublocale |
| **Level 3** ([MicroFocus](./microfocus.md)) | *What specific element is being processed now?* | $(H_{t^*}, a^*)$ — designated element |

A MesoFocus presupposes a MacroFocus but does not require a MicroFocus.
A MesoFocus does not uniquely determine a MicroFocus: knowing that $\mathrm{Fix}(j)$ is the settled region does not pick out one element for processing — it identifies a sub-Heyting-algebra, not a point.

## Aron Gurwitsch and Max Wertheimer: the thematic field as Gestalt-organized co-relevance

Aron Gurwitsch (*The Field of Consciousness*, 1964, chs.
2–3) gave the definitive analysis of the Thematic Field — the middle zone whose items are co-present with the Theme and stand in intrinsic relevance to it:

**Intrinsic relevance** (Gurwitsch, ch. 2): the Thematic Field consists of items that are **relevantly related** to the Theme — related in virtue of their content, not merely their spatial or temporal proximity.
The relevance is intrinsic: it belongs to the items' own nature as organized around the Theme.
Gurwitsch's central claim: the Thematic Field is not a formless halo but an **organized structure** whose organization mirrors the Theme's own structure.
Items in the Thematic Field are experienced as context-for-the-Theme, not as mere background.

**Gestalt organization of co-relevance**: the specific organizational principles that determine which items count as intrinsically relevant are the Gestalt laws identified by Max Wertheimer (*Untersuchungen zur Lehre von der Gestalt*, 1923, *Psychologische Forschung* 4:301–350).
Wertheimer formulated the laws of perceptual grouping as answers to the question: *why do certain elements form a unified percept?* His laws: 1. **Proximity**: elements close together (in the relevant metric) tend to group; applied to the thematic field, nearby items are more likely to be intrinsically relevant 2. **Similarity**: elements sharing features (color, shape, pitch, semantic class) tend to group; items similar to the Theme are in the Thematic Field 3. **Good continuation**: elements following the Theme's own structural direction tend to remain in the Thematic Field; they extend the Theme's organization rather than interrupting it 4. **Closure**: elements that together complete a structure implied by the Theme group into the Thematic Field 5. **Prägnanz** (the master law): of all possible organizations, the simplest and most stable prevails; the Thematic Field takes the most organized, most regular form consistent with the Theme

**Formal correspondence** in the relational universe: the Thematic Field $\mathcal{TF} = \{(t, H_t, \rho_{t^*|t}) : t < t^*\}$ is organized by the structure of the history category $T$ and the restriction maps.
Proximity is the ordering of $T$: fibers immediately below $t^*$ are most proximate.
Similarity is the content-closeness of restriction map images: fibers $H_t$ whose image $\rho_{t^*|t}(H_{t^*})$ closely resembles $H_{t^*}$ are most similar to the Theme.
Good continuation is the directional coherence of restriction maps: they carry structure consistently downward from $H_{t^*}$.
Prägnanz is the nuclear focal sublocale $H^*_{t^*}$: the maximally settled, maximally organized sub-structure of the Theme — the Gestalt-simplest region of the fiber, the joint fixed point toward which both nuclear closures converge.

**MesoFocus as inward Thematic Field**: the MesoFocus $(H_{t^*}, j, \mathrm{Fix}(j))$ is the Thematic Field *within* the Theme.
The settled sublocale $\mathrm{Fix}(j)$ is the sub-region of $H_{t^*}$ that is organized by the $j$-closure — the portion of the Theme made Gestalt-simple by the nucleus.
The unsettled complement $H_{t^*} \setminus \mathrm{Fix}(j)$ is the inward margin: co-present within the Theme but not yet organized into relevance by the nuclear closure.
In this sense MesoFocus takes the Gurwitsch field one level inward: it is the tripartite partition *of the Theme itself* into its own focal region (the settled sublocale) and its own background (the unsettled complement).

## Open questions

- Whether there is a natural **partial order on MesoFoci** over a fixed working fiber $H_{t^*}$: two MesoFoci $\mathcal{F}^1_{\mathrm{mes}} = (H_{t^*}, j_1, \mathrm{Fix}(j_1))$ and $\mathcal{F}^2_{\mathrm{mes}} = (H_{t^*}, j_2, \mathrm{Fix}(j_2))$ could be ordered by $\mathrm{Fix}(j_1) \subseteq \mathrm{Fix}(j_2)$ (finer vs. coarser settlement); whether this is the right order and what its lattice-theoretic properties are.
- Whether the **character MesoFocus** $F_\chi$ is necessarily a sublocale of the nuclear MesoFocus $H^*_{t^*}$ — whether full character expression always requires normative settlement — or whether the two MesoFoci are independent and their intersection is the operative constraint.
  The Persona spec leaves this open; the formal question is whether $\chi$ commutes with $\pi_{t^*}$.
- Whether there is a **canonical choice of MicroFocus** given a MesoFocus: whether the focal sublocale $\mathrm{Fix}(j)$ generates a preferred element for $\Delta$-propagation — for instance, the least upper bound of all $j$-stable elements, or the $j$-image of the current active element — or whether element designation at Level 3 is always independent.
- Whether **MesoFocus transitions** — changes in the focal nucleus $j$ while the MacroFocus $(H, t^*)$ is held fixed — can be given a formal treatment as morphisms in a category of MesoFoci over $H_{t^*}$, and whether the transition from character MesoFocus to nuclear MesoFocus (when a character is acquired or shed) has a canonical direction.
