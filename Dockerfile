FROM node:22-bullseye-slim

WORKDIR /app

# Install git and pnpm
RUN apt-get update && apt-get install -y git && corepack enable && corepack prepare pnpm@latest --activate

# Clone the repository or install globally
RUN npm install -g @deepseek-ai/dsh || npm install -g deepseek-harness

# Expose the default web port
EXPOSE 3080
EXPOSE 3018

# Set environment variables
ENV DEEPSEEK_API_KEY=your_api_key_here
ENV HOST=0.0.0.0

# Run the web UI command
CMD ["dsh", "web", "--host", "0.0.0.0", "--port", "3080"]
