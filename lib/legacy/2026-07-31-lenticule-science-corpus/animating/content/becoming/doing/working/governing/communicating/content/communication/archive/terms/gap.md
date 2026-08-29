---
title: "Gap"
description: "The unstated material between framed units that the reader must cross. The artifact-level counterpart to the gutter."
date-created: 2026-05-02
aliases: [gap]
defines: [gap]
---

A gap is whatever the artifact has not stated between two framed units. It is what closure crosses. In a comic, the gap is the [gutter](teaching/explanations/gutter.md) — the white strip between panels where the depicted action is not depicted. In a proof, the gap is whatever the writer has not written down: the unmentioned algebraic step, the routine application of a named lemma, the unstated reason that two cases exhaust the possibilities. In a software tutorial, the gap is whatever the author assumes about the reader's environment, vocabulary, or prior project.

Every artifact that frames units has gaps. The question is not whether they exist but whether they are governed.

## Acceptable and unacceptable

Line Edslev Andersen, in "Acceptable gaps in mathematical proofs" (*Synthese*, 2020), gives the cleanest treatment of this distinction in the case of mathematical writing. Some gaps are *acceptable*: the audience can be trusted to fill them, the disciplinary norms of the practice license their omission, and inspecting the gap would yield no insight. These are [acceptable-gaps](acceptable-gap.md). Others are not — the audience cannot fill them without external help, the practice does not license their omission, or the gap conceals a step the writer themselves did not check. These are defects.

The same distinction applies outside mathematics. A signage system can omit "turn here" because the arrow is shared vocabulary; it cannot omit the destination name without losing the audience. A software tutorial can omit "open a terminal" for an audience of developers; it cannot omit it for an audience of designers being onboarded.

## The artifact's responsibility

An artifact is not responsible for closing every gap. It is responsible for governing them: making clear which gaps the reader is licensed to cross with what authority, and which gaps the artifact itself is responsible for closing. A practice that has no gap-discipline produces artifacts that look complete but require silent expertise to read; a practice that demands every gap be closed produces artifacts that no one can stand to read at all.
