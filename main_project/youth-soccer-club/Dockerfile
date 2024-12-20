FROM oven/bun:1.1.21-alpine as builder

WORKDIR /app

ENV NODE_ENV production

COPY ./package.json ./bun.lockb ./

RUN bun i

COPY . .

RUN bun run build

FROM mysql

WORKDIR /app

ENV MYSQL_ROOT_PASSWORD=root \
  MYSQL_DATABASE=test_db \
  MYSQL_ROOT_PASSWORD=my-secret-pw \
  MYSQL_TCP_PORT=3306
  
RUN curl -O https://nodejs.org/dist/v20.16.0/node-v20.16.0-linux-x64.tar.xz
RUN tar -xf node-v20.16.0-linux-x64.tar.xz -C /usr/local --strip-components=1
RUN rm node-v20.16.0-linux-x64.tar.xz

COPY --from=builder /app/.next/standalone ./standalone
COPY --from=builder /app/.next/static ./standalone/.next/static
# COPY --from=builder /app/public ./standalone/public
COPY ./sql ./standalone/sql
COPY ./docker/start.sh ./

EXPOSE 3000
  
CMD ./start.sh
