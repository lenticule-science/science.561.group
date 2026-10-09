---
name: "Interchain Security Module"
date-created: 2026-10-08
aliases:
  - "ISM"
  - "Hyperlane ISM"
description: "A contract that decides whether a cross-chain message is valid for a receiving application, chosen by that application, for example m-of-n validator signatures or an aggregate of such checks."
references: {}
---

An **interchain security module (ISM)** is the Hyperlane component that verifies a message before a recipient contract executes it. Each application selects its module, which may check an m-of-n set of validator signatures, route by origin chain, or require several other modules to pass together. The recipient's security therefore equals its chosen module, not a global verifier set; a mailbox default applies if the application does not choose one. Validator signatures on a checkpoint are not specific to one module, so any module can reuse validators already running.
