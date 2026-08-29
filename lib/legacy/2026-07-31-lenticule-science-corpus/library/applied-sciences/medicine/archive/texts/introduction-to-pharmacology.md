---
title: "Introduction to Pharmacology"
description: "An overview of pharmacology covering pharmacodynamics, pharmacokinetics, the therapeutic index, and how pharmacological literacy underpins harm reduction."
aliases:
  - "Introduction to Pharmacology"
authors:
  - claude-opus-4-6
date-created: 2026-03-06
date-modified: 2026-03-29
type: lesson
keywords:
  - Pharmacology
teaches:
  - "Introduction to Pharmacology"
contains: [pharmacodynamics, pharmacokinetics, therapeutic-index, half-life, bioavailability]
acts-on: [receptor, enzyme, ion-channel]
enables: [harm-reduction, pain-management, dose-response]
requires: [human-body, nervous-system]
---

## The lock and the key — and why this metaphor fails

You have probably heard the "lock and key" explanation of how drugs work: a drug molecule fits into a receptor on a cell like a key fits into a lock, and this produces an effect. The metaphor is intuitive. It is also misleading in ways that matter.

A lock has two states: locked and unlocked. A key either fits or it does not. But a [receptor](../topics/human-body/terms/receptor.md) is not a lock. It is a protein embedded in a cell membrane that changes shape when a molecule binds to it — and the shape it assumes depends on *which* molecule binds, *how tightly*, and *for how long*. Different molecules binding to the same receptor can produce different effects, partial effects, or blocking effects. The receptor is not a switch. It is a variable.

This matters clinically. Consider three drugs that all bind to the same opioid receptor:

- **Morphine** is a full agonist — it binds to the mu-opioid receptor and activates it fully. High efficacy, high risk of respiratory depression.
- **Buprenorphine** is a partial agonist — it binds to the same receptor but only partially activates it. It produces pain relief and reduces withdrawal, but has a ceiling effect: beyond a certain dose, more drug does not produce more activation. This ceiling is what makes buprenorphine safer than morphine — it is much harder to fatally overdose on.
- **Naloxone** is an antagonist — it binds to the same receptor but does not activate it at all. Instead, it blocks other molecules (like morphine or fentanyl) from binding. This is why naloxone reverses opioid overdose: it displaces the opioid from the receptor and stops the activation that is suppressing breathing.

Three drugs. Same receptor. Radically different effects. The "lock and key" metaphor cannot explain this. [Pharmacodynamics](../topics/pharmacology/terms/pharmacodynamics.md) — the study of what drugs do to the body — can.

## What pharmacology actually studies

[Pharmacology](../topics/pharmacology/index.md) studies how drugs interact with living systems. It has two fundamental branches:

**[Pharmacodynamics](../topics/pharmacology/terms/pharmacodynamics.md)** — what the drug does to the body. How it binds to targets ([receptors](../topics/human-body/terms/receptor.md), enzymes, ion channels), what cellular processes it activates or inhibits, and what physiological effects result. The morphine/buprenorphine/naloxone example above is a pharmacodynamic question.

**[Pharmacokinetics](../topics/pharmacology/terms/pharmacokinetics.md)** — what the body does to the drug. How the drug is absorbed (from gut, skin, lungs, or injection site into the bloodstream), distributed (from blood to tissues), metabolized (broken down, primarily by liver enzymes), and excreted (removed from the body, primarily through kidneys). Pharmacokinetics determines how much drug reaches its target, how quickly, and for how long.

These two branches answer different but inseparable questions. Pharmacodynamics tells you that naloxone blocks opioid receptors. Pharmacokinetics tells you that naloxone's [half-life](../topics/pharmacology/terms/half-life.md) is 30–90 minutes — shorter than most opioids — which is why someone rescued from overdose with naloxone can re-enter respiratory depression when the naloxone wears off but the opioid is still present. The pharmacodynamic fact (it blocks the receptor) without the pharmacokinetic fact (it wears off quickly) is dangerous half-knowledge.

## The therapeutic index: how drugs can help and harm

Every drug that does something useful also does something harmful. The question is never "does this drug have side effects?" — the answer is always yes. The question is: **how far apart are the dose that helps and the dose that harms?**

The [therapeutic index](../topics/pharmacology/terms/therapeutic-index.md) is the ratio between the toxic dose and the therapeutic dose. A drug with a wide therapeutic index (like ibuprofen) has a large margin between the dose that reduces pain and the dose that causes harm. A drug with a narrow therapeutic index (like warfarin, digoxin, or lithium) has a small margin — the dose that helps is close to the dose that kills. Narrow therapeutic index drugs require careful monitoring because small changes in dose, metabolism, or drug interactions can push the patient from therapeutic to toxic.

