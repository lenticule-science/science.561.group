---
title: "Returns"
description: "Return is a relation O returns R — operation O returns resource R to its caller — asserting that R is the value made available to O's invoker upon O's completion: R is placed on the call stack's return channel, in the caller's binding variable, or in the caller's continuation argument. The defining structure: return is caller-directed output — the value travels back up the call stack to whoever invoked O. Return is distinct from emits (which dispatches to a side channel bypassing the caller) and distinct from produces (which asserts the resource is newly created, without specifying where it goes). Return corresponds to the codomain of a function f: A → B (Church 1941), to the value supplied to the continuation in CPS (Fischer 1972), and to the unit η: A → TA of a monad (Moggi 1991)."
date-created: 2026-03-20
---

## Formal definition

**Return** is a relation $O \text{ returns } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{ReturnType})$$

holding when $O$, upon completion, places an instance $r : R$ in the caller's return channel — the value $r$ is immediately accessible to the expression or statement that invoked $O$.

**One invariant.** $O \text{ returns } R$ iff:

1. **Caller-availability**: The instance $r : R$ is in the caller's scope immediately upon $O$'s completion — $r$ is bound to the result position of the call expression.
  No additional dispatch, subscription, or polling is needed to access $r$.
  The caller may use $r$ directly in the next computation step.
  This is the distinguishing condition: the return value is synchronously available to the invoker.
  Emission (to a side channel) and side-effects (to global state) do not satisfy this condition.

## Church: function codomains

Alonzo Church (*The Calculi of Lambda-Conversion*, 1941): a function $f : A \to B$ **returns** a value of type $B$ — $B$ is the codomain, the type of values that come back to the caller.
Every application $f\; a$ (for $a : A$) yields a result $b : B$ in the caller's scope.
Return is the formal content of the codomain: the type to the right of the arrow specifies what comes back.

**Beta-reduction** $(\lambda x . t)\; s \rightsquigarrow_\beta t[s/x]$ makes return concrete: the result of applying $\lambda x . t$ to $s$ is the term $t[s/x]$, which is the value returned to the context that contained the application.
The redex disappears; the result occupies its position.

**In linear lambda calculus** ($f : A \multimap B$): $f$ consumes $A$ and returns $B$.
The distinction between $A \multimap B$ (consume-and-return) and $A \multimap \mathbf{1}$ (consume-and-discard) is whether the operation has a caller-facing return.
A function of type $A \multimap \mathbf{1}$ consumes $A$ and returns the unit — effectively returning nothing meaningful.
This is the formal type of a purely side-effecting operation.

## Plotkin: evaluation strategies and return values

Gordon Plotkin (*Call-by-Name, Call-by-Value and the Lambda-Calculus*, 1975): the **call-by-value** and **call-by-name** strategies differ in what value is returned to the caller in each case.
Call-by-value: arguments are evaluated before the call; the function body is executed once with the value in hand, and the result is returned.
Call-by-name: the unevaluated expression is passed; a result is not forced until the caller demands it (lazy return).

The **operational correspondence**: Plotkin's standard reduction theorem shows that both strategies reach the same normal form (the return value) when one exists.
The return value is independent of strategy — what changes is when the return is forced, not what is returned.

## Fischer, Reynolds: continuation-passing style

Michael Fischer (*Lambda Calculus Schemata*, 1972) and John Reynolds (*Definitional Interpreters for Higher-Order Programming Languages*, 1972) introduced **continuation-passing style** (CPS).
In CPS, every operation takes an explicit **continuation** $\kappa : R \to \mathrm{Answer}$ as an extra argument.
Returning $r$ is replaced by calling $\kappa(r)$ — passing the return value to the continuation.

CPS makes the return channel explicit: instead of "O returns $r$ to whoever called it," CPS says "O calls $\kappa$ with $r$, where $\kappa$ was supplied by whoever called $O$."
The continuation $\kappa$ is the first-class reification of the return channel.

**CPS transformation** of direct-style return: $f\; a = b$ becomes $f_{\mathrm{CPS}}\; a\; \kappa = \kappa(b)$.
The equivalence: every direct-style return is a CPS call to the identity continuation $\mathrm{id}(b) = b$.

## Moggi: the monad unit as return

Eugenio Moggi (*Notions of Computation and Monads*, 1991): a **monad** $(T, \eta, \mu)$ on a category $\mathcal{C}$ has a **unit** (return) $\eta : A \to TA$.
The unit $\eta_A(a)$ wraps a pure value $a : A$ into a computation $\eta_A(a) : TA$ — it is the minimal computation that returns $a$ with no effects.

In Haskell, `return` is exactly $\eta$: `return :: a -> m a`.
Every monadic computation ultimately produces its value by applying `return` (or `pure`).
The return type $TA$ encodes the effect type $T$ — `return` gives back a value of type $a$ wrapped in the effect context $m$.

**Kleisli composition**: $(f >=> g)(a) = f(a) \gg= g$ — monadic return is the unit for Kleisli composition: `return >=> f = f` and `f >=> return = f`.
This makes return the identity element for the algebra of effectful computations.

## Open questions

- Whether return and emit are formally dual in the category of operations — whether there is a coend or profunctor construction that makes $O \text{ returns } R$ (giving to the caller) dual to $O \text{ emits } R$ (giving to an environment channel), and whether this duality corresponds to the caller/environment decomposition of a program's context.
- Whether the CPS representation of return (calling a continuation) and the direct-style return are inter-translatable without loss in all settings — specifically, whether any operation that returns $R$ has a faithful CPS translation in which $\kappa : R \to \mathrm{Answer}$ captures all uses of the return value, including uses in type-dependent contexts.
