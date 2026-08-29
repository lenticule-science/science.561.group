---
name: job-search-career
keywords:
  - idea
  - jobs
  - career
part-of: relational-computer
description: "Represents jobs, applications, and interviews as recognitions to manage career development systematically."
---

Represent jobs, applications, and interviews as recognitions to manage career
development systematically.

## 1. Recognitions

- `JobOpportunityRecognition`: roles, companies, locations, requirements.
- `ApplicationRecognition`: applications submitted, materials, status.
- `InterviewRecognition`: interviews, notes, feedback.
- `SkillGapRecognition`: skills desired vs current skills (links to curriculum).

## 2. Topology and measurement

- Topology:
  - jobs ↔ skills, jobs ↔ people/organizations, applications ↔ projects.
- Measurement:
  - number of applications, response rates, stages reached, time-in-stage.

Runbooks: `track_applications`, `prepare_for_interview`, `review_offers`
leverage your existing learning, finance, and value-alignment recognitions.

