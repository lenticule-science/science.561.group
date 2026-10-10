import { tm } from "@red-cup-engineering/relation-model-notation";
import { arrayTerm, jsonToTerm, objectTerm, stringTerm } from "@red-cup-engineering/relation-model-notation-json-codec";
import type { Tm } from "@red-cup-engineering/relation-model-notation/types";

const field = (key: string): Tm => tm.field(key, tm.var(0));
const legacyNegate = (value: Tm): Tm => tm.cond(
  tm.coincide(value, stringTerm("potential")), stringTerm("active"),
  tm.cond(tm.coincide(value, stringTerm("active")), stringTerm("potential"), value),
);
const chuDualTerm: Tm = tm.lam(objectTerm([
  ["pts", field("sts")],
  ["r", tm.fold(tm.lam(tm.lam(tm.append(tm.var(1), arrayTerm([objectTerm([
    ["charge", legacyNegate(tm.field("charge", tm.var(0)))],
    ["pt", tm.field("st", tm.var(0))],
    ["st", tm.field("pt", tm.var(0))],
  ])])))), arrayTerm([]), field("r"))],
  ["sts", field("pts")],
]));
const chuDualInvolutionTerm: Tm = tm.lam(tm.cond(
  tm.coincide(tm.app(chuDualTerm, tm.app(chuDualTerm, tm.var(0))), tm.var(0)),
  jsonToTerm(true),
  jsonToTerm(false),
));

export const chu = Object.freeze({ dual: chuDualTerm, dualInvolution: chuDualInvolutionTerm });
export const cohomologyTerms = Object.freeze({
  rankVanishing: tm.lam(objectTerm([["kind", field("kind")], ["rank", field("rank")]])),
  rankIdentity: tm.lam(objectTerm([["kind", field("kind")], ["left", field("left")], ["right", field("right")]])),
  rankComparison: tm.lam(objectTerm([["kind", field("kind")], ["left", field("left")], ["right", field("right")]])),
  carrier: tm.lam(objectTerm([["cells", field("cells")], ["entities", field("entities")], ["firstCohomology", field("firstCohomology")], ["kind", field("kind")], ["zeroCoboundary", field("zeroCoboundary")], ["zeroCohomology", field("zeroCohomology")]])),
  laplacian: tm.lam(objectTerm([["characteristicPolynomial", field("characteristicPolynomial")], ["cohomology", field("cohomology")], ["entityLaplacian", field("entityLaplacian")], ["firstCohomologyCokernelRank", field("firstCohomologyCokernelRank")], ["incidence", field("incidence")], ["incidenceRank", field("incidenceRank")], ["kind", field("kind")], ["laplacianRank", field("laplacianRank")], ["zeroCohomologyKernelRank", field("zeroCohomologyKernelRank")]])),
});
