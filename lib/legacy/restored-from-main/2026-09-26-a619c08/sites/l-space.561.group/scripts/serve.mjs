#!/usr/bin/env node
// Serve L-Space: the garden's application on the one web server, over the science section's files.
import { startNativeApplication } from "@red-cup-engineering/computer-web-server/native-application";
import { installGracefulShutdown } from "@red-cup-engineering/http-services-section/node-server";
import { lSpaceApplication } from "../src/site.mjs";

const host = process.env.HOST ?? "127.0.0.1";
const port = Number(process.env.PORT ?? 18848);
const app = await lSpaceApplication(process.env);
const running = await startNativeApplication(app, { host, port });
installGracefulShutdown({ ...running, app });
process.stderr.write(`[l-space] serving on ${host}:${running.port}\n`);
