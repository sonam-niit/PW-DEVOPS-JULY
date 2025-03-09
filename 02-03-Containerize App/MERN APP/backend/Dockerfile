# Use Node.js LTS version
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY backend/package*.json ./
RUN npm install

# Copy rest of the application
COPY backend/ .

# Expose port
EXPOSE 5000

# Start the application
CMD ["node", "server.js"]
