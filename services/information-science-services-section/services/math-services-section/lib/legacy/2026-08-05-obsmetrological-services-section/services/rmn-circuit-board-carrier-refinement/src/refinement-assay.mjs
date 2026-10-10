import { createHash } from "node:crypto";
import { regularFileMaterial } from "@lenticule-science/infomaterial-observation";
import { validateInfomaterialObservationReceipt } from "@lenticule-science/infomaterial-observation/receipt";
import { semanticBytes } from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { CARRIER_REFINEMENT_PROFILE, normalizeCarrierRefinementReceipt } from "@red-cup-engineering/relation-model-notation-runtime/carrier-refinement";
import { circuitAssemblyId, encodeHierarchicalCircuit, hierarchicalCircuitId, normalizeCircuitAssembly, normalizeHierarchicalCircuit, verifyCircuitAssembly } from "@red-cup-engineering/relation-model-notation-runtime/hierarchical-circuit";
import { decodeRelationalValue, encodeRelationalValue, RELATIONAL_VALUE_TYPE } from "@red-cup-engineering/relational-value-graph-service";
import { byteCarrierId, jsonId } from "./semantic-identity.mjs";

export const RMN_CIRCUIT_BOARD_CARRIER_PROFILE = "org.emsenn.infomaterial.rmn-circuit-board-carrier.v1";
export const PROVIDER_ACCOUNT = "eip155:31337:0x2971153aafb56be8dfc50ce4e80c76d6eb177a3f";
const MAXIMUM_BYTES = 4_194_304, CAIP10 = /^eip155:[1-9][0-9]*:0x[0-9a-f]{40}$/u;
function fail(code, message) { const error = new Error(message); error.code = code; throw error; }
function exactKeys(value, keys) { return value && Object.getPrototypeOf(value) === Object.prototype && Object.keys(value).sort().join("\0") === [...keys].sort().join("\0"); }
function typed(value, objectKind) { const encoded = encodeRelationalValue(value), term = ["ascribe", encoded.type, encoded.term]; return { bytes: semanticBytes(term), id: jsonId(term, objectKind) }; }
function producer(value) { if (typeof value !== "string" || !CAIP10.test(value)) fail("malformed-refinement", "producer must be a chain-qualified EVM account"); return value; }

function decodeCarrier(source) {
  if (!exactKeys(source, ["bytesBase64", "mode", "profile"]) || source.profile !== RMN_CIRCUIT_BOARD_CARRIER_PROFILE) fail("malformed-carrier", "carrier must use the exact canonical RMN circuit-board profile");
  if (typeof source.bytesBase64 !== "string" || source.bytesBase64.length === 0) fail("malformed-carrier", "carrier bytes must be canonical base64");
  const bytes = Buffer.from(source.bytesBase64, "base64");
  if (bytes.length === 0 || bytes.length > MAXIMUM_BYTES || bytes.toString("base64") !== source.bytesBase64) fail("malformed-carrier", "carrier bytes are absent, oversized, or noncanonical base64");
  if (typeof source.mode !== "string" || !/^(?:0|[1-9][0-9]*)$/u.test(source.mode)) fail("malformed-carrier", "carrier mode must be a decimal nonnegative integer");
  return { profile: source.profile, bytesBase64: source.bytesBase64, mode: source.mode, bytes, modeValue: BigInt(source.mode) };
}
export function normalizeRmnCircuitBoardCarrier(source) { const carrier = decodeCarrier(source); return { profile: carrier.profile, bytesBase64: carrier.bytesBase64, mode: carrier.mode }; }

