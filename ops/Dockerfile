FROM node:latest

# Install git
RUN apt-get update && apt-get install -y git

# Clone your public GitHub repo
RUN git clone https://github.com/gokhanercan/nlptoolkit /app

WORKDIR /app

# Install pnpm globally and project dependencies
RUN npm install -g pnpm@latest
RUN pnpm install

# <!-- npm install -g pnpm@latest-10
# pnpm i
# pnpm build
# pnpm dev

# Expose port
EXPOSE 4536

# Start the app
#CMD ["pnpm", "dev"] 
# node .output/server/index.mjs # make it cmd. 
CMD ["node", ".output/server/index.mjs"]