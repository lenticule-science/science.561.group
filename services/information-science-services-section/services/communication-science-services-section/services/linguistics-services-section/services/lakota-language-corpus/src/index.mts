/**
 * @emsenn/communicating-in-lakota — the Lakota fiber over @emsenn/communicating.
 *
 * The base package is language-neutral machinery whose every reading morphism is
 * parameterized over a `CompiledBundle`. This package is one such bundle made
 * concrete: it supplies the compiled Lakota vocabulary and binds the base reading
 * morphisms to it. The runnable `communicate` / `communicate-serve` bins project
 * this package's actions.
 */
import {
  read as readOver,
  articulateCommunication,
  admitCommunication,
  type Reading,
  type ParseResult,
  type ArticulateResult,
} from "@emsenn/communicating";

import lakota from "./compiled.mjs";

export { lakota, default } from "./compiled.mjs";
export { rawBundle } from "./bundle.mjs";
export { manifest, receipts } from "./manifest.mjs";
export {
  corpus,
  generateLakotaForm,
  readLakotaCorpusAction,
  generateLakotaFormAction,
  type LakotaCorpusEntry,
  type LakotaGenerationRequest,
  type LakotaGenerationResult,
} from "./corpus.mjs";
export {
  analyzeLakotaParticles,
  analyzeLakotaParticlesAction,
  lakotaParticleRules,
  type LakotaParticleAnalysis,
  type LakotaParticleFunction,
  type LakotaParticleRule,
  type LakotaParticleToken,
  type LakotaParticleWitness,
} from "./particles.mjs";
export {
  analyzeLakotaFrames,
  analyzeLakotaFramesAction,
  lakotaFrameRules,
  type LakotaAgreementRole,
  type LakotaFrameAnalysis,
  type LakotaFrameCertainty,
  type LakotaFrameRule,
  type LakotaImplicitParticipant,
  type LakotaParticipantValue,
  type LakotaVerbFrame,
} from "./frames.mjs";
export {
  lakotaOrthographyRules,
  normalizeLakotaOrthography,
  normalizeLakotaOrthographyAction,
  type LakotaOrthographyCertainty,
  type LakotaOrthographyNormalization,
  type LakotaOrthographyRule,
  type LakotaOrthographyToken,
  type LakotaOrthographyWitness,
} from "./orthography.mjs";
export {
  generateLakotaParadigmAction,
  generateLakotaParadigms,
  type LakotaParadigm,
  type LakotaParadigmCell,
  type LakotaParadigmRequest,
  type LakotaParadigmResult,
} from "./paradigms.mjs";
export {
  lakotaResearchObligations,
  readLakotaResearchObligations,
  readLakotaResearchObligationsAction,
  type LakotaObligationMaturity,
  type LakotaResearchObligation,
  type LakotaResearchObligationReport,
} from "./obligations.mjs";
export {
  lakotaMaturityData,
  readLakotaMaturity,
  readLakotaMaturityAction,
  type LakotaMaturity,
  type LakotaMaturityData,
  type LakotaMaturityEntry,
  type LakotaMaturityReport,
  type LakotaProvenInLeanStatus,
} from "./maturity.mjs";

/** Read a sentence at every layer at once, over the Lakota bundle. */
export const read = (text: string): Reading => readOver(text, lakota);

/** Settle a sentence through the engine, over the Lakota bundle. */
export const settle = (text: string): ParseResult => readOver(text, lakota).parse;

/** Articulate admitted Lakota text into its articulation carrier. */
export const articulate = (text: string): ArticulateResult =>
  articulateCommunication(admitCommunication(text), lakota);

export { actions } from "./actions.mjs";
