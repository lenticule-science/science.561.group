---

name: "MacroFocus"
description: "A MacroFocus is a pointed presheaf (H, t*) considered at the fiber level — a RelationalState H with a designated focal history t* ∈ T — whose primary output is the Gurwitsch tripartite field: the theme H_{t*}, the thematic field {H_t : t < t*} of restriction-accessible fibers, and the margin of co-present but inaccessible fibers. MacroFocus is Level 1 of the three-level focus stack: it answers 'which fiber is the current working context' and is the precondition for MesoFocus and MicroFocus."
date-created: 2026-03-20
---

## Formal definition

A **MacroFocus** is a pointed presheaf $\mathcal{F}_{\mathrm{mac}} = (H, t^*)$:

$$\mathcal{F}_{\mathrm{mac}} = (H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}},\; t^* \in T)$$

where: - $H$ is the **ambient presheaf** — the full [RelationalState](../../../../../../humanities/theories/philosophy/theories/relating/terms/relational-state.md): the family of fiber Heyting algebras $(H_t)_{t \in T}$ connected by restriction maps $\rho_{t'|t} : H_{t'} \to H_t$ for $t \leq t'$; each fiber carries the commuting nuclear pair $(\sigma_t, \Delta_t)$ - $t^* \in T$ is the **focal history** — the designated current position in the history category $T$

A MacroFocus IS a [Focus](./focus.md) — the pair $(H, t^*)$ is identical.
MacroFocus names this structure at **Level 1 of the three-level focus stack**: the fiber-level designation.
It answers the question: *which fiber is the current working context?* The answer is $H_{t^*}$.

**Four invariants.** $\mathcal{F}_{\mathrm{mac}}$ is a macrofocus iff it satisfies:

1. **Designation**: $t^*$ is a specific named element of $T$, not a generic placeholder or existential witness.
  Without a specific $t^*$, the presheaf $H$ is ambient and unfocused.
  Designation is the minimal act of focus: before any sub-fiber structure is resolved, the fiber is picked.

2. **Fiber accessibility**: $H_{t^*}$ is an object in the presheaf — a Heyting algebra with commuting nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$ — accessible as an object in the category of fibers.
  A MacroFocus is not a claim about what is inside $H_{t^*}$; it is purely the selection of $H_{t^*}$ from the presheaf.

3. **Gurwitsch tripartition**: the designation $t^*$ induces a partition of $H$ into three mutually exclusive parts:
   - **Theme** $\mathcal{T} = H_{t^*}$: the designated working fiber
   - **Thematic field** $\mathcal{TF} = \{(t, H_t, \rho_{t^*|t}) : t < t^*\}$: the restriction-accessible fibers, each equipped with a restriction map from $H_{t^*}$; these are the MacroFocus's **context**
   - **Margin** $\mathcal{M} = \{(t, H_t) : t \not\leq t^*\}$: fibers that exist in $H$ but have no restriction path from $H_{t^*}$; co-present but inaccessible

The tripartition is a structural consequence of the designation — it is not an additional choice.

4. **Horizon completeness**: the margin $\mathcal{M}$ is the **horizon** of the MacroFocus — the set of fibers currently inaccessible that could become thematic by a refocusing operation.
  The full presheaf $H$ equals $H_{t^*}$ together with $\mathcal{TF}$ and $\mathcal{M}$; the MacroFocus $(H, t^*)$ is recoverable (via sheaf gluing / accord) from $H_{t^*}$ and $\mathcal{TF}$ alone only for the restriction-accessible portion.
  The horizon cannot be reconstructed without an explicit refocusing.

## The zipper reading

A MacroFocus $(H, t^*)$ is a **zipper** on the presheaf $H$ in the sense of Huet (1997): a data structure traversal that designates one element as the current focus and encodes the surrounding structure as context, with a plug invariant ensuring nothing is lost.

- **Focus** = $H_{t^*}$ (the currently selected fiber — the zipper's cursor)
- **Context** = $\mathcal{TF}$ together with restriction maps (the path "breadcrumbs" from the root down to $t^*$)
- **Plug invariant**: $H|_{\downarrow t^*} = \mathrm{glue}(H_{t^*},\; \mathcal{TF})$ via the accord/sheaf-gluing condition — the restriction-accessible portion of $H$ is fully recoverable; the horizon $\mathcal{M}$ is the part the zipper has not visited

The zipper reading makes the operational meaning of MacroFocus precise: a MacroFocus is a position in the presheaf, not a global state.
It localizes computation to $H_{t^*}$ while keeping the full structure reachable via the context.

## Refocusing operations

A MacroFocus can be **refocused** — its $t^*$ changed — in three structurally distinct ways:

**Forward extension** $(H, t^*) \to (H', t')$ where $t' = s \star t^*$: - Extends the history by a generator $s$; produces a new fiber $H_{t'}$ that extends $H_{t^*}$ - The old theme $H_{t^*}$ moves from theme to thematic field (it is now $t' > t^*$, so $t^* < t'$ and $H_{t^*} \in \mathcal{TF}$ of the new focus) - This is the [RelationalMachine](relational-machine.md)'s step operation - The new margin may be larger or smaller than the old margin depending on $T$'s structure

**Backward restriction** $(H, t^*) \to (H, t)$ where $t < t^*$: - Retreats to a fiber currently in the thematic field; makes an accessible fiber the new theme - The old $H_{t^*}$ moves from theme to the *margin* of the new focus (since $t^* \not\leq t$ when $t < t^*$ in a non-trivial partial order) - This is context inspection: moving focus into the accessible context - The thematic field shrinks: only fibers below $t$ are now accessible

