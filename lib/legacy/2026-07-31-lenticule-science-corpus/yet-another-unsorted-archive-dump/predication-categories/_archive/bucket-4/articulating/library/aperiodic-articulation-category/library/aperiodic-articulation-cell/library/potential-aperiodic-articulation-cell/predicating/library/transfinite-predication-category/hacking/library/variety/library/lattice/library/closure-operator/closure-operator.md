---
name: closure-operator
description: A closure operator c on a poset P — an endomap satisfying x ≤ c(x) (extensive), x ≤ y ⟹ c(x) ≤ c(y) (monotone), c(c(x)) = c(x) (idempotent). Its fixed points form a coreflective subposet.
specializing: lattice

---

A **closure operator** on a poset P is an endomap c: P → P that is extensive (x ≤ c(x)), monotone (x ≤ y ⟹ c(x) ≤ c(y)), and idempotent (c(c(x)) = c(x)). The fixed points {x ∈ P | c(x) = x} form a sub-poset that is coreflective in P; the inclusion has a left adjoint given by c itself. Composing closure operators yields a closure operator when the operators commute; if they don't commute, iterating their composition to fixed point produces the joint closure. Closure operators on lattices are central to algebraic logic, topology (the Kuratowski closure axioms), and the closure-rule machinery of the 561 OS.
