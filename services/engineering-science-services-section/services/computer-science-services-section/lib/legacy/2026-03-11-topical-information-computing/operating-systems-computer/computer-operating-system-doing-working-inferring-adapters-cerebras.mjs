// Cerebras endpoint adapter (OpenAI-compatible).
// Calls https://api.cerebras.ai/v1/chat/completions with auth via API_KEY_CEREBRAS_INFERENCE.

const ENDPOINT = 'https://api.cerebras.ai/v1/chat/completions';
const DEFAULT_MODEL = 'llama3.1-8b';

export async function send({ prompt, model = DEFAULT_MODEL, maxTokens = 2000 }) {
  const apiKey = process.env.API_KEY_CEREBRAS_INFERENCE;
  if (!apiKey) throw new Error('API_KEY_CEREBRAS_INFERENCE not set');
  const res = await fetch(ENDPOINT, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model,
      messages: [{ role: 'user', content: prompt }],
      temperature: 0.2,
      max_tokens: maxTokens,
    }),
  });
  if (!res.ok) {
    const errText = await res.text();
    throw new Error(`cerebras ${res.status}: ${errText}`);
  }
  const data = await res.json();
  return data.choices?.[0]?.message?.content || '';
}
