# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Set environment variables for Mongo Express
ENV ME_CONFIG_MONGODB_ADMINUSERNAME=admin
ENV ME_CONFIG_MONGODB_ADMINPASSWORD=admin
ENV ME_CONFIG_MONGODB_SERVER=mongo
ENV ME_CONFIG_BASICAUTH_USERNAME=admin
ENV ME_CONFIG_BASICAUTH_PASSWORD=secret

# Expose the port on which Mongo Express will run
EXPOSE 8081

# Start the Mongo Express application
CMD ["npm", "start"]