**Lateral shift** $(H, t^*) \to (H, t^{**})$ where $t^{**} \not\leq t^*$ and $t^* \not\leq t^{**}$: - Moves to a fiber currently in the margin — a fiber not restriction-accessible from $t^*$ - Requires a genuinely new focus, since the new thematic field $\downarrow t^{**}$ may be disjoint from $\downarrow t^*$ - Context is not preserved: the old thematic field is not (in general) the new thematic field - This is a **hard context switch** — unlike forward extension or backward restriction, which preserve context continuity

## MacroFocus as the Level-1 question

In the three-level focus stack from [Focus](./focus.md), MacroFocus is Level 1.
The three levels answer three distinct questions:

| Level | Answers | Math object |
|---|---|---|
| **Level 1** (MacroFocus) | *Which fiber is the current working context?* | $(H, t^*)$ — pointed presheaf |
| **Level 2** ([MesoFocus](./mesofocus.md)) | *What is settled within the working fiber?* | $(H_{t^*}, j, \mathrm{Fix}(j))$ — nuclear sublocale |
| **Level 3** ([MicroFocus](./microfocus.md)) | *What specific element is being processed now?* | $(H_{t^*}, a^*)$ — designated element |

A MacroFocus is a precondition for both MesoFocus and MicroFocus: you must know which fiber is active before asking what is settled within it or which element is being processed.
But MacroFocus does not uniquely determine a MesoFocus (there may be multiple nuclei on $H_{t^*}$) or a MicroFocus (any element of $H_{t^*}$ could be designated).

## Aron Gurwitsch: the tripartite phenomenal field

Aron Gurwitsch (*The Field of Consciousness*, Pittsburgh: Duquesne University Press, 1964; repr. in *Collected Works of Aron Gurwitsch*, vol.
III, ed. Richard M.
Zaner, Dordrecht: Springer, 2010) provided the formal account of consciousness as a structured field rather than a punctate spotlight:

**The three zones**: every moment of directed attention constitutes a field with three formally distinguishable zones: - **Theme**: the item that is the center of attention — the focal content, maximally determinate, upon which the current cognitive act is directed; the theme has the most vivid, most fully articulated presence; it is what the act is *about* - **Thematic Field**: items that are co-present with the theme and stand in a relation of **intrinsic relevance** to it — they are not currently attended but are organized *around* the theme as its immediate context; the thematic field is structured (organized by Gestalt laws operating relative to the theme) and its items are relevant to the theme in virtue of their content, not merely their proximity - **Margin**: items that are co-present but stand in no intrinsic relevance relation to the theme — they are "there" in consciousness as background but exert no organizational pull on the theme; the margin is unorganized relative to the current act

**Formal criteria** (Gurwitsch, *Field of Consciousness*, ch. 1): 1.
The tripartition is **exhaustive and exclusive**: every item in the phenomenal field is in exactly one zone; no item is simultaneously in two zones 2.
The tripartition is **theme-relative**: moving the theme (shifting attention) reorganizes the entire field; what was in the thematic field may move to theme or margin; the zones are not fixed properties of items but are constituted by the current act of attention 3.
The thematic field is defined by **intrinsic relevance**: its items are there *as* context for the theme; relevance is a matter of content-organization (not spatial proximity), explained by the Gestalt organizational laws 4.
The margin is defined by **absence of intrinsic relevance**: its items are experienced as background, not as context; they are present but without organization relative to the current theme

**MacroFocus as Gurwitsch's field**: the MacroFocus $(H, t^*)$ instantiates Gurwitsch's tripartite field at the presheaf level.
The full presheaf $H$ is the phenomenal field; designation of $t^*$ constitutes the Theme ($H_{t^*}$), Thematic Field ($\mathcal{TF}$ — restriction-accessible fibers, each intrinsically relevant via restriction maps), and Margin ($\mathcal{M}$ — remaining fibers, co-present but without restriction paths from $H_{t^*}$) simultaneously.
MacroFocus is the scale at which Gurwitsch's partition first becomes visible — MesoFocus and MicroFocus operate *inside* the Theme; MacroFocus is the level that sees all three zones at once.

**Attention shifts as field reorganization**: Gurwitsch argued that consciousness is dynamic — the field is always reorganizing as attention moves.
The three refocusing operations (forward extension, backward restriction, lateral shift) are field reorganizations in Gurwitsch's sense.
Each refocusing reconstitutes the tripartite partition: forward extension makes the old Theme part of the new Thematic Field; lateral shift makes a formerly Marginal fiber the new Theme; backward restriction makes the old Theme Marginal (since $t^* \not\leq t$ when moving to $t < t^*$).
The field does not merely repoint — it structurally reconstitutes.

## Open questions

- Whether the three refocusing operations (forward extension, backward restriction, lateral shift) can be given a categorical presentation as morphisms in a category of MacroFoci over $H$ — and whether the composition of such morphisms is well-typed (a composition of a forward extension followed by a backward restriction returns to the original position, but through a different path).
- Whether a MacroFocus determines a **canonical MesoFocus**: the natural candidate is $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$, but this uses the machine's nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$ which is present in every fiber by the relational universe structure — so the canonical MesoFocus may always exist and be unique.
- Whether the **horizon** $\mathcal{M}$ carries a natural structure — whether the set of margin fibers can be equipped with an ordering or metric that captures their "distance" from the current focus, giving a formal notion of how many refocusing steps are needed to reach each marginal fiber.
