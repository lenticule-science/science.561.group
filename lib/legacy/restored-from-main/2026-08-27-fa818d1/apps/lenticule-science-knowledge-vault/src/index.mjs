import { composeKnowledgeVault } from "@561-group/knowledge-vault/compose";
import { evaluateVaultMazePassage } from "@561-group/knowledge-vault/passage";
import { compileVault } from "@561-group/vault-compiler/compile";
import { recallProbability } from "@red-cup-engineering/lantern-561-group/srs";
import { lenticuleScienceKnowledgeVaultConfig } from "./config.mjs";

export { lenticuleScienceKnowledgeVaultConfig } from "./config.mjs";

export function compileLenticuleScienceKnowledgeVault() {
  return composeKnowledgeVault(lenticuleScienceKnowledgeVaultConfig, { compileVault });
}

export function evaluateLenticuleSciencePassage(offered) {
  return evaluateVaultMazePassage({ ...offered, recallProbability });
}
