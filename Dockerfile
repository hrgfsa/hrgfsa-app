# Stage 1: Build Node.js app
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy app source code
COPY . .

# Build the app (for simple Hello World, just copy static files)
RUN mkdir -p dist && echo "<h1>Hello, World</h1>" > dist/index.html

# Stage 2: Nginx to serve static content
FROM nginx:alpine
# Remove default Nginx HTML
RUN rm -rf /usr/share/nginx/html/*

# Copy built app from builder
COPY --from=builder /app/dist/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
