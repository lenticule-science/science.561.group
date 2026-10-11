# RelCrypt bitslice lab notes

This is an experimental cipher-design workbench, not a security claim.

## Repo-derived design commitments

- Use `𝔽₂` as the bit-level algebraic substrate: xor/addition, and/multiplication, LFSR/xorshift style recurrence, affine diffusion.
- Use FOUR as a semantic bit-pair layer: `(positive evidence, negative evidence)`.
- Use `K₄ = {id, neg, conf, negConf}` as an involutive mask group over FOUR states, outside the Boolean-field core.
- Use settling/cohomology-inspired observables internally: truth-row count, inconsistency-row count, boundary count over `⊤` cells.
- Do **not** directly output K₄-masked FOUR states as ciphertext; earlier experiments showed alphabet collapse for structured plaintexts.

## Candidate designs

### RelStreamV5

A faster bitsliced stream generator.

Pipeline per 64-bit word:

1. 256-bit F₂/xoshiro-like state update.
2. Derive FOUR bitplanes `p,n`.
3. Derive K₄ mask bitplanes `m0,m1`.
4. Apply K₄ action over all 64 lanes at once.
5. Run a small local monotone settling rule over the ring of lanes.
6. Compute truth / false / inconsistency masks.
7. Inject H⁰-like counts and boundary counts into output whitening.
8. Duplex output and semantic masks back into state.

### RelStreamV6

A heavier variant with more explicit truth-row / inconsistency-row closure and K₄ re-gauging inside the local settling loop.

## Results

Main run is in `relcrypt_bitslice_results.json`; extra tests are in `relcrypt_bitslice_extra_results.json`.

Summary from 512 KiB samples:

| Candidate | Entropy bits/byte | Monobit z | Byte chi² | Serial corr | Key avalanche | Nonce avalanche | Python throughput |
|---|---:|---:|---:|---:|---:|---:|---:|
| RelStreamV5 | 7.9996846 | 0.6533 | 229.46 | -0.000351 | 49.992% | 49.978% | 0.858 MB/s |
| RelStreamV6 | 7.9996823 | 1.5547 | 230.997 | 0.000452 | 50.014% | 49.970% | 0.491 MB/s |

Extra tests over 8192-bit / 32x32 samples:

| Candidate | Linear complexity over 8192 bits | 32x32 matrix-rank distribution | Runs-test p approx |
|---|---:|---|---:|
| RelStreamV5 | 4098 | rank30=20, rank31=70, rank32=38 | 0.645 |
| RelStreamV6 | 4097 | rank29=1, rank30=15, rank31=75, rank32=37 | 0.916 |

## Interpretation

RelStreamV5 is the better current branch: faster, simpler, and no worse on smoke tests. RelStreamV6 adds more semantic machinery but did not buy enough statistical improvement to justify the cost.

The important architectural win is that K₄ masking is now outside the Boolean-field core. The F₂ machinery handles recurrence and diffusion; K₄ acts as an involutive semantic/masking layer; settling/cohomology-inspired observables shape the keystream.

## Next iteration targets

1. Replace ad hoc xoshiro-like recurrence with an explicit primitive-polynomial LFSR/NLFSR over `𝔽₂`.
2. Define and search a family of K₄-masked nonlinear filters over FOUR bitplanes.
3. Add a proper distinguishability harness: approximate linear bias, correlation of selected output bits with internal masks, and low-degree algebraic-normal-form probes.
4. Port the hot loop to C/Rust or NumPy/Numba for meaningful speed comparisons.
5. Write a Lean-side spec for the K₄ mask action and the bit-pair/FOUR representation so the Python is no longer just inspired by the repo but mechanically traceable to it.
