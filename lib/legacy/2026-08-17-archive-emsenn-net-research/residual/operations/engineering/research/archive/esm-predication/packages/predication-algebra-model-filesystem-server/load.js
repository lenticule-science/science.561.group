/**
 * engine/fars/load — disk → claims helper.
 *
 * Walks a directory tree and turns each file it finds into unix-layer
 * claims via the unix file vocabulary. Subjects are absolute file
 * paths.
 *
 * FARS is the filesystem substrate layer: it speaks "files at paths
 * with stat metadata and content bytes." Filetype-aware vocabularies
 * (markdown, yaml, source code) live in engine/filetypes and are
 * composed onto the resulting working model by the harness — not
 * here, and not by the substrate reducer.
 */

import { walkDir } from "./directory-walk.js";
import * as unix from "./unix-vocabulary.js";

// Vocabulary claims contributed by every loaded substrate. Compose
// these into a working model alongside per-file claims so a witness
// can read the structural declarations.
const VOCAB_CLAIMS = [...unix.vocabularyClaims];

function loadFile(absPath) {
  return unix.claimsFor(absPath);
}

// Walk the tree under rootDir and return the flat claim list for every
// file the walker reaches. Vocabulary claims are NOT included; concat
// VOCAB_CLAIMS yourself if you want them in your model.
function loadDirectory(rootDir, options) {
  const paths = walkDir(rootDir, options);
  const claims = [];
  for (const p of paths) {
    try {
      claims.push(...loadFile(p));
    } catch (_) {
      // A single bad file shouldn't kill the whole walk. Skip it.
      continue;
    }
  }
  return claims;
}

export {
  loadFile,
  loadDirectory,
  VOCAB_CLAIMS,
};
