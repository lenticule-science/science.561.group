---
title: "Drug Metabolism and Clearance"
description: "How the body processes and eliminates drugs through hepatic CYP-mediated Phase I/II metabolism and renal clearance, including genetic variation and special populations"
date-created: 2026-03-06
aliases:
  - "drug metabolism"
  - "drug clearance"
keywords:
  - pharmacology
teaches:
  - "Drug Metabolism and Clearance"
component-of: pharmacokinetics
requires: [bioavailability, drug-interaction]
determines: [half-life, therapeutic-index]
governed-by: [cyp-enzymes, renal-function, hepatic-function]
produces: [drug-metabolites, renal-clearance]
enables: pharmacogenomics
authors:
  - claude-opus-4-6
type: text
---

The body treats most drugs as foreign substances to be eliminated. Drug metabolism — primarily in the liver — converts lipophilic (fat-soluble) drugs into more hydrophilic (water-soluble) metabolites that the kidneys can excrete. This process determines how long a drug's effects last, what doses are needed to maintain therapeutic levels, and how drug effects change when the body's processing capacity is impaired.

## Phase I and Phase II metabolism

Hepatic drug metabolism occurs in two sequential phases:

**Phase I (functionalization)** reactions introduce or expose a functional group (hydroxyl, amine, carboxyl) on the drug molecule, making it slightly more polar. These reactions are primarily carried out by the cytochrome P450 (CYP) enzyme superfamily — a group of approximately 57 enzymes embedded in the endoplasmic reticulum of hepatocytes.

The CYP enzymes most relevant to drug metabolism are:

| Enzyme | Approximate % of drugs metabolized | Notable substrates |
|---|---|---|
| CYP3A4 | ~50% | Fentanyl, midazolam, statins, calcium channel blockers, many HIV antiretrovirals |
| CYP2D6 | ~25% | Codeine, tramadol, many antidepressants, metoprolol |
| CYP2C9 | ~10% | Warfarin, phenytoin, many NSAIDs |
| CYP2C19 | ~5% | Omeprazole, clopidogrel, some benzodiazepines |
| CYP1A2 | ~5% | Caffeine, theophylline, some antipsychotics |

The dominance of CYP3A4 — responsible for metabolizing roughly half of all drugs — explains why CYP3A4 inhibitors (ketoconazole, erythromycin, grapefruit juice) and inducers (rifampin, carbamazepine, St. John's Wort) have such broad [drug interaction](../../../glossary/terms/drug-interaction.md) potential.

**Phase II (conjugation)** reactions attach a large polar molecule (glucuronic acid, sulfate, glutathione, amino acid) to the Phase I metabolite (or directly to the parent drug if it already has a suitable functional group). The resulting conjugate is highly water-soluble and readily excreted by the kidneys. Phase II reactions are generally less susceptible to drug interactions than Phase I reactions.

## Genetic variation in metabolism

CYP enzyme activity varies substantially between individuals due to genetic polymorphisms. CYP2D6 illustrates this most dramatically:

- **Poor metabolizers** (~5-10% of Caucasians) lack functional CYP2D6 enzyme. Drugs metabolized by CYP2D6 accumulate at standard doses, increasing the risk of adverse effects. Codeine, which requires CYP2D6 conversion to its active metabolite (morphine) for analgesic effect, produces no pain relief in poor metabolizers.
- **Ultra-rapid metabolizers** (~1-7% of Caucasians, up to 29% of some North African populations) carry multiple copies of the CYP2D6 gene and metabolize drugs extremely quickly. Standard doses may be subtherapeutic. For codeine, ultra-rapid metabolism produces dangerously high morphine levels from standard doses — this has caused fatalities in breastfeeding infants whose mothers were ultra-rapid metabolizers prescribed codeine after delivery.

These genetic variations mean that "standard doses" are population averages that may be inadequate, appropriate, or toxic for any given individual. Pharmacogenomic testing — genotyping relevant CYP enzymes to guide drug selection and dosing — is increasingly available but not yet routinely used.

## Renal clearance

The kidneys eliminate water-soluble drugs and metabolites through three mechanisms:

- **Glomerular filtration** — unbound drug and metabolites filter passively from the blood into the renal tubule
- **Active tubular secretion** — transporters in the renal tubule actively pump drugs from the blood into the tubular fluid
- **Tubular reabsorption** — some filtered drug is reabsorbed from the tubular fluid back into the blood (especially lipophilic drugs that cross tubular membranes)

Renal function declines with age and with kidney disease. When renal clearance is reduced, drugs that are primarily eliminated by the kidneys accumulate. Dose adjustment based on estimated renal function (GFR) is required for renally cleared drugs — failure to adjust is a common cause of iatrogenic toxicity, particularly in elderly patients.

## Special populations

**Neonates and infants** — Phase I enzymes are immature at birth and reach adult levels over weeks to months. Phase II enzymes mature at different rates. Drug metabolism in neonates is slow and unpredictable, requiring careful dose adjustment. The "gray baby syndrome" from chloramphenicol toxicity in neonates was caused by immature glucuronidation (Phase II) leading to drug accumulation.

**Elderly patients** — hepatic blood flow decreases, liver mass decreases, CYP enzyme activity declines, and renal clearance falls. All of these changes slow drug elimination, increasing the risk of accumulation at standard doses.

**Hepatic impairment** — liver disease directly impairs the organ responsible for drug metabolism. In severe hepatic impairment, drugs that normally undergo extensive first-pass metabolism may have dramatically increased [bioavailability](../../../glossary/terms/bioavailability.md), and drugs that depend on hepatic metabolism for clearance may accumulate to toxic levels.

## Metabolism as transformation, not just elimination

A critical point: metabolism does not always inactivate drugs. Phase I metabolism can:

- Convert an active drug to an inactive metabolite (the expected pattern)
- Convert an inactive prodrug to its active form (codeine → morphine; clopidogrel → its active thiol metabolite)
- Convert a drug to a toxic metabolite (acetaminophen → NAPQI, which causes liver necrosis in overdose when glutathione stores are depleted)

Understanding these metabolic pathways is what allows clinicians to predict which patients will respond to a prodrug (those with functional CYP2D6 for codeine), which patients are at risk for toxicity from standard doses (those with impaired glutathione conjugation for acetaminophen), and which drug interactions will have clinical consequences.
