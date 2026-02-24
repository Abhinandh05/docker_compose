FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Ensure the node user owns the app directory
RUN chown -R node:node /app

# Switch to the pre-existing 'node' user (UID 1000)
USER node

EXPOSE 5173

CMD ["npm", "run", "dev"]