---

name: form-term-body
act: FormTermBody
slug: form-term-body
top: BindTerm
bottom: TailTrace
summary: To capture the remainder after extracting the head, we let the act *Bind Term* witness the act *Tail Trace*.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

To capture the remainder after extracting the head, we let the act *Bind Term* witness the act *Tail Trace*.

The composition `(BindTerm TailTrace)` shows the same binding that named the head now observing the tail, thereby recording the body, so we name it *Form Term Body*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
