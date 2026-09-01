---
component-of: relational-machine
specialization: boundary
admits: step-submission
instance-of: patch-site-inclusion-foot
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Machine Interface

## What this is

The **RelationalMachineInterface** is the exposed boundary of a [RelationalMachine](relational-machine.md): the point at which outside agents submit steps and the machine begins to receive them.

The interface does not hold state.
The interface does not transform state.
It receives incoming steps and passes them to the [RelationalMachineCarrier](relational-machine-carrier.md) for processing.
A RelationalMachine with no interface cannot receive input from outside itself.

## Mathematical grounding

The grounding is the [patch](../../../science/domains/math/patch.md) site inclusion ι : (U, J|_U) → (T, J).
A patch is a full sub-site of the history site.
The inclusion ι induces a geometric morphism j_U : R_U → R from the patch topos to the global topos.
The **feet** of this inclusion — the objects at either end of the cospan U → T ← U' — are the exposed boundaries where the patch meets the global site.
The RelationalMachineInterface is the locale's foot: the boundary where external steps enter.

The [Locality](../../../science/domains/math/locality.md) axiom (H is a sheaf on (T, J)) makes this boundary coherent: a compatible family of local data submitted at the interface can be uniquely glued into global state inside the machine.
An interface submission that is not compatible with existing state will fail the gluing condition — the Locality axiom is the formal statement of why incompatible inputs cannot corrupt the interior.

## In the FARS

In a [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md) locale, the RelationalMachineInterface is `INBOX.md`.
Every [FlatfileAgentialResourceSystemMessage](flatfile-agential-resource-system-message.md) deposited in `INBOX.md` is a step submitted to the locale's interface.
An agent outside the locale submits a step by writing a Message to `INBOX.md`; it does not write to the locale's entity files directly.
The improvement skill reads `INBOX.md` first — the interface is processed before any other work.

Two locales are connected when one locale's output can be submitted as a Message to the other locale's interface.
What types of steps the interface can accept is determined by the locale's [RelationalMachinePort](relational-machine-port.md).

A RelationalMachineInterface MUST be the sole point of external connection for incoming steps.
It MUST NOT hold entity state — it receives steps, it does not store them.
It MUST be processed before any other work begins in an agent session.
It MUST accept only steps whose types are in the locale's [RelationalMachinePort](relational-machine-port.md).

## Open questions
