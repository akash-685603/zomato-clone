# Use the official Node.js 18 image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Vite React application
RUN npm run build

# Install a lightweight web server to serve the build
RUN npm install -g serve

# Expose port 3000 to the host
EXPOSE 3000

# Command to serve the build directory
CMD ["serve", "-s", "dist", "-l", "3000"]
