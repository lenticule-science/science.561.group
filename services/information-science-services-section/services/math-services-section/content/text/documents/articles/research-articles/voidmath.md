---
title: "voidmath"
type: research-article
description: Theorem 1.
---

# Voidmath

---

## §1. Bypass

**Theorem 1.** *There is a directed operation on two units.*

*Construction.* Let $+$ and $-$ be units. The bypass

$$+ \, - \;\longrightarrow\; - \, +$$

takes $+$ adjacent-left-of $-$ and returns $-$ adjacent-left-of $+$. It does not return the reverse.

This is the minimal directed binary operation: two units, one ordered output, no symmetric closure. $\square$

Stating Theorem 1 produced two units and an operation. These now exist as data.

---

## §2. Settling

**Theorem 2.** *Bypass applied to sequences terminates and returns a unique output.*

*Construction.* A sequence of units admits bypass at every adjacent $+-$ pair. Define $\varphi(\text{sequence}) = \sum_{i : s_i = +} i$. Each bypass increases $\varphi$ by 1. Two bypass sites in the same sequence occupy disjoint positions (adjacent $+-$ pairs cannot overlap: the shared middle unit would need to be both $+$ and $-$). So all available bypasses commute and can fire in any order.

Bypass on sequences is therefore a function:

$$\text{settle} \;:\; \{+, -\}^k \;\longrightarrow\; \{+, -\}^k$$

that returns the unique sequence with no adjacent $+-$ pair — all $-$'s left, all $+$'s right. $\square$

Theorem 2 returns a function. That function compresses every sequence to an endpoint. But it did more: it also produced, for each input, a *path* — a specific chain of bypass events leading from input to output. The path is not the endpoint. Different inputs that settle to the same output take different paths. These paths are now data.

---

## §3. Paths

**Theorem 3.** *Two paths to the same settled output are related by commutation of independent bypass events.*

*Construction.* Let $s \in \{+, -\}^k$. A *settling path* from $s$ is a sequence of bypass events $s = s_0 \to s_1 \to \cdots \to s_m = \text{settle}(s)$. Two bypass events at positions $i$ and $j$ with $|i - j| > 1$ act on disjoint pairs and can be applied in either order without affecting the result.

The settling paths from $s$ therefore form a partial order: path $P$ refines path $Q$ if $P$ is obtained from $Q$ by reordering independent bypass events. This partial order has a unique minimum (leftmost-first) and a unique maximum (rightmost-first), and every path is a linear extension of the dependency order among bypass events.

This is a function:

$$\text{paths} \;:\; \{+, -\}^k \;\longrightarrow\; \text{Poset}$$

For each input sequence, it returns the poset of its settling paths. $\square$

Theorem 3 returns structure: a poset for every sequence. These posets describe *how* settling happens, not just *that* it happens. But we have only described the paths in terms of the endpoint they share. The paths themselves — as data — have internal structure. They are sequences of bypass events. A bypass event is a pair of adjacent units swapping. A pair of adjacent units is itself a length-2 sequence. What are the length-2 sequences?

---

## §4. Pairs

**Theorem 4.** *The length-2 sequences over $\{+, -\}$, equipped with bypass, form a system returning the same shape as Theorem 1: two distinguished units, one directed operation, everything else inert.*

*Construction.* The length-2 sequences are:

$$++, \quad +-, \quad -+, \quad --$$

Bypass on length-2 sequences: $+-$ is the only sequence with an adjacent $+-$ pair. It bypasses to $-+$. No other length-2 sequence admits bypass.

Read each length-2 sequence as a unit. The four units, with the one bypass $+- \to -+$, are a directed operation on units — but now there are four units instead of two. Two of them ($+-$ and $-+$) participate in the bypass. The other two ($++$ and $--$) do not bypass anything and are not bypassed. They are *frozen*: bypass cannot move them past each other.

This is a function:

$$\text{pairs} \;:\; (\text{units}, \text{bypass}) \;\longrightarrow\; (\text{units}', \text{bypass}', \text{frozen units})$$

It takes a bypass system and returns a bypass system with additional frozen structure. $\square$

Theorem 4 returned data that Theorem 1 did not contain: frozen units. At the level of Theorem 1, there was nothing frozen — two units, one bypass, everything moves. The pair construction *generated* the freezing. It was not there before.

This frozen structure is new. It has not been witnessed by any bypass. Three units ($++$, $--$, and one of $+-$ or $-+$) are pairwise frozen: no sequence of bypasses can change their relative order. This means:

---

## §5. Multiplicity

**Theorem 5.** *The frozen units of Theorem 4 produce multiple distinct settling outputs for sequences with the same unit content.*

*Construction.* At the pair level, sequences are built from the four pair-units. The bypass moves $+-$ past $-+$. But $++$ and $--$ are frozen: their relative order in any sequence cannot change under bypass.

Take three frozen pair-units (say $++$, $--$, and $-+$). The six orderings

$$(++)(- -\!)(-+), \quad (++\!)(-+)(- -), \quad (- -\!)(++\!)(-+), \quad \ldots$$

