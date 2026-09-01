// Run of any computer-operating-system: an operating-system bound to POSIX 1003.1, implemented in ESM Node.
// Concrete behavior: spawn a child process as the running subsystem, inherit stdio, forward signals, exit with child's status.
// Each step emits an EAVT cell to the supplied log path; cells conform to https://research-notes.561.group/hacking/library/doing/working/hacking/doing/working/running/running.schema.json (chained through
// the parent operating-system and system running schemas).

import { spawn } from 'node:child_process';
import { appendFile } from 'node:fs/promises';

export async function run({ instance, child: childPath, logPath }) {
  if (!instance || !childPath || !logPath) {
    throw new Error('computer-operating-system.run: requires { instance, child, logPath }');
  }

  const runStarted = new Date().toISOString();
  const runId = `run-${instance}-${runStarted}`;

  async function emit(cell) {
    await appendFile(logPath, JSON.stringify(cell) + '\n');
  }

  await emit({ e: runId, a: 'starting', v: { instance, child: childPath }, t: runStarted });
  await emit({ e: runId, a: 'binding-stdio', v: 'inherit', t: new Date().toISOString() });
  await emit({ e: runId, a: 'spawning', v: childPath, t: new Date().toISOString() });

  const childProc = spawn(process.execPath, [childPath], {
    stdio: 'inherit',
    env: process.env,
  });

  const forward = (signal) => async () => {
    await emit({ e: runId, a: 'forwarding-signal', v: signal, t: new Date().toISOString() });
    if (!childProc.killed) childProc.kill(signal);
  };

  process.on('SIGINT', forward('SIGINT'));
  process.on('SIGTERM', forward('SIGTERM'));

  return new Promise((res) => {
    childProc.on('exit', async (code, signal) => {
      const stoppedAt = new Date().toISOString();
      await emit({ e: runId, a: 'stopping', v: { code, signal, at: stoppedAt }, t: stoppedAt });
      res({ code, signal });
    });
  });
}
