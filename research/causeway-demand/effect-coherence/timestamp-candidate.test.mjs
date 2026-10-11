import test from 'node:test';
import assert from 'node:assert/strict';
import {timestamp} from './timestamp-candidate.mjs';

test('actual calendar and offset constraints', () => {
  for (const s of ['2026-02-30T00:00:00Z','2026-02-29T00:00:00Z','2026-04-31T00:00:00Z','2026-10-11T23:60:00Z','2026-10-11T23:59:60Z','2026-10-11T00:00:00+14:01','0000-01-01T00:00:00Z']) assert.equal(timestamp(s),false,s);
  for (const s of ['2024-02-29T23:59:59Z','2000-02-29T12:01:09.123Z','2026-10-11T00:00:00-05:00','2026-10-11T00:00:00+14:00','2026-10-11T00:00:00Z']) assert.equal(timestamp(s),true,s);
});
