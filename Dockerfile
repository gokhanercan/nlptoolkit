# Build stage
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install -g pnpm@latest
RUN pnpm install
RUN pnpm build

COPY *.txt .output/
COPY *.xml .output/

# Runtime stage
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/.output .
EXPOSE 3000
CMD ["node", "server/index.mjs"]

# Usage: 
    # docker build -t nlptoolkit .
    # docker run -p 3000:3000 nlptoolkit
    # docker save -o nlptoolkit.tar nlptoolkit

# # Install git
# RUN apt-get update && apt-get install -y git
# #RUN git clone https://github.com/gokhanercan/nlptoolkit /app