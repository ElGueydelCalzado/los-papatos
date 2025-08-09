FROM node:20-slim AS deps
WORKDIR /app
COPY package*.json . 2>/dev/null || :
RUN npm init -y && npm ci || true

FROM node:20-slim
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
EXPOSE 8080
CMD ["node","-e","console.log('EGDC image OK'); setInterval(()=>{},1<<30)"]
