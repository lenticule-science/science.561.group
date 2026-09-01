/** Demonstrate the closed meme-operation surface. */
import {
  communicateAction,
  negateAction,
  conflateAction,
  semioseAction,
  illocuteAction,
  quoteAction,
  referAction,
  presupposeAction,
  composeAction,
  modalizeAction,
  translateAction,
} from "@lenticule-science/communicating";
import {
  meme,
  cell,
  token,
  mark,
  claim,
  predicateOfClaim,
  charge,
  chargeValue,
  memeCarrier,
} from "@red-cup-engineering/relating";

const value = meme(
  cell(
    token(mark("Alice")),
    predicateOfClaim(claim(mark("predicate:says"))),
    token(mark("hello")),
  ),
  charge(chargeValue("potential"), [[mark("w")], []]),
);

const results = [
  communicateAction.run(value, {}),
  negateAction.run(value, {}),
  conflateAction.run(value, {}),
  semioseAction.run(value, {}),
  illocuteAction.run({ meme: value, force: "assertive" }, {}),
  quoteAction.run({ meme: value, position: "subject" }, {}),
  referAction.run({ meme: value, entity: "alice", position: "subject" }, {}),
  presupposeAction.run({ meme: value, trigger: "factive" }, {}),
  composeAction.run({ meme: value, with: value }, {}),
  modalizeAction.run({ meme: value, mode: "evidential", witness: "source" }, {}),
  translateAction.run({ meme: value, target: "french-discourse" }, {}),
];

if (!results.every((result) => memeCarrier.validate(result))) {
  throw new Error("communicating example: an operation escaped the meme carrier");
}
console.log(`all ${results.length} demonstrated operations return admitted memes`);
