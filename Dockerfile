FROM node:20
ENV NODE_ENV=production
ENV PORT=8080
WORKDIR /app
COPY ["package.json", "pnpm-lock.yaml*", "./"]
COPY . .
# Current line 7:
RUN npm i -g pnpm && pnpm install --no-cache

# Recommended for better compatibility:
RUN npm i -g pnpm
RUN pnpm install --no-cache
RUN pnpm build
EXPOSE 8080
CMD ["pnpm", "start"]
