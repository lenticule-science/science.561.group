---

title: Extending Context
act: ExtendContext
top: BindTrace
bottom: RenewContext
summary: Renewal alone does not attach arbitrary bindings. *Bind Trace* must now witness *Renew Context*, inducing ***Extend Context*** (`ExtendContext`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Renewal alone does not attach arbitrary bindings.  *Bind Trace* must now witness *Renew Context*, inducing ***Extend Context*** ([ExtendContext](extend-context.md)).

The composition `(BindTrace RenewContext)` mirrors the earlier extension but now operates on the general renewed context.  This shows that any new binding can extend the renewed structure, so we name the result *Extend Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
