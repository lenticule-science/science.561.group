import { randomUUID } from "node:crypto";
import { Message, Role } from "@a2a-js/sdk";
import { a2aResultParts, sendRmnTask } from "@red-cup-engineering/a2a-rmn-task-client-service";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import { ACTOR } from "./assay.mjs";
import { operationBytes, operationFromBytes } from "./a2a-executor.mjs";
import { semanticJsonRecord as record } from "./semantic-json.mjs";
export async function requestImprovementGameProposalAssay(assayRequest,{agentCardUrl=process.env.IMPROVEMENT_GAME_PROPOSAL_ASSAY_AGENT_CARD_URL,send=sendRmnTask,signal}={}){if(typeof agentCardUrl!=="string"||!agentCardUrl)throw new Error("IMPROVEMENT_GAME_PROPOSAL_ASSAY_AGENT_CARD_URL is required");const request=record({type:"ImprovementGameProposalAssayOperation",provider:ACTOR,assayRequest}),message=Message.toJSON({messageId:randomUUID(),contextId:"",taskId:"",role:Role.ROLE_USER,parts:[rmnPart(operationBytes(request))],metadata:{},extensions:[],referenceTaskIds:[]}),exchange=await send({agentUrl:agentCardUrl,message,requireSignature:true,signal}),parts=a2aResultParts(exchange.result),response=operationFromBytes(extractRmnPart(parts).bytes);if(response?.type!=="ImprovementGameProposalAssayResult"||response.provider!==ACTOR||response.request!==request.id||response.proposal!==assayRequest.proposal?.id)throw new Error("game assay returned a foreign result");return Object.freeze({review:response.review,provider:ACTOR,exchange:{inputNi:exchange.inputNi,outputNi:exchange.outputNi,agentCard:exchange.agentCard}});}