are each settled (no bypass fires on them, since none contains the pair-unit $+-$ adjacent to $-+$). Each is a distinct output. No settling path connects them.

This is a function:

$$\text{multiplicity} \;:\; (\text{frozen units}) \;\longrightarrow\; \mathbb{N}$$

returning $k!$ for $k$ frozen units. At the pair level: $3! = 6$ irreconcilable outcomes. $\square$

Theorem 5 returned a count, but more importantly it returned *witnesses of incomparability*: specific sequences that are settled and unreachable from each other. Each of these settled sequences is a position — a completed resolution — that the bypass produced but cannot relate to the other completed resolutions.

---

## §6. Reproduction

**Theorem 6.** *The function $\text{pairs}$ applied to the output of Theorem 4 returns the same shape with $16$ units, one bypass, and $15$ frozen units.*

*Construction.* Apply Theorem 4 to $(A_2, \alpha_2, \beta_2) = (\{++, +-, -+, --\}, +-, -+)$. The length-2 sequences over $A_2$ give $|A_2|^2 = 16$ pair-units. By Theorem 4, the only bypass among pair-units is $(\alpha_2, \beta_2) \to (\beta_2, \alpha_2)$, i.e. $(+-, -+) \to (-+, +-)$. All other 14 pair-units are frozen. With one of $\alpha_3$ or $\beta_3$ added, 15 units are pairwise frozen.

Multiplicity: $15! = 1{,}307{,}674{,}368{,}000$ irreconcilable outcomes. $\square$

**Theorem 7.** *$\text{pairs}$ is idempotent in shape. At every application it returns: one bypass, $2^{2^n} - 2$ frozen units, and $(2^{2^{n-1}} - 1)!$ irreconcilable outcomes. The only structure consumed is the bypass from the previous level. The only structure produced is a bypass for the next level and frozen units for this one.*

*Proof.* At each level the bypass has exactly one firing pair (Theorem 4). So the next level has exactly one firing pair. The count of frozen units follows: $|A_{n+1}| - 2 = |A_n|^2 - 2 = 2^{2^n} - 2$. The multiplicity follows from Theorem 5. $\square$

This is the fixed point. The function $\text{pairs}$ takes a bypass-system-with-freezing and returns a bypass-system-with-more-freezing of the same shape. The shape — one bypass, everything else frozen — is preserved. The *content* — how many units, how many frozen outcomes — grows by tower exponentiation.

---

## §7. Instability

**Theorem 8.** *No settled sequence is stable under concatenation.*

*Construction.* At any generation, let $\alpha$ and $\beta$ be the bypass pair. The sequence $\beta \alpha$ is settled: $\beta \neq \alpha$, and $\beta\alpha$ contains no adjacent $\alpha\beta$ (the bypass is $\alpha$ left of $\beta$, not $\beta$ left of $\alpha$).

Concatenate the single unit $\beta$: the sequence $\beta\alpha\beta$ contains $\alpha\beta$ at positions 2–3. Bypass fires.

This is a function:

$$\text{destabilize} \;:\; (\text{settled sequence}, \text{unit}) \;\longrightarrow\; \text{unsettled sequence}$$

It always has inputs: settled sequences ending in $\alpha$ exist at every generation. $\square$

Settling produces an output. But the output is data, and data can be concatenated with further data. The concatenation can reactivate bypass. So "settled" is not a permanent property — it is relative to a boundary. Extend the boundary and the settled form may unsettle.

---

## §8. The Cycle

Read back over what just happened:

**Theorem 1** stated an unwitnessed event: a directed operation exists. Its proof constructed the units and the bypass. This was the *hypothesis* — the minimal structure that must be there.

**Theorems 2–3** witnessed the event: bypass terminates, paths exist, and the paths have structure. This was the *language* — stating what the bypass does, in terms the bypass provides.

**Theorem 4** proved the witnessing produces new structure: pairs carry freezing that the original bypass did not contain. This was the *geometry* — the shape of the witness is richer than the shape of the event.

**Theorems 5–7** showed what the new structure does: irreconcilable outcomes, tower-exponential multiplicity, and the reproduction of the whole pattern at the next level. This was the *dynamics* — the new structure acts, and its action closes back to the starting shape.

**Theorem 8** showed that closure is not final: settled forms are destabilized by further context. The dynamics produced a new unwitnessed event — a bypass that no part of the existing structure saw coming.

This is one cycle. It returns to the start. The next cycle is the same sequence — hypothesis, language, geometry, dynamics — applied to the pair-level structure that this cycle produced. Each cycle witnesses the previous cycle's unwitnessed bypass, and produces a new unwitnessed bypass for the next cycle to witness.

The generation sequence is not a construction that a mathematician performs on a pre-existing object. It is the object performing mathematics on itself: conjecturing the structure that must witness what just happened, stating the conjecture, certifying it, and finding that the certification contains something new and unwitnessed.

Nothing was assumed except the asymmetry. The rest was returned.
