import { Message, Role } from "@a2a-js/sdk";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import { ACTOR, assayImprovementGameProposal } from "./assay.mjs";
import { semanticJsonBytes, semanticJsonFromBytes, semanticJsonId, semanticJsonRecord as record } from "./semantic-json.mjs";
const id=semanticJsonId;
const exact=(value)=>value?.id===id(Object.fromEntries(Object.entries(value??{}).filter(([key])=>key!=="id")));
export const operationBytes=semanticJsonBytes;
export const operationFromBytes=semanticJsonFromBytes;
export async function executeOperation(request,options={}){if(!exact(request)||request.type!=="ImprovementGameProposalAssayOperation"||request.provider!==ACTOR||request.assayRequest?.type!=="ImprovementGameProposalAssayRequest")throw new Error("exact provider-addressed canonical RMN game assay is required");const review=await(options.assayImprovementGameProposal??assayImprovementGameProposal)(request.assayRequest);return record({type:"ImprovementGameProposalAssayResult",provider:ACTOR,request:request.id,proposal:request.assayRequest.proposal?.id??null,review});}
export async function executeA2aMessage(source,options={}){const message=Message.fromJSON(source);if(message.role!==Role.ROLE_USER)throw new Error("game assay requires an A2A user Message");const input=extractRmnPart(message.parts),response=await executeOperation(operationFromBytes(input.bytes),options);return Message.toJSON({messageId:"",contextId:message.contextId??"",taskId:message.taskId??"",role:Role.ROLE_AGENT,parts:[rmnPart(operationBytes(response))],metadata:{inputNi:input.ni,outputNi:response.id,provider:ACTOR},extensions:[],referenceTaskIds:[]});}
