---
title: External Integrations & Connectors
status: someday
keywords:
  - idea
  - integrations
  - connectors
---
# Idea: External Integrations & Connectors

Model external APIs and services as recognitions so integrations stay explicit
and governable.

## 1. Recognitions

- `IntegrationRecognition`: description of an external service (API, DB, SaaS).
- `ConnectorRecognition`: code/config that talks to an integration.
- `SyncJobRecognition`: recurring or ad-hoc sync tasks.

## 2. Policy and measurement

- Policy:
  - who/what may use an integration, data flow constraints.
- Measurement:
  - request volumes, error rates, latency, data freshness.

Runbooks: `configure_integration`, `run_sync`, `disable_integration` help keep
integrations from becoming hidden, fragile wiring.
