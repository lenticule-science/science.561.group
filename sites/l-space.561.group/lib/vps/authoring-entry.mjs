// Bundle from the workspace source rather than npm's copied file dependency;
// this entry is a deployment artifact builder, so it must follow the same
// revision as the L-Space checkout even when node_modules has not been pruned.
export { createGeodeAuthoring } from "@red-cup-engineering/geode/vault-authoring";