function normalizeRequest(source) {
  const fields = ["assembly", "carrier", "circuit", "component", "components", "kind", "materialObservation", "producer"];
  if (!exactKeys(source, fields) || source.kind !== "RmnCircuitBoardCarrierRefinementAssayRequest" || !Array.isArray(source.components)) fail("malformed-refinement", "RMN board refinement request has an unknown, absent, or legacy field");
  const circuit = normalizeHierarchicalCircuit(source.circuit), components = source.components.map(normalizeHierarchicalCircuit), component = normalizeHierarchicalCircuit(source.component), assembly = normalizeCircuitAssembly(source.assembly);
  if (component.instances.length === 0 || component.nets.length === 0) fail("unsupported-component", "the RMN circuit-board proof profile accepts composite components only");
  const materialObservation = validateInfomaterialObservationReceipt(source.materialObservation);
  if (materialObservation.rootKind !== "file") fail("unsupported-material", "the RMN circuit-board carrier must be one observed regular file");
  return { kind: source.kind, producer: producer(source.producer), circuit, components, assembly, component, materialObservation: source.materialObservation, carrier: decodeCarrier(source.carrier) };
}

export function encodeRmnCircuitBoardRefinementRequest(source) {
  const value = normalizeRequest(source), publicValue = { ...value, carrier: { profile: value.carrier.profile, bytesBase64: value.carrier.bytesBase64, mode: value.carrier.mode } };
  const encoded = encodeRelationalValue(publicValue); return { value: publicValue, type: encoded.type, term: encoded.term };
}
export function decodeRmnCircuitBoardRefinementRequest(type, term) {
  if (JSON.stringify(type) !== JSON.stringify(RELATIONAL_VALUE_TYPE)) fail("malformed-refinement", "RMN board refinement request must use the relational RMN type");
  return encodeRmnCircuitBoardRefinementRequest(decodeRelationalValue(type, term)).value;
}

export async function assayRmnCircuitBoardCarrierRefinement(source) {
  const request = normalizeRequest(source), componentId = hierarchicalCircuitId(request.component), rootId = hierarchicalCircuitId(request.circuit), assemblyId = circuitAssemblyId(request.assembly);
  const verified = verifyCircuitAssembly(request.assembly, request.circuit, request.components);
  if (componentId !== rootId && !verified.family.library.has(componentId)) fail("unreachable-component", "selected circuit-board component is not reachable in the exact family");
  const expectedBytes = semanticBytes(encodeHierarchicalCircuit(request.component));
  if (!request.carrier.bytes.equals(expectedBytes)) fail("carrier-semantic-drift", "carrier bytes are not the canonical typed RMN of the selected component");
  const material = regularFileMaterial(request.carrier.bytes, request.carrier.modeValue);
  if (material.materialRoot !== request.materialObservation.materialRoot) fail("material-drift", "carrier bytes and mode do not inhabit the observed material root");
  const proof = { kind: "RmnCircuitBoardCarrierRefinementProof", profile: RMN_CIRCUIT_BOARD_CARRIER_PROFILE, circuit: rootId, assembly: assemblyId, component: componentId, canonicalComponentBytes: true, assemblyVerified: true };
  const proofDocument = typed(proof, "lenticule.carrier-refinement.rmn-circuit-board-proof"), behavior = typed(request.component.behavior, "lenticule.carrier-refinement.circuit-behavior").id;
  const receipt = normalizeCarrierRefinementReceipt({ kind: "CircuitCarrierRefinementReceipt", profile: CARRIER_REFINEMENT_PROFILE, proofProfile: RMN_CIRCUIT_BOARD_CARRIER_PROFILE, provider: PROVIDER_ACCOUNT, producer: request.producer, component: componentId, behavior, carrier: byteCarrierId(request.carrier.bytes, "lenticule.carrier-refinement.rmn-circuit-board", "application/rmn+cbor"), materialRoot: material.materialRoot, observation: request.materialObservation.semanticId, proof: proofDocument.id, equivalent: true, customerMaterialMutated: false });
  const document = typed(receipt, "lenticule.carrier-refinement.receipt"); return { receipt, proof, proofSemanticId: proofDocument.id, proofCanonicalBytes: proofDocument.bytes, semanticId: document.id, canonicalBytes: document.bytes };
}
