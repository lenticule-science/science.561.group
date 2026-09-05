Principal Closure
=================

.. meta::
   :xref-spec: math/infinite/geometry/index (Derived nucleus and flow laws)

Proposition — Principal Closure
-------------------------------

For any recognition :math:`k`, the assignment
:math:`\nu_k(x) := x \vee k` is a closure-like nucleus: it is
monotone, extensive, and idempotent; its fixed points are precisely
the recognitions :math:`y` with :math:`k \le y`.

**Proof.** Monotone and extensive are immediate from :math:`\vee`.
Idempotence:
:math:`\nu_k(\nu_k(x)) = (x \vee k) \vee k = x \vee k`. Fixed points
are exactly
:math:`\{\, y \mid y = y \vee k \,\}`, which is equivalent to
:math:`k \le y`. ∎

