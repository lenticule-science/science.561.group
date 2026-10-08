---
title: Lab Notebook & Experimental Pipeline
status: someday
keywords:
  - idea
  - experiments
  - lab
description: Treat experiments, protocols, and results as recognitions to get a relational lab notebook.
---
# Idea: Lab Notebook & Experimental Pipeline

Treat experiments, protocols, and results as recognitions to get a relational
lab notebook.

## 1. Recognitions

- `ProtocolRecognition`: steps, materials, conditions.
- `ExperimentRunRecognition`: specific execution of a protocol.
- `ObservationRecognition`: measurements taken during a run.
- `AnalysisRecognition`: models, fits, plots, conclusions.

## 2. Linking and traceability

- Protocols link to acts measuring and transforming observables.
- Experiment runs link to:
  - versioned protocols,
  - input samples (datasets, specimens),
  - devices (sensors, machines).
- Analysis recognitions depend on runs + methods (`MethodRecognition` from the
  papers idea).

## 3. Runbooks

- `plan_experiment`, `run_experiment`, `analyze_results`, `publish` runbooks
  implement the experimental pipeline, with snapshots and audit for each phase.
