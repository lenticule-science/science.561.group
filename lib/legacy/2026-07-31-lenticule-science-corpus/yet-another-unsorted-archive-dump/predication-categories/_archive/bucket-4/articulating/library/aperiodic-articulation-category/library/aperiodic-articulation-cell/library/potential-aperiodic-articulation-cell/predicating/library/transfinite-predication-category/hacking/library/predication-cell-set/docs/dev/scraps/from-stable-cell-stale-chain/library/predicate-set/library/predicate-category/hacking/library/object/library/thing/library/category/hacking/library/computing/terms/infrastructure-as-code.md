---
title: "infrastructure as code"
aliases:
  - IaC
  - declarative infrastructure
date-created: 2026-04-03
description: "The practice of defining computing infrastructure in version-controlled configuration files rather than manual setup, enabling reproducibility and portability."
---

**Infrastructure as code** (IaC) is the practice of defining computing infrastructure — servers, networks, databases, DNS records, firewall rules — in machine-readable configuration files rather than through manual setup or interactive consoles. The configuration files are version-controlled, reviewed, tested, and applied programmatically.

The idea is simple: if your infrastructure exists only as a sequence of manual steps someone performed, it cannot be reliably reproduced, audited, or moved. If it exists as code, it can be.

Two paradigms:

**Declarative IaC** describes the desired end state. The tool figures out what changes to make. Terraform (HashiCorp, 2014) is the dominant declarative IaC tool — it supports providers for every major hosting platform and cloud service. NixOS applies the declarative principle to the operating system itself — the entire system configuration is a single file that produces a reproducible OS build.

**Imperative IaC** describes the steps to reach the desired state. Ansible (Red Hat, 2012) is the most common imperative tool — it runs sequences of commands on remote machines via SSH. Shell scripts are the simplest form of imperative IaC.

The declarative approach is generally preferred because it handles the gap between current state and desired state automatically. An imperative script that assumes a fresh server will fail on a server that has been partially configured. A declarative tool computes the diff and applies only the necessary changes.

IaC is the primary mechanism for vendor independence in computing infrastructure. A Terraform configuration for a Hetzner VPS can be adapted to DigitalOcean, AWS, or self-hosted hardware by changing the provider block. The application configuration — what software runs, how it is configured — remains the same. Without IaC, migrating between providers means manually recreating every configuration decision.

The concept extends beyond servers. "Policy as code" applies the same principle to organizational rules. "Pipeline as code" (CI/CD configuration files) applies it to build and deployment processes. The underlying insight is the same: anything defined as code is reproducible, auditable, and portable; anything defined by manual action is not.
