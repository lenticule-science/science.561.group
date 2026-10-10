import { randomUUID } from "node:crypto";
import { Message, Role } from "@a2a-js/sdk";
import { a2aResultParts, circuitInterfaceFromAgentCard, sendRmnTask, SOVEREIGN_CIRCUIT_INTERFACE_EXTENSION } from "@red-cup-engineering/a2a-rmn-task-client-service";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import { admitJsonSemanticContent, EMPTY_WITNESS_ROOT, identifyJsonSemanticContent } from "@red-cup-engineering/semantic-content-identify-service";
import { normalizeCarrierRefinementReceipt } from "@red-cup-engineering/carrier-refinement-law";
import { encodeWasmFourRefinementRequest, toScisTransport } from "./refinement-assay.mjs";

const responseParts = a2aResultParts;

export async function assayWasmFourCarrier({ agentUrl, producer, component, materialObservation, carrier, signal, send = sendRmnTask }) {
  const request = encodeWasmFourRefinementRequest({ kind: "WasmFourCarrierRefinementAssayRequest", producer, component, materialObservation, carrier });
  const transport = identifyJsonSemanticContent({ objectKind: "lenticule.wasm-four-carrier-refinement.request", value: toScisTransport(request.value), witnessRoot: EMPTY_WITNESS_ROOT });
  const message = Message.toJSON({ messageId: randomUUID(), contextId: "", taskId: "", role: Role.ROLE_USER, parts: [rmnPart(transport.bytes, "wasm-four-refinement-request.rmn.cbor")], metadata: {}, extensions: [], referenceTaskIds: [] });
  const exchange = await send({ agentUrl, extensions: [SOVEREIGN_CIRCUIT_INTERFACE_EXTENSION], message, requireSignature: true, ...(signal ? { signal } : {}) });
  const output = extractRmnPart(responseParts(exchange.result)), response = admitJsonSemanticContent({ bytes: output.bytes, objectKind: "lenticule.carrier-refinement.receipt" });
  const receipt = normalizeCarrierRefinementReceipt(response.value);
  const provider = circuitInterfaceFromAgentCard(exchange.agentCard);
  if (receipt.provider !== provider.account) throw new Error("refinement receipt provider does not own the signed Agent Card");
  return { receipt, receiptNi: response.token, response: response.envelope, exchange };
}
