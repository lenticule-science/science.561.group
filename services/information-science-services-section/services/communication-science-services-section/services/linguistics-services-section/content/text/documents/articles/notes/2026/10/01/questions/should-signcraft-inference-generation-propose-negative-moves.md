---
kind: question
status: open-with-established-current-asymmetry
explores:
  - signcraft
  - generation
  - denial
  - four
  - relconlang
---
# Should SignCraft inference generation propose negative moves?

Current SignCraft settlement is signed: positive and negative evidence occupy separate lanes, and closure can derive `active` or `stable`.

Current `inference/generate()` is not symmetric in that way.

It reads denied attributes when constructing the current signed state, but when it constructs candidate moves it:

- skips denied basis conclusions;
- draws realized continuations from positive incidence;
- simulates each candidate by adjoining `potential`.

Thus negative evidence influences which positive continuations are available and how they score, but the generator does not originate a new against-side move.

That may be deliberate. `generate()` may be intended as a constructive-completion operator rather than a general signed inference proposer.

For the RelConLang experiment, though, the distinction must be explicit. A future negative answer such as a `nes+ccomp P` denial report cannot be assumed to fall out of current inference generation merely because the settlement algebra supports negative evidence.

Either:

1. negative/refutational proposal is a distinct operation; or
2. the inference move carrier becomes signed and its energy laws are extended to negative seeds.

No source change is warranted yet; the first experiment should simply demonstrate the asymmetry on a context with a supported denied conclusion.
