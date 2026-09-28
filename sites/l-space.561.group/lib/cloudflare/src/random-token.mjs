import { base64UrlEncode } from "./session.mjs";

/** Generate an opaque browser or OAuth token from Web Crypto entropy. */
export function randomToken(bytes = 32) {
  return base64UrlEncode(crypto.getRandomValues(new Uint8Array(bytes)));
}
