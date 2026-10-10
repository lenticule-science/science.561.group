import { randomUUID } from "node:crypto";
import { Message, Role } from "@a2a-js/sdk";
import { a2aResultParts, sendRmnTask } from "@red-cup-engineering/a2a-rmn-task-client-service";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import { checkTerm } from "@red-cup-engineering/relation-model-notation-runtime";
import { decodeSemantic, semanticBytes } from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { decodeCarrierRefinementReceipt } from "@red-cup-engineering/relation-model-notation-runtime/carrier-refinement";
import { circuitInterfaceFromAgentCard, SOVEREIGN_CIRCUIT_INTERFACE_EXTENSION } from "@red-cup-engineering/relation-model-notation-runtime/hierarchical-circuit";
import { encodeRmnCircuitBoardRefinementRequest } from "./refinement-assay.mjs";
import { jsonId } from "./semantic-identity.mjs";
const responseParts = a2aResultParts;
export async function assayRmnCircuitBoardCarrier({ agentUrl, producer, circuit, components, assembly, component, materialObservation, carrier, signal, send = sendRmnTask }) {
  const request = encodeRmnCircuitBoardRefinementRequest({ kind: "RmnCircuitBoardCarrierRefinementAssayRequest", producer, circuit, components, assembly, component, materialObservation, carrier });
  const term = ["ascribe", request.type, request.term], message = Message.toJSON({ messageId: randomUUID(), contextId: "", taskId: "", role: Role.ROLE_USER, parts: [rmnPart(semanticBytes(term), "rmn-board-refinement-request.rmn.cbor")], metadata: {}, extensions: [], referenceTaskIds: [] });
  const exchange = await send({ agentUrl, extensions: [SOVEREIGN_CIRCUIT_INTERFACE_EXTENSION], message, requireSignature: true, ...(signal ? { signal } : {}) }), output = extractRmnPart(responseParts(exchange.result)), response = decodeSemantic(output.bytes);
  if (!semanticBytes(response).equals(output.bytes) || response?.[0] !== "ascribe" || response.length !== 3) throw new Error("RMN board refinement provider returned noncanonical RMN");
  checkTerm(response[2], response[1]); const receipt = decodeCarrierRefinementReceipt(response[1], response[2]), provider = circuitInterfaceFromAgentCard(exchange.agentCard);
  if (receipt.provider !== provider.account) throw new Error("RMN board refinement receipt provider does not own the signed Agent Card");
  return { receipt, receiptNi: jsonId(response, "lenticule.carrier-refinement.receipt"), response, exchange };
}
