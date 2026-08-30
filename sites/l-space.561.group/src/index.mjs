import { composeKnowledgeVault } from "@red-cup-engineering/knowledge-vault/compose";
import { validateKnowledgeVaultConfig } from "@red-cup-engineering/knowledge-vault/config";
import { evaluateVaultMazePassage } from "@red-cup-engineering/knowledge-vault/passage";
import { compileVault } from "@561-group/vault-compiler/compile";
import { recallProbability } from "@red-cup-engineering/lantern-561-group/srs";
import { lSpaceConfig, lSpaceSurfacePolicy, roomVisibility } from "./config.mjs";

export {
  lSpaceAdmissionPolicy,
  lSpaceConfig,
  lSpaceSurfacePolicy,
  roomVisibility,
  lSpaceConfig as lenticuleScienceKnowledgeVaultConfig,
} from "./config.mjs";

/**
 * Validate the situated configuration on its own, before any corpus walk.
 * `composeKnowledgeVault` validates too, but a ten-thousand-room compile is a
 * slow place to discover a typo in a claim name.
 */
export function validateLSpaceConfig() {
  return validateKnowledgeVaultConfig(lSpaceConfig);
}

export function compileLSpace() {
  return composeKnowledgeVault(lSpaceConfig, { compileVault });
}

export function evaluateLSpacePassage(offered) {
  return evaluateVaultMazePassage({ ...offered, recallProbability });
}

export { compileLSpace as compileLenticuleScienceKnowledgeVault };
export { evaluateLSpacePassage as evaluateLenticuleSciencePassage };
