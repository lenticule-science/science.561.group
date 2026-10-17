import {
  createRelationalOperationProtocol,
} from "@red-cup-engineering/a2a-sovereign-operation-boundary-service";
import {
  ARTICULATE_OPERATION,
  ARTICULATING_REQUEST_KIND,
  ARTICULATING_RECEIPT_KIND,
} from "./apex.mjs";

export const articulatingRmnProtocol = createRelationalOperationProtocol({
  requestKind: ARTICULATING_REQUEST_KIND,
  responseKind: ARTICULATING_RECEIPT_KIND,
  label: "Obsmetrologia articulating",
});

export function encodeArticulatingRequestRmn(input) {
  const projected = articulatingRmnProtocol.encodeRequest(ARTICULATE_OPERATION, input);
  return Object.freeze({
    mediaType: "application/rmn+cbor",
    term: projected.term,
    bytes: projected.bytes,
    semanticId: projected.id,
  });
}

export function decodeCanonicalArticulatingRmn(bytes) {
  const source = Buffer.from(bytes);
  const admitted = articulatingRmnProtocol.admitRequest(source);
  const term = articulatingRmnProtocol.encodeRequest(admitted.operation, admitted.input).term;
  const request = admitted;
  if (request.operation !== ARTICULATE_OPERATION) throw new TypeError("RMN term names a different operation");
  return Object.freeze({ term, request, semanticId: articulatingRmnProtocol.encodeRequest(request.operation, request.input).id });
}
