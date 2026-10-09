---
title: Medical Data, Care Plans, and Health Trajectories
status: someday
keywords:
  - idea
  - medical
  - health
description: Represent medical records, care plans, and outcomes as recognitions so your health data becomes an explicit, traceable part of the relational universe.
---
# Idea: Medical Data, Care Plans, and Health Trajectories

Represent medical records, care plans, and outcomes as recognitions so your
health data becomes an explicit, traceable part of the relational universe.

## 1. Core recognitions

- `EncounterRecognition`
  - clinic visits, telehealth calls, ER trips; who, where, when, reason.
- `DiagnosisRecognition`
  - conditions (ICD or your own ontology), linked to encounters, tests, and
    body topology.
- `TestResultRecognition`
  - lab tests, imaging, vitals; values, ranges, uncertainties, methods.
- `MedicationRecognition`
  - prescriptions, dosages, schedules, adherence notes.
- `CarePlanRecognition`
  - agreed plans: medications, lifestyle changes, follow-ups, monitoring.

## 2. Topology and measurement

- Topology:
  - body topology (organs, systems) from `BodyRecognition`,
  - timelines of encounters/tests/medications,
  - links to `PaperRecognition` / `MethodRecognition` (guidelines).
- Measurement:
  - time series for vital signs (BP, HR, weight, sleep),
  - adherence metrics (took meds, followed plan),
  - stability/flare-up patterns for conditions.

## 3. Runbooks and questions

- Runbooks:
  - `update_care_plan`, `review_trends`, `prepare_visit_summary`.
- Questions:
  - “How has my blood pressure behaved under different care plans?”
  - “Which changes (diet, meds, sleep) most strongly correlate with improved
    metrics?”
  - “What tests have been done for this symptom, and what remains unexamined?”

With strong local policies and privacy, medical data becomes another domain
where you can reason relationally across time, methods, and outcomes.
