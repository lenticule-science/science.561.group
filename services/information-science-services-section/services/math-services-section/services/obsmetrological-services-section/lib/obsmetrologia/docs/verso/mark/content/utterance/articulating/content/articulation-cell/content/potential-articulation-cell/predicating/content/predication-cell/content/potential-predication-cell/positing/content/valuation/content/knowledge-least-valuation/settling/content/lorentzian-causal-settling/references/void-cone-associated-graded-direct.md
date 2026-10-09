---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, non-scott-continuous-firing-ordinal, four-regime-dichotomy]
---

# Void-cone associated graded — direct chain-level identification

Verdier-independent proof of the associated-graded computation underlying the [void-cone (co)homology theorem](void-cone-cohomology.md).
Where the Verdier-duality version identifies $\mathrm{gr}(\mathrm{Void}_v) \cong H_1(\check{\mathcal{F}}_v)$ via cosheaf-homology and *then* matches with $H^1(\mathcal{F}_v)$ via Verdier duality, this path establishes the matching directly at the chain level — without invoking Verdier duality at all.

## Statement

**Theorem.** *For a settling $v$ on the [bitopological settling site](../../bitopological-settling-site/bitopological-settling-site.md) with closure ordinal $\kappa$ and non-Scott-continuous firing ordinal set $L_{\mathrm{ns}}(\kappa)$:*

1. *(Associated graded.)
  The void filtration $V_0 \supseteq V_1 \supseteq \cdots \supseteq V_\infty$ admits the associated graded*

$$\mathrm{gr}(\mathrm{Void}_v) \;:=\; \bigoplus_{\tau < \kappa} \mathbb{Z}^{V_{<\tau} \setminus V_\tau} \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

*with one summand per non-Scott-continuous firing ordinal.*

2. *(Chain-level matching with $H^1$.)
  There is a canonical $\mathbb{Z}$-module isomorphism*

$$\Psi : \mathrm{gr}(\mathrm{Void}_v) \;\xrightarrow{\sim}\; H^1(\mathcal{F}_v),$$

*given on generators by the firing-ordinal indexing: $\Psi(\bar e_\mu) = e_\mu$, where $\bar e_\mu$ is the void-side generator at $\mu$ and $e_\mu$ is the apex-side generator at $\mu$.*

The matching is established without invoking [Verdier duality](verdier-duality-bitopological-site.md) — only the structural correspondence between cells leaving the void and cells acquiring designated values at each firing.

## Proof

### Part 1: Associated graded

The void filtration $V_0 \supseteq V_1 \supseteq \cdots$ has set-theoretic differences

$$V_{<\tau} \setminus V_\tau \;=\; \{(s, o, q) : v_\sigma(q)(s, o) = \bot \text{ for all } \sigma < \tau, v_\tau(q)(s, o) \neq \bot\}$$

— cells that left the void exactly at stage $\tau$.

For Scott-continuous successor steps $\tau = \sigma + 1$: $V_\sigma \setminus V_{\sigma+1}$ contains cells fired at $\sigma$ via a successor closure step.

For non-Scott-continuous firing ordinals $\mu \in L_{\mathrm{ns}}(\kappa)$ (limit ordinals where the closure produces a cell not derivable from any single earlier stage): $V_{<\mu} \setminus V_\mu$ is exactly the cells fired at the limit.

By the [non-Scott-continuous firing ordinal](../../settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) classification, only NSC firings contribute to $\mathrm{gr}(\mathrm{Void}_v)$ at the limit-ordinal stages; Scott-continuous successors are absorbed into the limit.
Hence

$$\mathrm{gr}(\mathrm{Void}_v) = \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}^{V_{<\mu} \setminus V_\mu} = \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$$

(the second equality because each NSC firing introduces one cell). $\square$ (Part 1)

### Part 2: Chain-level matching with $H^1$

The apex side: $H^1(\mathcal{F}_v)$ is computed by the [aperiodic-regime cohomology via direct limit](../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) (in the aperiodic regime) or [transfinite-bounded-regime $H^1$-generators](transfinite-bounded-regime-h1-generators.md) (in the transfinite-bounded regime), each giving

