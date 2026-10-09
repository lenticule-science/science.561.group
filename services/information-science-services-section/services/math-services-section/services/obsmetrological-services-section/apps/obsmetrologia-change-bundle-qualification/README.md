# Obsmetrologia change-bundle qualification

This application checks proposed changes to the [Obsmetrologia research library](../../lib/obsmetrologia). It validates the patch identity and declared paths, the mathematical claim and its sources, verification evidence, and the request's authority fields. Qualification and refusal records are written to its witness journal.

The exported `qualifyChangeBundle` function performs qualification using the shared semantic-content identity implementation. Journal-backed protocol operations additionally require the witness-journal provider.

Run `node src/contract-change-bundle-qualification.mjs` for the existing request protocol. `solicit-service` and `invoke-service` expose its two protocol operations. `npm test` exercises bundle qualification.

The content and management records retain their original identifiers and provenance. Qualification does not itself apply a patch to the mathematical library.

## Required verification and the axiom law

Every bundle's `verification` array must carry a passed, `ni:`-evidenced item for each of three ids: `obsmetrologia-scope-audit`, `obsmetrologia-lake-build`, and `obsmetrologia-axiom-law`. The third is the change-bundle side of the Obsmetrologia axiom law (specified 2026-09-21): the library admits no axioms beyond `Quot.sound`, ever — see `ALLOWED_AXIOMS` in the `obsmetrologia-theorem-audit` app's `src/proof-work-order.mjs`. Its evidence is expected to be the content-addressed record of an actual `collectAxioms` run, the same way the other two verification ids point at actual scope-audit and `lake build` output.

Because qualification here works from the bundle's own bytes, not a checkout it can build, it also runs a conservative textual backstop independent of that evidence: it refuses any bundle whose diff *adds* a line, under the Obsmetrologia Lean library (`Obsmetrologia/…` or `lib/obsmetrologia/Obsmetrologia/…` in the bundle's changed paths), that declares a Lean `axiom`. It does not refuse `sorry`: a `sorry` states a theorem whose proof is still frontier, Lean reports it as `sorryAx`, and the axiom census classifies such theorems as frontier rather than as violations. The match is deliberately conservative — it reads the added line's own text and only exempts a line whose trimmed text itself opens with a `--` line comment; it does not parse Lean's `/- block comments -/` or strip a trailing `-- comment` off an otherwise-live line. It can therefore refuse a bundle it need not (an `axiom` inside a block comment, say), but it never lets a real axiom declaration through unexamined. This refusal fires regardless of what the bundle's `verification` array claims.
