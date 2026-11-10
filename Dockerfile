# biblioteca-libros: Node plano. Sirve el catalogo y lo publica si tiene KAFKA_BROKERS.
FROM node:24-slim
WORKDIR /app
ENV NODE_ENV=production
COPY package.json package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY libros.mjs catalogo-kafka.mjs ./
COPY datos/ ./datos/
USER node
EXPOSE 3001
CMD ["node", "libros.mjs"]
