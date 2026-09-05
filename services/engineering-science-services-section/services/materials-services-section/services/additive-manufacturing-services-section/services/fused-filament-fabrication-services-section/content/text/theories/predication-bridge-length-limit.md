---
type: theorem
status: rule-of-thumb
class: design-rule
depends-on: []
see-also: []
---

# Bridge length limit

**Claim.** For a tuned FFF machine with active part cooling, the maximum reliably-bridgeable horizontal span $L_{\mathrm{max}}$ — that is, the longest unsupported horizontal stretch of single-bead bridge that can be deposited without sag exceeding $\sim 0.5$ mm or breakage — depends on material as follows:

| Material | $L_{\mathrm{max}}$ (well-tuned, full cooling) |
|---|---|
| PLA | $50$–$100$ mm |
| PETG | $30$–$50$ mm |
| ABS | $\leq 20$ mm without enclosure-tuning compromise |
| PA | $\leq 20$ mm reliably |
| PC | $\leq 15$ mm |
| TPU | not bridgeable |

For longer spans, design alternatives:
1. Add a chamfer at $\leq 45°$ instead of a flat overhang (eliminates bridge; see [overhang-angle-rule](../../../../../content/text/theories/predication-overhang-angle-rule.md)).
2. Add internal supports and accept post-processing.
3. Split the part and join at the bridge.
4. Re-orient so the bridge becomes a vertical wall.

**Mechanism.** A bridge is a self-supporting catenary of partially-cooled polymer between two anchor points. Sag accumulates because:
- Gravity acts on the bead from the moment of deposition.
- The bead's stiffness rises as it cools — but cooling takes time, during which gravity has been acting.
- If sag exceeds $\sim 0.5$ mm before solidification, the bead either touches lower geometry or falls entirely.

The dominant cooling-time variable is the polymer's $T_g$ relative to ambient: PLA (high $T_g - T_{\mathrm{amb}}$ gradient with full fan) cools fast enough to bridge $\sim 100$ mm; ABS ($T_g$ near $100$°C, fan disabled to prevent warping) cools slowly and sags by $30$ mm.

**Why "rule of thumb."** $L_{\mathrm{max}}$ depends on six interacting parameters:
- Bridge speed (slower → more cooling time → more sag time → competing effects)
- Bridge fan ($100\%$ for all but enclosed prints)
- Bridge flow ($90$–$95\%$ for taut bridges)
- Layer height (irrelevant — bridge is single-bead)
- Bead width (wider bead has more thermal mass, cools slower, but has more cross-section to resist sag)
- Anchor-side geometry (cantilevered anchors yield; rigid anchors hold)

A test artifact (Stefan Hermann's "All in One 3D Printer Test", Maker's Muse "Torture Test") characterizes $L_{\mathrm{max}}$ for a given (machine, material, profile) directly.

**Aesthetic vs. structural bridges.** A bridge that sags slightly may still be structurally sound — single-bead PLA bridges with $0.3$ mm sag are at most cosmetic defects. Bridges where sag exceeds bead height ($> h$) interact with the next layer's deposition path and produce structural defects.

**The 100mm-PLA-bridge** is the bragging-rights demonstration of a well-tuned hobbyist FFF setup; achievable with care, not always necessary, and irrelevant for any material more challenging than PLA.
