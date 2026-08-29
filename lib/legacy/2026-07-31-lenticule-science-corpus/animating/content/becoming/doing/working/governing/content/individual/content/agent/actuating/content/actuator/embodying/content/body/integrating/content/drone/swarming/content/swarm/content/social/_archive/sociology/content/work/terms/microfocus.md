---

title: "MicroFocus"
description: "A MicroFocus is a pair (H_{t*}, a*) — a focal fiber H_{t*} and a designated element a* ∈ H_{t*}. MicroFocus is Level 3 of the three-level focus stack: it answers 'what specific proposition is being processed right now' and presupposes a MacroFocus designation. The canonical role of a* is as the Andreoli synchronous-phase formula: the single element designated for Δ-propagation, the locus of irreducible non-determinism in the machine's current processing step. MicroFocus is the finest-grained level of focus — a single point in the working fiber."
defines: MicroFocus
related: Focus, MacroFocus, MesoFocus, Character, RelationalMachine, RelationalState
date-created: 2026-03-20
---

## Formal definition

A **MicroFocus** is a pair $\mathcal{F}_{\mathrm{mic}} = (H_{t^*}, a^*)$:

$$\mathcal{F}_{\mathrm{mic}} = (H_{t^*} : \mathbf{HA}_{\mathrm{nucl}},\; a^* \in H_{t^*})$$

where: - $H_{t^*}$ is the **focal fiber** — the Heyting algebra obtained from a [MacroFocus](./macrofocus.md) $(H, t^*)$; it carries the commuting nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$ - $a^* \in H_{t^*}$ is the **focal element** — the specific designated proposition currently under active processing; not a set, not a sublocale, but a single element of the fiber

A MicroFocus presupposes a MacroFocus: $H_{t^*}$ exists only after $t^*$ has been designated.
A MicroFocus does not presuppose a MesoFocus: element designation does not require prior settlement classification, though the relationship between $a^*$ and $\mathrm{Fix}(j)$ is operationally significant (see below).

A MicroFocus answers: *what am I working on right now?*

**Four invariants.** $\mathcal{F}_{\mathrm{mic}}$ is a microfocus iff it satisfies:

1. **Element containment**: $a^* \in H_{t^*}$ — the focal element is a member of the working fiber; it is not a formula from another fiber, not a restriction map, not a sublocale.
  The MicroFocus is always fiber-local.

2. **Singleness**: the MicroFocus designates exactly one element.
  This distinguishes MicroFocus from MesoFocus (which designates a sub-Heyting-algebra $\mathrm{Fix}(j)$, possibly infinite) and from MacroFocus (which designates a whole fiber $H_{t^*}$).
  The singleness is what makes MicroFocus "micro": it is the finest-grained possible designation within the focal fiber.

3. **$\Delta$-accessibility**: $a^*$ is available for $\Delta_{t^*}$-propagation — the operation of making $a^*$ transfer-stable.
  In Andreoli's terminology, $a^*$ is in the **synchronous phase**: it is the formula currently being decomposed non-invertibly.
  This means $\Delta_{t^*}(a^*)$ is defined and $\Delta_{t^*}(a^*) \geq a^*$ (inflation).
  The MicroFocus is the target of the machine's current non-deterministic commitment.

4. **Context is the rest**: all elements of $H_{t^*}$ other than $a^*$ are **context** for the MicroFocus.
  The MicroFocus is not isolated — it is $a^*$ plus the implicit context $H_{t^*} \setminus \{a^*\}$ — but the potential processing is directed at $a^*$ alone.
  This mirrors the Andreoli invariant: when the focused formula is $a^*$, all other formulas wait.

## The $\Delta$-propagation reading

The canonical operation on a MicroFocus $(H_{t^*}, a^*)$ is $\Delta_{t^*}$-propagation:

$$\mathcal{F}_{\mathrm{mic}} = (H_{t^*}, a^*) \;\xrightarrow{\Delta_{t^*}}\; \Delta_{t^*}(a^*)$$

$\Delta_{t^*}(a^*)$ is the transfer-stabilization of $a^*$: the smallest element of $\mathrm{Fix}(\Delta_{t^*})$ that is $\geq a^*$.
After propagation: - If $a^* \in \mathrm{Fix}(\Delta_{t^*})$ already: $\Delta_{t^*}(a^*) = a^*$ — the microfocus is already transfer-stable; propagation is a no-op - If $a^* \notin \mathrm{Fix}(\Delta_{t^*})$: $\Delta_{t^*}(a^*) > a^*$ — propagation strictly increases $a^*$, moving it toward $H^*_{t^*}$

After $\Delta_{t^*}$-propagation, the MicroFocus has been resolved: $a^*$ has been made transfer-stable.
The machine typically then selects a new MicroFocus — the next element requiring $\Delta$-attention — or exits the synchronous phase.

## The Andreoli phase duality

Andreoli's focused proof theory (1992) divides proof-search into two alternating phases.
In the relational universe, these phases map onto the nuclear pair:

