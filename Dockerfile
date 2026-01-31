FROM oven/bun:1.3.6-slim

WORKDIR /app

COPY package*.json bun.lockb* ./

RUN bun update --production

RUN bun install --production

COPY . .

CMD ["sh", "-c", "bun run db:migration && bun run start"]
