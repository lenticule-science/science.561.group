// Hugging Face Inference Providers router adapter (OpenAI-compatible).
// Calls https://router.huggingface.co/v1/chat/completions with auth via API_KEY_HUGGINGFACE_INFERENCE.
// The model name is supplied per-call (e.g., meta-llama/Llama-3.3-70B-Instruct).

const ENDPOINT = 'https://router.huggingface.co/v1/chat/completions';

export async function send({ prompt, model, maxTokens = 2000 }) {
  const apiKey = process.env.API_KEY_HUGGINGFACE_INFERENCE;
  if (!apiKey) throw new Error('API_KEY_HUGGINGFACE_INFERENCE not set');
  if (!model) throw new Error('huggingface adapter requires --model (the HF router takes the model per call)');
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
    throw new Error(`huggingface ${res.status}: ${errText}`);
  }
  const data = await res.json();
  return data.choices?.[0]?.message?.content || '';
}
