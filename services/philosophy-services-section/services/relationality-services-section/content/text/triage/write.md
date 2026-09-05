---
title: Process
date-created: "2026-03-04T00:00:00"
type: "[verb](verb)"
delta:
  - [signal pressure](signal pressure)
  - [undefined modulation](undefined modulation)
lambda:
  - [harmonize](harmonize)
  - [modulate](modulate)
enfolds:
  - [text generation](text generation)
  - [telemetricism](telemetricism)
---


When used as a [telemetric method](telemetric method) by another [telemetric record](telemetric record), to *write* means to go through a process of [harmonize|harmonizing](harmonize|harmonizing) and [modulate|modulating](modulate|modulating) a collection of [telemetric signal|telemetric signals](telemetric signal|telemetric signals), necessarily including a [voice](voice) as a [telemetric lambda](telemetric lambda).

## Process

- **Scan for candidate delta records:**
	- Match any record whose [telemetric delta](telemetric delta) or [telemetric enfold|enfolds](telemetric enfold|enfolds) contain any enfolds from the calling record.
	- Include any records whose enfolds contain any [telemetric adjoint|adjoints](telemetric adjoint|adjoints) from the calling record.
- **Tally frequency:**
	- Count how often each record appears
	- Optionally weight by recency or lambda overlap
- **Select records:**
	- Filter to include at least one `voice`
	- Select high-tally records
- **Modulate:**
	- Extend the calling record with generated text.
		- Let `voice` shape the structure
	- Follow signal behavior, not topic logic
- **Finalize**
	- Apply [grammatize telemetric record](grammatize telemetric record) to the calling record.
