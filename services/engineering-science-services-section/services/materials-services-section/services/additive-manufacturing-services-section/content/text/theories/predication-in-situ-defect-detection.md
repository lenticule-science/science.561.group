---
type: question
status: open
depends-on: [in-situ-monitoring, process-structure-property-linkage]
---

# Open: Generalizable in-situ defect detection across machines and parts

In-situ monitoring sensors (see [in-situ-monitoring](./predication-in-situ-monitoring.md)) generate detailed datasets per build. Deep-learning defect classifiers trained on these datasets achieve >95% accuracy on lab benchmarks (Scime & Beuth 2018, Snow et al. 2021, Brion & Pattinson 2022). The open problem is that these classifiers do not generalize: a model trained on machine A printing geometry G performs poorly on machine A' (same model, different unit) and even worse on a different geometry G'.

## What goes wrong

1. **Sensor calibration drift.** Pyrometers age. Cameras change focus. Acoustic sensors couple differently to subtly different builds. The "same" sensor on two machines produces statistically different signals.

2. **Geometry-specific signal distributions.** A part with thick sections has different cooling-rate signatures than a thin part; the defect-free baseline is geometry-dependent. Classifiers trained on a corpus of test-coupon builds do not transfer to production part geometries.

3. **Material lot variability.** Powder lot, filament spool, resin batch all shift the baseline signature. A model qualified on lot L produces false positives or negatives on lot L+1.

4. **Defect-class imbalance.** True defects are rare in well-tuned processes. Training datasets must be augmented (synthetic defects, domain randomization) or use few-shot / anomaly-detection framings; both have well-known performance penalties.

## Sub-questions

1. **Physics-informed models.** Replace black-box CNNs with models that take the underlying thermal-physics into account (e.g., predict melt-pool temperature from process parameters; flag anomalies relative to physics prediction). Active research: Estalaki et al. (2022), Xie et al. (2024). Open: how much does this generalize, and at what compute cost?

2. **Self-supervised pre-training.** Pretrain on unlabeled in-situ data from many machines / materials / geometries; fine-tune with small labeled defect dataset. Standard ML pattern; not yet demonstrated to deliver the cross-machine generalization needed.

3. **Domain adaptation across machines.** Treat machine-to-machine transfer as a domain-shift problem. Borrow techniques from medical-imaging (where the analog is hospital-to-hospital generalization). Limited published work on the AM case.

4. **Anomaly detection rather than classification.** Define "normal" by a probabilistic model of the in-process signal and flag deviations. Avoids the labeled-defect problem. The challenge is calibrating the deviation threshold and the false-positive rate.

5. **Physics-based simulation augmentation.** Generate synthetic defect data via FEA or CFD simulation; train on the augmented dataset. The simulation has to be accurate enough that defect signatures match real ones — open question for most processes.

## Connection to qualification

Defect *detection* is a necessary precondition for [pedigree-based qualification](./predication-qualification-and-certification.md), but not sufficient. Detection must be linked to *property impact*: a detected anomaly must come with a credible estimate of how much it reduced fatigue life or static strength. This is a separate ML/physics modeling problem.

## What success would look like

A defect-detection model deployed on an arbitrary AM machine, after a brief calibration build (no defect labels needed), provides per-part flagging with quantified false-positive rate. The detection feeds either (a) operator alert for catastrophic anomaly, (b) per-part property derating for downstream design margin calculation, or (c) part rejection in a pedigree-qualification flow.

## References

- **Scime, L., Beuth, J. (2018).** "Anomaly detection and classification in a laser powder bed additive manufacturing process using a trained computer vision algorithm." *Additive Manufacturing* 19.
- **Snow, Z., Diehl, B., Reutzel, E. W., Nassar, A. (2021).** "Toward in-situ flaw detection in laser powder bed fusion AM through layerwise imagery and machine learning." *Journal of Manufacturing Systems* 59.
- **Brion, D. A. J., Pattinson, S. W. (2022).** "Generalisable 3D printing error detection and correction via multi-head neural networks." *Nature Communications* 13.
- **Petsiuk, A. L., Pearce, J. M. (2022).** "Open source computer vision-based layer-wise 3D printing analysis." *Additive Manufacturing* 50.
- **Estalaki, S. M., et al. (2022).** "Predicting defects in laser powder bed fusion using in-situ thermal imaging data and machine learning." *Additive Manufacturing* 58.
