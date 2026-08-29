# Minimal Cloud Run deploy image for weiqi-web's static server.
#
# weiqi-web is zero-dependency (no node_modules at all), so there is nothing
# to vendor and no npm install/ci at build time. `public/` is the deployable
# artifact -- `npm run build` (type-stripping weiqi-kernel's .mts sources into
# public/js/kernel/*.mjs and compiling public/data/glossary.json) is run
# BEFORE this image is built, from the repo, with weiqi-kernel present as a
# sibling directory; the Docker build context (this directory alone, per
# `gcloud run deploy --source`) never needs weiqi-kernel/weiqi-lsp at all,
# so their READ-ONLY status is never at risk from a deploy.
#
# Matches the house pattern in play.561.group/Dockerfile: FROM node:24-slim,
# COPY . ., zero-dep static server, CMD runs the existing server unmodified.
FROM node:24-slim
WORKDIR /app
COPY . .
ENV NODE_ENV=production
# scripts/serve.mjs now defaults HOST to 0.0.0.0 and reads PORT from the
# environment (process.env.PORT ?? 8080) -- Cloud Run's injected PORT is
# honored with no Dockerfile-level override needed.
CMD ["node", "scripts/serve.mjs"]
