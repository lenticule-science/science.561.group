# collatz-settlement scripts

Collatz is no longer special-cased code — it is the generic settling harness with one plug-in.
What remains here is the $thing's closure rule (a thin call into the harness) and the shape
statistic used by the spiral claim.

| Script | Role |
|---|---|
| `collatz-settlement.mjs` | the closure rule: `#settling-endofunctor` run on the `#collatz` plug-in. Reports κ (=stopping time), regime, nucleus-shadow census. `node collatz-settlement.mjs 27` → κ=111. |
| `shape-statistics.mjs` (`#shape-statistics`) | the cream of the old `predictions.py`: `v2`, `collatzShortcutShape`, `shapeCountsByDepth`, `depthGrowthVerdict` — the depth-binned growth whose dominant ratio is the plastic number. |

## The harness lives at the settling tier

The generic machine and the families are at `settling/` (a `@561/settling` mini-package):
`#settling-endofunctor`, `#closure-ordinal`, `#increment-sequence`, `#settlement-spiral`,
`#substitution`, and the plug-ins `#collatz #affine #successor #residue`.

Claim-named tests are at `settling/test/*.test.mjs` (run `node --test test/*.test.mjs` from the
package root). The four legacy analysis scripts (`ritm`, `collatz-stabilizer`,
`collatz-predictions`, `affine-commutation`) were retired; their cream lives in the harness,
`#shape-statistics`, and `#residue-commutation`. The modal-comonad realization is preserved as
prior-art prose in `../docs/dev/notes/`.
