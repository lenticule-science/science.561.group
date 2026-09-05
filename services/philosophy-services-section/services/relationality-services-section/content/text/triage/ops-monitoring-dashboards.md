---
title: Ops Monitoring & Dashboards
status: someday
keywords:
  - idea
  - monitoring
  - ops
---
# Idea: Ops Monitoring & Dashboards

Use the measurement fabric to build practical “devops” style dashboards for the
relational computer and its services.

## 1. Recognitions

- `ServiceRecognition`: runtime, storage, network, ingestion, etc.
- `SLORecognition`: service-level objectives (latency, error rate, throughput).
- `AlertPolicyRecognition`: conditions for alerts.

## 2. Measurement and views

- Measurement:
  - per-service metrics (latency, errors, queues, resource usage).
- Views:
  - dashboards combining SLOs, active alerts, and runbook recommendations
    (e.g., “run deployment rollback”, “throttle intake”).

Runbooks: `respond_to_alert`, `tune_slo`, `review_incident` make ops work
explicit and reusable.
