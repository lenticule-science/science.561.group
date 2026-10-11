import { composeVaultMaze } from "@red-cup-engineering/graphical-knowledge-game-server/compose";
import { validateVaultMazeConfig } from "@red-cup-engineering/graphical-knowledge-game-server/config";
import { evaluateVaultMazePassage } from "@red-cup-engineering/graphical-knowledge-game-server/passage";
import { compileVault } from "@red-cup-engineering/education-platform-service/compile";
import { recallProbability } from "@red-cup-engineering/education-platform-service/srs";
import { lSpaceConfig, lSpaceSurfacePolicy, roomVisibility } from "./config.mjs";

export {
  lSpaceAdmissionPolicy,
  lSpaceApplicationPolicy,
  lSpaceConfig,
  lSpaceSurfacePolicy,
  roomVisibility,
} from "./config.mjs";

/**
 * Validate the situated configuration on its own, before any corpus walk.
 * `composeVaultMaze` validates too, but a ten-thousand-room compile is a
 * slow place to discover a typo in a claim name.
 */
export function validateLSpaceConfig() {
  return validateVaultMazeConfig(lSpaceConfig);
}

export function compileLSpace() {
  return composeVaultMaze(lSpaceConfig, { compileVault });
}

export function evaluateLSpacePassage(offered) {
  return evaluateVaultMazePassage({ ...offered, recallProbability });
}

export { evaluateLSpacePassage as evaluateLenticuleSciencePassage };
