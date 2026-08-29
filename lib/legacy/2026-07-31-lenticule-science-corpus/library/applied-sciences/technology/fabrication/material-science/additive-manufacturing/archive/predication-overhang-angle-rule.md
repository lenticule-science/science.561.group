---
type: theorem
status: rule-of-thumb
class: design-rule
depends-on: [overhang]
---

# Overhang angle rule (45° rule)

**Claim.** For desktop FFF with active part-cooling and well-tuned profile, surfaces with overhang angle $\theta \leq 45°$ from vertical print successfully without [supports](teaching/explanations/support.md). Surfaces with $\theta > 45°$ require supports, and surfaces with $\theta > 60°$–$70°$ either require supports or fail.

**Mechanism.** Each new layer extends laterally beyond the previous by $\Delta x = h \tan\theta$ where $h$ is layer height. For the new bead to be supported by the previous layer, the bead-to-previous-layer overlap must exceed approximately half the bead width $w/2$. For $h = 0.20$ mm and $w = 0.45$ mm, $\theta = 45°$ gives $\Delta x = 0.20$ mm — overlap $= w - \Delta x = 0.25$ mm, well above $w/2 = 0.225$ mm. At $\theta = 60°$, $\Delta x = 0.346$ mm; overlap $= 0.104$ mm, below $w/2$, so the bead is mostly cantilevered with only its trailing edge supported. At $\theta > 65°$ the bead is essentially printing in air on top of the previous bead's edge.

**Why "rule of thumb" rather than "established".**
The threshold $\theta_{\max}$ is a function of:
- Layer height $h$ (smaller $h$ → smaller $\Delta x$ per layer → higher tolerable $\theta$).
- Bead width $w$ (larger $w$ → more overlap budget at given $\Delta x$).
- Cooling effectiveness (better cooling freezes the bead before sag → higher tolerable $\theta$).
- Material (PLA tolerates $\theta_{\max} \approx 55$–$60°$; ABS only $\approx 35$–$45°$ without enclosure cooling tuning).
- Print speed (slower → more cooling time per bead → higher tolerable $\theta$).

The "$45°$" number is a useful round-number average across these conditions for typical PLA on a typical desktop machine, suitable for first-pass design decisions. Production work should test the actual $\theta_{\max}$ for the specific (machine, material, profile) triple using an overhang test artifact.

**Counterexamples.**
- Well-tuned PLA with high cooling and small layers can print $\theta = 70°$ overhangs cleanly.
- ABS in a well-controlled enclosure (thermal stable, no part-cooling fan) has unusual overhang behavior — slow cooling helps layer adhesion but hurts overhang quality; the optimum is process-dependent.
- Variable-layer-height slicing can locally use small $h$ on overhangs to extend $\theta_{\max}$ without paying small-$h$ time cost on bulk.

**Corollary.** When designing a part where supports must be avoided (no post-processing labor budget), constrain all overhang surfaces to $\theta \leq 45°$ from vertical. This usually means chamfering all underside features at $45°$ instead of using flat undersides.

**Related rules.**
- [Bridges shorter than $\sim 50$ mm print without supports in PLA](theories/fused-filament-fabrication/theorems/bridge-length-limit.md) — *not yet written; in scope.*
