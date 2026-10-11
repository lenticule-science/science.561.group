import assert from 'node:assert/strict';
import test from 'node:test';
import { mcpApplications } from '../src/site.mjs';
const base = { admission: { identifyContext: async () => null }, archive: {} };
test('explicit file custody refuses missing state and unavailable profiles; omission keeps memory default', () => {
  assert.throws(() => mcpApplications({ ...base, environment: { PUBLIC_BASE_URL: 'https://fixture.invalid', OAUTH_GRANT_STORE_PROFILE: 'linux-local-flock-v1' } }));
  assert.throws(() => mcpApplications({ ...base, environment: { PUBLIC_BASE_URL: 'https://fixture.invalid', LSPACE_OAUTH_STATE: '/synthetic-unused', OAUTH_GRANT_STORE_PROFILE: 'unknown-profile' } }));
  assert.equal(mcpApplications({ ...base, environment: { PUBLIC_BASE_URL: 'https://fixture.invalid' } }).length, 2);
});
