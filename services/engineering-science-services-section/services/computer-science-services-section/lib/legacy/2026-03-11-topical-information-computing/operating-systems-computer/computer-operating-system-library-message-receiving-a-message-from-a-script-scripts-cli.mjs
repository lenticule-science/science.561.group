#!/usr/bin/env node
import receiveAMessageFromAScript from './receive-a-message-from-a-script.mjs';

const chunks = [];
process.stdin.on('data', c => chunks.push(c));
process.stdin.on('end', async () => {
  try {
    const sendResult = JSON.parse(Buffer.concat(chunks).toString('utf8'));
    const result = await receiveAMessageFromAScript({ sendResult });
    console.log(JSON.stringify(result, null, 2));
  } catch (error) {
    console.error(error.message);
    process.exit(1);
  }
});
