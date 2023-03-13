# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in package.json
RUN yarn install

# Lint the code
RUN yarn lint

# Check formatting
RUN yarn format:check

# Run unit tests and generate coverage report
RUN yarn test:cov

# Run end-to-end tests
RUN yarn test:e2e

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Run the app in production mode
CMD ["yarn", "start:prod"]
