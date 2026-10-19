FROM node:22-alpine

WORKDIR /app

# Alpine uses 'apk' instead of 'apt-get' and comes highly optimized
RUN apk add --no-cache git && corepack enable && corepack prepare pnpm@latest --activate

# Install DeepSeek Harness globally
RUN npm install -g @deepseek-ai/dsh || npm install -g deepseek-harness

EXPOSE 3080
EXPOSE 3018

CMD ["dsh", "web", "--host", "0.0.0.0", "--port", "3080"]
