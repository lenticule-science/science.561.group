---
type: concept
class: mechanical-property
depends-on: [layer, anisotropy]
realizes: []
---

# Residual stress (in additive manufacturing)

Self-equilibrating stress locked into a finished part by the build process, present in the part even with no external load. In AM, residual stress arises from differential thermal contraction: each newly-deposited layer cools and shrinks while constrained by the cooler layers below it, leaving the upper layer in residual tension and the lower layers in residual compression.

**Why it matters.**

- *Distortion.* When a part is removed from the build plate, the cut releases a constraint and the part springs to a new equilibrium shape — the post-removal distortion. This is the dominant source of dimensional error in metal LPBF.
- *Cracking.* If residual stress exceeds yield in tension during cooling (metal AM) or below $T_g$ (polymer AM), through-thickness cracks open. The "delamination" failure mode in tall ABS prints is residual-stress-driven cracking at the layer interface.
- *Fatigue.* Residual surface tension shortens fatigue life; residual surface compression (analogous to shot peening) extends it. Some post-processing treatments (laser shock peening, surface burnishing) deliberately invert the residual-stress profile.

**Magnitude.** In LPBF Ti-6Al-4V, residual stress can reach ~70% of yield (>500 MPa) at the build-plate interface. In FFF ABS, the analog is the warp-corner stress, which at $\Delta T = 80$°C and $\alpha = 90 \times 10^{-6}$ /°C is order $E \alpha \Delta T \approx 14$ MPa — small by metal standards but enough to overcome bed adhesion.

**Prediction.**

- *Inherent strain method* (Ueda 1975, Keller 2017). The standard fast simulation: replace the full thermo-mechanical solve with a calibrated layer-by-layer "inherent strain" applied to a structural FEA. Used by Ansys AM, Simufact AM, Netfabb Local Simulation.
- *Full thermo-mechanical FEA.* Slower but does not require calibration. Used for new alloys and processes.
- *Surrogate models.* 2022– research wave: deep-learning models trained on FEA outputs to predict distortion in seconds rather than hours, enabling design-time iteration.

**Mitigation.**

- *Build orientation.* Orient long thin features along Z to minimize the moment arm for distortion.
- *Support strategy.* Use supports to constrain regions of high residual stress.
- *Stress-relief heat treatment.* Standard for metal LPBF: 600–650°C / 2 h for Ti-6Al-4V; 980–1080°C HIP cycle for IN718. Releases residual stress by creep relaxation, also closes some porosity.
- *Build-plate heating.* Reduces $\Delta T$, reduces residual stress.

**FFF analog.** [Cooling-warping tradeoff](../theorems/cooling-warping-tradeoff.md). Same mechanism, different mitigation (heated chamber instead of stress-relief anneal).
