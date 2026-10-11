import assert from "node:assert/strict";
import test from "node:test";
import { mkdtemp, readFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { Readable, Writable } from "node:stream";
import { cliOptions, defaultProvider, openAiCompatibleActuate, proposeTermDescription, renderTermDescriptionPrompt, runCli, validateTermDescription } from "../src/propose-term-descriptions.mjs";

test("the Jinja-like Markdown template receives JSON-quoted request values", () => {
  const prompt = renderTermDescriptionPrompt("Name: {{name}}; aliases: {{aliases}}; context: {{context}}", { name: "file", aliases: ["digital file"], context: "stored data" });
  assert.equal(prompt, 'Name: "file"; aliases: ["digital file"]; context: "stored data"');
});

test("description validation admits exactly two terminal-punctuated prose sentences", () => {
  assert.deepEqual(validateTermDescription({ description: "A file is a named collection of information. The term is used in digital storage systems." }), []);
  assert.match(validateTermDescription({ description: "Only one sentence." }).join(" "), /exactly two/);
  assert.match(validateTermDescription({ description: "One. Two. Three." }).join(" "), /exactly two/);
  assert.match(validateTermDescription({ description: "One. Two." , extra: true }).join(" "), /exactly one key/);
  assert.deepEqual(validateTermDescription({ description: "The U.S. file system stores data, e.g., in named files. J. R. R. Tolkien is an example of initials that do not add sentences." }), []);
  assert.match(validateTermDescription({ description: "The U.S. has files. They are stored. This is a third sentence." }).join(" "), /exactly two/);
});

test("proposal retries a structurally invalid model result and returns only a proposal", async () => {
  const prompts = [];
  const proposal = await proposeTermDescription({ name: "computer file", aliases: ["digital file"], context: "a storage term" }, {
    template: "Name: {{name}} / {{aliases}} / {{context}}",
    provider: { endpoint: "https://example.test/chat/completions", model: "test-model", apiKey: "secret" },
    actuate: async (prompt) => {
      prompts.push(prompt);
      return prompts.length === 1
        ? '{"description":"This is only one sentence."}'
        : '{"description":"A computer file is a named collection of data stored by a computer. The term is used when discussing filesystems and digital information."}';
    },
  });
  assert.equal(proposal.disposition, "proposed");
  assert.equal(proposal.fuel.spent, 2);
  assert.equal(proposal.proposal.description, "A computer file is a named collection of data stored by a computer. The term is used when discussing filesystems and digital information.");
  assert.match(prompts[1], /deterministic reasons/);
  assert.equal("path" in proposal, false);
});

test("provider defaults retain the existing NVIDIA endpoint and key compatibility", () => {
  const provider = defaultProvider({ API_KEY_INFERENCE_NVIDIA: "nvidia-key" });
  assert.equal(provider.endpoint, "https://integrate.api.nvidia.com/v1/chat/completions");
  assert.equal(provider.model, "nvidia/nemotron-3-nano-30b-a3b");
  assert.equal(provider.apiKey, "nvidia-key");
});

test("GitHub Models is a generic OpenAI-compatible provider convenience", () => {
  const options = cliOptions(["--github-models"], { GITHUB_TOKEN: "gh-token", GITHUB_MODELS_MODEL: "openai/gpt-4.1-mini" });
  assert.equal(options.provider.endpoint, "https://models.github.ai/inference/chat/completions");
  assert.equal(options.provider.model, "openai/gpt-4.1-mini");
  assert.equal(options.provider.apiKey, "gh-token");
});

test("transport retries transient HTTP failures but exposes quota refusal immediately", async () => {
  let calls = 0;
  const delays = [];
  const text = await openAiCompatibleActuate({
    endpoint: "https://example.test", model: "test", apiKey: "key", retryDelayMs: 5,
    fetch: async () => {
      calls += 1;
      return calls === 1 ? new Response("temporary", { status: 503 }) : new Response(JSON.stringify({ choices: [{ message: { content: "ok" } }] }), { status: 200 });
    },
    sleep: async (milliseconds) => { delays.push(milliseconds); },
  });
  assert.equal(text, "ok");
  assert.equal(calls, 2);
  assert.deepEqual(delays, [5]);
  calls = 0;
  await assert.rejects(() => openAiCompatibleActuate({ endpoint: "https://example.test", model: "test", apiKey: "key", fetch: async () => { calls += 1; return new Response("quota", { status: 429 }); } }), /429/);
  assert.equal(calls, 1);
});

test("the CLI emits JSONL and can persist proposal records without touching a term carrier", async () => {
  const directory = await mkdtemp(join(tmpdir(), "term-description-proposals-"));
  const chunks = [];
  const output = new Writable({ write(chunk, _, done) { chunks.push(String(chunk)); done(); } });
  const priorFetch = globalThis.fetch;
  globalThis.fetch = async () => new Response(JSON.stringify({ choices: [{ message: { content: '{"description":"A computer file is a named collection of data stored by a computer. The term is used when discussing filesystems and digital information."}' } }] }), { status: 200, headers: { "content-type": "application/json" } });
  try {
    const code = await runCli({
      input: Readable.from(['{"name":"computer file","aliases":["digital file"]}\n']),
      output,
      argv: ["--proposal-directory", directory],
      env: { API_KEY_INFERENCE_NVIDIA: "test-key" },
    });
    assert.equal(code, 0);
  } finally {
    globalThis.fetch = priorFetch;
  }
  const record = JSON.parse(chunks.join(""));
  assert.equal(record.disposition, "proposed");
  assert.match(record.output, /000001-computer-file\.json$/);
  const persisted = JSON.parse(await readFile(record.output, "utf8"));
  assert.equal("output" in persisted, false);
  assert.deepEqual(persisted, (({ output: _, ...proposal }) => proposal)(record));
});

test("batch transport preserves source order despite concurrent batch completion", async () => {
  const chunks = [];
  const output = new Writable({ write(chunk, _, done) { chunks.push(String(chunk)); done(); } });
  const priorFetch = globalThis.fetch;
  globalThis.fetch = async (_, request) => {
    const prompt = JSON.parse(request.body).messages[0].content;
    if (!prompt.startsWith("Produce public glossary descriptions")) {
      return new Response(JSON.stringify({ choices: [{ message: { content: '{"description":"A three is a test term. The term is used for ordered batch testing."}' } }] }), { status: 200 });
    }
    const requests = JSON.parse(prompt.slice(prompt.indexOf("[\n")));
    if (requests[0].index === 0) await new Promise((resolveDelay) => setTimeout(resolveDelay, 20));
    return new Response(JSON.stringify({ choices: [{ message: { content: JSON.stringify({ descriptions: requests.map(({ index, name }) => ({ index, description: `A ${name} is a test term. The term is used for ordered batch testing.` })) }) } }] }), { status: 200 });
  };
  try {
    const code = await runCli({
      input: Readable.from(['{"name":"one"}\n{"name":"two"}\n{"name":"three"}\n']), output,
      argv: ["--batch-size", "2", "--concurrency", "2"], env: { API_KEY_INFERENCE_NVIDIA: "test-key" },
    });
    assert.equal(code, 0);
  } finally { globalThis.fetch = priorFetch; }
  assert.deepEqual(chunks.map((chunk) => JSON.parse(chunk).request.name), ["one", "two", "three"]);
});
