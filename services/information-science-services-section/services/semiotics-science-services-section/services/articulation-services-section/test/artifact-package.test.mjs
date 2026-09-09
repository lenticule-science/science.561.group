import test from "node:test";
import { verifyPackageArtifact } from "../scripts/verify-package-artifact.mjs";

test("the packed artifact fresh-installs and imports every declared export", async () => {
  await verifyPackageArtifact();
});
