---
title: Content Identifier (CID)
description: A label in IPFS that points to material based on the content's cryptographic hash rather than its location.
date-created: 2026-04-05
sources:
  - url: https://docs.ipfs.tech/concepts/content-addressing/
---

A Content Identifier (CID) is a label used in IPFS to point to material based on the content itself, not where the content is stored. Identifying material by the value of its hash is called **content addressing**.

A CID encodes:
- The hash function used (typically SHA256)
- The hash value itself
- The data structure type (DAG node, raw file, etc.)

When you add a file to IPFS, each chunk is given a unique CID. The root node's CID becomes the file's identifier — what you share with others to retrieve it.

**Key property**: The CID is univocally linked to the content's entire tree. Any change to the content changes the hash, which changes the CID. This makes content addressing immutable by construction — a CID cannot point to two different files.

This contrasts with location addressing (URLs), where the same address might point to different content if the server operator changes it.

See: [Content-Addressed Storage: IPFS, Arweave, and the Permaweb](../texts/content-addressed-storage.md)
