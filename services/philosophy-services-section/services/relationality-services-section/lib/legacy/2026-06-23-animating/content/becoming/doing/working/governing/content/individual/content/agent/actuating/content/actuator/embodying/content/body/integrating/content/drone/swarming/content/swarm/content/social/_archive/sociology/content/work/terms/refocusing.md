---

name: "Refocusing"
description: "A Refocusing is a morphism (H, t*) → (H', t') between MacroFoci — a pair (ρ, φ) of a presheaf transition ρ and a history reassignment φ that moves the designated focal history from t* to t'. Three structurally distinct cases: forward extension (t' = s★t*, H' = G_s(H)), backward restriction (t' < t*, H' = H), and lateral shift (t' incomparable with t*, H' = H). In every case the new MacroFocus (H', t') is fully constituted by the refocusing; the Gurwitsch tripartition reconstitutes around t'. Formally a morphism in the category of pointed presheaves."
date-created: 2026-03-20
---

## Formal definition

A **Refocusing** is a morphism $\mathfrak{R} : (H, t^*) \to (H', t')$ in the category of pointed presheaves:

$$\mathfrak{R} = (\rho : H \to H',\; \phi : t^* \leadsto t')$$

where: - $(H, t^*)$ is the **source MacroFocus** — the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ with designated history $t^*$ - $(H', t')$ is the **target MacroFocus** — the presheaf $H'$ (possibly equal to $H$) with the new designated history $t'$ - $\rho : H \to H'$ is a **presheaf morphism** — a natural transformation between the ambient presheaves; when $H' = H$, this is $\mathrm{id}_H$ - $\phi : t^* \leadsto t'$ is the **history reassignment** — the record of which history is now focal; in the forward extension case, $\phi$ is the step morphism $s \star t^* = t'$; in the backward and lateral cases, $\phi$ is a morphism in $T$ or a choice from $T$

**Three invariants.** $\mathfrak{R}$ is a refocusing iff:

1. **Presheaf coherence**: if $\rho \neq \mathrm{id}_H$, then $\rho$ is a natural transformation — every component $\rho_t : H_t \to H'_t$ commutes with the restriction maps; $\rho_{t} \circ H'(f) = H(f) \circ \rho_{t'}$ for all $f : t \to t'$.
  The nuclei are automatically preserved ([Natural Transformation](../../../../../humanities/theories/math/theories/categories/theories/ordinary-categories/terms/natural-transformation.md)).

2. **Fiber availability**: $H'_{t'} \in \mathbf{HA}_{\mathrm{nucl}}$ — the target fiber at $t'$ is a Heyting algebra with commuting nuclear pair; the designated position $t'$ is a valid focal position in $H'$.

3. **Field reconstitution**: the Gurwitsch tripartition around $t'$ in $H'$ is fully determined by the refocusing — a refocusing is not just a pointer change but a full reconstitution of Theme ($H'_{t'}$), Thematic Field ($\{H'_t : t < t'\}$), and Margin ($\{H'_t : t \not\leq t'\}$).
  The new field is determined by the target position, not inherited from the source.

## The three cases

### Forward extension: $(H, t^*) \to (G_s H, s \star t^*)$

- $H' = G_s H$ where $G_s$ is the directed comonad ([Passage](../../humanities/theories/math/passage.md)): $(G_s H)(t) = H(s \star t)$
- $t' = s \star t^*$ — the history extended by generator $s$
- $\rho = \gamma$ — the carrier stepping map $\gamma_{t^*} : H_{t^*} \to H_{s \star t^*}$ (the covariant forward map of the [Carrier](carrier.md))
- Effect: the old theme $H_{t^*}$ moves into the new thematic field (since $t^* < s \star t^*$); the new theme $H_{s \star t^*}$ is a fresh fiber above the old one

This is the [RelationalMachine](relational-machine.md)'s step operation.
It is the only refocusing case that changes $H$ — the other two cases preserve $H$ and change only the pointer.

