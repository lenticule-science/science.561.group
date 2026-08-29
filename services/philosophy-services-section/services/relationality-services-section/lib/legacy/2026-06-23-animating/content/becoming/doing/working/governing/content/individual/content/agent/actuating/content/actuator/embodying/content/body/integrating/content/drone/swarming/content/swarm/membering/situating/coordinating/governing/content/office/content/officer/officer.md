---
name: officer
---

The **time-bounded incumbency relation** between a persona and an office.
Distinct from both the office (the role-as-position) and the persona (the holder).

An officer is the *relation* `incumbent-of(persona, office, t-from, t-to?)
` reified as a first-class object.
The same persona may be officer-of-X over interval `[t1, t2]` and officer-of-Y over `[t2, t3]`; the same office may be held by officer-A then officer-B.
The officer object lets the audit query *who held this office at this time* without confusing the office's authority-cells with the persona's intrinsic-identity-cells.

## Distinguishing predication-shape

- `incumbent-of(officer, persona, office)` — the holder relation.
- `incumbency-from(officer, t-from)` — when the relation began.
- `incumbency-to(officer, t-to?)
  ` — when (if ever) it ended; absence means current.
- `installed-by(officer, witness)` — the witness that issued the incumbency.
- `acted-as-office(officer, witness)` — every act performed by the persona-while-being-this-officer attaches to the officer object, not directly to the persona, so audit decomposes "by-office" vs "by-persona-as-themselves" cleanly.

## Step-induction role

Office-bound dispatch: the dispatcher needs to know *who is currently the incumbent of office:X*.
That query traverses to the current officer (if any) and from there to the persona.
Without officer as a relation-object, incumbency would have to be encoded as a direct cell from persona to office, losing the time-bounding and the per-incumbency-act-attribution.

Audit: a witness signed "by office:first-officer" decomposes into "by officer:Y" → "by persona:calder-underhill at incumbency-interval-Z" → ultimately attributing to the persona while preserving the office-context.

## Not synonymous with

- **Office** — office is the position itself; officer is the incumbency-of-office.
- **Persona** — persona is the holder; officer is the relation-with-time-bounds.
- **Personnel** — personnel is the polity-membership relation; officer is the office-incumbency relation.
  A personnel may be a current officer of multiple offices, or none.
