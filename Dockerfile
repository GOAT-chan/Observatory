FROM oven/bun:1.3.10-slim

WORKDIR /app

COPY package.json bun.lock ./

RUN bun install --production

COPY . .

CMD ["sh", "-c", "bun run db:migration && bun run start"]
