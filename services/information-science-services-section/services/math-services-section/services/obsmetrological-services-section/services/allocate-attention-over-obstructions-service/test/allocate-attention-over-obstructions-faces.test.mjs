import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";
import test from "node:test";
import { allocateAttentionOverObstructions } from "../scripts/allocate-attention-over-obstructions.mjs";

const examples = [
  {
    "type": "JavascriptNodeOperationExample",
    "name": "budget four",
    "input": {
      "obstructions": [
        {
          "id": "a",
          "cost": 2,
          "benefit": 4
        },
        {
          "id": "b",
          "cost": 3,
          "benefit": 3
        },
        {
          "id": "c",
          "cost": 1,
          "benefit": 1
        }
      ],
      "budget": 4
    },
    "output": {
      "type": "AttentionAllocation",
      "budget": 4,
      "readNext": [
        "a",
        "c"
      ],
      "selected": [
        {
          "id": "a",
          "cost": 2,
          "benefit": 4
        },
        {
          "id": "c",
          "cost": 1,
          "benefit": 1
        }
      ],
      "cost": 3,
      "benefit": 5,
      "residual": 3
    }
  }
];

for (const example of examples) {
  test(example.name, async () => {
    const importedOutput = await allocateAttentionOverObstructions(example.input);
    assert.deepEqual(importedOutput, example.output);
    const command = spawnSync(process.execPath, [fileURLToPath(new URL("../scripts/allocate-attention-over-obstructions.mjs", import.meta.url))], {
      input: JSON.stringify(example.input) + "\n",
      encoding: "utf8",
    });
    assert.equal(command.status, 0, command.stderr);
    const commandOutput = JSON.parse(command.stdout.trim());
    assert.deepEqual(commandOutput, example.output);
    assert.deepEqual(commandOutput, importedOutput);
  });
}