$$H^1(\mathcal{F}_v) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

with generator $e_\mu \in H^1$ corresponding to "cell $\mathrm{cell}(\mu)$ acquires bilattice value $\mathbf{t}$ at firing $\mu$."

The void side: the associated graded $\mathrm{gr}(\mathrm{Void}_v) \cong \bigoplus_\mu \mathbb{Z}$ has generator $\bar e_\mu$ corresponding to "cell $\mathrm{cell}(\mu)$ leaves the void at firing $\mu$."

Both sides are indexed by the same set $L_{\mathrm{ns}}(\kappa)$, with one $\mathbb{Z}$-summand per element.
The natural map $\Psi : \bar e_\mu \mapsto e_\mu$ is a $\mathbb{Z}$-module isomorphism.

**Why $\Psi$ is canonical.** "Cell $\mathrm{cell}(\mu)$ leaves the void at firing $\mu$" and "cell $\mathrm{cell}(\mu)$ acquires designated value at firing $\mu$" are descriptions of *the same event*: a cell that was $\bot$ in $v_{<\mu}$ becomes non-$\bot$ in $v_\mu$.
The void-side description tracks the cell's departure from the void; the apex-side description tracks its arrival in the firing-counting cohomology.
The bijection is the identity on firing events.

This is a chain-level bijection: each side's generators have a literal one-to-one correspondence with the firing events, and $\Psi$ is the identity bijection on these events.
No derived-functor machinery, no Verdier duality. $\square$ (Part 2)

Combining: $\mathrm{gr}(\mathrm{Void}_v)$ and $H^1(\mathcal{F}_v)$ are canonically isomorphic as $\mathbb{Z}$-modules via the firing-ordinal indexing. $\blacksquare$

## Comparison with the Verdier-dependent path

The [void-cone (co)homology theorem](void-cone-cohomology.md) (sketch) identifies $\mathrm{gr}(\mathrm{Void}_v) \cong H_1(\check{\mathcal{F}}_v)$ via the *cosheaf homology of the Verdier dual*, and then $H^1(\mathcal{F}_v) \cong H_1(\check{\mathcal{F}}_v)$ via Verdier duality.
The composition gives $\mathrm{gr}(\mathrm{Void}_v) \cong H^1(\mathcal{F}_v)$.

This path: bypasses the cosheaf-homology stage entirely.
The matching is direct at the chain level, depending only on:

- The firing-ordinal classification of cells (NSC vs. Scott-continuous).
- The Anderson-Putnam-direct-limit / transfinite-bounded computation of $H^1$ (already established at draft level).

What the Verdier-dependent path adds (and this path lacks): a *categorical equivalence* between sheaves and cosheaves on the bitopological site.
The chain-level isomorphism $\Psi$ of this path is just an isomorphism of $\mathbb{Z}$-modules, not a derived equivalence.

For most downstream uses — MLD-classification, no-tunneling, deformation theory — the chain-level isomorphism is sufficient.
For the structural unification of "every sheaf has a Verdier dual cosheaf with matching cohomology," Verdier is needed.

## Position in the program

Verdier-independent half of the [void-cone (co)homology theorem](void-cone-cohomology.md).
With this path:

- **The void/apex matching becomes a proved theorem** in the chain-level $\mathbb{Z}$-module sense, no longer load-bearing on Verdier.
- **The cosheaf-homology identification remains conditional on Verdier** (still open at sketch level).
- The [void-cone-cohomology](void-cone-cohomology.md) file's status is split: Step 1 (associated graded) is now proved; Steps 2–3 (cosheaf identification + Verdier matching) remain sketch.

Open downstream: - *Cosheaf side standalone.* If the Verdier duality completion (Tasks 33–37) succeeds, the cosheaf-homology identification gains independent justification.
Until then, this chain-level path is the rigorous alternative. - *Filtration spectral sequence.* The [void-cone via filtration spectral sequence](void-cone-via-filtration-ss.md) path gives a third route via SS of the void filtration directly, complementing this chain-level direct argument.
