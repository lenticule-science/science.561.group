---
title: Frozen Astrometry Fragments
description: "This repository explores a deliberately constrained way of working with astronomical data: small, frozen, checksummed astrometric slices that directly constrain software behavior."
---
# Frozen Astrometry Fragments

This repository explores a deliberately constrained way of working with astronomical data: **small, frozen, checksummed astrometric slices that directly constrain software behavior**. The goal is not to replace existing astronomy tools, but to make explicit what they usually hide—provenance, absence, and the conditions under which a claim is even well-formed.

The core object in this repo is a *fragment*: a minimal dataset derived once from an authoritative catalog (e.g., Gaia Data Release 3 or the Yale Bright Star Catalogue), then fixed. Fragments are treated as locally valid, not globally representative. They are not refreshed, enriched, or silently repaired.

## Motivation

Most tools say “based on real data” while allowing their behavior to drift far beyond what the data actually constrains. This repo is an attempt to reverse that default. Here, **data is not decoration**. If a behavior cannot be justified by a column in the fragment, it does not run. Missing structure is surfaced as refusal, not patched over with models or defaults.

This makes the resulting software brittle, sparse, and occasionally frustrating by design. That brittleness is the point.

## What a Fragment Is

A fragment is:
- **Derived** (not primitive): produced from an upstream catalog using a documented query.
- **Frozen**: published once, versioned, and checksummed.
- **Minimal**: contains only columns required to support specific operations.
- **Operative**: software behavior is a pure function of fragment contents plus explicit parameters.

A fragment is *not*:
- A live view into a catalog.
- A comprehensive or up-to-date sky model.
- An implicit endorsement of any astrophysical inference beyond the listed fields.

## Typical Columns

Fragments usually include only core astrometry:
- Right ascension and declination
- Parallax (if available)
- Proper motion (if available)
- One photometric magnitude

No spectral classes, masses, ages, or evolutionary models are included unless explicitly justified and documented.

## What You Can Do With This

This repo supports tools and experiments that:
- Animate sky deformation over long timescales using only measured proper motion.
- Shift the observer’s position and expose parallax-driven perspective fractures.
- Test the temporal stability of culturally defined constellations.
- Demonstrate brightness–distance paradoxes without astrophysical enrichment.
- Refuse to perform inference when required structure is absent.

The emphasis is on **arguable outputs**: results that can be traced back to individual cells in a CSV.

## What You Cannot Do (By Design)

You cannot:
- Infer stellar mass, age, or evolution without adding new data.
- Smooth over missing values or extrapolate beyond documented regimes.
- Claim realism, completeness, or “the actual sky” as a global object.

If something fails, that failure is the output.

## Repository Structure

data/
fragments/
gaia_dr3_minimal_v1.csv
bsc5_visible_v1.csv
provenance/
gaia_dr3_minimal_v1.md

tools/
render/
tests/
notebooks/

docs/
assumptions.md
refusals.md

csharp
Copy code

This structure is suggestive, not prescriptive. The invariant is that **data, provenance, and behavior are separable and inspectable**.

## Provenance

Every fragment has a provenance note describing:
- Source catalog and release
- Query or selection criteria
- Columns retained and columns discarded
- Known limitations and non-claims

Provenance is constitutive, not optional metadata.

## Design Principle (One Sentence)

> If a behavior cannot be justified by the fragment, the correct output is refusal.

## Status

This is an exploratory research artifact. Interfaces, formats, and scope may change, but the constraint discipline is non-negotiable.

## License

Data retains the license of its upstream source. Code is licensed separately; see LICENSE for details.