# Tick's dreaming branch (2026-05-28)

## What

When `tick` (this morphism, `#script/tick`) is applied to an entity that carries a `dreaming-state-record` (see `../../../../library/dreaming-state-record/dreaming-state-record.schema.json`), the closure-rule set passed to the tick must be **pruned**: rules whose names appear in the state record's `suspendedSensoryPredicates[]` field are filtered out before the tick's rule-iteration loop.

## Why this is a cross-regime composition

- `tick` is **finite-settlement-algebra** (settling-regime, κ < ω): one closure-rule application per call.
- `dreaming-state-record` is **transfinite-predication-category** (predicating-regime, ω < κ < ω₁): it describes a fiber state.
- The composition: a predicating-regime state restricts a settling-regime morphism's rule-set.
  The tick remains settling-regime; the regime of the state record does not "infect" the tick's regime — only the rule-set the tick consults.

This is the structural pattern for ALL state-records affecting closure: the state describes the fiber (predicating-regime); the closure on that fiber is settling-regime; the state prunes the rule-set the closure consults.

## What this is NOT

This is **explicitly not** OpenClaw's "LLM dreaming" pattern.
OpenClaw uses LLM passes to consolidate memory between sessions — that would be an aperiodic-articulating act (LLM call = articulating, κ ≥ ω₁).
Our dreaming runs `tick` (finite-settling) on the pruned rule-set.
No `inferring` morphism is invoked during a dream-tick.

The difference matters because it determines what budget the dream-tick consumes (zero dollars, finite cost-units) and what witness it produces (a tick-witness, not an inferring-witness).

## Implementation note

The current `tick.mjs` accepts `(entity, closureRules)`.
To apply the dreaming branch, the caller filters `closureRules` per the state-record before invoking `tick`:

```js
const stateRecord = lookupDreamingStateRecord(entity);
const activeRules = stateRecord
  ? closureRules.filter((r) => !stateRecord.suspendedSensoryPredicates.includes(r.name))
  : closureRules;
const result = tick(entity, activeRules);
```

This keeps `tick` itself unchanged.
The cross-regime composition is enforced at the call site (currently `iterating-operations-loop`, which already accepts a `mode` parameter that does the same thing — modes ARE the predicating-regime restrictions that prune settling-regime rule-sets, of which dreaming is one instance).

## Implication

`dreaming-state-record` is a kind-of `mode`.
A dreaming-state IS a mode that narrows the agent's authorization to internal-composition rules.
The `mode` schema's `narrows[]` field maps directly to `dreaming-state-record.suspendedSensoryPredicates[]`.
Future refactor candidate: unify the two by making dreaming-state-record a restriction of mode.
