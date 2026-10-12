---
title: Source reconciliation observations
date-created: 2026-10-12
description: Distinguish source identity observations from preservation responsibility, useful content and independently received capability.
---

# Source reconciliation observations

This specification supports the Group's continuing repository reconciliation.
It applies the existing [digital-preservation](../../../glossary/terms/digital-preservation.md)
distinction between storage and a responsibility to a named receiving community.
The desired end is useful source in its coherent live owner and consumers.

Let a source observation retain repository identity, immutable commit, verified
complete Git tree and a selected path scope. Let an explicit path mapping name
the intended current locations. Compare object IDs together with modes and types;
preserve symlinks, child commits and empty directories. A complete-tree hash must
be reconstructible from the supplied metadata before using it as an observation.
For a selected location, a chain of complete immediate-tree identities can bind
that location to the commit root without reading every descendant. The chain
must end at the observed object, proven absence or unread child boundary. Only
those locations and explicitly observed complete subtrees establish coverage;
omitted paths cannot be labelled absent.

The resulting predicates have limited meanings:

- **Object match:** the mapped location has the same Git object, mode and type.
- **Changed:** both selected objects exist and their recorded identities differ.
- **Missing:** the location is absent within an actually observed tree boundary.
- **Unresolved:** observation stops at a child Gitlink or fails its source bound.
- **Removed and absent:** the proposal calls for removal and that selected path
  is absent. This alone says nothing about preservation of its former effects.

A path below an unread child commit cannot establish absence. A mapped object
match does not establish that duplicated previous locations have been retired;
observe those locations separately. Additional target objects are neither loss
nor proof of improvement. Mechanical disjointness and commit containment do not
establish semantic independence, correct ownership or useful receiving.

Content assessment therefore needs the intended effect, current consumer,
necessary information, provenance and actual conditions of satisfaction.
Preserving an uncertain original does not require importing it into the active
implementation. Conversely, retaining its Git history does not make its useful
capability available to a consumer.

Engineering realizes these observation predicates at the shared Git evidence
owner. Group source operations selects the actual scope and supplies the result
to the original work's decision. Independent consumer evidence establishes
capability receiving. Provider read success grants no mutation authority, and
none of these observations grants publication or disclosure permission.
