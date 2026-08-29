---
id: extension
name: Extension
description: "A prefix extension is a morphism t → t' in the history category T, witnessing that t' = t ★ u for some non-empty u — a forward step in the history ordering."

defines: Extension
---

### Definition — Extension {#extension}

A **prefix extension** is a morphism $f : t \to t'$ in the history category $T$,
witnessing that $t' = t \star u$ for some $u \neq e$. Since $T$ is a thin category,
such a morphism is unique when it exists. The morphism $f$ exists precisely when
$t \leq t'$ in the prefix ordering (§order).

A **one-step extension** of $t$ by step $s \in \Sigma$ is the morphism
$t \to t \star \mathrm{gen}(s)$ — the smallest possible extension in the $s$-direction.
The one-step extensions of $t$ are the morphisms $t \to t \star \mathrm{gen}(s)$ for
each step $s \in \Sigma$.

#### What Extension Does {#extension-action}

Extensions witness the forward growth of the history category. Every non-empty
history $t'$ arises as a sequence of extensions from $e$: the chain
$e \to \mathrm{gen}(s_1) \to \mathrm{gen}(s_1) \star \mathrm{gen}(s_2) \to \cdots \to t'$.

Extensions are the morphisms along which the presheaf $H$ restricts (§restriction):
each extension $f : t \to t'$ induces a restriction map $H(f) : H_{t'} \to H_t$
going backward. Extensions generate the structure of $T$; restriction maps record
how that structure is reflected in the fiber algebras.

#### Extension-Stable Propositions {#extension-stable}

An element $a \in H_t$ is **extension-stable** if $\Delta_t(a) = a$ — that is, if
$a$ is already the smallest element present in every one-step extension of $t$ via
restriction. The sub-algebra of extension-stable propositions is
$\mathrm{Fix}(\Delta_t)$ (§fiber-doctrine). The extension-stable sub-algebra is the
other pole of the restriction–extension dyad (§restriction-extension-dyad).