| Andreoli phase | Operation | Mode | Corresp. focus level |
|---|---|---|---|
| **Asynchronous** | $\sigma_{t^*}$-closure | Deterministic; applies to all propositions eagerly; order-irrelevant | [MesoFocus](./mesofocus.md): settling the sublocale $H^*_{t^*}$ |
| **Synchronous** | $\Delta_{t^*}$-propagation on $a^*$ | Non-deterministic; designates one element; the irreducible choice | MicroFocus: the focused element $a^*$ |

The **synchronous phase** is the phase where MicroFocus is operative.
In the asynchronous phase, processing is holistic — the $\sigma_{t^*}$-closure is applied to the entire fiber without needing to pick one element.
In the synchronous phase, processing is local — one element $a^*$ is designated, and the machine commits to making it transfer-stable.

The selection of $a^*$ for the synchronous phase is the machine's irreducible non-deterministic commitment.
Different choices of $a^*$ yield different $\Delta$-propagation outcomes; this is where branching computation (different possible executions) enters the relational universe.

**Andreoli's completeness theorem** maps onto: every element of $H_{t^*}$ can be brought to $H^*_{t^*}$ through a finite alternation of $\sigma$-asynchronous phases and $\Delta$-synchronous phases.
The MicroFocus is the vehicle of progress in each synchronous phase.

## Relation to MesoFocus

A MicroFocus $(H_{t^*}, a^*)$ and a MesoFocus $(H_{t^*}, j, \mathrm{Fix}(j))$ over the same working fiber $H_{t^*}$ interact in four ways:

| Case | Condition | Interpretation |
|---|---|---|
| $a^* \in \mathrm{Fix}(j)$ | Focal element is already $j$-settled | Processing an element already within the focal sublocale; confirmation or refinement |
| $a^* \notin \mathrm{Fix}(j)$ | Focal element is outside the focal sublocale | Active work: bringing $a^*$ into settlement; the MicroFocus is on an unsettled element |
| $a^* = j(b)$ for some $b$ | Focal element is the $j$-image of some other element | Processing the settlement-output of a prior propagation |
| $a^* \in \partial \mathrm{Fix}(j)$ | Focal element is on the boundary | The element that, once $\Delta$-propagated, would enter $\mathrm{Fix}(j)$ — the most productive microfocus |

The canonical MicroFocus for **productive work** selects $a^* \in \mathrm{Fix}(\sigma_{t^*}) \setminus H^*_{t^*}$: an element that is meaning-settled (so $\sigma_{t^*}$ has finished with it) but not yet transfer-settled (so $\Delta_{t^*}$ still has work to do).
This is the element at the boundary between the MesoFocus's focal sublocale and its complement — the most efficient target for $\Delta$-propagation.

## William James, Edgar Rubin, and Edmund Husserl: the theme as maximal determinacy

Three convergent accounts identify the focal element $a^* \in H_{t^*}$ as the formally most determinate item in the current field:

**William James: the substantive part** (*The Principles of Psychology*, 1890, ch. IX): James identified the **substantive part** of the stream of thought as the resting-place — the moment when a definite, nameable content is held in mind.
The substantive part is maximal in the following sense: it is as determinate as the current act of attention can make it.
Further determination would require a new act; the substantive part is the *completed* determination of one focal moment.
The part can be held: unlike the transitive parts (the flights between resting-places, which dissolve on inspection), the substantive part endures as an object of examination.

**Formal correspondence**: $a^* \in H_{t^*}$ is a substantive part — a specific named element of the fiber, held in focus during the synchronous phase of $\Delta$-propagation.
The $\Delta_{t^*}$-propagation of $a^*$ is the operation of making the substantive part as determinate as the nucleus can make it: $\Delta_{t^*}(a^*)$ is the maximally $\Delta$-determined version of $a^*$, its transfer-stable completion.

**Edgar Rubin: figure, contour, and owned boundary** (*Synsoplevede Figurer*, 1915; German: *Visuell Wahrgenommene Figuren*, 1921): Rubin established that the figure (the focal item in perception) has three defining properties absent from the ground: - **Thing-like quality**: the figure is experienced as an object with a defined outline; the ground is experienced as formless substance extending behind - **Contour ownership**: the shared boundary between figure and ground belongs to the figure; the figure's shape is defined by that contour; the ground's boundary at the same edge is undefined - **Depth precedence**: the figure appears in front of the ground in perceived depth

Rubin's **reversal experiment** (the faces-vase illusion): the same physical contour admits two figure-ground assignments, but only one at a time.
The perceptual organization is **bistable** — the contour belongs to one figure or the other, not both simultaneously.

**Formal correspondence**: the focal element $a^* \in H_{t^*}$ is the figure in the MicroFocus.
The "contour" of $a^*$ is its position in the fiber lattice: the set of relations $\{b \in H_{t^*} : b \leq a^*\}$ and $\{b \in H_{t^*} : b \geq a^*\}$ define the shape of $a^*$ in the Heyting algebra.
The **singleness invariant** is Rubin's contour-ownership condition: exactly one element owns the current computational boundary.
The bistability of the Rubin vase corresponds to the MicroFocus selection: the same fiber $H_{t^*}$ admits multiple choices of $a^*$, but the machine commits to exactly one in each synchronous phase.

