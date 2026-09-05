---
name: archives-media
keywords:
  - idea
  - archives
  - media
part-of: relational-computer
description: "Treats documents, images, audio/video, and edits as recognitions with explicit provenance."
---

Treat documents, images, audio/video, and edits as recognitions with explicit
provenance.

## 1. Recognitions

- `ArtifactRecognition`: a document, image, recording, dataset.
- `VersionRecognition`: specific version of an artifact.
- `EditRecognition`: change operations (diffs).
- `ProvenanceRecognition`: how/where an artifact was created/obtained.

## 2. Topology and measurement

- Topology:
  - citation/remix graphs, collections, exhibits.
- Measurement:
  - access frequency, preservation risk, bit rot checks.

Runbooks: `ingest_archive`, `migrate_format`, `verify_integrity` make archival
work explicit and auditable.

