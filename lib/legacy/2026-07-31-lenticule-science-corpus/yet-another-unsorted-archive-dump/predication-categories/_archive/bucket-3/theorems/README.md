# theorems/

Claims with proofs or sketches. One claim per file.

This includes propositions, lemmas, corollaries, and theorems proper. The grain is "one claim, one proof obligation" — if a result has two genuinely independent parts, they are two files.

## Frontmatter

```yaml
---
kind: theorem
status: draft | sketch | proved
lean: <Module>.<lemma> | [<Module>.<lemma>, ...]   # optional Lean proof(s)
symbol: "\\mathbb{M}"                              # optional, only when the theorem names a structure
depends-on: [skp, settling, closure-is-kz, ...]     # objects, morphisms, and prior theorems
---
```

`symbol:` is allowed on a theorem file when the theorem itself introduces and names a mathematical structure (e.g., the Gray–Street fibration 2-monad $\mathbb{M}$). Most theorems should omit it; the canonical home for a `symbol:` is on the corresponding object/morphism/concept file.

Status meanings:

- `draft` — the claim is precisely stated; no complete proof attempt yet.
- `sketch` — a proof outline exists; gaps are explicitly marked in the body.
- `proved` — a complete proof is in the file (or in a clearly-cited reference) and has been checked. The validator requires both a `## Proof` section heading *and* a `$\square$` end-of-proof marker. The heading marks where the proof begins; the marker marks where it ends. Both make the proof structure unambiguous.

When a theorem is shown false, the file is *deleted*. The refutation lives wherever it naturally belongs — as a counterexample example, as the body of a stronger theorem that contradicts it, or as a paragraph in the relevant narrative. A "refuted" placeholder file is just a confusing pointer.

A claim that is currently believed but for which no proof has been attempted lives here as `draft`, not in `questions/`. `questions/` is for genuinely open mathematical inquiries — questions about *what* to prove rather than attempts at proving a stated claim.

If a `lean:` ref is present, the validator runs `lake build` and confirms the cited lemma exists and contains no `sorry`. The book renders such theorems with a `[LEAN ✓]` badge.

## Body shape

1. **Statement.** Precise, self-contained.
2. **Proof** (or **Sketch** under `status: sketch`). For sketches, mark gaps explicitly: "[gap: needs Beck–Chevalley on $\mathbf{T}(\mathcal{C}, \lambda)$]".
3. **Discussion**, brief: where the claim is used, what it depends on conceptually, what it does *not* say.

## Splitting

If a "theorem" in some prior write-up actually packages five different claims, it becomes five files here, with a sixth narrative note in `narratives/` if the bundling itself was meaningful.
