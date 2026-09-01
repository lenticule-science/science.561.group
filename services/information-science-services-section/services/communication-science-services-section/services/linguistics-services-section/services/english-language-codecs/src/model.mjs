// model.mjs — append-only settling model for simple continuation generation.
// Mechanically ported (types stripped) from the recovered
// content/assets/legacy/github-language-packages/english-language-codecs/src/model.mts.
// Logic is unchanged.
import { TRUE, FALSE, TOP, BOTTOM, joinKnowledge } from "../../../lib/language-engine/index.mjs";
import { realizeSection } from "./section.mjs";

const PRECEDES = "precedes";
const DENIES = "denies";

export const emptyCorpus = Object.freeze({ assertions: [] });

function tokenize(text) {
  return text.toLowerCase().match(/[\p{L}\p{M}\p{N}]+/gu) ?? [];
}

function assertionId(assertion, index) {
  return `${assertion.subject}\x00${assertion.predicate}\x00${assertion.object}\x00${index}`;
}

export function ingest(corpus, text, witness) {
  const tokens = tokenize(text);
  const assertions = [...corpus.assertions];
  for (let i = 0; i < tokens.length - 1; i++) {
    const assertion = {
      subject: tokens[i],
      predicate: PRECEDES,
      object: tokens[i + 1],
      charge: TRUE,
      ...(witness !== undefined ? { witness } : {}),
    };
    assertions.push({ ...assertion, id: assertionId(assertion, assertions.length) });
  }
  return { assertions };
}

export function recall(corpus, context) {
  const tokens = tokenize(context);
  const subject = tokens[tokens.length - 1];
  if (subject === undefined) return [];
  return corpus.assertions.filter((assertion) => assertion.subject === subject && assertion.predicate === PRECEDES);
}

export function predict(corpus, context) {
  const assertions = recall(corpus, context);
  if (assertions.length === 0) return [{ token: null, charge: BOTTOM, regime: "void", reason: "unseen" }];
  const byToken = new Map();
  for (const assertion of assertions) {
    const prior = byToken.get(assertion.object);
    byToken.set(assertion.object, prior ? joinKnowledge(prior, assertion.charge) : assertion.charge);
  }
  return [...byToken.entries()].map(([token, charge]) => ({
    token,
    charge,
    regime: regimeOf(charge),
    ...(charge.value === "stable" ? { reason: "contested" } : {}),
  }));
}

export function settleNext(corpus, context) {
  const predictions = predict(corpus, context);
  return predictions.find((p) => p.regime === "affirmed") ?? predictions[0];
}

export function model(seedText, witness) {
  const corpus = seedText === undefined ? emptyCorpus : ingest(emptyCorpus, seedText, witness);
  return wrap(corpus);
}

function wrap(corpus) {
  return {
    corpus,
    assertions: corpus.assertions,
    ingest: (text, witness) => wrap(ingest(corpus, text, witness)),
    predict: (context) => predict(corpus, context),
    settle: (context) => settleNext(corpus, context),
    generate(seed, opts) {
      const limit = opts?.limit ?? 12;
      let text = seed;
      for (let i = 0; i < limit; i++) {
        const settled = settleNext(corpus, text);
        if (settled.token == null || settled.regime === "void") break;
        text = `${text} ${settled.token}`;
      }
      return text;
    },
    realizeContinuation(subject, predicate, context) {
      const settled = settleNext(corpus, context);
      const out = realizeSection({
        subject,
        cells: [{
          predicate,
          object: settled.token,
          charge: settled.charge,
          tense: "present",
        }],
      });
      return { ...out, settled, contested: settled.regime === "contradicted" };
    },
  };
}

function regimeOf(charge) {
  if (charge.value === "potential") return "affirmed";
  if (charge.value === "active") return "denied";
  if (charge.value === "stable") return "contradicted";
  return "void";
}

export { PRECEDES, DENIES, TRUE, FALSE, TOP, BOTTOM };
