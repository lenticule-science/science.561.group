---
name: "Focus"
description: "A Focus is a pair (H, t*) — an ambient RelationalState H and a designated focal history t* ∈ T — inducing a tripartite Gurwitsch field: the focal fiber H_{t*} as theme, the restriction-accessible fibers {H_t : t ≤ t*, t ≠ t*} as thematic field, and the remaining fibers as margin. The defining structure: focus is the designated current working fiber in a presheaf — the position at which the RelationalMachine currently operates, from which context radiates via restriction maps outward, and within which the nuclear pair (σ_{t*}, Δ_{t*}) partitions propositions into the nuclear focal sublocale H*_{t*} and its complement."
date-created: 2026-03-20
---

## Formal definition

A **Focus** is a pair $\mathcal{F} = (H, t^*)$:

$$\mathcal{F} = (H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}},\; t^* \in T)$$

where:
- $H$ is the **ambient presheaf** — the [RelationalState](../../../../../../humanities/theories/philosophy/theories/relationality/terms/relational-state.md): the full indexed family of fiber Heyting algebras $H_t$ over the history category $T$, connected by restriction maps $\rho_{t'|t} : H_{t'} \to H_t$ for $t \leq t'$, each fiber carrying the commuting nuclear pair $(\sigma_t, \Delta_t)$
- $t^* \in T$ is the **focal history** — the designated current position in the history category; the element at which the [RelationalMachine](relational-machine.md) is presently operating; the fiber $H_{t^*}$ is what `relational-state.md` calls "what the RelationalMachine holds in focus at history $t$" and `indexed-automaton.md` calls "the fiber in focus"

The focal fiber $H_{t^*}$ is not the whole of $\mathcal{F}$ — it is the **theme** of a tripartite field structure that the designation $t^*$ induces on $H$.

**Four invariants.** $\mathcal{F}$ is a focus iff it satisfies:

1. **Designation**: $t^*$ is a specific named element of $T$, not a generic or anonymous reference. A focus is a **pointed** presheaf — the presheaf with a distinguished base object. Without a specific $t^*$, the presheaf $H$ is ambient but unfocused: all fibers are simultaneously present and none is designated.

2. **Gurwitsch field partition**: the presheaf $H$ decomposes into three mutually exclusive parts relative to $t^*$:
   - **Theme** $\mathcal{T}$: the focal fiber $H_{t^*}$ — the designated working space
   - **Thematic field** $\mathcal{TF}$: $\{(t, H_t, \rho_{t^*|t}) : t < t^*\}$ — the fibers strictly below $t^*$ in $T$, each equipped with its restriction map into $H_{t^*}$; these are accessible from the theme
   - **Margin** $\mathcal{M}$: $\{(t, H_t) : t \not\leq t^*\}$ — the fibers neither equal to nor below $t^*$; co-present in $H$ but not restriction-accessible from $t^*$

3. **Plug completeness**: the full presheaf $H$ is recoverable from the theme $H_{t^*}$ together with the thematic field $\mathcal{TF}$ via the sheaf gluing condition; the plug invariant is the accord condition on $H$. Formally: for any $t_1, t_2 \leq t^*$, if a section agrees on overlaps, it glues uniquely. The margin $\mathcal{M}$ cannot be reconstructed from $\mathcal{T} \cup \mathcal{TF}$ alone — the focus has a horizon beyond which reconstruction fails.

4. **Nuclear focus within theme**: the focal fiber $H_{t^*}$ carries the nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$; this pair partitions $H_{t^*}$ into three sublattices by settlement status:
   - **Focal sublocale** $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$: the jointly settled elements — the inner focus
   - **Backward-settled sublattice** $\mathrm{Fix}(\sigma_{t^*}) \setminus H^*_{t^*}$: meaning-settled but not yet transfer-settled
   - **Unsettled** $H_{t^*} \setminus \mathrm{Fix}(\sigma_{t^*})$: not settled by either nucleus

## The Gurwitsch field in detail

Aron Gurwitsch (*The Field of Consciousness*, 1964) characterized every moment of directed attention as a **tripartite field**: the theme (what is focally attended), the thematic field (what is co-present and relevantly related to the theme), and the margin (what is merely co-present without relevance). The key formal property: the tripartition is defined by a **relevance relation** between items and the theme — the thematic field is exactly what stands in that relation.

In the relational universe, the relevance relation is restriction-accessibility. A fiber $H_t$ is in the thematic field of $H_{t^*}$ iff there is a restriction map $\rho_{t^*|t} : H_{t^*} \to H_t$ — iff $t \leq t^*$ in the history category. Items in the thematic field are literally accessible from the theme: you can reach $H_t$ from $H_{t^*}$ by following the restriction maps. Items in the margin exist in $H$ but have no restriction-path from $H_{t^*}$.