This is not an abstract concept. It is the reason people die of accidental overdoses:

- **Fentanyl** has an extremely narrow therapeutic index — the difference between a dose that manages pain and a dose that stops breathing is small. When fentanyl contaminates the illicit drug supply, users who have calibrated their dose for heroin (wider therapeutic index) receive a drug that is far more potent at the same weight. They are not "using too much." They are encountering pharmacokinetic and pharmacodynamic parameters they cannot see.
- **Alcohol** has a narrower therapeutic index than most people realize, and tolerance shifts it further: a person with high tolerance can drink quantities that would kill a non-tolerant person, but their liver damage accumulates regardless.

## Pharmacology as harm reduction infrastructure

Pharmacological knowledge is not neutral information. It is infrastructure for survival. [Harm reduction](../terms/harm-reduction.md) practices — naloxone distribution, safer supply, drug checking, opioid agonist therapy — are applied pharmacology. They work because someone understood the pharmacological principles:

- **Naloxone saves lives** because competitive antagonism at the mu-opioid receptor reverses respiratory depression. But naloxone's short half-life means the overdose can recur — which is why naloxone kits include instructions to call emergency services, not just administer the drug.
- **Methadone maintenance works** because a long-acting full agonist (methadone, half-life 24–36 hours) prevents withdrawal and craving without the cycle of intoxication and withdrawal that a short-acting agonist (heroin, half-life 30 minutes) produces.
- **Drug checking saves lives** because knowing the [bioavailability](../topics/pharmacology/terms/bioavailability.md) and potency of what you are consuming allows dose adjustment. A person who knows their supply contains fentanyl can adjust their dose. A person who does not know is making pharmacokinetic decisions without pharmacokinetic information.

This is why the [pharmacology and harm reduction](../topics/pharmacology/texts/pharmacology-and-harm-reduction.md) text argues that pharmacological literacy is not a clinical luxury — it is the knowledge base that makes rational risk management possible. Withholding this knowledge from drug users (through criminalization, through moralizing, through the assumption that knowledge enables harm) is itself a cause of death.

## Self-check

<details>
<summary>1. A patient on methadone maintenance is prescribed a new medication. The prescriber does not check for drug interactions. The patient develops respiratory depression. Using pharmacological concepts, explain what likely happened.</summary>

Methadone is metabolized by cytochrome P450 enzymes in the liver (primarily CYP3A4 and CYP2B6). If the new medication inhibits these enzymes, methadone's metabolism slows — it is cleared from the body more slowly, and blood levels rise. The same daily dose of methadone now produces higher peak and trough concentrations. Since methadone is a full opioid agonist with a relatively narrow therapeutic index at higher doses, the increased blood level pushes the patient from the therapeutic range into the respiratory depression range. This is a pharmacokinetic drug interaction — the body's handling of methadone changed, even though the methadone dose did not.
</details>

<details>
<summary>2. Why is buprenorphine safer than methadone for opioid use disorder treatment, even though both are opioid agonists?</summary>

Buprenorphine is a partial agonist — it binds to the mu-opioid receptor but only partially activates it. This creates a ceiling effect: beyond a certain dose, more buprenorphine does not produce more receptor activation. This ceiling limits respiratory depression, which is the mechanism of opioid overdose death. Methadone is a full agonist — more dose produces more activation without a ceiling, so respiratory depression increases with dose. Buprenorphine's partial agonism makes it much harder to fatally overdose on, which is why it can be prescribed in outpatient settings while methadone typically requires supervised dosing at specialized clinics.
</details>

<details>
<summary>3. A naloxone training says "always call 911 after administering naloxone, even if the person wakes up." Using pharmacokinetics, explain why.</summary>

Naloxone's half-life is 30–90 minutes, but the opioids it displaces from the receptor (especially fentanyl and methadone) have much longer half-lives. When naloxone wears off, the opioid molecules are still present in the body and can re-bind to the receptors, causing respiratory depression to return. The person who "woke up" after naloxone is not out of danger — they are temporarily protected by a drug that will wear off before the opioid does. Emergency services are needed because the person may require repeated naloxone doses or medical monitoring until the opioid is cleared.
</details>

## What comes next

- [How Drugs Work](../topics/pharmacology/texts/how-drugs-work.md) — the full mechanism: receptors, enzymes, ion channels, selectivity
- [Dose-Response Relationships](../topics/pharmacology/texts/dose-response-relationships.md) — potency, efficacy, therapeutic window
- [Drug Metabolism and Clearance](../topics/pharmacology/texts/drug-metabolism-and-clearance.md) — CYP enzymes, genetic variation, drug interactions
- [Pharmacology and Harm Reduction](../topics/pharmacology/texts/pharmacology-and-harm-reduction.md) — pharmacological literacy as survival infrastructure
