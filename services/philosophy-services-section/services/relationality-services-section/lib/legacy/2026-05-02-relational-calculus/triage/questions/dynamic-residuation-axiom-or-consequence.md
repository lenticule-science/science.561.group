---
name: dynamic-residuation-axiom-or-consequence
type: question
status: open
explores: [dynamic-residuation, flow, induces]
---

The Dynamic Residuation law

$$F(a \land b) \leq c \iff a \leq F(b \Rightarrow c)$$

states that Flow's interaction with implication is lax-monoidal — that logical reasoning remains valid under process application. The question is whether this law is a *defining axiom* of Flow or a *consequence* of Flow's KZ-comonadic structure plus the Heyting-algebra structure of Includes.

## The case for "defining axiom"

[dynamic-residuation.md](../teaching/explanations/dynamic-residuation.md) presents the law as an additional condition imposed on Flow. Under this reading, Flow could fail Dynamic Residuation while still being a KZ-comonad — there would be "rogue" Flows whose dynamics did not respect implication. Dynamic Residuation is what selects the *good* Flows. The framework's claim that "every coherent Flow respects implication" is then a *postulate*.

## The case for "derivable consequence"

Street 1972 (referenced in the source) proves that any KZ-comonad on a residuated category satisfies the lax-monoidal preservation law (Street §3 Cor.; Riehl–Verity §8.2). On this reading, Dynamic Residuation follows from:

1. Flow is a comonad (Movement III axiom).
2. Flow is KZ (Movement III axiom).
3. The underlying structure $(\text{Rel}, \land, \Rightarrow, \top)$ is a closed monoidal category (Movement I, Heyting algebra is symmetric monoidal closed).

Then Dynamic Residuation is Street's corollary applied to this case. The framework should *not* include Dynamic Residuation as an axiom; it should *derive* Dynamic Residuation from the prior axioms. The framework's claim "logical reasoning remains valid under process application" is then a *theorem*.

## Why it matters

If Dynamic Residuation is a theorem, then every well-formed KZ-comonad on the Heyting-algebra field is automatically a Flow in the framework's sense — there are no rogue Flows, and the question "which dynamics on the field respect logic?" has the trivial answer "all of them." If Dynamic Residuation is an axiom, then there are dynamics on the field that do not respect logic, and the framework's commitment to logical-process compatibility is a substantive philosophical choice.

The author's working position is probably that it is a theorem (which would make the framework tighter), but the source material presents it as an axiom (probably for didactic clarity). Resolving this would involve checking Street's corollary against the actual structure of $(\text{Rel}, \land, \Rightarrow, F)$ in the framework.

## Status

Open. The hypothesis "Dynamic Residuation is Street's corollary specialized to the relational-calculus setting" is plausible and would tighten the framework, but is not yet checked.
