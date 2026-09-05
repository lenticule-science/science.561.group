#!/usr/bin/env node
import sendParametersToAScript from './send-parameters-to-a-script.mjs';

const chunks = [];
process.stdin.on('data', c => chunks.push(c));
process.stdin.on('end', async () => {
  try {
    const { scriptPath, parameters } = JSON.parse(Buffer.concat(chunks).toString('utf8'));
    const result = await sendParametersToAScript({ scriptPath, parameters });
    console.log(JSON.stringify(result, null, 2));
  } catch (error) {
    console.error(error.message);
    process.exit(1);
  }
});
