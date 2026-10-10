import assert from "node:assert/strict";
import test from "node:test";
import { lstat, mkdtemp, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { observeInfomaterial } from "@lenticule-science/infomaterial-observation";
import { semanticBytes } from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { jsonId } from "../src/semantic-identity.mjs";
import { CIRCUIT_ASSEMBLY_PROFILE, HIERARCHICAL_CIRCUIT_PROFILE, encodeHierarchicalCircuit, hierarchicalCircuitId } from "@red-cup-engineering/relation-model-notation-runtime/hierarchical-circuit";
import { assayRmnCircuitBoardCarrierRefinement, RMN_CIRCUIT_BOARD_CARRIER_PROFILE } from "../src/refinement-assay.mjs";
const ACCOUNT = "eip155:31337:0x1111111111111111111111111111111111111111";
const FOUR = [[false,false],[true,false],[false,true],[true,true]].map(([positiveEvidence,negativeEvidence]) => ({positiveEvidence,negativeEvidence}));
const id = (label) => jsonId(["constant", ["base", "Text"], label], "lenticule.carrier-refinement.test-text-constant");
const ports = [{name:"in",direction:"input",predicate:id("input"),carrier:id("FOUR"),mode:"tensor"},{name:"out",direction:"output",predicate:id("output"),carrier:id("FOUR"),mode:"tensor"}];
const behavior = { factors: [{ inputs: ["in"], outputs: ["out"], rows: FOUR.map((value) => ({ input:[value], output:[value] })) }] };
async function fixture() {
  const leaf = { profile:HIERARCHICAL_CIRCUIT_PROFILE, law:id("leaf law"), ports, instances:[], nets:[], behavior }, leafId = hierarchicalCircuitId(leaf);
  const board = { profile:HIERARCHICAL_CIRCUIT_PROFILE, law:id("board law"), ports, instances:[{name:"leaf",component:leafId}], nets:[{name:"input",driver:{instance:null,port:"in"},sinks:[{instance:"leaf",port:"in"}],mode:"tensor",chain:null,contract:null},{name:"output",driver:{instance:"leaf",port:"out"},sinks:[{instance:null,port:"out"}],mode:"tensor",chain:null,contract:null}], behavior };
  const boardId = hierarchicalCircuitId(board), bytes = semanticBytes(encodeHierarchicalCircuit(board)), root = await mkdtemp(join(tmpdir(),"rmn-board-refinement-")), path = join(root,"board.rmn.cbor"); await writeFile(path,bytes);
  const observed = await observeInfomaterial(path), materialObservation = {...observed.observation,semanticId:observed.semanticId,canonicalBytesBase64:observed.canonicalBytes.toString("base64")};
  const membrane = (address,label) => ({address,membrane:{account:ACCOUNT,authority:id(`${label} authority`),custody:id(`${label} custody`),territory:id(`${label} territory`)}});
  const assembly = { profile:CIRCUIT_ASSEMBLY_PROFILE,circuit:boardId,placements:[membrane([],"board"),membrane(["leaf"],"leaf")] };
  const carrier = {profile:RMN_CIRCUIT_BOARD_CARRIER_PROFILE,bytesBase64:bytes.toString("base64"),mode:String((await lstat(path,{bigint:true})).mode)};
  const request = {kind:"RmnCircuitBoardCarrierRefinementAssayRequest",producer:ACCOUNT,circuit:board,components:[leaf],assembly,component:board,materialObservation,carrier};
  return {request};
}
test("canonical RMN netlist material refines one recursive circuit board", async () => { const {request}=await fixture(),result=await assayRmnCircuitBoardCarrierRefinement(request); assert.equal(result.receipt.equivalent,true); assert.equal(result.receipt.component,hierarchicalCircuitId(request.component)); assert.equal(result.proof.canonicalComponentBytes,true); assert.equal(result.proof.assemblyVerified,true); assert.equal(result.receipt.proof,result.proofSemanticId); });
test("a board carrier cannot differ from its exact normalized RMN component", async () => { const {request}=await fixture(); const bytes=Buffer.from(request.carrier.bytesBase64,"base64"); bytes[bytes.length-1]^=1; request.carrier.bytesBase64=bytes.toString("base64"); await assert.rejects(assayRmnCircuitBoardCarrierRefinement(request),/not the canonical typed RMN/u); });
test("the board-material provider may submit its carrier when deterministic assembly verification holds", async () => { const {request}=await fixture(); request.producer="eip155:31337:0x2971153aafb56be8dfc50ce4e80c76d6eb177a3f"; const result=await assayRmnCircuitBoardCarrierRefinement(request); assert.equal(result.receipt.equivalent,true); });
