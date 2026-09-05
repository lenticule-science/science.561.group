---
type: question
status: open
depends-on: [process-structure-property-linkage, in-situ-monitoring]
---

# Open: AM qualification and certification

How can AM parts be certified for use in safety-critical applications (aerospace primary structure, medical implants, nuclear) at production volumes, without per-part destructive testing or full-build CT scanning?

## Why this is hard

Conventional manufacturing certifies the *process* once and then certifies parts statistically by lot sampling. This works because conventional processes (forging, casting, machining) are stable: a process qualified at machine A is closely transferable to machine A' of the same model with the same setup. AM is much less stable:

- *Machine-to-machine variation.* Two LPBF machines of the same model from the same vendor produce parts with measurably different mechanical properties under nominally identical settings. Documented in Slotwinski et al. (2014), Lewandowski & Seifi (2016).
- *Build-to-build variation.* Powder lot, recoater wear, ambient conditions, and machine drift all shift the property distribution.
- *Part-to-part variation within a build.* Position on the build plate, neighbor parts (which absorb laser energy), and gas-flow pattern affect each individual part.

So the conventional "qualified process → statistical part qualification" pipeline does not transfer. Three candidate solutions:

## Path 1 — Equivalence

Show that the AM part has equal-or-better allowables (B-basis statistical strength) than the conventional reference part. Approach used by the FAA for the GE LEAP fuel nozzle. Expensive: requires extensive testing of identical parts; eliminates AM's design freedom (because the part must replicate a conventional design).

**Status.** Works but does not scale. Used for narrow part categories.

## Path 2 — Qualified part / qualified process

Lock down everything: machine model, vendor, powder lot, parameters, build layout, post-processing recipe. Certify the part envelope. Approach used by FDA for class III implants and by some defense aerospace primes.

**Status.** Works for low-volume, high-value parts. Does not allow design changes without re-qualification.

## Path 3 — Pedigree-based qualification

Use [in-situ monitoring](./predication-in-situ-monitoring.md) to record a per-part digital pedigree certifying that the process stayed inside its qualified envelope. In principle this is the path to AM-as-flexible-manufacturing: each part is certified individually based on its own thermal/optical/acoustic history.

**Status.** Proposed in principle (NIST AM CoE 2020 roadmap, ASTM F42 working groups), demonstrated in research (Mahmoudi et al. 2019, Mani et al. 2017, Wang et al. 2024). Not accepted by any regulator as the sole basis of part acceptance as of 2026.

## Sub-questions

1. **Sensor → defect → property mapping.** Given a thermal/acoustic anomaly, can we quantify its impact on fatigue life? Without this, in-situ monitoring is suggestive but not certifying. Active work: Snow et al. (2021), Estalaki et al. (2022).
2. **ML model qualification.** If a deep-learning model classifies anomalies, the *model itself* must be qualified. Standards (ISO/IEC 23894:2023) exist for ML risk management but not for safety-critical AM-pedigree models specifically.
3. **Cross-machine transferability.** A pedigree certified on machine A must mean something on machine A'. Open: how to formalize machine equivalence for AM.
4. **Powder-lot tracking.** Pedigree must extend backward through powder atomization and feedstock blending. Standards (52907) exist; full traceability in practice is rare.
5. **Sampling strategy.** Even with full pedigree, some statistical sampling may be required. The optimal sample size as a function of pedigree confidence is an open OR/statistics problem.

## Why this matters

Without a pedigree-based path, AM is permanently confined to low-volume regulated applications. Solving qualification is the unlock for AM as a mass-production technology in aerospace, medical, and nuclear. Industry estimates (Wohlers, NIST) put the addressable market unlock at order $50–100 B annually.

## References

- [Seifi et al. (2017)](./predication-seifi-et-al-2017.md) — the standardization roadmap.
- Mahmoudi, M., et al. (2019). "On the printability and qualification of metal AM." *JOM* 71(8).
- NIST AM CoE Strategic Roadmap (updated 2023).
- FDA Guidance: *Technical Considerations for Additive Manufactured Medical Devices* (2017, draft revision 2024).
