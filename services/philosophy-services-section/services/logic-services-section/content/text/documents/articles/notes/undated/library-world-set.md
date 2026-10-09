---
name: world-set
description: "A set W of worlds over which the modal structure on a settlement is indexed. May be the settling-bound λ itself (worlds = settling ordinals) or a separate index set chosen for the modal application. The index set the bilattice-accessibility-relation and modal operators range over."
symbol: "W"
depends-on: [settling-bound]
derives-from: docs/dev/scraps/world-set.md
title: world-set
---

# World set

A set, denoted `W`, of **worlds** over which the modal structure on a settlement is indexed. The world-set is the **index set** for modal-style quantification (necessity, possibility, accessibility).

## Two natural choices for `W`

**Choice 1 — temporal worlds.** `W = λ` (the settling-bound). Each "world" is an ordinal settling-step. Modal claims about temporal-modal relationships ("necessarily at all later times," "possibly at some later time") use the settling-bound's ordinal structure as the world-set. Accessibility relations between worlds become temporal-accessibility — `R(τ, τ') = t` if `τ'` is reachable from `τ`.

This is the natural choice for temporal-modal extensions of the substrate.

**Choice 2 — explicit worlds.** `W` is a separate index set chosen for the modal application. Used when modal claims are about non-temporal structure: branching worlds, possible-evidence-states, observer perspectives, contexts. The world-set's structure is application-specific.

## Why a `world-set` is needed

Modal operators on the substrate quantify over worlds. Without an explicit `W`, "necessarily" and "possibly" have no quantification range.

The modal-necessity-operator `□_R u_w(s, o) := ⋀_t {R(w, w') → u_{w'}(s, o) : w' ∈ W}` uses `W` as the meet-range. The modal-possibility-operator `♢_R` uses `W` as the join-range. Both require `W` to be a set (so the meets/joins are well-defined).

## Cardinality and operational implications

For finite `W`, modal operators compute finite meets/joins — operationally tractable. For countable `W`, the meets/joins are countable — typically still tractable.

For uncountable `W`, the meets/joins become uncountable; the operators may not compute in finite time, and Scott-continuity (which would otherwise reduce uncountable joins to finite directed-joins) may fail.

For modal substrate work in the Scott-continuous regime: `|W| ≤ ω` is the typical constraint.

## Position

`transfinite-predication-category/hacking/library/world-set/`. Predicating tier — the world-set is the index over which world-indexed valuations live; modal operators (sibling $things) consume world-indexed valuations.

## Derivation source

Adapted from `predication-categories/objects/world-set.md`, preserved at `docs/dev/scraps/`. The archive note is brief; substantive content (two-choice analysis, cardinality concerns) is added here.
