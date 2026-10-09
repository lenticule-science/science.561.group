---
name: variety
description: The category Var of varieties of universal algebras. Objects are equationally-defined classes of $\Sigma$-algebras closed under homomorphisms, subalgebras, and direct products (Birkhoff 1935). Morphisms are reduct functors induced by signature inclusions and theory interpretations.
having-as-object: [lattice, pre-bilattice, bilattice]
forgetting-the-negation: variety
references:
  - id: birkhoff1935
    type: article-journal
    title: On the structure of abstract algebras
    volume: 31
    issue: 4
    author:
      - literal: Birkhoff, Garrett
    container-title: Mathematical Proceedings of the Cambridge Philosophical Society
    page: 433-454
    issued:
      - year: 1935
title: variety
---

A variety of universal algebras is a class of $\Sigma$-algebras over a signature $\Sigma$ defined by a set of equations on $T_\Sigma(X)$. By Birkhoff's HSP theorem ([@birkhoff1935]) a class of $\Sigma$-algebras is a variety iff it is closed under homomorphic images, subalgebras, and direct products. The category $\mathbf{Var}$ has varieties as objects and signature-inclusion reducts and theory interpretations as morphisms.
