import {
  languageManifestReceipts,
  loadLanguageManifestFile,
  type LanguageManifest,
  type LanguageManifestReceipt,
} from "@emsenn/communicating/speaking/listening/algebra";

const manifestUrl = new URL("../data/manifest.json", import.meta.url);

export const manifest: LanguageManifest = loadLanguageManifestFile(
  manifestUrl,
  "@emsenn/communicating-in-lakota/data/manifest.json",
);

export const receipts: LanguageManifestReceipt = languageManifestReceipts(manifest);

export default manifest;
