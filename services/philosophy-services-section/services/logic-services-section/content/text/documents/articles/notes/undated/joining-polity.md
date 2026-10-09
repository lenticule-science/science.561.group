---
name: member of
type: morphism
class: agent-form-relation
source: persona
target: polity
produces: personnel
status: open
title: member of
description: member-of(personnel, persona, polity, enrolled-at, revoked-at?) — the polity has formally recognized the persona as a member; the relation is reified as a personnel object.
---

`member-of(personnel, persona, polity, enrolled-at, revoked-at?)` — the polity has formally recognized the persona as a member; the relation is reified as a [personnel](personnel.md) object.

## Shape

A reified-relation morphism. The personnel-record is the substrate's address for "this persona's membership in this polity." Recognition is not an intrinsic property of the persona; it is a substrate edit issued by an authority within the polity (typically the captain or an explicitly-empowered office).

## Step-induction role

Polity-membership-recognition. Without this relation, the persona is not personnel of the polity and cannot vote in governance, hold offices, be subject to discipline. Issuing the cell is what produces personnel.

Cross-polity: a persona may be `member-of` multiple polities; each membership is its own personnel-relation. Federation between polities involves recognizing each other's personnel-relations.
