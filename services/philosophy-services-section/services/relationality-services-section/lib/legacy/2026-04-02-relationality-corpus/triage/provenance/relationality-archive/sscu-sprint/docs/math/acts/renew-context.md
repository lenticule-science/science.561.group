---

name: renew-context
act: RenewContext
slug: renew-context
top: ExtendFirstContext
bottom: ContextualizeTrace
summary: Extending once still leaves the general renewal unspecified. Forcing *Extend First Context* to witness *Contextualize Trace* produces ***Renew Context*** (`RenewContext`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Extending once still leaves the general renewal unspecified.  Forcing *Extend First Context* to witness *Contextualize Trace* produces ***Renew Context*** ([RenewContext](renew-context.md)).

The renewed seed must reattach to the original trace record.  Composing `(ExtendFirstContext ContextualizeTrace)` explicitly shows the first extension re-entering the named trace, so the resulting act is *Renew Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
