# Use the official Node.js 18 image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock files
COPY package.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN yarn build

# Install a lightweight web server to serve the build
RUN yarn global add serve

# Expose port 3000 to the host
EXPOSE 3000

# Command to serve the build directory
CMD ["serve", "-s", "dist", "-l", "3000"]
