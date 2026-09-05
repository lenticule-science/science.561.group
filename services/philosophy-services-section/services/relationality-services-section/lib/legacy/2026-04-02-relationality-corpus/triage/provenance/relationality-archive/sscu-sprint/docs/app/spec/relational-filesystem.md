---
name: relational-filesystem
keywords:
  - idea
  - filesystem
  - processes
part-of: relational-computer
description: "Models files, directories, and processes as recognitions so the computer can reason about its substrate."
---

Model files, directories, and processes as recognitions so that the universal
relational computer can reason about and orchestrate its own substrate.

## 1. Core recognitions

- `FileRecognition`
  - Logical files: paths, content hashes, formats, schemas, and provenance
    (which runbooks or processes produced them).
- `DirectoryRecognition`
  - Hierarchical groupings of files, with semantic roles (config, data,
    cache, logs).
- `ProcessRecognition`
  - Running or historical processes: command, arguments, environment, input/
    output files, measurements.
- `CapabilityRecognition`
  - Permissions or capabilities (read/write/execute) over files, directories,
    and processes, tied to identities and policies.

## 2. Topology and measurement

- **Topology**
  - File/directory tree enriched with semantic edges (dataflow, ownership,
    dependency, configuration links).
  - Processes linked to the files they read/write and to higher-level
    recognitions (runbooks, jobs, architectures).
- **Measurement**
  - Disk usage, IO bandwidth, process runtimes, error rates.
  - Data retention/age metrics: when files were last touched, by whom, and
    for what purpose.

## 3. Runbooks and flows

- `run_introspect_filesystem`
  - Scan a directory tree, create/update `FileRecognition` and
    `DirectoryRecognition` nodes with hashes and metadata.
- `run_trace_process`
  - Capture `ProcessRecognition` entries for key jobs, linking them to inputs,
    outputs, and measurements.
- `run_manage_storage_lifecycle`
  - Use topology and measurement to drive backup, archive, deletion, and
    migration (in coordination with `backup-archive-migration.md`).

## 4. Cross-domain connections

- Grounds the storage/replication architecture in concrete OS-level entities.
- Supports reproducibility for research, deployments, and data pipelines by
  making file/process provenance first-class within the relational graph.

