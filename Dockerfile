# Use the official Node.js image as the base image
FROM node:21-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the entire project to the working directory
COPY . .

# Build the Next.js app
RUN npm run build

# Expose the port on which the app will run
EXPOSE 3000

# Start the app
CMD ["npm", "start"]