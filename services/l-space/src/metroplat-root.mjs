import { isAbsolute, resolve } from 'node:path';
import { statSync } from 'node:fs';

/** Root selection is explicit, no live checkout detection or silent corpus substitution. */
export function selectMetroplatCorpusRoot(repositoryRoot, configuredRoot, environment = process.env) {
  if (typeof repositoryRoot !== 'string' || !repositoryRoot.trim()) throw new TypeError('host repositoryRoot is required');
  if (typeof configuredRoot !== 'string' || !configuredRoot.trim()) throw new TypeError('installed L-Space corpus root is required');
  const override = environment?.METROPLAT_LSPACE_CORPUS_ROOT;
  if (override !== undefined && override !== '') {
    if (typeof override !== 'string' || !isAbsolute(override)) throw new TypeError('METROPLAT_LSPACE_CORPUS_ROOT must be an absolute path');
    return resolve(override);
  }
  return resolve(repositoryRoot, configuredRoot);
}

/** Fail with a stable, debuggable capability error before asking CAIRN to scan. */
export function assertMetroplatCorpusRoot(root, readStatus = statSync) {
  if (typeof root !== 'string' || !isAbsolute(root)) throw new TypeError('resolved corpus root must be absolute');
  try {
    if (!readStatus(root).isDirectory()) throw new Error('not a directory');
  } catch (cause) {
    const error = new Error('L-Space corpus root is unavailable in this runtime; install/read-mount the authorized corpus or set METROPLAT_LSPACE_CORPUS_ROOT to a verified absolute directory. Do not silently substitute a different corpus.');
    error.code = 'LSPACE_CORPUS_ROOT_UNAVAILABLE';
    error.root = root;
    error.cause = cause;
    throw error;
  }
  return root;
}