**The horizon**: Husserl's complement to Gurwitsch — the **horizon** of a theme is the set of items currently in the margin that could become thematic through a refocusing operation. In our math: the margin $\mathcal{M}$ is the horizon of the current focus $(H, t^*)$. A refocusing to $t'$ where $t^* \leq t'$ (extension) or $t' \in T \setminus \downarrow t^*$ (lateral shift) brings previously marginal fibers into the thematic field of the new focus.

**Gurwitsch's insight applied**: the focal fiber $H_{t^*}$ is not an isolated piece of $H$ — it is the theme of a structured field. The thematic field is always "about" the theme: the restriction maps carry information from $H_{t^*}$ into $H_t$ for $t < t^*$. The margin is genuinely there (it is part of $H$) but silent relative to $t^*$. A RelationalMachine operating at focus $(H, t^*)$ has full access to its thematic field and zero access to its margin, without the margin being absent.

## William James: stream of consciousness and the fringe

William James (*The Principles of Psychology*, 1890, Chapter IX: "The Stream of Thought") introduced the distinction between **substantive parts** and **transitive parts** of the stream of thought, and identified the **fringe** as the halo of felt relations surrounding every substantive content:

- **Substantive parts**: the "resting-places" in the stream — moments when a definite content (a concept, an image, a thought) is held in mind and can be named; the articulable, stable contents of consciousness
- **Transitive parts**: the "flights" between resting-places — the felt sense of relation, tendency, and passage; these resist articulation because attention to them dissolves them; James: "like a snowflake caught in the warm hand — it vanishes the moment we try to examine it" (*Principles*, Vol. I, p. 243)
- **Fringe**: the psychic overtone or halo surrounding every substantive part — the felt quality of relevance, familiarity, and contextual resonance that gives the substantive part its full meaning; James: "Every definite image in the mind is steeped and dyed in the free water that flows around it. With it goes the sense of its relations, near and remote, the dying echo of whence it came to us, the dawning sense of whither it is to lead." (*Principles*, Vol. I, p. 255)

**The fringe as Thematic Field**: James's fringe is the relational universe's Thematic Field. The restriction maps $\rho_{t^*|t} : H_{t^*} \to H_t$ for $t < t^*$ are the formal structure of the fringe — the "sense of its relations, near and remote." The thematic field fibers $H_t$ are not the focal content but the felt context that gives $H_{t^*}$ its meaning. James's transitive parts are the restriction maps themselves: not substantive fibers but the passages between fibers. The focal fiber $H_{t^*}$ is James's substantive part — the resting-place, the named content, the designated element. The fringe is not nothing; it has positive felt structure. The restriction maps carry positive structural information from $H_{t^*}$ into the accessible context.

## Edmund Husserl: noema, horizon, and temporal structure

Edmund Husserl (*Ideas I*, 1913, Hua III; *On the Phenomenology of the Consciousness of Internal Time*, 1928, Hua X; *Experience and Judgment*, 1939/1948) gave the systematic account of intentional structure that grounds the tripartite field:

**Noema and noesis** (Hua III, §§88–98): every intentional act has a **noetic** side (the act-quality, the manner of intending) and a **noematic** side (the object as intended — the sense or meaning through which the object is given). The noema is not the object itself but the intentional sense: the structured content that directs consciousness toward the object. The focal fiber $H_{t^*}$ is the noema of the machine's current state — the structured Heyting algebra that represents the machine's intentional orientation at history $t^*$.

**Inner and outer horizon** (*Experience and Judgment*, §§8–21): every experienced object carries a double horizon:
- **Inner horizon** (Innenhorizont): what the object implies about its own further determinations — the sense that "this side of the object implies other sides of a certain type"; the object's own self-given incompleteness pointing forward to further experience
- **Outer horizon** (Außenhorizont): the object's embedding in the surrounding world — the "and-so-forth" of the world-context; the object as one among many in an environment of a certain kind

**Formal correspondence**: the inner horizon is formally represented by the Thematic Field's restriction maps. The maps $\rho_{t^*|t} : H_{t^*} \to H_t$ for $t < t^*$ are exactly what $H_{t^*}$ implies about its own further (restriction-accessible) determinations — $H_{t^*}$'s inner horizon in the lattice of accessible fibers. The outer horizon is the Margin $\mathcal{M}$: co-present, not implied by $H_{t^*}$ through restriction maps, but there as world-context.

