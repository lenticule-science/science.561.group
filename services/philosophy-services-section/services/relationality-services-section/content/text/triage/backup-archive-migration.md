---
title: Backup, Export, and Migration
status: someday
keywords:
  - idea
  - backup
  - migration
---
# Idea: Backup, Export, and Migration

Treat backups and exports as recognitions and runbooks so moving/archiving data
is traceable and reversible.

## 1. Recognitions

- `BackupPlanRecognition`: what to back up, how often, where.
- `BackupRunRecognition`: specific backup executions with hashes and sizes.
- `ExportRecognition`: exports to other formats/systems (JSON, RDF, files).
- `MigrationRecognition`: moves between schemas or environments.

## 2. Measurement and topology

- Measurement:
  - backup success rates, time, storage usage, restore tests.
- Topology:
  - which recognitions are covered by which backups/exports.

Runbooks: `run_backup`, `verify_backup`, `restore_from_backup`,
`export_slice`, `run_migration` keep resilience work coherent with snapshots
and archives.
