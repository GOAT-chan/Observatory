FROM oven/bun:1.3.10-slim

WORKDIR /app

RUN mkdir deps

COPY package.json bun.lock ./

COPY deps/rosu_pp_js_nodejs.tar.gz ./deps

RUN bun install --production

COPY . .

CMD ["sh", "-c", "bun run db:migration && bun run start"]