**Edmund Husserl: inner horizon and primal impression** (*Experience and Judgment*, 1939, §§8–21; *On the Phenomenology of the Consciousness of Internal Time*, Hua X, §§10–21): Husserl identified two structural properties of every focal element: - **Primal impression** (Urimpression, Hua X §11): the element is given with **absolute presence** — not as retained (held from the past) or as anticipated (projected into the future) but as the now-point of the act; the focal element is the absolute present in the temporal stream - **Inner horizon** (*Experience and Judgment*, §8): the element implies its own further determinations — to focus on $a^*$ is already to be directed toward what engaging further with $a^*$ would reveal; the inner horizon is the structure of the element's self-transcendence, its pointing beyond itself to its own completion

**Formal correspondence**: the focal element $a^* \in H_{t^*}$ is a primal impression — the now-element, absolutely present in the fiber.
The $\Delta_{t^*}$-propagation captures the inner horizon: $a^* \leq \Delta_{t^*}(a^*)$ (inflation) is the formal expression of the element's self-transcendence — $a^*$ is less than its own most complete determination, and the nucleus makes the inner horizon explicit by mapping $a^*$ to $\Delta_{t^*}(a^*) \in \mathrm{Fix}(\Delta_{t^*})$.

## Centering Theory analog

In computational linguistics, **Centering Theory** (Grosz, Joshi, Weinstein 1995) models discourse coherence via a hierarchy of **forward-looking centers** $C_f(U_n)$ (entities evoked in utterance $U_n$) and a distinguished **backward-looking center** $C_b(U_n)$ — the most prominent entity that links $U_n$ to the prior discourse context.

The MicroFocus $a^*$ is the formal analog of $C_b$: the single most prominent element that is **currently potential** in the machine's processing, linking the present computation to the ongoing fiber state.
The full fiber $H_{t^*}$ is the analog of $C_f$: the set of all available elements.
The MicroFocus picks one of these — the backward-looking center of the current computational step.

Centering's **Rule 1** (the $C_b$ of $U_n$ is the highest-ranked element of $C_f(U_{n-1})$ that appears in $U_n$) maps onto: the canonical next MicroFocus is the most "highly ranked" element of the previous fiber that is still potential — where rank is determined by the $\Delta$-propagation urgency ordering on $H_{t^*}$.

## MicroFocus as the Level-3 question

In the three-level focus stack from [Focus](./focus.md), MicroFocus is Level 3:

| Level | Answers | Math object |
|---|---|---|
| **Level 1** ([MacroFocus](./macrofocus.md)) | *Which fiber is the current working context?* | $(H, t^*)$ — pointed presheaf |
| **Level 2** ([MesoFocus](./mesofocus.md)) | *What is settled within the working fiber?* | $(H_{t^*}, j, \mathrm{Fix}(j))$ — nuclear sublocale |
| **Level 3** (MicroFocus) | *What specific element is being processed now?* | $(H_{t^*}, a^*)$ — designated element |

Level 3 is the finest granularity: below the MicroFocus, there is no further structural differentiation within the fiber.
A single element $a^*$ is the atom of focused computation.

The three levels are nested but not fully determined by each other: MacroFocus does not uniquely determine a MesoFocus (which nucleus?), MesoFocus does not uniquely determine a MicroFocus (which element?).
Each level requires an independent designation.
Conversely: every MicroFocus implies a MacroFocus (which fiber?), and a MicroFocus plus a canonical nucleus implies a MesoFocus ($H^*_{t^*}$).

## Open questions

- Whether the **selection of $a^*$** — the machine's non-deterministic choice of which element to make the microfocus — can be given a principled rule within the relational universe, or whether it is genuinely free.
  Candidate rules: (i) pick the $\sigma_{t^*}$-stable element with the smallest $\Delta_{t^*}$-inflation (the element "closest" to $\mathrm{Fix}(\Delta_{t^*})$); (ii) pick the element determined by a character nucleus $\chi$ (the character guides attention to $F_\chi$-bordering elements); (iii) no principled rule — the freedom IS the machine's agency.
- Whether **sequential MicroFoci** — the sequence $a^*_1, a^*_2, \ldots$ of elements processed in successive synchronous phases — can be formalized as a path in the fiber $H_{t^*}$, and whether coherent paths (in the Centering Theory sense) correspond to paths that converge monotonically toward $H^*_{t^*}$.
- Whether a MicroFocus on $a^* \in F_\chi$ (in-character element) versus $a^* \notin F_\chi$ (out-of-character element) corresponds to the distinction between **in-character action** and **character-testing pressure** — and whether the character nucleus $\chi$ generates a gradient on $H_{t^*}$ that pulls MicroFocus selection toward $F_\chi$.
- Whether the **Andreoli completeness** guarantee (every element can reach $H^*_{t^*}$ in finite alternating phases) holds in the relational universe: whether the alternating application of $\sigma_{t^*}$-closure (asynchronous) and $\Delta_{t^*}$-propagation on designated elements (synchronous) converges to $H^*_{t^*}$ for every starting state in $H_{t^*}$, and whether the convergence rate depends on the order of MicroFocus selections.
