---

title: "Dose-Response Relationships"
description: "How the magnitude of a drug's effect changes as dose increases, covering potency, efficacy, the therapeutic window, individual variation, and overdose mechanics"
date-created: 2026-03-06
aliases:
  - "dose-response"
keywords:
  - pharmacology
teaches:
  - "Dose-Response Relationships"
requires: [pharmacodynamics, pharmacokinetics]
contains: [potency, efficacy, therapeutic-window]
determines: [therapeutic-index, overdose-risk]
enables: [dose-titration, harm-reduction]
---

The dose-response relationship describes how the magnitude of a drug's effect changes as the dose increases. It is the most fundamental relationship in pharmacology — and misunderstanding it produces prescribing errors, overdose deaths, and failed treatments.

## The dose-response curve

For most drugs acting on receptors, the relationship between dose and effect follows a sigmoidal (S-shaped) curve when plotted on a logarithmic scale:

- At very low doses, the drug occupies few receptors and produces minimal effect
- In the steep middle portion of the curve, small dose increases produce large increases in effect — this is the sensitive range where dosing adjustments have the most impact
- At high doses, the curve flattens — most receptors are occupied, and further dose increases produce diminishing additional effect (the "ceiling effect")
- Beyond a certain point, maximal effect (Emax) is reached; no amount of additional drug produces more of the intended effect

## Key parameters

**Potency (ED₅₀)** — the dose required to produce 50% of the maximal effect. A more potent drug achieves the same effect at a lower dose. Potency does not determine efficacy or safety — a very potent drug is not necessarily more effective or more dangerous than a less potent one. It simply requires fewer milligrams. Fentanyl is roughly 100 times more potent than morphine (a much lower dose produces the same analgesic effect), but it is not 100 times more effective — both achieve similar maximal analgesia.

**Efficacy (Emax)** — the maximal effect a drug can produce regardless of dose. This is determined by the drug's interaction with its target. A full agonist can produce the maximal receptor response; a partial agonist cannot, even at receptor saturation. This ceiling effect is clinically significant: buprenorphine's ceiling on respiratory depression is what makes it safer than morphine in overdose.

**Potency vs. efficacy** — a common source of confusion. A drug can be highly potent (works at very low doses) but have low efficacy (cannot achieve a large maximal effect). Conversely, a drug can have low potency (requires high doses) but high efficacy (produces a large maximal effect at those doses). Clinical decision-making cares primarily about efficacy — whether the drug can produce the desired effect — and about safety. Potency matters mainly for practical dosing.

## The therapeutic window

The dose-response curve for the desired effect is not the only relevant curve. Every drug also has dose-response curves for its adverse effects. The relationship between these curves defines the [therapeutic index](../terms/therapeutic-index.md):

- If the curve for adverse effects is far to the right of the curve for therapeutic effects, there is a wide therapeutic window — the drug is relatively safe
- If the curves overlap, the therapeutic window is narrow — the dose that helps is close to the dose that harms
- If the adverse-effect curve is to the left of the therapeutic curve, the drug is toxic at therapeutic doses and is not clinically useful (or requires very careful monitoring)

## Individual variation

The dose-response curves described above are population averages. Individual patients may fall anywhere on the distribution due to:

- **Genetic variation** — polymorphisms in drug-metabolizing enzymes (CYP2D6, CYP2C19), drug transporters, and drug targets produce "ultra-rapid metabolizers" (who need higher doses), "poor metabolizers" (who need lower doses), and everything in between
- **Age** — neonates have immature metabolic enzymes; elderly patients have decreased renal and hepatic function
- **Body composition** — weight, fat distribution, and total body water affect drug distribution
- **Organ function** — renal and hepatic impairment alter drug clearance
- **Tolerance** — prior exposure to a drug or related drugs shifts the dose-response curve to the right (requiring higher doses for the same effect)
- **Drug interactions** — concomitant medications alter [pharmacokinetics](../terms/pharmacokinetics.md) or [pharmacodynamics](../terms/pharmacodynamics.md)

This individual variation is why population-based dose recommendations are starting points, not destinations. The clinical skill is adjusting the dose based on the individual patient's response — titrating to effect while monitoring for toxicity.

## Dose-response and overdose

Overdose occurs when the dose exceeds the top of the therapeutic window. For opioids, the critical dose-response relationship is between analgesia/euphoria and respiratory depression. Tolerance shifts the analgesia curve to the right (higher doses needed for the same effect) faster than it shifts the respiratory depression curve. This means that as tolerance develops, the therapeutic window narrows — the dose needed for pain relief or euphoria approaches the dose that suppresses breathing.

When a tolerant person loses tolerance (through incarceration, hospitalization, or a period of abstinence) and then resumes their previous dose, the analgesia curve has shifted back to the left (less tolerance) while the respiratory depression curve has shifted back further. The dose that was previously tolerated now exceeds the respiratory depression threshold. This is the pharmacological mechanism behind the high rate of overdose death after release from incarceration — and the harm reduction rationale for naloxone distribution, supervised consumption, and opioid agonist therapy during and after periods of reduced use.