### Backward restriction: $(H, t^*) \to (H, t)$ where $t < t^*$

- $H' = H$ — same presheaf; $\rho = \mathrm{id}_H$
- $t' = t$ — a history strictly below $t^*$ in $T$; currently in the thematic field of the source MacroFocus
- $\phi$ is the inclusion $t \hookrightarrow t^*$ (the restriction map direction)
- Effect: the old theme $H_{t^*}$ moves to the margin of the new focus (since $t^* \not\leq t$ in a non-trivial partial order); the thematic field shrinks to $\downarrow t$; the old thematic field elements above $t$ become marginal

This is context inspection — retreating to an accessible fiber.
It is **lossless**: the full presheaf $H$ is retained; only the pointer changes.
The old theme is not discarded; it moves to the margin and becomes re-accessible via lateral shift.

### Lateral shift: $(H, t^*) \to (H, t')$ where $t' \not\leq t^*$ and $t^* \not\leq t'$

- $H' = H$ — same presheaf; $\rho = \mathrm{id}_H$
- $t'$ is a history currently in the margin $\mathcal{M}$ of the source MacroFocus
- $\phi$ is not a morphism in $T$ between $t^*$ and $t'$ — the two histories are incomparable; the shift is a pointer reassignment, not a path-following
- Effect: the old theme $H_{t^*}$ and its thematic field $\downarrow t^*$ may be entirely disjoint from the new thematic field $\downarrow t'$; this is a **hard context switch**

Lateral shift is the only refocusing that does not preserve context continuity.
The new thematic field $\{H_t : t < t'\}$ may have no overlap with the old thematic field $\{H_t : t < t^*\}$.

## Math grounding

The three cases correspond to the two poles of the [Passage](../../humanities/theories/math/passage.md) and lateral choice:

| Case | Math structure | Direction |
|---|---|---|
| Forward extension | Carrier stepping map $\gamma_t : X(t) \to X(s \star t)$ | Covariant — forward along histories |
| Backward restriction | Restriction map $H(f) : H_{t'} \to H_t$ | Contravariant — backward along histories |
| Lateral shift | Pointer reassignment in $T$ | Neither — incomparable position |

The [Reindexing](../../humanities/theories/math/reindexing.md) structure gives the formal account of what the presheaf $H$ provides at each position: refocusing moves through the index set $T$ while the presheaf $H$ provides the fiber contents.
The [Natural Transformation](../../../../../humanities/theories/math/theories/categories/theories/ordinary-categories/terms/natural-transformation.md) structure ensures that in the forward extension case, the stepping map $\gamma$ is coherent with the nuclear pair.

## Composition of refocusings

Refocusings compose in the category of pointed presheaves.
Two significant compositions:

**Forward then backward** $(H, t^*) \to (G_s H, s \star t^*) \to (G_s H, t^*)$: extend by $s$ then retreat to the original position.
This is not the identity: the presheaf has changed from $H$ to $G_s H$; the theme returns to position $t^*$ but the fiber $G_s H_{t^*} = H_{s \star t^*}$ is different from the original $H_{t^*}$.

**Two backward restrictions** $(H, t^*) \to (H, t) \to (H, t'')$ where $t'' < t < t^*$: a double retreat.
This composes by transitivity in $T$: the path $t'' < t < t^*$ gives a path of inclusions.
The new thematic field is $\downarrow t'' \subset \downarrow t \subset \downarrow t^*$.

## Open questions

- Whether there is a canonical **refocusing distance** — a metric on $T$ that measures how many refocusing steps are needed to reach $t'$ from $t^*$, and whether this metric has the same structure as the edit distance in the history monoid.
- Whether the category of MacroFoci and refocusings has a **terminal object** — a canonical "most focused" position — and whether that terminal object corresponds to the Grundnorm anchor of the fiber's normative structure.
- Whether the three refocusing types (forward, backward, lateral) generate all morphisms in the pointed-presheaf category, or whether there are morphisms between MacroFoci that are not decomposable into these three.
