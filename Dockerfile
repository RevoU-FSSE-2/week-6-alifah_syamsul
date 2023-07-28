# Use an official Node.js runtime as the parent image
FROM node:14-slim

# Set the working directory in the Docker image to '/usr/src/app'. 
# This directory in the image becomes the starting point for any RUN, COPY, and CMD instructions that follow in the Dockerfile.
WORKDIR /app

# Copy package.json and package-lock.json (if available) from your project directory into the Docker image
# so Docker can install the app's dependencies.
COPY package*.json ./

# Run 'npm install' in the Docker image to install the app's dependencies.
# The '.' in './' refers to the Docker image's current directory (which is '/usr/src/app', as set by the WORKDIR command).
RUN npm install

# Copy the rest of the app's source code from your project directory into the Docker image.
COPY . .

# Tell Docker that the app listens on port 8080 at runtime.
# Replace 8080 with the port your app actually listens on, if it's not 8080.
EXPOSE 3001

# Define the command that Docker runs when the Docker image is run as a container (i.e., 'npm start').
CMD [ "node", "app.js" ]