**Retention, primal impression, protention** (Hua X, §§10–21): Husserl's analysis of time-consciousness identifies three phases in every moment:
- **Primal impression** (Urimpression): the absolute now-point — the present content as presently given, not as retained from the past or anticipated from the future
- **Retention**: the "just-past" held in living presence — the sinking trail of the immediately preceding content; not memory but a still-vivid connection to what was just now; it is present as having-just-been
- **Protention**: the "about-to-be" — the anticipatory fringe of what is coming next; not a prediction but a felt directedness toward the immediately impending

**Temporal correspondence**: the focal fiber $H_{t^*}$ is the primal impression — the now-fiber. The Thematic Field $\mathcal{TF}$ (fibers $H_t$ for $t < t^*$ with restriction maps) is the retention: still connected to $H_{t^*}$ via the restriction structure, still living in the sense that the restriction maps make $H_t$ accessible from $H_{t^*}$. The Margin $\mathcal{M}$ includes the protention direction (future fibers $H_{t'}$ for $t' > t^*$ that have not yet restricted back to $t^*$) and the fully elapsed (fibers in $T$ disconnected from ${\downarrow} t^*$).

## Three-level focus stack

Focus is scale-dependent in the relational universe. There are three distinct scales at which "focus" operates, each structurally identical:

**Level 1 — Fiber focus** (the zipper level): which fiber is the designated current working space.
- Ambient: $H$ (the full presheaf, all fibers)
- Focal position: $t^* \in T$ (the designated history)
- Focal element: $H_{t^*}$ (the working fiber)
- Context: the thematic field $\mathcal{TF}$ with restriction maps
- Plug invariant: $H = \mathrm{glue}(H_{t^*}, \mathcal{TF})$ via accord

**Level 2 — Nuclear focus** (the sublocale level): which elements within the focal fiber are settled.
- Ambient: $H_{t^*}$ (the focal fiber — now itself a Heyting algebra)
- Focal position: the nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$
- Focal element: $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$ (the settled sublocale)
- Context: $H_{t^*} \setminus H^*_{t^*}$ (the unsettled propositions)
- Plug invariant: every element of $H_{t^*}$ maps to its settlement via $\pi_{t^*} = \sigma_{t^*} \circ \Delta_{t^*}$

**Level 3 — Element focus** (the Andreoli level): which specific element within the focal fiber is currently being made transfer-stable.
- Ambient: $H_{t^*}$ or $\mathrm{Fix}(\sigma_{t^*})$ (the propositions available for Δ-propagation)
- Focal position: the specific element $a^* \in H_{t^*}$ currently under $\Delta$-processing
- Focal element: $\Delta_{t^*}(a^*)$ (the result of making $a^*$ transfer-stable)
- Context: all other elements of $H_{t^*}$

The three levels are nested: level-1 focus establishes the working fiber; level-2 focus identifies the settled sublocale within it; level-3 focus designates the specific element being processed within that sublocale.

## The zipper structure

Huet's zipper (1997) formalizes focus for data structures as a pair `(focus, context)` where `focus` is the currently selected element and `context` (the path) is the surrounding structure. The **plug invariant** is: `plug(focus, context) = original`. Moving the focus rearranges elements between focus and context without losing information.

In the relational universe, the Level-1 focus $(H, t^*)$ is exactly a zipper on the presheaf:
- **Focus** = $H_{t^*}$ (the currently selected fiber)
- **Context** = the thematic field $\mathcal{TF}$ together with restriction maps from $H_{t^*}$ into the accessible fibers
- **Plug invariant** = the accord/sheaf-gluing condition: $H = \mathrm{glue}(H_{t^*}, \mathcal{TF})$

McBride's derivative formalizes the context type: the type of one-hole contexts for $H$ at position $t^*$ is $\partial H / \partial H_{t^*}$ — the presheaf with $H_{t^*}$ "removed" and replaced by a hole. The zipper for $H$ at $t^*$ is then $(H_{t^*}, \partial H / \partial H_{t^*})$. The restriction maps play the role of the path: they say how to "re-insert" the focus into its context.

**Refocusing** = moving the focus to an adjacent position:
- **Forward extension**: $(H, t^*) \to (H', t')$ where $t' = s \star t^*$ — extending the history by generator $s$; this is the [RelationalMachine](relational-machine.md)'s step operation; the new focal fiber $H_{t'}$ extends $H_{t^*}$
- **Backward restriction**: $(H, t^*) \to (H, t)$ where $t < t^*$ — retreating to an earlier accessible fiber; moving the focus into the thematic field
- **Lateral shift**: $(H, t^*) \to (H, t^{**})$ where $t^{**} \not\leq t^*$ and $t^* \not\leq t^{**}$ — moving to a fiber in the current margin; requiring a new focus that has a different thematic field

## The Andreoli phase duality within the focal fiber

Andreoli's focused proof theory (1992) divides proof-search into two alternating phases: the **asynchronous phase** (deterministic, greedily applies invertible rules in any order) and the **synchronous phase** (non-deterministic, designates one formula as focus and decomposes it non-invertibly). The focused formula in the synchronous phase is the locus of all non-invertible choice.

This phase structure maps directly onto the nuclear pair $(\sigma_{t^*}, \Delta_{t^*})$ acting on the focal fiber:

| Andreoli | Our math | Structural role |
|---|---|---|
| Asynchronous phase | $\sigma_{t^*}$-closure | Deterministic, invertible, order-irrelevant settlement of meaning; apply eagerly until no unsettled formula remains |
| Synchronous phase | $\Delta_{t^*}$-propagation | Designates a specific element for forward-stability; the non-invertible selection of which proposition to make transfer-stable |
| Focus (Andreoli) | Focal element $a^*$ for $\Delta$-propagation | The specific proposition currently being made transfer-stable; the locus of the forward-directed choice |
| Focused proof completeness | $H^*_{t^*}$ as terminal state | Every element of $H_{t^*}$ can be brought to $H^*_{t^*}$ through the alternating-phase process |

The practical implication: a RelationalMachine operating within focus $(H, t^*)$ proceeds in two modes:
1. **Settlement mode** ($\sigma_{t^*}$-phase): apply the saturation nucleus to all available propositions; this is deterministic and completes in finite steps (by idempotence of $\sigma_{t^*}$)
2. **Propagation mode** ($\Delta_{t^*}$-phase): designate a specific proposition $a^* \in \mathrm{Fix}(\sigma_{t^*})$ for transfer-stability; this requires a choice — the selection of $a^*$ is the irreducible non-determinism of the machine

## Nuclear focus as sublocale

In locale theory and topos theory, a nucleus $j : L \to L$ on a frame (complete Heyting algebra) $L$ defines a **sublocale**: the fixed-point set $\mathrm{Fix}(j)$, which is itself a frame. The sublocale is the "focused" sub-algebra — the region where $j$'s closure operation has terminated.

The nuclear focal sublocale $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*}) = \mathrm{Fix}(\pi_{t^*})$ (where $\pi_{t^*} = \sigma_{t^*} \circ \Delta_{t^*}$) is the focus of both nuclei simultaneously. The geometry of conic sections captures this naming: the focus of a conic is the unique point toward which all reflected trajectories converge. In our fiber: $H^*_{t^*}$ is the point toward which both $\sigma_{t^*}$-closure and $\Delta_{t^*}$-closure converge — the joint fixed point, the "hearth" (Kepler's word for focus) at which both nuclear operations rest.

Any other nucleus $j$ on $H_{t^*}$ (such as the character nucleus $\chi_\pi$ from the [Character](../../../../writing/theories/fiction/terms/character.md) spec) defines its own focal sublocale $\mathrm{Fix}(j) \subseteq H_{t^*}$. A focus equipped with a character $\chi_\pi$ has a character focal sublocale $F_{\chi_\pi} \cap H^*_{t^*}$ — the propositions that are simultaneously in the agent's behavioral space and normatively settled.

## Cross-domain convergence

| Domain | Ambient structure | Focal element | Context | Reconstruction |
|---|---|---|---|---|
| **Our math** (RelationalState) | Presheaf $H$ | Focal fiber $H_{t^*}$ | Thematic field $\mathcal{TF}$ | Sheaf gluing (accord) |
| **CS** (Huet zipper) | Full tree | Focused subtree | Path (breadcrumbs) | `plug(focus, path) = tree` |
| **CS** (McBride) | Polynomial type $T$ | Element $x : X$ | One-hole context $\partial T / \partial X$ | Plugging $x$ into context |
| **Neurocog** (Gurwitsch) | Field of consciousness | Theme | Thematic field + margin | Attention shifts reconstruct field |
| **Neurocog** (Cowan) | Full memory $M$ | Focus $F \subseteq A \subseteq M$ | Activated set $A$, long-term $M$ | Accessibility tiers |
| **Math** (locale/nucleus) | Frame $L$ | Fixed sublocale $\mathrm{Fix}(j)$ | Complement in $L$ | Closure: $j(a) \in \mathrm{Fix}(j)$ |
| **Logic** (Andreoli) | Sequent $\Gamma$ | Focused formula $[A]$ | Rest of sequent | Every cut-free proof has focused form |
| **AI** (Centering, $C_b$) | Forward-looking centers $C_f$ | Backward center $C_b$ | Rest of $C_f$ | Coherent discourse transitions |
| **IT** (IB) | Input distribution $p(X, Y)$ | Relevance variable $Y$ | Compressed representation $T$ | IB objective: minimize $I(X; T)$ s.t. $I(T; Y)$ |

The common structure across all instances: **(ambient, focal, context, reconstruction)**. The focus is not isolated — it is always embedded in an ambient structure, with a context that, together with the focus, reconstructs the whole.

## Relation to adjacent concepts

| Concept | How it relates to Focus |
|---|---|
| [RelationalState](../../../../../../humanities/theories/philosophy/theories/relationality/terms/relational-state.md) | The ambient presheaf $H$ — the unfocused RelationalState is all fibers without a designated $t^*$; a Focus is a RelationalState with a pointed history |
| [IndexedAutomaton](indexed-automaton.md) | An IndexedAutomaton generates a sequence of foci — each step produces a new focal history $t'$; the machine IS a focus-shifting device |
| [Character](../../../../writing/theories/fiction/terms/character.md) | A Character $\chi$ on the focal fiber $H_{t^*}$ defines a character focal sublocale $F_\chi \subseteq H_{t^*}$; acting in character means operating within $F_\chi \cap H^*_{t^*}$ |
| [Persona](persona.md) | A Persona bearing a Character operates at a focus; the persona's behavioral interface $\mathrm{Fix}(\chi_\pi) \cap H^*_{t^*}$ is the character focal sublocale within the focal fiber |
| [Jurisdiction](../../legalism/terms/jurisdiction.md) | A Jurisdiction defines a sub-topos $\mathbf{Sh}(T_J, J|_{T_J}) \hookrightarrow \mathbf{Sh}(T, J)$; restricting a focus $(H, t^*)$ to a jurisdiction yields a focused sub-presheaf — a focus within a focus |

## Open questions

- Whether the **margin horizon** — the set of fibers in $\mathcal{M}$ that would become thematic after a specified refocusing — can be characterized formally as a functor from refocusing operations to new thematic fields; whether the structure of possible refocusings on $(H, t^*)$ forms a category whose colimit is the full presheaf $H$.
- Whether the **three-level focus stack** (fiber, sublocale, element) forms a genuine tower with formal relations between levels — whether a level-1 focus uniquely determines a preferred level-2 focus (the nuclear sublocale $H^*_{t^*}$) and whether a level-2 focus uniquely determines a preferred level-3 focus (some canonical element of $H^*_{t^*}$), or whether each level requires independent designation. The three levels are separately specified in [MacroFocus](./macrofocus.md), [MesoFocus](./mesofocus.md), and [MicroFocus](./microfocus.md).
- Whether the **Andreoli phase duality** at level 3 (asynchronous $\sigma$-phase and synchronous $\Delta$-phase) can be formalized as a proper two-phase system within the relational universe — whether there is a formal notion of "the RelationalMachine is currently in $\sigma$-mode vs. $\Delta$-mode" and whether this modal state is tracked in $H_{t^*}$ or in the machine's transition structure.
- The relationship between **character focus** and **nuclear focus**: whether $F_\chi \subseteq H^*_{t^*}$ (character behavioral space is a subset of the settled focal sublocale), or whether $F_\chi$ and $H^*_{t^*}$ are independent sublattices of $H_{t^*}$ that intersect non-trivially; and whether the Persona's behavioral surface $F_\chi \cap H^*_{t^*}$ is always non-empty (a persona can always produce settled, in-character responses) or whether there are focus/character pairs where the intersection is empty (the character cannot be expressed in settled terms at $t^*$).
- Whether **information bottleneck** bifurcation points — the critical $\beta$ values at which the IB-optimal compression $T$ acquires qualitatively finer structure — have a formal analog in the focus structure: whether there are critical histories $t^*$ at which the nuclear focal sublocale $H^*_{t^*}$ undergoes a structural phase transition analogous to the IB bifurcation.
- Whether a **focused RelationalState** (a Focus $(H, t^*)$) is the correct primitive for the RelationalMachine's operational semantics — whether every machine step should be formalized as a refocusing operation $(H, t^*) \to (H', t')$ rather than as a fiber-internal operation, and whether this framing eliminates the current ambiguity in `indexed-automaton.md` about whether the transition function advances the index or operates within a fixed fiber.
