import { startNativeApplication } from '@red-cup-engineering/computer-web-server/native-application';
import { lSpaceApplication } from './site.mjs';

const app = await lSpaceApplication(process.env);
const service = await startNativeApplication(app, { host: process.env.HOST ?? '127.0.0.1', port: Number(process.env.PORT ?? 18848) });
console.error(`L-Space listening on ${service.port}`);
let stopping = false;
for (const signal of ['SIGINT', 'SIGTERM']) process.on(signal, () => {
  if (stopping) return;
  stopping = true;
  void service.close().then(() => process.exit(0), () => process.exit(1));
});
