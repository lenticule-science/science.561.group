/** Corpus custody and working strata are not admitted reading documents. */
export const EXCLUDED_SEGMENTS = Object.freeze(['legacy', 'triage', 'private', 'dev', 'test', 'fixtures', 'dist', 'sites', 'lib']);

/** The existing MetroPlat archive selection, shared with exact-source preparation.
 * This pure policy does not acquire/materialize a corpus or admit a principal. */
export function lSpaceReaderPolicy({sciencePrefix, excludes} = {}) {
  return Object.freeze({
    excludes: excludes ?? EXCLUDED_SEGMENTS,
    admitPath: path => !sciencePrefix || path.startsWith(sciencePrefix + '/') || path.includes('/content/text/'),
  });
}
