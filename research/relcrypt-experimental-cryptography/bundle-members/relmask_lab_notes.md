# RelMask Lab — first Python run

Experimental RelMath-flavored crypto toy. This is math-lab code, not production cryptography.

Best candidate from this pass: `RelStream-v4`.

Architecture:
- F₂ LFSR bank for the fundamental stream algebra.
- Nonlinear Boolean filter over F₂.
- Bit-pairs interpreted as FOUR charges.
- K₄ self-inverse masks applied to the internal FOUR state, not directly as ciphertext masks.
- Local settling/closure on FOUR cells.
- Truth-row and inconsistency-row observables folded back into F₂ diffusion.
- Final encryption mode is XOR keystream; the K₄ layer protects/shapes the internal semantic state.

Observed on a 256 KiB sample:
- Roundtrip: passed.
- Monobit z: about -0.55 in one run.
- Byte chi-square: about 246.5 for 255 df in one run.
- Entropy: about 7.9993 bits/byte in one run.
- Key avalanche: about 50.03%.
- Pure Python speed: about 0.07 MB/s.
- AES-CTR via compiled cryptography backend: about 270 MB/s in the same environment.

Interpretation:
- Statistically, the best RelMath toy landed in the same rough neighborhood as AES-CTR on crude smoke tests.
- Performance is nowhere close in Python.
- The failed variant is important: using K₄ directly as the ciphertext mask degenerates on zero plaintext because bottom maps only to bottom/top under K₄. The corrected architecture uses K₄ as an internal semantic/gauge mask and F₂ XOR for stream encryption.
