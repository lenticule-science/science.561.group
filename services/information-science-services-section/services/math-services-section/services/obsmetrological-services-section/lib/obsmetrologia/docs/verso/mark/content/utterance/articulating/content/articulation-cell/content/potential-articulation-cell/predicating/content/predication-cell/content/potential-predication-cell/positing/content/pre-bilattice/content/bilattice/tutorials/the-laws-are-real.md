# Tutorial: the laws are real

The test suite doesn't hand-build answers and check they come back — it asserts **properties** over
**random** inputs. In this run you'll write a couple of those checks yourself, so "the suite doesn't
cheat" is something you verified.

## 1. A random charge

```js
import { witness } from "./tests/_construct-utterance.mjs";
import { randomBytes } from "node:crypto";

const rbool = () => (randomBytes(1)[0] & 1) === 1;
const rand = () => { const p = rbool(), n = rbool();
  return { value: [p, n], evidence: [p ? [witness()] : [], n ? [witness()] : []] }; };

console.log(rand().value);   // a random one of the four states, each run
```

Nothing here fixes an expected output — `rand()` is a *probe*, not a baked case.

## 2. Check a law: join is commutative

```js
import { joinKnowledge as joinK } from "@red-cup-engineering/metrologic/bilattice";

const V = (c) => `${+c.value[0]}${+c.value[1]}`;
let ok = true;
for (let i = 0; i < 100; i++) {
  const a = rand(), b = rand();
  if (V(joinK({ left: a, right: b })) !== V(joinK({ left: b, right: a }))) ok = false;
}
console.log("joinK commutative:", ok);   // true — for 100 random pairs
```

The property — `joinK(a,b) = joinK(b,a)` — must hold for *every* input; 100 random pairs probe it. If
the op were wrong on some state, a random run would eventually catch it.

## 3. Check the σ-duality

The truth ops are the knowledge ops seen through the order-swap σ. Verify it:

```js
import { joinTruth as joinT } from "@red-cup-engineering/metrologic/bilattice";

const sigma = (c) => ({ value: [c.value[0], !c.value[1]], evidence: c.evidence });
ok = true;
for (let i = 0; i < 100; i++) {
  const a = rand(), b = rand();
  const viaSigma = sigma(joinK({ left: sigma(a), right: sigma(b) }));
  if (V(joinT({ left: a, right: b })) !== V(viaSigma)) ok = false;
}
console.log("joinT = σ∘joinK∘σ:", ok);   // true
```

You just confirmed, on random inputs, that knowledge and truth are one structure swapped by σ — not
two independent definitions.

## 4. Run the whole suite

```sh
node --test        # every law, the descent, the cones, the void
```

## What you saw

Two laws checked the way the suite checks all of them — a property asserted over random probes,
nothing constructed to force the answer. That's why these tests *mean* something the deleted
hand-built ones didn't.

## See also

- reference: [the laws](../references/the-laws.md) · [the test suite](../references/the-test-suite.md)
